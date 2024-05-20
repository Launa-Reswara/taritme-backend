import logger from "./src/lib/utils/logger.js";
import routes from "./src/routes/index.js";
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
  app.use(routes);

  app.listen(process.env.PORT, () => {
    console.log(`Server sudah jalan di port ${process.env.PORT}`);
  });
}

main();
