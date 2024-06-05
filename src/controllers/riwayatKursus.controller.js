import { pool } from "../lib/utils/pool.js";

export async function getRiwayatKursus(req, res) {
  try {
    const [results] = await pool.query(`SELECT * FROM riwayat_kursus`);

    if (results.length) {
      res.status(200).json({
        statusCode: 200,
        message: "Success get riwayat kursus!",
        data: results,
      });
    } else {
      res.status(404).json({
        statusCode: 404,
        message: "No available riwayat kursus!",
      });
    }
  } catch (err) {
    res.status(400).json({
      statusCode: 400,
      message: "Failed to get riwayat kursus!",
    });
  }
}
