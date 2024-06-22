import { formatToSqlDate } from "../lib/helpers/formatToSqlDate.js";
import { getRatingOrComments } from "../lib/helpers/getRatingOrComments.js";
import { normalizeString } from "../lib/helpers/normalizeString.js";
import { uploadImage } from "../lib/utils/cloudinary.js";
import {
  ADMIN_EMAIL,
  ADMIN_PASSWORD,
  FRONTEND_PRODUCTION_URL,
  MIDTRANS_API_URL,
  MIDTRANS_CLIENT_KEY,
  MIDTRANS_SERVER_KEY,
} from "../lib/utils/constants.js";
import { decode } from "../lib/utils/jwt.js";
import { pool } from "../lib/utils/pool.js";
import axios from "axios";
import midtransClient from "midtrans-client";
import { nanoid } from "nanoid";

export async function uploadImagePelatihTari(req, res) {
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
        const b64 = Buffer.from(req.file.buffer).toString("base64");

        let dataURI = "data:" + req.file.mimetype + ";base64," + b64;

        const cloudinaryResponse = await uploadImage(dataURI, "pelatih_tari");

        if (cloudinaryResponse) {
          await pool.query(
            `UPDATE pelatih_tari SET image = '${cloudinaryResponse.secure_url}' WHERE id = '${id}'`
          );

          res.status(200).json({
            statusCode: 200,
            message: "Success upload image!",
            data: cloudinaryResponse.secure_url,
          });
        } else {
          res.status(400).json({
            statusCode: 400,
            message: "Error while uploading image!",
          });
        }
      }
    } else {
      res.status(401).json({
        statusCode: 401,
        message: "Not Authorized!",
      });
    }
  } catch (err) {
    res.status(400).json({
      statusCode: 400,
      message: "Failed to upload image!",
    });
  }
}

export async function addImagePelatihTari(req, res) {
  try {
    const authHeader = req.headers.authorization;

    if (authHeader) {
      const token = authHeader.split(" ")[1];
      const decodedToken = decode(token);

      if (
        decodedToken.email === ADMIN_EMAIL &&
        decodedToken.password === ADMIN_PASSWORD
      ) {
        const b64 = Buffer.from(req.file.buffer).toString("base64");

        let dataURI = "data:" + req.file.mimetype + ";base64," + b64;

        const cloudinaryResponse = await uploadImage(dataURI, "pelatih_tari");

        if (cloudinaryResponse) {
          res.status(200).json({
            statusCode: 200,
            message: "Success add image!",
            data: cloudinaryResponse.secure_url,
          });
        } else {
          res.status(400).json({
            statusCode: 400,
            message: "Error while adding image!",
          });
        }
      }
    } else {
      res.status(401).json({
        statusCode: 401,
        message: "Not Authorized!",
      });
    }
  } catch (err) {
    res.status(400).json({
      statusCode: 400,
      message: "Failed to add image!",
    });
  }
}

export async function addPelatihTari(req, res) {
  try {
    const authHeader = req.headers.authorization;
    const { email, image, name, no_hp, status, description, price } = req.body;

    if (authHeader) {
      const token = authHeader.split(" ")[1];
      const decodedToken = decode(token);

      if (
        decodedToken.email === ADMIN_EMAIL &&
        decodedToken.password === ADMIN_PASSWORD
      ) {
        await pool.query(
          `INSERT INTO pelatih_tari(email, name, no_hp, description, image, price, status, created_at) VALUES('${email}', '${name}', '${no_hp}', '${description}', '${image}', '${price}', '${status}', '${formatToSqlDate(
            new Date()
          )}')`
        );

        res.status(200).json({
          statusCode: 200,
          message: `Success add pelatih tari ${name}!`,
        });
      }
    } else {
      res.status(401).json({
        statusCode: 401,
        message: "Not Authorized!",
      });
    }
  } catch (err) {
    res.status(400).json({
      statusCode: 400,
      message: "Failed to add pelatih tari!",
    });
  }
}

export async function editPelatihTari(req, res) {
  try {
    const authHeader = req.headers.authorization;

    const { id } = req.params;
    const { email, name, no_hp, status, description, price } = req.body;

    if (authHeader) {
      const token = authHeader.split(" ")[1];
      const decodedToken = decode(token);

      if (
        decodedToken.email === ADMIN_EMAIL &&
        decodedToken.password === ADMIN_PASSWORD
      ) {
        await pool.query(
          `UPDATE pelatih_tari SET email = '${email}', name = '${name}', no_hp = '${no_hp}', description = '${description}', price = '${price}', status = '${status}' WHERE id = '${id}'`
        );

        res.status(200).json({
          statusCode: 200,
          message: `Success edit pelatih tari ${name}!`,
        });
      }
    } else {
      res.status(401).json({
        statusCode: 401,
        message: "Not Authorized!",
      });
    }
  } catch (err) {
    res.status(400).json({
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

        res.status(200).json({
          statusCode: 200,
          message: `Success delete pelatih tari`,
        });
      } else {
        res.status(401).json({
          statusCode: 401,
          message: "Not Authorized!",
        });
      }
    } else {
      res.status(401).json({
        statusCode: 401,
        message: "Not Authorized!",
      });
    }
  } catch (err) {
    res.status(400).json({
      statusCode: 400,
      message: "Failed to delete!",
    });
  }
}

