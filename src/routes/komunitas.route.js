import { getKomunitas } from "../controllers/komunitas.controller.js";
import express from "express";

const komunitasRoutes = express.Router();

// GET
komunitasRoutes.get("/api/v1/komunitas", getKomunitas);

export default komunitasRoutes;
