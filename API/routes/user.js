const express = require('express');
const router = express.Router();
const User = require('../models/User');
const { verifyToken, authorization, authAdmin } = require('./verify')

//Update user
router.put("/:id", authorization, async(req, res) => {
    if (req.body.password) {
        req.body.password = cryptojs.AES.encrypt(req.body.password, process.env.SECRET).toString()
    };

    try {
        const updatedUser = await User.findByIdAndUpdate(req.params.id, {
            $set: req.body
        }, { new: true });
        res.status(200).json(updatedUser)
    } catch (error) {
        res.status(500).json(error)

    }

})

//Delete user (ADMIN)
router.delete("/:id", authAdmin, async(req, res) => {
    try {
        await User.findByIdAndDelete(req.params.id);
        res.status(200).json("User has been deleted...");
    } catch (err) {
        res.status(500).json(err);
    }
});

//Get user (ADMIN)
router.get("/find/:id", authAdmin, async(req, res) => {
    try {
        const user = await User.findById(req.params.id);
        const { password, ...others } = user._doc
        res.status(200).json(others);
    } catch (err) {
        res.status(500).json(err);
    }
});

module.exports = router