const express = require('express')
const User = require('../models/user.model')
const { userRegister } = require('../utils/Auth')
const router = express.Router()

router.post('/signup',(req,res)=>{userRegister(req.body,req.role,res)}),

router.post('/signin',(req,res)=>{userLogin(req.body,req.role,res)})

module.exports = router