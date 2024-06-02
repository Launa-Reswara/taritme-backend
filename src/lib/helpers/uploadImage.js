import {
  CLOUDINARY_API_KEYS,
  CLOUDINARY_API_SECRET,
  CLOUDINARY_CLOUD_NAME,
} from "../utils/constants.js";
import cloudinary from "cloudinary";

cloudinary.v2.config({
  cloud_name: CLOUDINARY_CLOUD_NAME,
  api_key: CLOUDINARY_API_KEYS,
  api_secret: CLOUDINARY_API_SECRET,
});

const opts = {
  overwrite: true,
  invalidate: true,
  resource_type: "image",
  folder: "taritme/pelatih_tari",
};

export async function uploadImage(image) {
  const res = await cloudinary.v2.uploader.upload(image, opts);
  return res;
}
