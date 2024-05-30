import { connection } from "../lib/utils/connection.js";

export async function RiwayatKursusHandler(req, res) {
  try {
    const [results] = await connection.query(`SELECT * FROM riwayat_kursus`);

    if (results.length) {
      res.send({
        statusCode: 200,
        message: "Berhasil mendapatkan riwayat kurus!",
        data: results,
      });
      return results;
    } else {
      res.send({
        statusCode: 404,
        message: "Data tidak diemukan!",
      });
    }
  } catch (err) {}
}
