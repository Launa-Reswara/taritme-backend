import mysql from "mysql2/promise";

export const connection = await mysql.createConnection({
  port: process.env.DATABASE_PORT,
  host: process.env.DATABASE_HOST,
  user: process.env.DATABASE_USER,
  database: process.env.DATABASE_NAME,
  password: process.env.DATABASE_PASSWORD,
});
