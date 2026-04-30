const express = require("express");
const mysql = require("mysql2");

const app = express();

const db = mysql.createConnection({
  host: process.env.DB_HOST,
  user: "admin",
  password: process.env.DB_PASSWORD,
  database: "devops_db"
});

app.get("/", (req, res) => {
  res.send("App is running 🚀");
});

app.get("/users", (req, res) => {
  db.query("SELECT * FROM users", (err, results) => {
    if (err) return res.send(err);
    res.json(results);
  });
});

app.get("/add", (req, res) => {
  db.query("INSERT INTO users (name) VALUES ('DevOps')", () => {
    res.send("User added");
  });
});

app.listen(3000, () => console.log("Server running"));