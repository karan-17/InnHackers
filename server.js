const express = require('express')
const morgan = require('morgan')
const cors = require('cors')
const connectDB = require('./config/db')
const passport = require('passport')
const bodyParser = require('body-parser')
const routes = require('./routes/index')
const {connect }= require('mongoose')
const {success, error}= require('consola')
// const users = require('./routes/users')
const {DATABASE, SECRET} = require('./config/dbconfig')

connectDB()

const app = express()

if (process.env.NODE_ENV === 'development') {
    app.use(morgan('dev'))
}
//midlewares 

//routes middleware


app.use(cors())
app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())
app.use(routes)
app.use(passport.initialize())
require('./config/passport')(passport)


const PORT = process.env.PORT || 3000

app.listen(PORT, () => success({message: `Server running on port ${PORT}`, badge: true}))