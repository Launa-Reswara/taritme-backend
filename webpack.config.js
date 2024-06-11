import path from "path";
import { fileURLToPath } from "url";
import nodeExternals from "webpack-node-externals";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const config = {
  mode: "production",
  entry: "./app.js",
  // ignore node_modules
  externals: [nodeExternals()],
  output: {
    path: path.join(__dirname, "dist"),
    publicPath: "/",
    filename: "build.js",
  },
  target: "node",
};

export default config;
