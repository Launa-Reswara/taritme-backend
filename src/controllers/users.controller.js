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
      `SELECT name, email, users_profile.jenis_kelamin, users_profile.bio, users_profile.no_hp, users_profile.age, users_profile.image FROM users LEFT JOIN users_profile ON users.id = users_profile.id WHERE email = '${decodedToken.email}'`
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

export async function uploadImageUserProfile(req, res) {
  try {
    const authHeader = req.headers.authorization;

    if (authHeader) {
      const token = authHeader.split(" ")[1];
      const decodedToken = decode(token);

      const b64 = Buffer.from(req.file.buffer).toString("base64");

      let dataURI = "data:" + req.file.mimetype + ";base64," + b64;

      const cloudinaryResponse = await uploadImage(dataURI, "user-profile");

      if (cloudinaryResponse) {
        res.status().json({
          statusCode: 200,
          message: "Success upload image!",
          data: cloudinaryResponse.secure_url,
        });
      } else {
        res.status().json({
          statusCode: 400,
          message: "Error while uploading image!",
        });
      }
    } else {
      res.status().json({
        statusCode: 401,
        message: "Not Authorized!",
      });
    }
  } catch (err) {
    res.status().json({
      statusCode: 400,
      message: "Failed to edit data!",
    });
  }
}
