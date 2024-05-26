import { connection } from "../lib/utils/connection.js";

export async function komunitasHandler(_, res) {
  try {
    const [results] = await connection.query(`SELECT * FROM komunitas`);

    if (results.length) {
      res.json({
        statusCode: 200,
        message: "Success get all komunitas!",
        data: results,
      });
    }
  } catch (err) {
    res.status(500).json({ statusCode: 500, message: err.message });
  }
}
