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
import passport from "passport";

const routes = express.Router();

// POST
routes.post("/api/v1/auth/login", loginUserAccount);
routes.post("/api/v1/auth/login/admin", loginAdmin);
routes.post("/api/v1/auth/registration", registrationUserAccount);
routes.post(
  "/api/v1/pelatih-tari/:name/transactions",
  verifyJwt,
  transactionPelatihTari
);
routes.post("/api/v1/pelatih-tari/add", addPelatihTari);
routes.post(
  "/api/v1/pelatih-tari/upload-image/:id",
  multerStorage.single("my_file"),
  uploadImagePelatihTari
);
routes.post(
  "/api/v1/pelatih-tari/add-image",
  multerStorage.single("my_file"),
  addImagePelatihTari
);
routes.post(
  "/api/v1/users/profile/upload-image/:id",
  multerStorage.single("my_file"),
  uploadImageUserProfile
);
routes.post("/api/v1/pelatih-tari/:name/penilaian", penilaianPelatihTari);
routes.post("/api/v1/riwayat-kursus", addRiwayatKursus);

// PATCH
routes.patch("/api/v1/pelatih-tari/edit/:id", editPelatihTari);
routes.patch("/api/v1/users/profile/edit/:id", editUserProfile);

// GET
routes.get(
  "/api/v1/pelatih-tari/:name/kumpulan-penilaian",
  getPenilaianPelatihTari
);
routes.get("/", getHome);
routes.get("/api/v1/pelatih-tari", getPelatihTari);
routes.get("/api/v1/pelatih-tari/:name", getDetailPelatihTari);
routes.get("/api/v1/komunitas", getKomunitas);
routes.get("/api/v1/users", getUsers);
routes.get("/api/v1/users/profile", getUserProfile);
routes.get(
  "/api/v1/pelatih-tari/payment/:order_id",
  getPaymentStatusPelatihTari
);
routes.get("/api/v1/riwayat-kursus", getRiwayatKursus);

// DELETE
routes.delete("/api/v1/pelatih-tari/delete/:id", deletePelatihTari);

export default routes;
