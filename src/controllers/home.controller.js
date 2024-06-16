export async function getHome(_, res) {
  try {
    if (res.statusCode === 200) {
      res.status(200).json({
        statusCode: 200,
        message: "Success!",
        author: "Launa Reswara",
        description: "API for Taritme",
        endpoints: {
          "/api/v1/auth/login": "Login",
          "/api/v1/auth/login/admin": "Login as Admin",
          "/api/v1/auth/registration": "Regist account",
          "/api/v1/arsip-kesenian": "Arsip Kesenian",
          "/api/v1/pelatih-tari": "List pelatih/instruktur tari yang ada",
          "/api/v1/pelatih-tari/transactions": "Sewa jasa instruktur",
          "/api/v1/komunitas": "List komunitas yang ada",
          "/api/v1/admin": "Admin Dashboard",
          "/api/v1/admin/arsip": "CRUD arsip",
          "/api/v1/admin/pelatih": "CRUD pelatih",
        },
      });
    }
  } catch (err) {
    res.status(400).json({ status: 400, message: "Failed to get home!" });
  }
}
