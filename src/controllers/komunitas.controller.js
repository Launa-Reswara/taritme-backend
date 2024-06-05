import { pool } from "../lib/utils/pool.js";

export async function getKomunitas(_, res) {
  try {
    const [results] = await pool.query(`SELECT * FROM komunitas`);

    if (results.length) {
      res.status(200).json({
        statusCode: 200,
        message: "Success get all komunitas!",
        data: results,
      });
    } else {
      res.json({
        statusCode: 404,
        message: "Komunitas data is not found!",
      });
    }
  } catch (err) {
    res.json({ statusCode: 500, message: err.message });
  }
}
