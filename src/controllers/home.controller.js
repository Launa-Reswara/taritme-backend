export async function getHome(_, res) {
  try {
    if (res.statusCode === 200) {
      res.status(200).json({
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
    }
  } catch (err) {
    res.status(400).json({ status: 400, message: "Failed to get home!" });
  }
}
