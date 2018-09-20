const express = require('express');  //CommonJS module vs ES2015 module (import express from 'express';)
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const keys = require('./config/keys');
require('./models/User');

//console.log('MongoDB URI=', keys.mongoURI);
mongoose.connect(keys.mongoURI);
mongoose.connection.on('error', () => { console.log ('MongoDB Connection Error') });

//const db = mongoose.connection;
//db.on('error', console.error.bind(console, 'connection error:'));

const app = express(); //Requests=>Port=>NodeJS=>Express=>Routes=>Response=>NodeJS=>Port
app.use(bodyParser.json());

const User = mongoose.model('users');

app.post('/auth', async (req, res)=>{
    //console.log('Request Body=', req.body);
    const user = new User({ 
        googleId: req.body.id,
        googleName: req.body.name,
        googleEmail: req.body.email
    });
    try {
        await user.save();
    } catch (err) {
        res.status(422).send(err);
    }
    res.send({ hi: 'Save to Database auth'});
});

//db.once('open', function () {
    //console.log('Request Before Save =', userId, userName, userEmail);
    
    //new User({ 
        //googleId: userId,
        //googleName: userName,
        //googleEmail: userEmail
      ///}).save();
//});

//mongoose.disconnect();

const PORT =process.env.PORT || 5000;

app.listen(PORT);  //Express tells NodeJS to listen to port 5000

//localhost:5000
//Mongodb: --host 127.0.0.1:27017
