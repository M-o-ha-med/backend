var mysql = require("mysql");

var hostname = process.env.DB_HOST;
var database = process.env.DB_NAME;
var port = process.env.DB_PORT;
var username = process.env.DB_USER;
var password = process.env.DB_PASSWORD;

var con = mysql.createConnection({
  host: hostname,
  user: username,
  password,
  database,
  port,
});


con.connect(function (err) {
  if (err) throw err;
  console.log("Connected!");
});



module.exports = {con}
