import {
  CLOUDINARY_API_KEYS,
  CLOUDINARY_API_SECRET,
  CLOUDINARY_CLOUD_NAME,
} from "./constants.js";
import { v2 } from "cloudinary";

v2.config({
  cloud_name: CLOUDINARY_CLOUD_NAME,
  api_key: CLOUDINARY_API_KEYS,
  api_secret: CLOUDINARY_API_SECRET,
});

export async function uploadImage(image, folderName) {
  const opts = {
    overwrite: true,
    invalidate: true,
    resource_type: "image",
    folder: `taritme/${folderName}`,
  };

  const res = await v2.uploader.upload(image, opts);
  return res;
}
