import dotenv from "dotenv";

dotenv.config();

export const CONDITION = process.env.NODE_ENV;
export const PORT = process.env.PORT;

export const ADMIN_EMAIL = process.env.ADMIN_EMAIL;
export const ADMIN_PASSWORD = process.env.ADMIN_PASSWORD;

export const MIDTRANS_SERVER_KEY = process.env.MIDTRANS_SERVER_KEY;
export const MIDTRANS_CLIENT_KEY = process.env.MIDTRANS_CLIENT_KEY;
export const MIDTRANS_APP_URL = process.env.MIDTRANS_APP_URL;
export const MIDTRANS_API_URL = process.env.MIDTRANS_API_URL;

export const DATABASE_HOST = process.env.DATABASE_HOST;
export const DATABASE_USER = process.env.DATABASE_USER;
export const DATABASE_PORT = process.env.DATABASE_PORT;
export const DATABASE_NAME = process.env.DATABASE_NAME;
export const DATABASE_PASSWORD = process.env.DATABASE_PASSWORD;

export const DEVELOPMENT_URL = process.env.DEVELOPMENT_URL;
export const PRODUCTION_URL = process.env.PRODUCTION_URL;

export const FRONTEND_DEVELOPMENT_URL = process.env.FRONTEND_DEVELOPMENT_URL;
export const FRONTEND_PRODUCTION_URL = process.env.FRONTEND_PRODUCTION_URL;

export const CLOUDINARY_CLOUD_NAME = process.env.CLOUDINARY_CLOUD_NAME;
export const CLOUDINARY_API_KEYS = process.env.CLOUDINARY_API_KEYS;
export const CLOUDINARY_API_SECRET = process.env.CLOUDINARY_API_SECRET;

export const JWT_SECRET = process.env.JWT_SECRET;
