import { uploadImage } from "../lib/utils/cloudinary.js";
import {
  ADMIN_EMAIL,
  ADMIN_PASSWORD,
  MIDTRANS_CLIENT_KEY,
  MIDTRANS_SERVER_KEY,
} from "../lib/utils/constants.js";
import { decode } from "../lib/utils/jwt.js";
import { pool } from "../lib/utils/pool.js";
import midtransClient from "midtrans-client";
import { nanoid } from "nanoid";

export async function uploadImagePelatihTari(req, res) {
  try {
    const authHeader = req.headers.authorization;

    if (authHeader) {
      const token = authHeader.split(" ")[1];
      const decodedToken = decode(token);

      if (decodedToken.email === ADMIN_EMAIL && decodedToken.ADMIN_PASSWORD) {
        const b64 = Buffer.from(req.file.buffer).toString("base64");

        let dataURI = "data:" + req.file.mimetype + ";base64," + b64;

        const cloudinaryResponse = await uploadImage(dataURI);

        if (cloudinaryResponse) {
          res.status().json({
            statusCode: 200,
            message: "Success upload image!",
            data: cloudinaryResponse.secure_url,
          });
        } else {
          res.status().json({
            statusCode: 400,
            message: "Error while uploading image!",
          });
        }
      }
    } else {
      res.status().json({
        statusCode: 401,
        message: "Not Authorized!",
      });
    }
  } catch (err) {
    res.status().json({
      statusCode: 400,
      message: "Failed to edit data!",
    });
  }
}

export async function addPelatihTari(req, res) {
  try {
    const authHeader = req.headers.authorization;
    const { email, name, image, no_hp, status, description, price } = req.body;

    if (authHeader) {
      const token = authHeader.split(" ")[1];
      const decodedToken = decode(token);

      if (
        decodedToken.email === ADMIN_EMAIL &&
        decodedToken.password === ADMIN_PASSWORD
      ) {
        await pool.query(
          `INSERT INTO pelatih_tari(email, name, no_hp, description, image, price, status, rating, total_review, created_at) VALUES('${email}', '${name}', '${no_hp}', '${description}', '${image}', '${price}', '${status}', 5, 10, '${new Date()
            .toISOString()
            .slice(0, 19)
            .replace("T", " ")}')`
        );

        res.status().json({
          statusCode: 200,
          message: `Success add pelatih tari ${name}!`,
        });
      }
    } else {
      res.status().json({
        statusCode: 401,
        message: "Not Authorized!",
      });
    }
  } catch (err) {
    res.status().json({
      statusCode: 400,
      message: "Failed to add pelatih tari!",
    });
  }
}

export async function editPelatihTari(req, res) {
  try {
    const authHeader = req.headers.authorization;

    const { id } = req.params;
    const { email, name, image, no_hp, status, description, price } = req.body;

    if (authHeader) {
      const token = authHeader.split(" ")[1];
      const decodedToken = decode(token);

      if (
        decodedToken.email === ADMIN_EMAIL &&
        decodedToken.password === ADMIN_PASSWORD
      ) {
        await pool.query(
          `UPDATE pelatih_tari SET email = '${email}', name = '${name}', no_hp = '${no_hp}', description = '${description}', image = '${image}', price = '${price}', status = '${status}' WHERE id = '${id}'`
        );

        res.status().json({
          statusCode: 200,
          message: `Success edit pelatih tari ${name}!`,
        });
      }
    } else {
      res.status().json({
        statusCode: 401,
        message: "Not Authorized!",
      });
    }
  } catch (err) {
    res.status().json({
      statusCode: 400,
      message: "Failed to edit pelatih tari!",
    });
  }
}

export async function deletePelatihTari(req, res) {
  try {
    const authHeader = req.headers.authorization;
    const { id } = req.params;

    if (authHeader) {
      const token = authHeader.split(" ")[1];
      const decodedToken = decode(token);

      if (
        decodedToken.email === ADMIN_EMAIL &&
        decodedToken.password === ADMIN_PASSWORD
      ) {
        await pool.query(`DELETE FROM pelatih_tari WHERE id = '${id}'`);

        res.status().json({
          statusCode: 200,
          message: `Success delete pelatih tari`,
        });
      } else {
        res.status().json({
          statusCode: 401,
          message: "Not Authorized!",
        });
      }
    } else {
      res.status().json({
        statusCode: 401,
        message: "Not Authorized!",
      });
    }
  } catch (err) {
    res.status().json({
      statusCode: 400,
      message: "Failed to delete!",
    });
  }
}

