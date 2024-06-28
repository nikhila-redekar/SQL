// create.js
const mysql = require('mysql2')

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'Sangram@21',
  database: 'test_db'
})

connection.connect(function(err) {
    if (err) throw err;
    console.log("Connected!");
    var sql = "CREATE TABLE users (name VARCHAR(255), email VARCHAR(255))";
    connection.query(sql, function (err, result) {
      if (err) throw err;
      console.log("Table created");
    });
    connection.end()

  });