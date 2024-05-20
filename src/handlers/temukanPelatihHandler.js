export async function temukanPelatihHandler(req, res) {
  try {
  } catch (err) {
    res.status(500);
    res.send({
      statusCode: 500,
      message: err.message,
    });
  }
}