export async function getDetailPelatihTari(req, res) {
  try {
    const name = req.params.name;

    const [results] = await pool.query(
      `SELECT pelatih_tari.id, name, image, description, price, detail_pelatih_tari.tentang_pelatih, detail_pelatih_tari.image_1, detail_pelatih_tari.image_2, detail_pelatih_tari.image_3 FROM pelatih_tari LEFT JOIN detail_pelatih_tari ON pelatih_tari.id = detail_pelatih_tari.pelatih_tari_id WHERE name = '${normalizeString(
        name
      )}'`
    );

    const newArr = await Promise.all(
      results.map(async (item) =>
        Object.assign(item, {
          rating: await getRatingOrComments("rating", item.name),
          total_comments: await getRatingOrComments("comments", item.name),
        })
      )
    );

    if (newArr.length) {
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
    const authHeader = req.headers.authorization;

    if (authHeader) {
      const token = authHeader.split(" ")[1];
      const decodedToken = decode(token);
      const email = decodedToken.email;

      const { pelatih_tari_name, customer_details, item_details } = req.body;

      const { gross_amount, name, phone, city } = customer_details;

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
          finish: `${FRONTEND_PRODUCTION_URL}/temukan-pelatih/${pelatih_tari_name}/ikuti-kursus/penilaian`,
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
    } else {
      res.status(401).json({
        statusCode: 401,
        message: "Not authorized!",
      });
    }
  } catch (err) {
    res
      .status(400)
      .json({ statusCode: 400, message: "Failed to create transaction!" });
  }
}

export async function getPelatihTari(_, res) {
  try {
    const [results] = await pool.query(`SELECT * FROM pelatih_tari`);

    const newArr = await Promise.all(
      results.map(async (item) =>
        Object.assign(item, {
          rating: await getRatingOrComments("rating", item.name),
          total_comments: await getRatingOrComments("comments", item.name),
        })
      )
    );

    if (newArr.length) {
      res.status(200).json({
        statusCode: 200,
        message: "Success get all pelatih tari!",
        data: newArr,
      });
    } else {
      res.status(404).json({
        statusCode: 404,
        message: "No available detail pelatih tari!",
      });
    }
  } catch (err) {
    res
      .status(400)
      .json({ statusCode: 400, message: "Failed to get all pelatih tari!" });
  }
}

export async function getPaymentStatusPelatihTari(req, res) {
  try {
    const authHeader = req.headers.authorization;

    const { order_id } = req.params;

    if (authHeader) {
      const response = await axios.get(
        `${MIDTRANS_API_URL}/v2/${order_id}/status`,
        {
          headers: { Authorization: `Basic ${btoa(MIDTRANS_SERVER_KEY)}` },
        }
      );

      const [results] = await pool.query(
        `SELECT * FROM penilaian_pelatih_tari WHERE order_id = '${order_id}'`
      );

      if (results.length === 0) {
        if (response.status === 200) {
          res.status(200).json({
            statusCode: 200,
            message: "Success get payment status!",
            data: response.data,
          });
        } else {
          res.status(404).json({
            statusCode: 404,
            message: "No payment status available!",
          });
        }
      } else {
        res.status(401).json({
          statusCode: 401,
          message: "You've given review in this transaction before!",
        });
      }
    } else {
      res.status(401).json({ statusCode: 401, message: "Not authorized!" });
    }
  } catch (err) {
    res
      .status(400)
      .json({ statusCode: 400, message: "Failed to get payment status!" });
  }
}

// penilaian pelatih tari
export async function penilaianPelatihTari(req, res) {
  try {
    const authHeader = req.headers.authorization;

    const { pelatih_tari_id, pelatih_tari_name, rating, comment, order_id } =
      req.body;

    if (authHeader) {
      const token = authHeader.split(" ")[1];
      const decodedToken = decode(token);

      const [results] = await pool.query(
        `SELECT name FROM users WHERE email = '${decodedToken.email}' LIMIT 1`
      );

      if (results.length) {
        await pool.query(
          `INSERT INTO penilaian_pelatih_tari (pelatih_tari_id, pelatih_tari_name, rating, comment, users_email, users_name, order_id) VALUES ('${pelatih_tari_id}', '${pelatih_tari_name}', '${rating}', '${comment}', '${decodedToken.email}', '${results[0].name}', '${order_id}')`
        );

        res.status(200).json({
          statusCode: 200,
          message: "Success to add penilaian!",
        });
      } else {
        res.status(404).json({
          statusCode: 404,
          message: "Your name is not available!",
        });
      }
    } else {
      res.status(401).json({
        statusCode: 401,
        message: "Not authorized!",
      });
    }
  } catch (err) {
    res
      .status(400)
      .json({ statusCode: 400, message: "Failed to add penilaian!" });
  }
}

export async function getPenilaianPelatihTari(req, res) {
  try {
    const authHeader = req.headers.authorization;

    const { name } = req.params;

    if (authHeader) {
      const [results] = await pool.query(
        `SELECT * FROM penilaian_pelatih_tari WHERE pelatih_tari_name = '${normalizeString(
          name
        )}'`
      );

      res.status(200).json({
        statusCode: 200,
        message: "Success get penilaian pelatih tari!",
        data: results,
      });
    } else {
      res.status(401).json({
        statusCode: 401,
        message: "Not authorized!",
      });
    }
  } catch (err) {
    res.status(400).json({
      statusCode: 400,
      message: "Failed to get penilaian pelatih tari!",
    });
  }
}
