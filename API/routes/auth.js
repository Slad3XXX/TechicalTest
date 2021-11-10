const express = require('express');
const router = express.Router();
const User = require('../models/User');
const cryptojs = require('crypto-js')
const jwt = require('jsonwebtoken')


//Register 
router.post("/register", async(req, res) => {
    const newUser = new User({
        username: req.body.username,
        email: req.body.email,
        password: cryptojs.AES.encrypt(req.body.password, process.env.SECRET).toString()

    })

    try {
        const savedUser = await newUser.save();
        res.status(200).json(savedUser)
    } catch (error) {

        res.status(500).json(error)

    }
})

//Login 

router.post("/login", async(req, res) => {

    try {

        const user = await User.findOne({ username: req.body.username })
        if (!user) {
            res.status(401).json("Wrong credentials");

        }
        const hashedpass = cryptojs.AES.decrypt(user.password, process.env.SECRET);
        const opassword = hashedpass.toString(cryptojs.enc.Utf8);
        if (opassword !== req.body.password) {
            res.status(401).json("Wrong credentials");

        }
        const token = jwt.sign({
            id: user._id,
            isAdmin: user.isAdmin,


        }, process.env.SECRET, { expiresIn: "3d" })

        const { password, ...others } = user._doc;

        res.status(200).json({ others, token });
    } catch (error) {
        res.status(500).json(error)

    }


})


module.exports = router