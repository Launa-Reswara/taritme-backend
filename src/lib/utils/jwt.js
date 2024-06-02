import { JWT_SECRET } from "./constants.js";
import jwt from "jsonwebtoken";

export function encode(payload) {
  return jwt.sign(payload, JWT_SECRET, {
    expiresIn: 60 * 60 * 24,
    algorithm: "HS256",
  });
}

export function decode(token) {
  return jwt.decode(token, JWT_SECRET);
}

