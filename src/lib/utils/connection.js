import mysql from "mysql2/promise";

export const connection = await mysql.createConnection({
  port: 3306,
  host: "localhost",
  user: "root",
  database: "taritme",
  password: "haikel",
});
