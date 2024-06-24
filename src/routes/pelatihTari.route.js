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
import { multerStorage } from "../lib/utils/multer.js";
import { verifyJwt } from "../middleware/index.js";
import express from "express";

const pelatihTariRoutes = express.Router();

// GET
pelatihTariRoutes.get("/api/v1/pelatih-tari", getPelatihTari);
pelatihTariRoutes.get("/api/v1/pelatih-tari/:name", getDetailPelatihTari);

pelatihTariRoutes.get(
  "/api/v1/pelatih-tari/payment/:order_id",
  verifyJwt,
  getPaymentStatusPelatihTari
);
pelatihTariRoutes.get(
  "/api/v1/pelatih-tari/:name/kumpulan-penilaian",
  getPenilaianPelatihTari
);

// POST
pelatihTariRoutes.post(
  "/api/v1/pelatih-tari/:name/transactions",
  verifyJwt,
  transactionPelatihTari
);

pelatihTariRoutes.post("/api/v1/pelatih-tari/add", addPelatihTari);

pelatihTariRoutes.post(
  "/api/v1/pelatih-tari/upload-image/:id",
  verifyJwt,
  multerStorage.single("my_file"),
  uploadImagePelatihTari
);

pelatihTariRoutes.post(
  "/api/v1/pelatih-tari/add-image",
  verifyJwt,
  multerStorage.single("my_file"),
  addImagePelatihTari
);

pelatihTariRoutes.post(
  "/api/v1/pelatih-tari/:name/penilaian",
  verifyJwt,
  penilaianPelatihTari
);

// PATCH
pelatihTariRoutes.patch(
  "/api/v1/pelatih-tari/edit/:id",
  verifyJwt,
  editPelatihTari
);

// DELETE
pelatihTariRoutes.delete(
  "/api/v1/pelatih-tari/delete/:id",
  verifyJwt,
  deletePelatihTari
);

export default pelatihTariRoutes;
