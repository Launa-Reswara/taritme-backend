import { connection } from "../lib/utils/connection.js";
import {
  ADMIN_EMAIL,
  ADMIN_PASSWORD,
  MIDTRANS_CLIENT_KEY,
  MIDTRANS_SERVER_KEY,
} from "../lib/utils/constants.js";
import { decode } from "../lib/utils/jwt.js";
import { uploadImage } from "../lib/utils/uploadImage.js";
import midtransClient from "midtrans-client";
import { nanoid } from "nanoid";

// TODO: delete, edit
export async function getPelatihTari(_, res) {
  try {
    const [result] = await connection.query(`SELECT * FROM pelatih_tari`);

    if (result.length) {
      res.send({
        statusCode: 200,
        message: "Success get all pelatih tari!",
        data: result,
      });
    } else {
      res.send({
        statusCode: 404,
        message: "Data is not available!",
      });
    }
  } catch (err) {
    res.send({
      statusCode: 400,
      message: "Failed to get data!",
    });
  }
}

export async function uploadImagePelatihTari(req, res) {
  try {
    const authHeader = req.headers.authorization;

    if (authHeader) {
      const b64 = Buffer.from(req.file.buffer).toString("base64");

      let dataURI = "data:" + req.file.mimetype + ";base64," + b64;

      const cloudinaryResponse = await uploadImage(dataURI);

      if (cloudinaryResponse) {
        res.send({
          statusCode: 200,
          message: "Success upload image!",
          data: cloudinaryResponse.secure_url,
        });
      } else {
        res.send({
          statusCode: 400,
          message: "Error while uploading image!",
        });
      }
    } else {
      res.send({
        statusCode: 401,
        message: "Not Authorized!",
      });
    }
  } catch (err) {
    res.send({
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
      }

      await connection.query(
        `INSERT INTO pelatih_tari(email, name, no_hp, description, image, price, status, rating, total_review) VALUES('${email}', '${name}', '${no_hp}', '${description}', '${image}', '${price}', '${status}', 5, 10)`
      );

      res.send({
        statusCode: 200,
        message: `Success add pelatih tari ${name}!`,
      });
    } else {
      res.send({
        statusCode: 401,
        message: "Not Authorized!",
      });
    }
  } catch (err) {
    res.send({
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
        await connection.query(
          `UPDATE pelatih_tari SET email = '${email}', name = '${name}', no_hp = '${no_hp}', description = '${description}', image = '${image}', price = '${price}', status = '${status}' WHERE id = '${id}'`
        );

        res.send({
          statusCode: 200,
          message: `Success edit pelatih tari ${name}!`,
        });
      }
    } else {
      res.send({
        statusCode: 401,
        message: "Not Authorized!",
      });
    }
  } catch (err) {
    res.send({
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
        await connection.query(`DELETE FROM pelatih_tari WHERE id = '${id}'`);

        res.send({
          statusCode: 200,
          message: `Success delete pelatih tari`,
        });
      } else {
        res.send({
          statusCode: 401,
          message: "Not Authorized!",
        });
      }
    } else {
      res.send({
        statusCode: 401,
        message: "Not Authorized!",
      });
    }
  } catch (err) {
    res.send({
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

    const [result] = await connection.query(
      `SELECT name, image, description, rating, price, total_review, detail_pelatih_tari.tentang_pelatih, detail_pelatih_tari.image_1, detail_pelatih_tari.image_2, detail_pelatih_tari.image_3, detail_pelatih_tari.price_per_paket FROM pelatih_tari LEFT JOIN detail_pelatih_tari ON pelatih_tari.id = detail_pelatih_tari.pelatih_tari_id WHERE name = '${normalizedName}'`
    );

    if (result.length) {
      res.send({
        statusCode: 200,
        message: "Success get detail pelatih tari!",
        data: result,
      });
    } else {
      res.send({
        statusCode: 404,
        message: "Data is not available!",
      });
    }
  } catch (err) {
    res.send({
      statusCode: 400,
      message: "Failed to get data!",
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
      res.json({
        statusCode: 200,
        message: "Success create transaction!",
        token: transaction.token,
        redirect_url: transaction.redirect_url,
      });
    });
  } catch (err) {
    res.json({ statusCode: 400, message: "Failed to create transaction!" });
  }
}

/*export async function userPaymentPelatihTariHandler(req, res) {
  try {
    const { email } = req.body;
    const [result] = await connection.query(
      `SELECT * FROM user_payment_pelatih_tari`
    );

    if (result.length) {
    }
  } catch (err) {
    res.json({ statusCode: 400, message: "Failed!" });
  }
}*/
