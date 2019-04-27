const express = require('express')
const bodyParser = require('body-parser')
const cors = require('cors')
const port = 3005

const users = require('./routes/users')
const orders = require('./routes/orders')

const app = express()

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended: false}))

//ROUTES
app.use('/users', users)
app.use('/orders', orders)


app.listen(port, () => {console.log(`listening on port ${port}`)})