import midtransClient from "midtrans-client";
import { nanoid } from "nanoid";

// Midtrans payment
export async function transactionHandler(req, res) {
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
          address,
          city,
        },
      },
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
    res.json({ statusCode: 500, message: "Failed to create transaction!" });
  }
}
