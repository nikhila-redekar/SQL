// index.js
var mysql = require('mysql2');

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "Sangram@21",
  database: 'test_db'
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});