import { PORT } from "./src/lib/utils/constants.js";
import logger from "./src/lib/utils/logger.js";
import { specs } from "./src/lib/utils/swagger.js";
import routes from "./src/routes/index.js";
import bodyParser from "body-parser";
import compression from "compression";
import cors from "cors";
import dotenv from "dotenv";
import express from "express";
import morgan from "morgan";
import swaggerUi from "swagger-ui-express";

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

  // Swagger JS docs
  app.use(
    "/api/v1/docs",
    swaggerUi.serve,
    swaggerUi.setup(specs, { explorer: true })
  );

  app.listen(PORT, () => {
    console.log(`Server sudah jalan di port ${PORT}`);
  });
}

main();
