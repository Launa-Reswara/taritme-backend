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
  editPelatihTari,
  getDetailPelatihTari,
  getPelatihTari,
  transactionPelatihTari,
  uploadImagePelatihTari,
} from "../controllers/pelatihTari.controller.js";
import { multerStorage } from "../lib/utils/multer.js";
import { verifyJwt } from "../middleware/index.js";
import express from "express";

const routes = express.Router();

// bagusnya dipecah per file aja
routes.post("/api/auth/login", loginUserAccount);
routes.post("/api/auth/login/admin", loginAdmin);
routes.post("/api/auth/registration", registrationUserAccount);
routes.post(
  "/api/pelatih-tari/:name/transactions",
  verifyJwt,
  transactionPelatihTari
);
routes.post(
  "/api/pelatih-tari/upload-image",
  multerStorage.single("my_file"),
  uploadImagePelatihTari
);

routes.patch("/api/pelatih-tari/edit", editPelatihTari);

routes.get("/", getHome);
routes.get("/api/pelatih-tari", getPelatihTari);
routes.get("/api/pelatih-tari/:name", getDetailPelatihTari);
routes.get("/api/komunitas", getKomunitas);
routes.get("/api/admin/statistics", adminStatistics);

routes.delete("/api/pelatih-tari/delete", deletePelatihTari);

export default routes;
