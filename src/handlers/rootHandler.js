export async function rootHandler(req, res) {
  try {
    if (res.statusCode === 200) {
      res.send({
        status: 200,
        author: "Launa Reswara",
        description: "API for Taritme",
        endpoints: {
          "/api/auth/login": "Login",
          "/api/auth/registration": "Regist account",
          "/api/arsip-kesenian": "Arsip Kesenian",
          "/api/list-pelatih": "List pelatih/instruktur tari yang ada",
          "/api/komunitas": "List komunitas yang ada",
          "/api/admin": "Admin side",
          "/api/admin/arsip": "CRUD arsip",
          "/api/admin/pelatih": "CRUD pelatih",
        },
      });
    } else {
      res.send({
        status: res.statusCode,
        message: res.statusMessage,
      });
    }
  } catch (err) {
    res.status(500).json({ status: 500, message: err.message });
  }
}
