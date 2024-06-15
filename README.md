<div align="center">
  <h1>Taritme Backend</h1>
  <p>Backend side for Taritme</p>
</div>

## Status

Deployment process!

## Documentation of API

| Endpoint                               | Method | Description                                                                           |
| -------------------------------------- | ------ | ------------------------------------------------------------------------------------- |
| `/api/auth/login`                      | POST   | Login as User request. Will match correct email and password from DB.                 |
| `/api/auth/login/admin`                | POST   | Login as Admin request. Will match correct email and password. The admin is only one. |
| `/api/pelatih-tari/:name/transactions` | POST   | Pelatih tari transactions.                                                            |
| `/api/pelatih-tari/add`                | POST   | Add new pelatih tari data.                                                            |
| `/api/pelatih-tari/upload-image/:id`   | POST   | Edit image pelatih tari based on id.                                                  |
| `/api/pelatih-tari/add-image`          | POST   | Add new pelatih tari image                                                            |
| `/api/users/profile/upload-image/:id`  | POST   | Edit users profile image based on id.                                                 |
| `/api/pelatih-tari/:name/penilaian`    | POST   | Add penilaian pelatih tari based on name.                                             |
| `/api/riwayat-kursus`                  | POST   | Add new riwayat kursus data.                                                          |
| `/api/pelatih-tari`                    | GET    | Get available pelatih tari.                                                           |
| `/api/pelatih-tari/:name`              | GET    | Get available pelatih tari by name.                                                   |
| `/api/komunitas`                       | GET    | Get available komunitas.                                                              |
| `/api/users`                           | GET    | Get available users.                                                                  |
| `/api/pelatih-tari/edit/:id`           | PATCH  | Edit pelatih tari based on id.                                                        | 
| `/api/users/profile/edit/:id`          | PATCH  | Edit users profile based on id                                                        | 
| `/api/pelatih-tari/delete/:id`         | DELETE | Delete pelatih tari based on id.                                                      |

## Tech Stack

- Express JS
- MySQL
- Cloudinary
- Midtrans

## Getting Started

- Clone repo ini.
- Masuk ke folder project, kemudian ketikkan `npm install` untuk menginstall semua dependencies yang diperlukan.
- Setelah itu, ketik `npm run dev` untuk menjalankan project. Backend akan diserve di `http://localhost:5000` .
- Jika ingin build project ini dengan Docker, silahkan pastikan Docker telah terinstall, dan ketik `docker compose up --build`.
