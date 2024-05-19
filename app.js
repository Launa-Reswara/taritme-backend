const express = require("express");
const compression = require("compression");
const morgan = require("morgan");
const logger = require("./src/utils/logger");
const dotenv = require("dotenv");
const cors = require("cors");
const bodyParser = require("body-parser");

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

  app.get("/", (req, res) => {
    res.send("Halo dari Express!");
  });

  app.listen(process.env.PORT, () => {
    console.log(`Server sudah jalan di port ${process.env.PORT}`);
  });
}

main();
