export async function loginHandler(req, res) {
  try {
    const payload = {
      username: req.body.username,
      password: req.body.password,
    };
  } catch (err) {
    res.send({
      status: 500,
      message: err.message,
    });
  }
}
