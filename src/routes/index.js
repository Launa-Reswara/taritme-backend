import {
  adminHandler,
  loginHandler,
  registrationHandler,
} from "../handlers/authHandler.js";
import { komunitasHandler } from "../handlers/komunitasHandler.js";
import { rootHandler } from "../handlers/rootHandler.js";
import { transactionHandler } from "../handlers/transactionsHandler.js";
import express from "express";

const routes = express.Router();

routes.get("/", rootHandler);
routes.post("/api/auth/login", loginHandler);
routes.post("/api/auth/login/admin", adminHandler);
routes.post("/api/auth/registration", registrationHandler);
routes.post("/api/pelatih-tari/transactions", transactionHandler);
routes.get("/api/komunitas", komunitasHandler);

export default routes;
