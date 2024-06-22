<div align="center">
  <h1>Taritme Backend</h1>
  <p>Backend side for Taritme</p>
</div>


## Database Design

![database design](./public/docs/Screenshot%20from%202024-06-23%2002-48-54.png)

## Documentation of API

| Endpoint                                  | Method | Description                                                                           |
| ----------------------------------------- | ------ | ------------------------------------------------------------------------------------- |
| `/api/v1/auth/login`                      | POST   | Login as User request. Will match correct email and password from DB.                 |
| `/api/v1/auth/login/admin`                | POST   | Login as Admin request. Will match correct email and password. The admin is only one. |
| `/api/v1/pelatih-tari/:name/transactions` | POST   | Pelatih tari transactions.                                                            |
| `/api/v1/pelatih-tari/add`                | POST   | Add new pelatih tari data.                                                            |
| `/api/v1/pelatih-tari/upload-image/:id`   | POST   | Edit image pelatih tari based on id.                                                  |
| `/api/v1/pelatih-tari/add-image`          | POST   | Add new pelatih tari image                                                            |
| `/api/v1/users/profile/upload-image/:id`  | POST   | Edit users profile image based on id.                                                 |
| `/api/v1/pelatih-tari/:name/penilaian`    | POST   | Add penilaian pelatih tari based on name.                                             |
| `/api/v1/riwayat-kursus`                  | POST   | Add new riwayat kursus data.                                                          |
| `/api/v1/pelatih-tari`                    | GET    | Get available pelatih tari.                                                           |
| `/api/v1/pelatih-tari/:name`              | GET    | Get available pelatih tari by name.                                                   |
| `/api/v1/komunitas`                       | GET    | Get available komunitas.                                                              |
| `/api/v1/users`                           | GET    | Get available users.                                                                  |
| `/api/v1/pelatih-tari/edit/:id`           | PATCH  | Edit pelatih tari based on id.                                                        |
| `/api/v1/users/profile/edit/:id`          | PATCH  | Edit users profile based on id                                                        |
| `/api/v1/pelatih-tari/delete/:id`         | DELETE | Delete pelatih tari based on id.                                                      |

## Tech Stack

- Express JS
- MySQL
- Cloudinary
- Midtrans

## Getting Started

### A. Prerequisites

- Node.js (Latest Version).
- Docker.
- PM2.
- MySQL.

### B. Process

- Clone this repo.
- Create a database named `taritme` in your environment.
- Go to the project folder, navigate to `src/lib/utils` and you can find a file named `taritme.sql`. Import it to your environment with command `mysqldump -u <your_mysql_username> -p taritme < taritme.sql`
- Go to the project folder, and type `npm install` to install all needed dependencies. 
- Create a `.env` file. You can check the format in `.env.example` file.
- After that, type `npm run dev` to run this project. See the result in the Browser => http://localhost:5000.
- If you want to build this project in Docker Container, just type `docker compose up --build` in your terminal and see the result.

## Note

- This project are deployed in a VPS with Ubuntu 22.04 as the operating system, using Nginx as a Web Server, PM2 to run and automate Backend workflow, and Cloudflare for subdomain.
- We use conventional commits as commit style and rules. If you want to know more about it, [read here](https://www.conventionalcommits.org/en/v1.0.0/).
- For isolated build/deployment/testing, we use Docker. If you want to know more about it, [read here](https://www.docker.com/).
