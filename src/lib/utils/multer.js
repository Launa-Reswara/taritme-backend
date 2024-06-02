import Multer from "multer";

const storage = new Multer.memoryStorage();

export const multerStorage = Multer({
  storage,
});
