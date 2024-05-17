const express = require("express");
const compression = require("compression");
const morgan = require("morgan");
const logger = require("./src/utils/logger");

const app = express();

// Start logging using morgan and winston logger
const morganFormat =
  ":method :url :status :res[content-length] - :response-time ms";
app.use(morgan(morganFormat, { stream: logger.stream }));

/**
 * Optimization technique using compression
 * @see https://expressjs.com/en/advanced/best-practice-performance.html
 */
app.use(compression());

app.get("/", (req, res) => {
  res.send("Halo dari Express!");
});
