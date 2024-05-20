import { loginHandler } from "../handlers/authHandler.js";
import { rootHandler } from "../handlers/rootHandler.js";
import express from "express";

const routes = express.Router();

routes.get("/", rootHandler);
routes.post("/api/auth/login", loginHandler);

export default routes;
