import { pool } from "../lib/utils/pool.js";

export async function getUsers(_, res) {
  try {
    const [result] = await pool.query(`SELECT * FROM users`);

    if (result.length) {
      res.send({
        statusCode: 200,
        message: "Success get all pelatih tari!",
        data: result,
      });
    } else {
      res.send({
        statusCode: 404,
        message: "No available users!",
      });
    }
  } catch (err) {
    res.json({ statusCode: 400, message: "Failed to get all users" });
  }
}

export async function getUserProfile(_, res) {
  try {
    const [results] = await pool.query(
      `SELECT id, name, email, users_profile.jenis_kelamin, users_profile.bio, users_profile.no_hp, users_profile.age, users_profile.image FROM users LEFT JOIN users_profil WHERE id = users_profile.id`
    );

    if (results.length) {
      res.json({
        statusCode: 200,
        message: "Success get user profil!",
        data: results,
      });
    } else {
      res.json({
        statusCode: 404,
        message: "No available user profile!",
      });
    }
  } catch (err) {
    res.json({ statusCode: 400, message: "Failed to get all users" });
  }
}
