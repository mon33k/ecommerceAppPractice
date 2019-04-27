var pgp = require("pg-promise")({});
var connectionString = "postgres://localhost/ecommercetables";
var db = pgp(connectionString);

module.exports = db;
