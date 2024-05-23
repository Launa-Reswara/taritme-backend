import {
  adminHandler,
  loginHandler,
  registrationHandler,
} from "../handlers/authHandler.js";
import { rootHandler } from "../handlers/rootHandler.js";
import express from "express";

const routes = express.Router();

routes.get("/", rootHandler);
routes.post("/api/auth/login", loginHandler);
routes.post("/api/auth/registration", registrationHandler);
routes.post("/api/auth/admin", adminHandler);

export default routes;
