export async function rootHandler(req, res) {
  try {
    if (res.statusCode === 200) {
      res.send({
        status: res.statusCode,
        message: res.statusMessage,
        author: "Launa Reswara",
        description: "API for Taritme",
        endpoints: {
          "/api/auth/login": "Login",
          "/api/auth/registration": "Regist account",
        },
      });
    } else {
      res.send({
        status: res.statusCode,
        message: res.statusMessage,
      });
    }
  } catch (err) {
    res.send({ status: 500, message: err.message });
  }
}
