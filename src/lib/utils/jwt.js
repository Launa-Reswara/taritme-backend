import jwt from "jsonwebtoken";

export function encode(payload) {
  return jwt.sign(payload, process.env.JWT_SECRET, {
    expiresIn: 60 * 60 * 24,
    algorithm: "HS256",
  });
}

export function decode(token) {
  return jwt.decode(token, process.env.JWT_SECRET);
}

/*export function verify(token) {
  jwt.verify(token, process.env.JWT_SECRET, (err) => {
    if (err) {
      res.status(403).json({ statusCode: 403, message: "Invalid token!" });
    } else {
      res.status(200).json({
        statusCode: 200,
        message: "Success!",
      });
    }
  });
}
*/
