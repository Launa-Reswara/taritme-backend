import {
  loginAdmin,
  loginUserAccount,
  registrationUserAccount,
} from "../controllers/auth.controller.js";
import { getHome } from "../controllers/home.controller.js";
import { getKomunitas } from "../controllers/komunitas.controller.js";
import {
  addImagePelatihTari,
  addPelatihTari,
  deletePelatihTari,
  editPelatihTari,
  getDetailPelatihTari,
  getPaymentStatusPelatihTari,
  getPelatihTari,
  getPenilaianPelatihTari,
  penilaianPelatihTari,
  transactionPelatihTari,
  uploadImagePelatihTari,
} from "../controllers/pelatihTari.controller.js";
import {
  addRiwayatKursus,
  editUserProfile,
  getRiwayatKursus,
  getUserProfile,
  getUsers,
  uploadImageUserProfile,
} from "../controllers/users.controller.js";
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
  "/api/pelatih-tari/upload-image/:id",
  multerStorage.single("my_file"),
  uploadImagePelatihTari
);
routes.post(
  "/api/pelatih-tari/add-image",
  multerStorage.single("my_file"),
  addImagePelatihTari
);
routes.post(
  "/api/users/profile/upload-image/:id",
  multerStorage.single("my_file"),
  uploadImageUserProfile
);
routes.post("/api/pelatih-tari/:name/penilaian", penilaianPelatihTari);
routes.post("/api/riwayat-kursus", addRiwayatKursus);

routes.patch("/api/pelatih-tari/edit/:id", editPelatihTari);
routes.patch("/api/users/profile/edit/:id", editUserProfile);

routes.get(
  "/api/pelatih-tari/:name/kumpulan-penilaian",
  getPenilaianPelatihTari
);
routes.get("/", getHome);
routes.get("/api/pelatih-tari", getPelatihTari);
routes.get("/api/pelatih-tari/:name", getDetailPelatihTari);
routes.get("/api/komunitas", getKomunitas);
routes.get("/api/users", getUsers);
routes.get("/api/users/profile", getUserProfile);
routes.get("/api/pelatih-tari/payment/:order_id", getPaymentStatusPelatihTari);
routes.get("/api/riwayat-kursus", getRiwayatKursus);

routes.delete("/api/pelatih-tari/delete/:id", deletePelatihTari);

export default routes;
