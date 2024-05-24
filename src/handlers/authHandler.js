import { connection } from "../lib/utils/connection.js";
import { encode } from "../lib/utils/jwt.js";

export async function loginHandler(req, res) {
  try {
    if (!req.body.email || !req.body.password) {
      res.send({
        statusCode: 401,
        message: "Login gagal, data tidak lengkap!",
      });
    } else {
      const payload = {
        email: req.body.email,
        password: req.body.password,
      };

      const [results] = await connection.query(
        `SELECT * FROM users WHERE email = '${payload.email}' AND password = '${payload.password}'`
      );

      // JWT token
      const newToken = encode(payload);

      if (results.length) {
        res.status(200);
        res.send({
          statusCode: res.statusCode,
          message: "Login berhasil!",
          data: results[0],
          token: newToken,
        });
      } else {
        res.send({
          statusCode: 401,
          message: "Login gagal, data yang dimasukkan salah!",
        });
      }
    }
  } catch (err) {
    res.status(500);
    res.send({
      status: 500,
      message: err.message,
    });
  }
}

async function checkUser(payload) {
  // WIP: insert to DB
  const [results] = await connection.query(
    `SELECT * FROM users WHERE email = '${payload.email}' AND password = '${payload.password}'`
  );

  if (results.length) return true;
  else return false;
}

export async function registrationHandler(req, res) {
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
      res.send({
        statusCode: 401,
        message: "Registrasi akun gagal, data yang dimasukkan belum lengkap!",
      });
    } else if (results.length) {
      res.send({
        statusCode: 401,
        message:
          "Registrasi akun gagal, Email yang dimasukkan telah dipakai oleh akun lain!",
      });
    } else {
      const [results] = await connection.query(
        `INSERT INTO users (name, email, password) VALUES ('${payload.name}', '${payload.email}', '${payload.password}')`
      );

      if (results) {
        res.status(200);
        res.send({
          statusCode: 200,
          message: "Registrasi akun berhasil!",
        });
      } else {
        res.send({
          statusCode: 400,
          message: "Registrasi akun gagal, silahkan coba lagi!",
        });
      }
    }
  } catch (err) {
    res.send({ statusCode: 500, message: err.message });
  }
}

export async function adminHandler(req, res) {
  try {
    if (!req.body.email || !req.body.password) {
      res.send({
        statusCode: 401,
        message: "Login gagal, data tidak lengkap!",
      });
    } else {
      const payload = {
        email: req.body.email,
        password: req.body.password,
      };

      if (
        payload.email === process.env.ADMIN_EMAIL &&
        payload.password === process.env.ADMIN_PASSWORD
      ) {
        res.status(200);
        res.send({
          statusCode: 200,
          message: "Login berhasil!",
        });
      } else {
        res.send({
          statusCode: 401,
          message: "Login gagal, data yang dimasukkan salah!",
        });
      }
    }
  } catch (err) {
    res.status(500);
    res.send({ statusCode: 500, message: err.message });
  }
}
