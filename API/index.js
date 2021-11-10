const express = require('express');
const app = express();
const dotenv = require('dotenv');
const mongoose = require('mongoose');
const userRoute = require("./routes/user")
const authRoute = require("./routes/auth")


dotenv.config()

mongoose.connect(process.env.MONGOURI, {
        useNewUrlParser: true,
        useUnifiedTopology: true,

    })
    .then((db) => console.log("Mongo is successfully connected to ", db.connection.host))
    .catch((err) => console.log(err))


app.use(express.json())
app.use("/api/user", userRoute)
app.use("/api/auth", authRoute)



app.listen(process.env.PORT, () => {
    console.log('Server started in port ' + process.env.PORT)
});