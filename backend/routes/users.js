const express = require('express');
const admin = require('../firebase')
const userRouter = express.Router();
const userService = require('../services/users')

/* GET users listing by USER NAME component */
// userRouter.get('/:username', (req, res) => {
//   const { username } = req.params

//   userService.getUserByUsername(username)
//     .then(data => {
//       res.json(data)
//     })
//     .catch((err) => {
//       res.status(404).json({ error: err.toString() })
//     })
// })

// GET a logged in User 

// POST new user to user table on SIGN UP component
userRouter.post('/addnewuser', (req, res) => {
  const { username, fullname, email, firebase_uid } = req.body

  userService.addSignUpNewUser(username, fullname, email, firebase_uid)
  .then(() => {
    res.json({message: "New User POSTED Successfully"})
  })
  .catch((err) => {
    res.status(404).json({ error: err.toString() })
  })
})

// 
userRouter.put('/auth/:username', (req, res) => {
  const { username } = req.params
  const { auth_token } = req.body

  userService.addFBAuthToken(auth_token, username)
    .then(data => {
      console.log('success!')
      res.json(data)
    })
    .catch((err) => {
      console.log(err)
      res.status(404).json({ error: err.toString() })
    })
})

userRouter.get('/protected', (req, res) => {
  const { auth_token } = req.body
  const token = ''

  // Got rid of this function because I don't want to save the auth token in the backend anymore
  // userService.decryptFBAuthToken(auth_token)
  //   .then(data => {
  //     token = res.json(data)
  //   })
  //   .catch(err => {
  //     res.status(404).json({error: err.toString()})
  //   })
    admin.auth().verifyIdToken(token)
        .then(function (decodedToken) {
          console.log('decodedToken', decodedToken)
          // res.decodedToken = decodedToken
          res.json(decodedToken)
        })
        .catch(function (error) {
          res.json('error', error)
        });

})

module.exports = userRouter;