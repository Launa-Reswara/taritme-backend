import { arsipKesenianHandler } from "../handlers/arsipKesenianHandler.js";
import {
  adminHandler,
  loginHandler,
  registrationHandler,
} from "../handlers/authHandler.js";
import { komunitasHandler } from "../handlers/komunitasHandler.js";
import { pelatihTariHandler } from "../handlers/pelatihTariHandler.js";
import { rootHandler } from "../handlers/rootHandler.js";
import { transactionHandler } from "../handlers/transactionsHandler.js";
import express from "express";

const routes = express.Router();

// bagusnya dipecah per file aja
routes.get("/", rootHandler);
routes.post("/api/auth/login", loginHandler);
routes.post("/api/auth/login/admin", adminHandler);
routes.post("/api/auth/registration", registrationHandler);
routes.post("/api/pelatih-tari/:name/transactions", transactionHandler);
routes.get("/api/pelatih-tari", pelatihTariHandler);
routes.get("/api/komunitas", komunitasHandler);
routes.get("/api/arsip-kesenian", arsipKesenianHandler);
routes.get("/api/arsip-kesenian/:detail");

export default routes;
