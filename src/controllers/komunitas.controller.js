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
      res.status(404).json({
        statusCode: 404,
        message: "No available komunitas!",
      });
    }
  } catch (err) {
    res.status(400).json({ statusCode: 400, message: err.message });
  }
}
