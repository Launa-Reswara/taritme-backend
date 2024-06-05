import {
  loginAdmin,
  loginUserAccount,
  registrationUserAccount,
} from "../controllers/auth.controller.js";
import { getHome } from "../controllers/home.controller.js";
import { getKomunitas } from "../controllers/komunitas.controller.js";
import {
  addPelatihTari,
  deletePelatihTari,
  editPelatihTari,
  getDetailPelatihTari,
  getPelatihTari,
  transactionPelatihTari,
  uploadImagePelatihTari,
} from "../controllers/pelatihTari.controller.js";
import { getUserProfile, getUsers } from "../controllers/users.controller.js";
import { multerStorage } from "../lib/utils/multer.js";
import { verifyJwt } from "../middleware/index.js";
import express from "express";

const routes = express.Router();

routes.post("/api/auth/login", loginUserAccount);
routes.post("/api/auth/login/admin", loginAdmin);
routes.post("/api/auth/registration", registrationUserAccount);
routes.post(
  "/api/pelatih-tari/:name/transactions",
  verifyJwt,
  transactionPelatihTari
);
routes.post("/api/pelatih-tari/add", addPelatihTari);
routes.post(
  "/api/pelatih-tari/upload-image",
  multerStorage.single("my_file"),
  uploadImagePelatihTari
);

routes.patch("/api/pelatih-tari/edit/:id", editPelatihTari);

routes.get("/", getHome);
routes.get("/api/pelatih-tari", getPelatihTari);
routes.get("/api/pelatih-tari/:name", getDetailPelatihTari);
routes.get("/api/komunitas", getKomunitas);
routes.get("/api/users", getUsers);
routes.get("/api/users/profile/:id", getUserProfile);

routes.delete("/api/pelatih-tari/delete/:id", deletePelatihTari);

export default routes;
