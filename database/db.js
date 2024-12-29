var mysql = require("mysql");

var hostname = "gg-d5.h.filess.io";
var database = "BOBODB_showcareit";
var port = "3307";
var username = "BOBODB_showcareit";
var password = "9551537df099705f889782ac88c02816767cf323";

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
