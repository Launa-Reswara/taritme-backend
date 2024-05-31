import jwt from "jsonwebtoken";

export async function verifyJwt(req, res) {
  const authHeader = req.headers.authorization;

  if (authHeader) {
    const token = authHeader.split(" ")[1];

    jwt.verify(token, process.env.JWT_SECRET, (err) => {
      if (err) {
        res.status(403).json({ statusCode: 403, message: "Invalid token!" });
      } else {
        next();
      }
    });
  } else {
    res.status(401).send({
      statusCode: 401,
      message: "Not authorized!",
    });
  }
}
