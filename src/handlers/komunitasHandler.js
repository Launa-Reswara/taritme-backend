import { connection } from "../lib/utils/connection.js";

export async function komunitasHandler(req, res) {
  try {
    const [results] = await connection().then((res) => res);
  } catch (err) {
    res.send({ statusCode: 500, message: err.message });
  }
}
