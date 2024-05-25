import midtransClient from "midtrans-client";

// WIP
// Midtrans payment
export async function transactionHandler(req, res) {
  try {
    const { name, email } = req.body;

    const transaction_id = `TRX-1241241`;

    const authString = btoa(`${process.env.MIDTRANS_SERVER_KEY}:`);

    const snap = new midtransClient.Snap({
      isProduction: false,
      serverKey: process.env.MIDTRANS_SERVER_KEY,
    });

    const parameter = {
      transaction_details: {
        order_id: transaction_id,
        gross_amount: 10000,
      },
      credit_card: {
        secure: true,
      },
      customer_details: {
        first_name: name,
        email: email,
      },
    };

    snap.createTransaction(parameter).then((transaction) => {
      let transactionToken = transaction.token;
      res.json({
        statusCode: 200,
        message: "Success create transaction!",
        token: transactionToken,
      });
    });

    /*const payload = {
      transaction_details: {
        order_id: transaction_id,
        gross_amount,
      },
      item_details: result.map((item) => ({
        id: item.id,
        price: item.harga,
        quantity: 1,
        name: item.name,
      })),
      customer_details: {
        first_name: customer_name,
        email: customer_email,
      },
      callbacks: {
        finish: `${FRONTEND_URL}/order-status?transaction_id=${transaction_id}`,
      },
    };

    const response = await fetch(`${MIDTRANS_APP_URL}/snap/v1/transactions`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
        Authorization: `Basic ${authString}`,
      },
      body: JSON.stringify(payload),
    });

    const data = await response.json();

    if (response.status !== 201) {
      return res.status(500).send({
        statusCode: 500,
        message: "Failed to create transaction!",
      });
    }

    return res.json({
      statusCode: 200,
      message: "Success create transaction!",
      data: {
        id: transaction_id,
        status: PENDING_PAYMENT,
        customer_name,
        customer_email,
        pelatih: result,
        snap_token: data.token,
        snap_redirect_url: null,
      },
    });*/
  } catch (err) {
    res.send({ statusCode: 500, message: "Failed to create transaction!" });
  }
}
