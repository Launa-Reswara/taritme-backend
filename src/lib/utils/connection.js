import mysql from "mysql2/promise";

export async function connection() {
  const connection = await mysql.createConnection({
    port: 5000,
    host: "",
    uri: process.env.DATABASE_URI,
  });

  return connection;
}
