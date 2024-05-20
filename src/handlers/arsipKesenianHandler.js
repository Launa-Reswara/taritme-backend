export async function arsipKesenianHandler(req, res) {
  try {
    res.send({ statusCode: res.statusCode, message: res.message });
  } catch (err) {
    res.status(500);
    res.send({ statusCode: 500, message: err.message });
  }
}

export async function detailArsipKesenianHandler(req, res) {
  try {
  } catch (err) {
    res.status(500);
    res.send({ statusCode: 500, message: err.message });
  }
}
