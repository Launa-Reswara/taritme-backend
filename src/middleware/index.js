import { JWT_SECRET } from "../lib/utils/constants.js";
import jwt from "jsonwebtoken";

export async function verifyJwt(req, res, next) {
  const authHeader = req.headers.authorization;

  if (authHeader) {
    const token = authHeader.split(" ")[1];

    jwt.verify(token, JWT_SECRET, (err, user) => {
      if (err) {
        return res
          .status(403)
          .json({ statusCode: 403, message: "Your token is expired!" });
      }

      req.user = user;
      next();
    });
  } else {
    return res
      .status(401)
      .json({ statusCode: 401, message: "Not Authorized!" });
  }
}
