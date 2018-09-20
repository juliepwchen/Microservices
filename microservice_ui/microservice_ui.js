const express = require('express');
const app = express();
app.get('/', (req, res) => {
  res.send('Microservice UI');
});

app.listen(3000, ()=>{
  console.log('Microservice UI is up on Port 3000');
});
