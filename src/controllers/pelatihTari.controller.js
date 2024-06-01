import { connection } from "../lib/utils/connection.js";
import {
  CONDITION,
  FRONTEND_DEVELOPMENT_URL,
  FRONTEND_PRODUCTION_URL,
  MIDTRANS_CLIENT_KEY,
  MIDTRANS_SERVER_KEY,
} from "../lib/utils/constants.js";
import midtransClient from "midtrans-client";
import { nanoid } from "nanoid";

// TODO: delete, edit
export async function getPelatihTari(_, res) {
  try {
    const [result] = await connection.query(
      `SELECT * FROM pelatih_tari LEFT JOIN data_pelatih_tari ON pelatih_tari.id = data_pelatih_tari.pelatih_tari_id`
    );

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

export async function deletePelatihTari(req, res) {
  try {
    const { email } = req.body;

    const [result] = await connection.query(
      `DELETE pelatih_tari, data_pelatih_tari FROM pelatih_tari LEFT JOIN data_pelatih_tari ON pelatih_tari.id = data_pelatih_tari.pelatih_tari_id WHERE data_pelatih_tari.email = '${email}'`
    );

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
