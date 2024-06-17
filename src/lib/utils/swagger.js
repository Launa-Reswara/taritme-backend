import swaggerJsDoc from "swagger-jsdoc";

const options = {
  definition: {
    openapi: "3.1.0",
    info: {
      title: "Taritme Backend",
      version: "0.1.0",
      description: "Taritme Backend API",
      license: {
        name: "Apache 2.0",
        url: "https://apache.org/licenses/LICENSE-2.0",
      },
      contact: {
        name: "Launa Reswara",
        url: "https://taritme.ekel.dev",
        email: "contact@taritme.ekel.dev",
      },
    },
    servers: [
      {
        url: "http://localhost:5000",
      },
    ],
  },
  apis: ["../../routes/index.js"],
};

export const specs = swaggerJsDoc(options);
