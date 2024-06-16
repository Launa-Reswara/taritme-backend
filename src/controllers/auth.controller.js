import { ADMIN_EMAIL, ADMIN_PASSWORD } from "../lib/utils/constants.js";
import { encode } from "../lib/utils/jwt.js";
import { checkPassword, hashPassword } from "../lib/utils/password.js";
import { pool } from "../lib/utils/pool.js";
import passport from "passport";

export async function loginUserAccount(req, res) {
  try {
    if (!req.body.email || !req.body.password) {
      res.status(401).json({
        statusCode: 401,
        message: "Login gagal, data tidak lengkap!",
      });
    } else {
      const payload = {
        email: req.body.email,
        password: req.body.password,
      };

      const [results] = await pool.query(
        `SELECT * FROM users WHERE email = '${payload.email}'`
      );

      // JWT token
      const newToken = encode(payload);

      const isTruePassword = checkPassword(
        payload.password,
        results[0].password
      );

      if (results.length && isTruePassword) {
        res.status(200).json({
          statusCode: 200,
          message: "Login berhasil!",
          data: results[0],
          token: newToken,
        });
      } else {
        res.status(401).json({
          statusCode: 401,
          message: "Login gagal, data yang dimasukkan salah!",
        });
      }
    }
  } catch (err) {
    res.status(400).json({
      statusCode: 400,
      message: "Login gagal!",
    });
  }
}

export async function registrationUserAccount(req, res) {
  try {
    const payload = {
      name: req.body.name,
      email: req.body.email,
      password: req.body.password,
    };

    const [results] = await pool.query(
      `SELECT * FROM users WHERE email = '${payload.email}' `
    );

    if (!payload.name || !payload.email || !payload.password) {
      res.status(401).json({
        statusCode: 401,
        message: "Registrasi akun gagal, data yang dimasukkan belum lengkap!",
      });
    } else if (results.length) {
      res.status(401).json({
        statusCode: 401,
        message:
          "Registrasi akun gagal, Email yang dimasukkan telah dipakai oleh akun lain!",
      });
    } else {
      await pool.query(
        `INSERT INTO users (name, email, password) VALUES ('${
          payload.name
        }', '${payload.email}', '${hashPassword(payload.password)}')`
      );

      await pool.query(
        `INSERT INTO users_profile (users_id) SELECT id FROM users WHERE id = LAST_INSERT_ID() LIMIT 1`
      );

      res.status(200).json({
        statusCode: 200,
        message: "Registrasi akun berhasil!",
      });
    }
  } catch (err) {
    res.status(400).json({
      statusCode: 400,
      message: "Registrasi akun gagal, silahkan coba lagi!",
    });
  }
}

export async function loginAdmin(req, res) {
  try {
    if (!req.body.email || !req.body.password) {
      res.status(401).json({
        statusCode: 401,
        message: "Login sebagai admin gagal, data tidak lengkap!",
      });
    } else {
      const payload = {
        email: req.body.email,
        password: req.body.password,
      };

      // JWT token
      const newToken = encode(payload);

      if (
        payload.email === ADMIN_EMAIL &&
        payload.password === ADMIN_PASSWORD
      ) {
        res.status(200).json({
          statusCode: 200,
          message: "Login sebagai admin berhasil!",
          token: newToken,
        });
      } else {
        res.status(401).json({
          statusCode: 401,
          message: "Login sebagai admin gagal, data yang dimasukkan salah!",
        });
      }
    }
  } catch (err) {
    res.status(400).json({
      statusCode: 400,
      message: "Login sebagai admin gagal!",
    });
  }
}
