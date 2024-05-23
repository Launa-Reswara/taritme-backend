import { connection } from "../lib/utils/connection.js";
import { encode } from "../lib/utils/jwt.js";

/**
 * Structure for users
 *
 * id: integer not null
 * name: text(100)
 * email: text(100) not null
 * password: text(100) not null
 */
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

      // JWT token
      const newToken = encode(payload);

      if (payload.email === "halo@ekel.dev" && payload.password === "ekel123") {
        res.status(200);
        res.send({
          statusCode: res.statusCode,
          message: "Login berhasil!",
          data: payload,
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
  const [results] = await connection().then((res) =>
    res.query(
      `SELECT * FROM users WHERE email = '${payload.username}' AND password = '${payload.password}'`
    )
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

    if (!payload.name || !payload.email || !payload.password) {
      res.send({
        statusCode: 401,
        message: "Registrasi akun gagal, data yang dimasukkan belum lengkap!",
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
    // res.status(req.statusCode);
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
