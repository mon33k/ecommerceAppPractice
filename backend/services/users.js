const db = require("./dbConnect.js")
const userService = {}

// Get user by username
userService.getUserByUsername = (username) => {
    const sql = `SELECT * FROM users WHERE username=$[username]`
    return db.one(sql, { username })
}

// get a logged in user by firebase_uid
userService.getUserByFirebase_uid = (firebase_uid) => {
    const sql = `SELECT * FROM users WHERE firebase_uid=$[firebase_uid]`
    return db.any(sql, {firebase_uid})
}

// POST a new user signing up 
userService.addSignUpNewUser = (username, fullname, email, firebase_uid) => {
    const sql = `INSERT INTO users (username, fullname, email, firebase_uid) 
    VALUES ($1, $2, $3) RETURNING users.username, users.fullname, users.email, users.firebase_uid`
    [req.body.username, hash, req.body.email]
    return db.none(sql, {username, fullname, email, firebase_uid})
}

// This is when I wanted to add the auth_token in the backend but now I'm gonna just add the uid
// userService.addFBAuthToken = (auth_token, username) => {
//     const sql = `UPDATE users SET auth_token = $[auth_token] WHERE username = $[username]`
//     return db.none(sql, { auth_token, username })
// }

// userService.decryptFBAuthToken = (auth_token) => {
//     const sql = `SELECT auth_token FROM users WHERE auth_token = $[auth_token]`
//     return db.none(sql, { auth_token })
// }

module.exports = userService