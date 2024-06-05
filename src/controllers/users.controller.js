import { decode } from "../lib/utils/jwt.js";
import { pool } from "../lib/utils/pool.js";

export async function getUsers(_, res) {
  try {
    const [results] = await pool.query(`SELECT * FROM users`);

    if (results.length) {
      res.status(200).json({
        statusCode: 200,
        message: "Success get all pelatih tari!",
        data: results,
      });
    } else {
      res.status(404).json({
        statusCode: 404,
        message: "No available users!",
      });
    }
  } catch (err) {
    res
      .status(400)
      .json({ statusCode: 400, message: "Failed to get all users" });
  }
}

export async function getUserProfile(req, res) {
  try {
    const { token } = req.body;

    const decodedToken = decode(token);

    const [results] = await pool.query(
      `SELECT id, name, email, FROM users WHERE email = '${decodedToken.email}'`
    );

    if (results.length) {
      res.status(200).json({
        statusCode: 200,
        message: "Success get user profile!",
        data: results,
      });
    } else {
      res.status(404).json({
        statusCode: 404,
        message: "No available user profile!",
      });
    }
  } catch (err) {
    res
      .status(400)
      .json({ statusCode: 400, message: "Failed to get user profile!" });
  }
}
