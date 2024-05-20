import { connection } from "../lib/utils/connection.js";
import { encode } from "../lib/utils/jwt.js";

export async function loginHandler(req, res) {
  try {
    if (!req.body.email || !req.body.password) {
      res.status(401);
      res.send({ statusCode: 401, message: "Data tidak lengkap!" });
    } else {
      const payload = {
        email: req.body.email,
        password: req.body.password,
      };

      // JWT token
      const newToken = encode(payload);

      /*if (res.statusCode === 200 || res.statusCode === 201) {
        if (Object.keys(req.body).length === 2) {
          const [results] = await connection().then((res) =>
            res.query(
              `SELECT * FROM users_list WHERE email = '${payload.email}' AND password = '${payload.password}'`
            )
          );

          if (results.length) {
            res.send({
              status: res.statusCode,
              message: "Login berhasil!",
              data: results,
              token: newToken,
            });
          } else {
            res.send({
              status: res.statusCode,
              message:
                "Username atau password yang dimasukkan salah! Silahkan coba lagi!",
              data: null,
              token: null,
            });
          }
        }
      } else {
        res.send({
          status: res.statusCode,
          message: res.statusMessage,
          data: null,
          token: null,
        });
      }*/ res.send({
        status: res.statusCode,
        message: "Login berhasil!",
        data: payload,
        token: newToken,
      });
    }
  } catch (err) {
    res.send({
      status: 500,
      message: err.message,
    });
  }
}

async function checkUser(payload) {
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
      email: req.email,
      password: req.password,
    };

    if (res.statusCode === 200 || res.statusCode === 201) {
      if (Object.keys(req.body).length === 2) {
        const availableUser = await checkUser(payload);

        if (availableUser) {
          res.status(403);
          res.send({
            status: 403,
            message: "Data ini sudah pernah didaftarkan akun!",
          });
        } else {
          await connection().then((res) =>
            res.execute(
              `INSERT INTO users(email, password, role) VALUES('${
                payload.email
              }', '${payload.password}', '${
                payload.email === process.env.ADMIN_EMAIL &&
                payload.password === process.env.ADMIN_PASSWORD
                  ? "admin"
                  : "guest"
              }')`
            )
          );

          res.send({
            status: res.statusCode,
            message: "Pembuatan akun berhasil!",
          });
        }
      }
    } else {
      res.status(res.statusCode);
      res.send({
        status: res.statusCode,
        message: res.statusMessage,
        data: null,
        token: null,
      });
    }
  } catch (err) {
    res.send({ statusCode: 500, message: err.message });
  }
}
