import { connection } from "../lib/utils/connection.js";

export async function getUsers(_, res) {
  try {
    const [result] = await connection.query(`SELECT * FROM users`);

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
    res.json({ statusCode: 400, message: "Failed to create transaction!" });
  }
}
