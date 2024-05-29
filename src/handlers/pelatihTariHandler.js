import { connection } from "../lib/utils/connection.js";
import midtransClient from "midtrans-client";
import { nanoid } from "nanoid";

export async function pelatihTariHandler(_, res) {
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

export async function detailPelatihTariHandler() {
  try {
    const [result] = await connection.query(
      `SELECT pelatih_tari.name, pelatih_tari.description, pelatih_tari.rating, pelatih_tari.price, pelati_tari.total_review, detail_pelatih_tari.tentang_pelatih,detail_pelatih_tari.image_1,detail_pelatih_tari.image_2,detail_pelatih_tari.image_3 FROM pelatih_tari LEFT JOIN detail_pelatih_tari ON pelatih_tari.id = detail_pelatih_tari.pelatih_tari_id,`
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
export async function transactionPelatihTariHandler(req, res) {
  try {
    const { customer_details, item_details } = req.body;

    const { gross_amount, name, email, phone, city } = customer_details;

    const firstName = name.split(" ")[0];
    const lastName = name.split(" ").slice(1).join(" ");

    // Generate transaction id
    const transaction_id = `TRM-ITEM-${nanoid(10)}`;

    // Create midtrans snap
    const snap = new midtransClient.Snap({
      isProduction: false,
      serverKey: process.env.MIDTRANS_SERVER_KEY,
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
      item_details,
      callbacks: {
        finish: `
        ${
          process.env.NODE_ENV === "development"
            ? process.env.FRONTEND_DEVELOPMENT_URL
            : process.env.FRONTEND_PRODUCTION_URL
        }/temukan-pelatih
        `,
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
