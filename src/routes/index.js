import { adminStatistics } from "../controllers/admin.controller.js";
import {
  loginAdmin,
  loginUserAccount,
  registrationUserAccount,
} from "../controllers/auth.controller.js";
import { getHome } from "../controllers/home.controller.js";
import { getKomunitas } from "../controllers/komunitas.controller.js";
import {
  deletePelatihTari,
  getDetailPelatihTari,
  getPelatihTari,
  transactionPelatihTari,
} from "../controllers/pelatihTari.controller.js";
import express from "express";

const routes = express.Router();

// bagusnya dipecah per file aja
routes.post("/api/auth/login", loginUserAccount);
routes.post("/api/auth/login/admin", loginAdmin);
routes.post("/api/auth/registration", registrationUserAccount);
routes.post("/api/pelatih-tari/:name/transactions", transactionPelatihTari);

routes.get("/", getHome);
routes.get("/api/pelatih-tari", getPelatihTari);
routes.get("/api/pelatih-tari/:name", getDetailPelatihTari);
routes.get("/api/komunitas", getKomunitas);
routes.get("/api/admin/statistics", adminStatistics);

routes.delete("/api/pelatih-tari", deletePelatihTari);

export default routes;
