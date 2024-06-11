(()=>{"use strict";const a=require("dotenv");a.config();const s=process.env.PORT,e=process.env.ADMIN_EMAIL,t=process.env.ADMIN_PASSWORD,i=process.env.MIDTRANS_SERVER_KEY,o=process.env.MIDTRANS_CLIENT_KEY,r=(process.env.MIDTRANS_APP_URL,process.env.MIDTRANS_API_URL),n=process.env.DATABASE_HOST,u=process.env.DATABASE_USER,l=process.env.DATABASE_PORT,d=process.env.DATABASE_NAME,c=process.env.DATABASE_PASSWORD,p=(process.env.DEVELOPMENT_URL,process.env.PRODUCTION_URL,process.env.FRONTEND_DEVELOPMENT_URL),m=(process.env.FRONTEND_PRODUCTION_URL,process.env.CLOUDINARY_CLOUD_NAME),g=process.env.CLOUDINARY_API_KEYS,h=process.env.CLOUDINARY_API_SECRET,_=process.env.JWT_SECRET,y=require("winston"),{combine:E,timestamp:f,json:C}=y.format,j=y.createLogger({level:"info",format:E(f(),C()),transports:[new y.transports.Console({format:y.format.combine(y.format.colorize({all:!0}),y.format.simple())}),new y.transports.File({filename:"taritme-backend.log",level:"error"})]}),S=require("jsonwebtoken");function w(a){return S.sign(a,_,{expiresIn:86400,algorithm:"HS256"})}function R(a){return S.decode(a,_)}const T=require("bcrypt"),$=require("mysql2/promise");a.config();const b=$.createPool({port:l,host:n,user:u,database:d,password:c,enableKeepAlive:!0,keepAliveInitialDelay:0});function A(a){return a.split("-").map((a=>a[0].toUpperCase()+a.substring(1))).join(" ")}const k=require("cloudinary");async function N(a,s){const e={overwrite:!0,invalidate:!0,resource_type:"image",folder:`taritme/${s}`};return await k.v2.uploader.upload(a,e)}k.v2.config({cloud_name:m,api_key:g,api_secret:h});const L=require("axios"),v=require("midtrans-client"),O=require("nanoid"),I=require("multer"),q=new I.memoryStorage,F=I({storage:q}),D=require("express"),M=D.Router();M.post("/api/auth/login",(async function(a,s){try{if(a.body.email&&a.body.password){const i={email:a.body.email,password:a.body.password},[o]=await b.query(`SELECT * FROM users WHERE email = '${i.email}'`),r=w(i),n=(e=i.password,t=o[0].password,T.compareSync(e,t));o.length&&n?s.status(200).json({statusCode:200,message:"Login berhasil!",data:o[0],token:r}):s.status(401).json({statusCode:401,message:"Login gagal, data yang dimasukkan salah!"})}else s.status(401).json({statusCode:401,message:"Login gagal, data tidak lengkap!"})}catch(a){s.status(400).json({statusCode:400,message:"Login gagal!"})}var e,t})),M.post("/api/auth/login/admin",(async function(a,s){try{if(a.body.email&&a.body.password){const i={email:a.body.email,password:a.body.password},o=w(i);i.email===e&&i.password===t?s.status(200).json({statusCode:200,message:"Login sebagai admin berhasil!",token:o}):s.status(401).json({statusCode:401,message:"Login sebagai admin gagal, data yang dimasukkan salah!"})}else s.status(401).json({statusCode:401,message:"Login sebagai admin gagal, data tidak lengkap!"})}catch(a){s.status(400).json({statusCode:400,message:"Login sebagai admin gagal!"})}})),M.post("/api/auth/registration",(async function(a,s){try{const e={name:a.body.name,email:a.body.email,password:a.body.password},[t]=await b.query(`SELECT * FROM users WHERE email = '${e.email}' `);e.name&&e.email&&e.password?t.length?s.status(401).json({statusCode:401,message:"Registrasi akun gagal, Email yang dimasukkan telah dipakai oleh akun lain!"}):(await b.query(`INSERT INTO users (name, email, password) VALUES ('${e.name}', '${e.email}', '${function(a){const s=T.genSaltSync(10);return T.hashSync(a,s)}(e.password)}')`),await b.query("INSERT INTO users_profile (users_id) SELECT id FROM users WHERE id = LAST_INSERT_ID() LIMIT 1"),s.status(200).json({statusCode:200,message:"Registrasi akun berhasil!"})):s.status(401).json({statusCode:401,message:"Registrasi akun gagal, data yang dimasukkan belum lengkap!"})}catch(a){s.status(400).json({statusCode:400,message:"Registrasi akun gagal, silahkan coba lagi!"})}})),M.post("/api/pelatih-tari/:name/transactions",(async function(a,s,e){const t=a.headers.authorization;if(!t)return s.status(401).json({statusCode:401,message:"Not Authorized!"});{const i=t.split(" ")[1];S.verify(i,_,((t,i)=>{if(t)return s.status(403).json({statusCode:403,message:"Your token is expired!"});a.user=i,e()}))}}),(async function(a,s){try{const{pelatih_tari_name:e,customer_details:t,item_details:r}=a.body,{gross_amount:n,name:u,email:l,phone:d,city:c}=t,m=u.split(" ")[0],g=u.split(" ").slice(1).join(" "),h=`TRM-ITEM-${(0,O.nanoid)(10)}`,_=new v.Snap({isProduction:!1,serverKey:i,clientKey:o}),y={transaction_details:{order_id:h,gross_amount:n},item_details:r,credit_card:{secure:!0},customer_details:{first_name:m,last_name:g,email:l,phone:d,billing_adress:{first_name:m,last_name:g,email:l,phone:d,city:c}},callbacks:{finish:`${p}/temukan-pelatih/${e}/ikuti-kursus/penilaian`}};await _.createTransaction(y).then((a=>{s.status(200).json({statusCode:200,message:"Success create transaction!",token:a.token,redirect_url:a.redirect_url})}))}catch(a){s.status(400).json({statusCode:400,message:"Failed to create transaction!"})}})),M.post("/api/pelatih-tari/add",(async function(a,s){try{const i=a.headers.authorization,{email:o,image:r,name:n,no_hp:u,status:l,description:d,price:c}=a.body;if(i){const a=R(i.split(" ")[1]);a.email===e&&a.password===t&&(await b.query(`INSERT INTO pelatih_tari(email, name, no_hp, description, image, price, status, rating, total_review, created_at) VALUES('${o}', '${n}', '${u}', '${d}', '${r}', '${c}', '${l}', 5, 10, '${(new Date).toISOString().slice(0,19).replace("T"," ")}')`),s.status(200).json({statusCode:200,message:`Success add pelatih tari ${n}!`}))}else s.status(401).json({statusCode:401,message:"Not Authorized!"})}catch(a){s.status(400).json({statusCode:400,message:"Failed to add pelatih tari!"})}})),M.post("/api/pelatih-tari/upload-image/:id",F.single("my_file"),(async function(a,s){try{const i=a.headers.authorization,{id:o}=a.params;if(i){const r=R(i.split(" ")[1]);if(r.email===e&&r.password===t){const e=Buffer.from(a.file.buffer).toString("base64");let t="data:"+a.file.mimetype+";base64,"+e;const i=await N(t,"pelatih_tari");i?(await b.query(`UPDATE pelatih_tari SET image = '${i.secure_url}' WHERE id = '${o}'`),s.status(200).json({statusCode:200,message:"Success upload image!",data:i.secure_url})):s.status(400).json({statusCode:400,message:"Error while uploading image!"})}}else s.status(401).json({statusCode:401,message:"Not Authorized!"})}catch(a){s.status(400).json({statusCode:400,message:"Failed to upload image!"})}})),M.post("/api/pelatih-tari/add-image",F.single("my_file"),(async function(a,s){try{const i=a.headers.authorization;if(i){const o=R(i.split(" ")[1]);if(o.email===e&&o.password===t){const e=Buffer.from(a.file.buffer).toString("base64");let t="data:"+a.file.mimetype+";base64,"+e;const i=await N(t,"pelatih_tari");i?s.status(200).json({statusCode:200,message:"Success add image!",data:i.secure_url}):s.status(400).json({statusCode:400,message:"Error while adding image!"})}}else s.status(401).json({statusCode:401,message:"Not Authorized!"})}catch(a){s.status(400).json({statusCode:400,message:"Failed to add image!"})}})),M.post("/api/users/profile/upload-image/:id",F.single("my_file"),(async function(a,s){try{const e=a.headers.authorization,{id:t}=a.params;if(e){const e=Buffer.from(a.file.buffer).toString("base64");let i="data:"+a.file.mimetype+";base64,"+e;const o=await N(i,"users_profile");o?(await b.query(`UPDATE users_profile SET image = '${o.secure_url}' WHERE users_id = '${t}'`),s.status(200).json({statusCode:200,message:"Success upload image!",data:o.secure_url})):s.status(400).json({statusCode:400,message:"Error while uploading image!"})}else s.status(401).json({statusCode:401,message:"Not Authorized!"})}catch(a){s.status(400).json({statusCode:400,message:"Failed to edit image!"})}})),M.post("/api/pelatih-tari/:name/penilaian",(async function(a,s){try{const e=a.headers.authorization,{pelatih_tari_id:t,pelatih_tari_name:i,rating:o,comment:r,order_id:n}=a.body;if(e){const a=R(e.split(" ")[1]),[u]=await b.query(`SELECT name FROM users WHERE email = '${a.email}' LIMIT 1`);u.length?(await b.query(`INSERT INTO penilaian_pelatih_tari (pelatih_tari_id, pelatih_tari_name, rating, comment, users_email, users_name, order_id) VALUES ('${t}', '${i}', '${o}', '${r}', '${a.email}', '${u[0].name}', '${n}')`),s.status(200).json({statusCode:200,message:"Success to add penilaian!"})):s.status(404).json({statusCode:404,message:"Your name is not available!"})}else s.status(401).json({statusCode:401,message:"Not authorized!"})}catch(a){s.status(400).json({statusCode:400,message:"Failed to add penilaian!"})}})),M.post("/api/riwayat-kursus",(async function(a,s){try{const e=a.headers.authorization,{pelatih_tari_name:t,order_id:i}=a.body;if(e){const a=R(e.split(" ")[1]),[o]=await b.query(`SELECT id, name FROM users WHERE email = '${a.email}'`),[r]=await b.query(`SELECT * FROM pelatih_tari WHERE name = '${A(t)}'`);await b.query(`INSERT INTO riwayat_kursus (email, pelatih_tari_name, pelatih_tari_image, pelatih_tari_price, pelatih_tari_description, users_id, pelatih_tari_id, order_id) VALUES ('${a.email}', '${r[0].name}', '${r[0].image}', '${r[0].price}', '${r[0].description}', '${o[0].id}', '${r[0].id}', '${i}')`),s.status(200).json({statusCode:200,message:"Success add riwayat kursus!",data:{users:o[0],pelatih_tari:r[0]}})}}catch(a){s.status(400).json({statusCode:400,message:"Failed to add riwayat kursus!"})}})),M.patch("/api/pelatih-tari/edit/:id",(async function(a,s){try{const i=a.headers.authorization,{id:o}=a.params,{email:r,name:n,no_hp:u,status:l,description:d,price:c}=a.body;if(i){const a=R(i.split(" ")[1]);a.email===e&&a.password===t&&(await b.query(`UPDATE pelatih_tari SET email = '${r}', name = '${n}', no_hp = '${u}', description = '${d}', price = '${c}', status = '${l}' WHERE id = '${o}'`),s.status(200).json({statusCode:200,message:`Success edit pelatih tari ${n}!`}))}else s.status(401).json({statusCode:401,message:"Not Authorized!"})}catch(a){s.status(400).json({statusCode:400,message:"Failed to edit pelatih tari!"})}})),M.patch("/api/users/profile/edit/:id",(async function(a,s){try{const e=a.headers.authorization,{id:t}=a.params,{name:i,no_hp:o,jenis_kelamin:r,age:n,bio:u}=a.body;e?(await b.query(`UPDATE users_profile JOIN users ON users_profile.users_id = users.id SET users.name = '${i}', no_hp = '${o}', jenis_kelamin = '${r}', age = '${n}', bio = '${u}' WHERE users_profile.users_id = '${t}'`),s.status(200).json({statusCode:200,message:`Success edit users profile ${i}!`})):s.status(401).json({statusCode:401,message:"Not Authorized!"})}catch(a){s.status(400).json({statusCode:400,message:"Failed to edit pelatih tari!"})}})),M.get("/api/pelatih-tari/:name/kumpulan-penilaian",(async function(a,s){try{const e=a.headers.authorization,{name:t}=a.params;if(e){const[a]=await b.query(`SELECT * FROM penilaian_pelatih_tari WHERE pelatih_tari_name = '${A(t)}'`);a.length?s.status(200).json({statusCode:200,message:"Success get penilaian pelatih tari!",data:a}):s.status(404).json({statusCode:404,message:"Penilaian pelatih tari is not available!"})}}catch(a){s.status(400).json({statusCode:400,message:"Failed to get penilaian pelatih tari!"})}})),M.get("/",(async function(a,s){try{200===s.statusCode&&s.status(200).json({statusCode:200,message:"Success!",author:"Launa Reswara",description:"API for Taritme",endpoints:{"/api/auth/login":"Login","/api/auth/login/admin":"Login as Admin","/api/auth/registration":"Regist account","/api/arsip-kesenian":"Arsip Kesenian","/api/pelatih-tari":"List pelatih/instruktur tari yang ada","/api/pelatih-tari/transactions":"Sewa jasa instruktur","/api/komunitas":"List komunitas yang ada","/api/admin":"Admin Dashboard","/api/admin/arsip":"CRUD arsip","/api/admin/pelatih":"CRUD pelatih"}})}catch(a){s.status(400).json({status:400,message:"Failed to get home!"})}})),M.get("/api/pelatih-tari",(async function(a,s){try{const[a]=await b.query("SELECT * FROM pelatih_tari");a.length?s.status(200).json({statusCode:200,message:"Success get all pelatih tari!",data:a}):s.status(404).json({statusCode:404,message:"No available pelatih tari!"})}catch(a){s.status(400).json({statusCode:400,message:"Failed to get all pelatih tari!"})}})),M.get("/api/pelatih-tari/:name",(async function(a,s){try{const e=a.params.name,[t]=await b.query(`SELECT pelatih_tari.id, name, image, description, rating, price, total_review, detail_pelatih_tari.tentang_pelatih, detail_pelatih_tari.image_1, detail_pelatih_tari.image_2, detail_pelatih_tari.image_3, detail_pelatih_tari.price_per_paket FROM pelatih_tari LEFT JOIN detail_pelatih_tari ON pelatih_tari.id = detail_pelatih_tari.pelatih_tari_id WHERE name = '${A(e)}'`);t.length?s.status(200).json({statusCode:200,message:"Success get detail pelatih tari!",data:t}):s.status(404).json({statusCode:404,message:"No available detail pelatih tari!"})}catch(a){s.status(400).json({statusCode:400,message:"Failed to get detail pelatih tari!"})}})),M.get("/api/komunitas",(async function(a,s){try{const[a]=await b.query("SELECT * FROM komunitas");a.length?s.status(200).json({statusCode:200,message:"Success get all komunitas!",data:a}):s.status(404).json({statusCode:404,message:"No available komunitas!"})}catch(a){s.status(400).json({statusCode:400,message:a.message})}})),M.get("/api/users",(async function(a,s){try{const[a]=await b.query("SELECT * FROM users");a.length?s.status(200).json({statusCode:200,message:"Success get all pelatih tari!",data:a}):s.status(404).json({statusCode:404,message:"No available users!"})}catch(a){s.status(400).json({statusCode:400,message:"Failed to get all users"})}})),M.get("/api/users/profile",(async function(a,s){try{const e=a.headers.authorization;if(e){const a=R(e.split(" ")[1]),[t]=await b.query(`SELECT users.id, name, email, users_profile.jenis_kelamin, users_profile.bio, users_profile.no_hp, users_profile.age, users_profile.image FROM users LEFT JOIN users_profile ON users.id = users_profile.users_id WHERE email = '${a.email}'`);t.length?s.status(200).json({statusCode:200,message:"Success get user profile!",data:t}):s.status(404).json({statusCode:404,message:"No available user profile!"})}else s.status(401).json({statusCode:401,message:"Not Authorized!"})}catch(a){s.status(400).json({statusCode:400,message:"Failed to get user profile!"})}})),M.get("/api/pelatih-tari/payment/:order_id",(async function(a,s){try{const e=a.headers.authorization,{order_id:t}=a.params;if(e){R(e.split(" ")[1]);const a=await L.get(`${r}/v2/${t}/status`,{headers:{Authorization:`Basic ${btoa(i)}`}}),[o]=await b.query(`SELECT * FROM riwayat_kursus WHERE order_id = '${t}'`);0===o.length?200===a.status?s.status(200).json({statusCode:200,message:"Success get payment status!",data:a.data}):s.status(404).json({statusCode:404,message:"No payment status available!"}):s.status(401).json({statusCode:401,message:"You've given review in this transaction before!"})}else s.status(401).json({statusCode:401,message:"Not authorized!"})}catch(a){s.status(400).json({statusCode:400,message:"Failed to get payment status!"})}})),M.get("/api/riwayat-kursus",(async function(a,s){try{if(a.headers.authorization){const[a]=await b.query("SELECT * FROM riwayat_kursus");a.length?s.status(200).json({statusCode:200,message:"Success to get riwayat kursus!",data:a}):s.status(404).json({statusCode:404,message:"Riwayat kursus is not available!"})}else s.status(401).json({statusCode:401,message:"Not authorized!"})}catch(a){s.status(400).json({statusCode:400,message:"Failed to get riwayat kursus!"})}})),M.delete("/api/pelatih-tari/delete/:id",(async function(a,s){try{const i=a.headers.authorization,{id:o}=a.params;if(i){const a=R(i.split(" ")[1]);a.email===e&&a.password===t?(await b.query(`DELETE FROM pelatih_tari WHERE id = '${o}'`),s.status(200).json({statusCode:200,message:"Success delete pelatih tari"})):s.status(401).json({statusCode:401,message:"Not Authorized!"})}else s.status(401).json({statusCode:401,message:"Not Authorized!"})}catch(a){s.status(400).json({statusCode:400,message:"Failed to delete!"})}}));const z=M,U=require("body-parser"),P=require("compression"),W=require("cors"),H=require("morgan");a.config();const B=D();!async function(){B.use(H(":method :url :status :res[content-length] - :response-time ms",{stream:{write:a=>{j.info(a)}}})),B.use(W()),B.options("*",W()),B.use(U.urlencoded({extended:!1})),B.use(U.json()),B.use(P()),B.use(z),B.listen(s,(()=>{console.log(`Server sudah jalan di port ${s}`)}))}()})();