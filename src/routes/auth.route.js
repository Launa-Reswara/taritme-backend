import {
  loginAdmin,
  loginUserAccount,
  registrationUserAccount,
} from "../controllers/auth.controller.js";
import express from "express";

const authRoutes = express.Router();

// POST
authRoutes.post("/api/v1/auth/login", loginUserAccount);
authRoutes.post("/api/v1/auth/login/admin", loginAdmin);
authRoutes.post("/api/v1/auth/registration", registrationUserAccount);

export default authRoutes;
