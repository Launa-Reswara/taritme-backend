import { getRatingOrComments } from "../lib/helpers/getRatingOrComments.js";
import { normalizeString } from "../lib/helpers/normalizeString.js";
import { uploadImage } from "../lib/utils/cloudinary.js";
import { decode } from "../lib/utils/jwt.js";
import { pool } from "../lib/utils/pool.js";

export async function getUsers(_, res) {
  try {
    const [results] = await pool.query(
      `SELECT users.id, users.name, users.email, users.is_already_paid, users_profile.jenis_kelamin, users_profile.bio, users_profile.no_hp, users_profile.image FROM users LEFT JOIN users_profile ON users.id = users_profile.users_id`
    );

    if (results.length) {
      res.status(200).json({
        statusCode: 200,
        message: "Success get all users!",
        data: results,
      });
    } else if (results.length === 0) {
      res.status(200).json({
        statusCode: 200,
        message: "Success, but no available users!",
        data: results,
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
    const authHeader = req.headers.authorization;

    if (authHeader) {
      const token = authHeader.split(" ")[1];
      const decodedToken = decode(token);

      const [results] = await pool.query(
        `SELECT users.id, name, email, users_profile.jenis_kelamin, users_profile.bio, users_profile.no_hp, users_profile.age, users_profile.image FROM users LEFT JOIN users_profile ON users.id = users_profile.users_id WHERE email = '${decodedToken.email}'`
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
    } else {
      res.status(401).json({
        statusCode: 401,
        message: "Not Authorized!",
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

    const { id } = req.params;

    if (authHeader) {
      const b64 = Buffer.from(req.file.buffer).toString("base64");

      let dataURI = "data:" + req.file.mimetype + ";base64," + b64;

      const cloudinaryResponse = await uploadImage(dataURI, "users_profile");

      if (cloudinaryResponse) {
        await pool.query(
          `UPDATE users_profile SET image = '${cloudinaryResponse.secure_url}' WHERE users_id = '${id}'`
        );

        res.status(200).json({
          statusCode: 200,
          message: "Success upload image!",
          data: cloudinaryResponse.secure_url,
        });
      } else {
        res.status(400).json({
          statusCode: 400,
          message: "Error while uploading image!",
        });
      }
    } else {
      res.status(401).json({
        statusCode: 401,
        message: "Not Authorized!",
      });
    }
  } catch (err) {
    res.status(400).json({
      statusCode: 400,
      message: "Failed to edit image!",
    });
  }
}

export async function editUserProfile(req, res) {
  try {
    const authHeader = req.headers.authorization;

    const { id } = req.params;
    const { name, no_hp, jenis_kelamin, age, bio } = req.body;

    if (authHeader) {
      await pool.query(
        `UPDATE users_profile JOIN users ON users_profile.users_id = users.id SET users.name = '${name}', no_hp = '${no_hp}', jenis_kelamin = '${jenis_kelamin}', age = '${age}', bio = '${bio}' WHERE users_profile.users_id = '${id}'`
      );

      res.status(200).json({
        statusCode: 200,
        message: `Success edit users profile ${name}!`,
      });
    } else {
      res.status(401).json({
        statusCode: 401,
        message: "Not Authorized!",
      });
    }
  } catch (err) {
    res.status(400).json({
      statusCode: 400,
      message: "Failed to edit users profile!",
    });
  }
}

// riwayat kursus
export async function getRiwayatKursus(req, res) {
  try {
    const authHeader = req.headers.authorization;

    if (authHeader) {
      const token = authHeader.split(" ")[1];
      const decodedToken = decode(token);

      const [results] = await pool.query(
        `SELECT * FROM riwayat_kursus WHERE email = '${decodedToken.email}'`
      );

      const newArr = await Promise.all(
        results.map(async (item) =>
          Object.assign(item, {
            rating: await getRatingOrComments("rating", item.pelatih_tari_name),
            total_comments: await getRatingOrComments(
              "comments",
              item.pelatih_tari_name
            ),
          })
        )
      );

      res.status(200).json({
        statusCode: 200,
        message: "Success to get riwayat kursus!",
        data: newArr,
      });
    } else {
      res.status(401).json({
        statusCode: 401,
        message: "Not authorized!",
      });
    }
  } catch (err) {
    res
      .status(400)
      .json({ statusCode: 400, message: "Failed to get riwayat kursus!" });
  }
}

export async function addRiwayatKursus(req, res) {
  try {
    const authHeader = req.headers.authorization;

    const { pelatih_tari_name, order_id } = req.body;

    if (authHeader) {
      const token = authHeader.split(" ")[1];
      const decodedToken = decode(token);

      const [users] = await pool.query(
        `SELECT id, name FROM users WHERE email = '${decodedToken.email}'`
      );

      const [pelatih_tari] = await pool.query(
        `SELECT * FROM pelatih_tari WHERE name = '${normalizeString(
          pelatih_tari_name
        )}'`
      );

      await pool.query(
        `UPDATE users SET is_already_paid = 1 WHERE email = '${decodedToken.email}'`
      );

      await pool.query(
        `INSERT INTO riwayat_kursus (email, pelatih_tari_name, pelatih_tari_image, pelatih_tari_price, pelatih_tari_description, users_id, pelatih_tari_id, order_id) VALUES ('${decodedToken.email}', '${pelatih_tari[0].name}', '${pelatih_tari[0].image}', '${pelatih_tari[0].price}', '${pelatih_tari[0].description}', '${users[0].id}', '${pelatih_tari[0].id}', '${order_id}')`
      );

      res.status(200).json({
        statusCode: 200,
        message: "Success add riwayat kursus!",
        data: { users: users[0], pelatih_tari: pelatih_tari[0] },
      });
    }
  } catch (err) {
    res
      .status(400)
      .json({ statusCode: 400, message: "Failed to add riwayat kursus!" });
  }
}

export async function deleteUserAccount(req, res) {
  try {
    const { id } = req.params;

    await pool.query(`DELETE FROM users WHERE id = '${id}'`);

    res.status(200).json({
      statusCode: 200,
      message: "Success to delete user account!",
    });
  } catch (err) {
    res
      .status(400)
      .json({ statusCode: 400, message: "Failed to delete user account!" });
  }
}
