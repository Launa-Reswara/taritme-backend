import { PORT } from "./src/lib/utils/constants.js";
import logger from "./src/lib/utils/logger.js";
import authRoutes from "./src/routes/auth.route.js";
import homeRoutes from "./src/routes/home.route.js";
import komunitasRoutes from "./src/routes/komunitas.route.js";
import pelatihTariRoutes from "./src/routes/pelatihTari.route.js";
import usersRoutes from "./src/routes/users.route.js";
import bodyParser from "body-parser";
import compression from "compression";
import cors from "cors";
import dotenv from "dotenv";
import express from "express";
import morgan from "morgan";

dotenv.config();
const app = express();

async function main() {
  // Start logging using morgan and winston logger
  const morganFormat =
    ":method :url :status :res[content-length] - :response-time ms";

  app.use(
    morgan(morganFormat, {
      stream: {
        write: (text) => {
          logger.info(text);
        },
      },
    })
  );

  app.use(cors());
  app.options("*", cors());

  app.use(bodyParser.urlencoded({ extended: false }));
  app.use(bodyParser.json());

  /**
   * Optimization technique using compression
   * @see https://expressjs.com/en/advanced/best-practice-performance.html
   */
  app.use(compression());

  // routes
  app.use(authRoutes);
  app.use(homeRoutes);
  app.use(komunitasRoutes);
  app.use(pelatihTariRoutes);
  app.use(usersRoutes);

  app.listen(PORT, () => {
    console.log(`Server sudah jalan di port ${PORT}`);
  });
}

main();
