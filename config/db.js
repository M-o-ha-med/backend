var mysql = require("mysql");

var hostname = "127.0.0.1";
var database = "projectPAW";
var port = "3306";
var username = "root";
var password = "";

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
