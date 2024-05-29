import { connection } from "../lib/utils/connection.js";

export async function arsipKesenianHandler(req, res) {
  try {
    const [result] = await connection.query(`SELECT * FROM arsip_kesenian`);

    if (result.length) {
      res.send({
        statusCode: 200,
        message: "Success get arsip kesenian!",
        data: result,
      });
    } else {
      res.send({
        statusCode: 404,
        message: "Data is not available!",
      });
    }
  } catch (err) {
    res.send({ statusCode: 400, message: "Error! There is something wrong" });
  }
}

export async function detailArsipKesenianHandler(req, res) {
  try {
    const [result] = await connection.query(`SELECT *  FROM WHERE `);
  } catch (err) {
    res.send({ statusCode: 400, message: err.message });
  }
}