export async function getDetailPelatihTari(req, res) {
  try {
    const name = req.params.name;

    const normalizedName = name
      .split("-")
      .map((item) => item[0].toUpperCase() + item.substring(1))
      .join(" ");

    const [results] = await pool.query(
      `SELECT name, image, description, rating, price, total_review, detail_pelatih_tari.tentang_pelatih, detail_pelatih_tari.image_1, detail_pelatih_tari.image_2, detail_pelatih_tari.image_3, detail_pelatih_tari.price_per_paket FROM pelatih_tari LEFT JOIN detail_pelatih_tari ON pelatih_tari.id = detail_pelatih_tari.pelatih_tari_id WHERE name = '${normalizedName}'`
    );

    if (results.length) {
      res.status(200).json({
        statusCode: 200,
        message: "Success get detail pelatih tari!",
        data: results,
      });
    } else {
      res.status(404).json({
        statusCode: 404,
        message: "No available detail pelatih tari!",
      });
    }
  } catch (err) {
    res.status(400).json({
      statusCode: 400,
      message: "Failed to get detail pelatih tari!",
    });
  }
}

// Midtrans payment
export async function transactionPelatihTari(req, res) {
  try {
    const { pelatih_tari_name, customer_details, item_details } = req.body;

    const { gross_amount, name, email, phone, city } = customer_details;

    const firstName = name.split(" ")[0];
    const lastName = name.split(" ").slice(1).join(" ");

    // Generate transaction id
    const transaction_id = `TRM-ITEM-${nanoid(10)}`;

    // Create midtrans snap
    const snap = new midtransClient.Snap({
      isProduction: false,
      serverKey: MIDTRANS_SERVER_KEY,
      clientKey: MIDTRANS_CLIENT_KEY,
    });

    /**
     * Parameter needed for transaction
     * @see https://docs.midtrans.com/reference/request-body-json-parameter
     */
    const parameter = {
      transaction_details: {
        order_id: transaction_id,
        gross_amount,
      },
      item_details,
      credit_card: {
        secure: true,
      },
      customer_details: {
        first_name: firstName,
        last_name: lastName,
        email,
        phone,
        billing_adress: {
          first_name: firstName,
          last_name: lastName,
          email,
          phone,
          city,
        },
      },
      callbacks: {
        // ganti localhost kalo mau up ke production
        finish: `${"http://localhost:3000"}/temukan-pelatih/${pelatih_tari_name}/ikuti-kursus/penilaian`,
      },
    };

    // Init transaction
    await snap.createTransaction(parameter).then((transaction) => {
      res.status(200).json({
        statusCode: 200,
        message: "Success create transaction!",
        token: transaction.token,
        redirect_url: transaction.redirect_url,
      });
    });
  } catch (err) {
    res
      .status(400)
      .json({ statusCode: 400, message: "Failed to create transaction!" });
  }
}

export async function getPelatihTari(_, res) {
  try {
    const [results] = await pool.query(`SELECT * FROM pelatih_tari`);

    if (results.length) {
      res.status(200).json({
        statusCode: 200,
        message: "Success get all pelatih tari!",
        data: results,
      });
    } else {
      res.status(404).json({
        statusCode: 404,
        message: "Noavailable pelatih tari!",
      });
    }
  } catch (err) {
    res
      .status(400)
      .json({ statusCode: 400, message: "Failed to get all pelatih tari!" });
  }
}

/*export async function userPaymentPelatihTariHandler(req, res) {
  try {
    const { email } = req.body;
    const [results] = await pool.query(
      `SELECT * FROM user_payment_pelatih_tari`
    );

    if (results.length) {
    }
  } catch (err) {
    res.status().json({ statusCode: 400, message: "Failed!" });
  }
}*/
