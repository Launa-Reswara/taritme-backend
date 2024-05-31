import { connection } from "../lib/utils/connection.js";
import { encode } from "../lib/utils/jwt.js";
import { checkPassword, hashPassword } from "../lib/utils/password.js";

export async function loginUserAccount(req, res) {
  try {
    if (!req.body.email || !req.body.password) {
      res.json({
        statusCode: 401,
        message: "Login gagal, data tidak lengkap!",
      });
    } else {
      const payload = {
        email: req.body.email,
        password: req.body.password,
      };

      const [results] = await connection.query(
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
          statusCode: res.statusCode,
          message: "Login berhasil!",
          data: results[0],
          token: newToken,
        });
      } else {
        res.json({
          statusCode: 401,
          message: "Login gagal, data yang dimasukkan salah!",
        });
      }
    }
  } catch (err) {
    res.json({
      status: 400,
      message: "Login gagal!",
      cause: err.message,
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

    const [results] = await connection.query(
      `SELECT * FROM users WHERE email = '${payload.email}' `
    );

    if (!payload.name || !payload.email || !payload.password) {
      res.json({
        statusCode: 401,
        message: "Registrasi akun gagal, data yang dimasukkan belum lengkap!",
      });
    } else if (results.length) {
      res.json({
        statusCode: 401,
        message:
          "Registrasi akun gagal, Email yang dimasukkan telah dipakai oleh akun lain!",
      });
    } else {
      const [results] = await connection.query(
        `INSERT INTO users (name, email, password) VALUES ('${
          payload.name
        }', '${payload.email}', '${hashPassword(payload.password)}')`
      );

      if (results) {
        res.status(200);
        res.json({
          statusCode: 200,
          message: "Registrasi akun berhasil!",
        });
      } else {
        res.json({
          statusCode: 400,
          message: "Registrasi akun gagal, silahkan coba lagi!",
        });
      }
    }
  } catch (err) {
    res.json({
      statusCode: 400,
      message: "Registrasi akun gagal, silahkan coba lagi!",
      // Note: kalo udah production, dihapus cause nya
      cause: err.message,
    });
  }
}

export async function loginAdmin(req, res) {
  try {
    if (!req.body.email || !req.body.password) {
      res.json({
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
        payload.email === process.env.ADMIN_EMAIL &&
        payload.password === process.env.ADMIN_PASSWORD
      ) {
        res.status(200).json({
          statusCode: 200,
          message: "Login sebagai admin berhasil!",
          token: newToken,
        });
      } else {
        res.json({
          statusCode: 401,
          message: "Login sebagai admin gagal, data yang dimasukkan salah!",
        });
      }
    }
  } catch (err) {
    res.json({
      statusCode: 400,
      message: "Login sebagai admin gagal!",
      cause: err.message,
    });
  }
}
