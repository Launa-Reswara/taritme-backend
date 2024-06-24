import { getHome } from "../controllers/home.controller.js";
import express from "express";

const homeRoutes = express.Router();

homeRoutes.get("/", getHome);

export default homeRoutes;
