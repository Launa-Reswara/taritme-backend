import { connection } from "../lib/utils/connection.js";

export async function adminStatistics(req, res) {
  try {
    const [result] = await connection.query(
      `SELECT users.id, users.name, users.email, user_payment_pelatih_tari.user_id, user_payment_pelatih_tari.is_user_pay FROM users LEFT JOIN user_payment_pelatih_tari ON users.id = user_payment_pelatih_tari.user_id`
    );

    res.send({
      statusCode: 200,
      message: "Success get data!",
      data: result,
    });
  } catch (err) {
    res.send({
      statusCode: 400,
      message: "Failed to get data!",
    });
  }
}
