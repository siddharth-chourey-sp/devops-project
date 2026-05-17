const express = require("express");
const mysql = require("mysql2");
const getSecrets = require("./secrets");

const app = express();

async function startServer() {
  const secrets = await getSecrets();

  const connection = mysql.createConnection({
    host: secrets.host,
    user: secrets.user,
    password: secrets.password,
    database: secrets.database,
    port: secrets.port,
  });

  connection.connect((err) => {
    if (err) {
      console.error("DB connection failed:", err);
      return;
    }

    console.log("DB connected");
  });

  app.get("/health", (req, res) => {
    res.send("OK");
  });

  app.listen(3000, "0.0.0.0", () => {
    console.log("Server running");
  });
}

startServer();
