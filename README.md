<div align="center">
  <h1>Taritme Backend</h1>
  <p>Backend side for Taritme</p>
</div>

## Status

Under heavy development!

## Documentation of API

- **POST** `/api/auth/login`

  Login as User request. Will match correct email and password from DB.

- **POST** `/api/auth/login/admin`

  Login as Admin request. Will match correct email and password. The admin is only one.

- **POST** `/api/auth/registration`

  Register user account.

- **POST** `/api/pelatih-tari/:name/transactions`

- **POST** `/api/pelatih-tari/upload-image`

- **GET** `/api/pelatih-tari`

  Get a list of all pelatih tari.

- **GET** `/api/pelatih-tari/:name`

  Get pelatih tari by its name.

- **GET** `/api/komunitas`

  Get a list of all komunitas.

- **GET** `/api/users`

  Get all users.

- **PATCH** `/api/pelatih-tari/edit/:name`

  Edit pelatih tari data by its name.

## Tech Stack

- Express JS
- MySQL

## Getting Started

- Clone repo ini.
- Masuk ke folder project, kemudian ketikkan `npm install` untuk menginstall semua dependencies yang diperlukan.
- Setelah itu, ketik `npm run dev` untuk menjalankan project. Backend akan diserve di `http://localhost:5000` .
- Jika ingin mengetes project ini dengan Docker, silahkan pastikan Docker telah terinstall, dan ketik `docker compose up --build`.
