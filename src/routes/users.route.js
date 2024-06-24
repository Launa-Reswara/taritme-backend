import {
  addRiwayatKursus,
  deleteUserAccount,
  editUserProfile,
  getRiwayatKursus,
  getUserProfile,
  getUsers,
  uploadImageUserProfile,
} from "../controllers/users.controller.js";
import { multerStorage } from "../lib/utils/multer.js";
import { verifyJwt } from "../middleware/index.js";
import express from "express";

const usersRoutes = express.Router();

// POST
usersRoutes.post(
  "/api/v1/users/profile/upload-image/:id",
  verifyJwt,
  multerStorage.single("my_file"),
  uploadImageUserProfile
);
usersRoutes.post("/api/v1/riwayat-kursus", verifyJwt, addRiwayatKursus);

// PATCH
usersRoutes.patch("/api/v1/users/profile/edit/:id", verifyJwt, editUserProfile);

// GET
usersRoutes.get("/api/v1/users", getUsers);
usersRoutes.get("/api/v1/users/profile", verifyJwt, getUserProfile);
usersRoutes.get("/api/v1/riwayat-kursus", verifyJwt, getRiwayatKursus);

// DELETE
usersRoutes.delete("/api/v1/users/delete/:id", verifyJwt, deleteUserAccount);

export default usersRoutes;
