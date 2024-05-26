import midtransClient from "midtrans-client";
import { nanoid } from "nanoid";

// Midtrans payment
export async function transactionHandler(req, res) {
  try {
    const { name, email, gross_amount, phone } = req.body;

    // generate transaction id
    const transaction_id = `TRM-ITEM-${nanoid(10)}`;

    const snap = new midtransClient.Snap({
      isProduction: false,
      serverKey: process.env.MIDTRANS_SERVER_KEY,
    });

    const parameter = {
      transaction_details: {
        order_id: transaction_id,
        gross_amount,
      },
      credit_card: {
        secure: true,
      },
      customer_details: {
        first_name: name,
        email: email,
        phone,
      },
    };

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
