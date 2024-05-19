import { encode } from "../lib/utils/jwt";

export async function loginHandler(req, res) {
  try {
    const payload = {
      username: req.body.username,
      password: req.body.password,
    };

    // JWT token
    const newToken = encode(payload);

    if (res.statusCode === 200 || res.statusCode === 201) {
      if (Object.keys(req.body).length === 2) {
        // const [results]
      }
    }
  } catch (err) {
    res.send({
      status: 500,
      message: err.message,
    });
  }
}
