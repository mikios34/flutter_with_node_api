const express = require('express');
require('dotenv/config');
const bodypareser = require('body-parser');
const mongose = require('mongoose');
const app = express();
const authJwt = require('./helper/jwt');
const errorHandler = require('./helper/error-handler');
const authJwtuser = require('./helper/jwtuser');

//authJwt;


//midlewa

app.use(bodypareser.json());
app.use(authJwt);
app.use(authJwtuser);
app.use(errorHandler);
const userRout = require('./routers/users');

app.use('/user', userRout);





mongose.connect('mongodb://127.0.0.1:27017/simpledatabae',{
    keepAlive: true,
  useNewUrlParser: true,
  useCreateIndex: true,
  useFindAndModify: false,
    
    useNewUrlParser: true,
    useUnifiedTopology: true,
    dbName: 'simpledatabase'
}).then(()=>{
    console.log('conection has been made');
}).catch((error)=>{
    console.log('error');
})


 app.listen(3011,()=>{
    console.log("server started at https://localhost:3000");
});
