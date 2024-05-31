export async function getHome(_, res) {
  try {
    if (res.statusCode === 200) {
      res.send({
        statusCode: 200,
        message: "Success!",
        author: "Launa Reswara",
        description: "API for Taritme",
        endpoints: {
          "/api/auth/login": "Login",
          "/api/auth/login/admin": "Login as Admin",
          "/api/auth/registration": "Regist account",
          "/api/arsip-kesenian": "Arsip Kesenian",
          "/api/pelatih-tari": "List pelatih/instruktur tari yang ada",
          "/api/pelatih-tari/transactions": "Sewa jasa instruktur",
          "/api/komunitas": "List komunitas yang ada",
          "/api/admin": "Admin Dashboard",
          "/api/admin/arsip": "CRUD arsip",
          "/api/admin/pelatih": "CRUD pelatih",
        },
      });
    } else {
      res.status(res.statusCode).send({
        statusCode: res.statusCode,
        message: res.statusMessage,
      });
    }
  } catch (err) {
    res.json({ status: 400, message: err.message });
  }
}
