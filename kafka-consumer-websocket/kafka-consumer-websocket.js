//const express = require('express');
const bodyParser = require('body-parser');
const _ = require('lodash');

//const WebSocketServer = require('websocket').server;
//onst http = require('http');

///////////////////////
// Kafka 
///////////////////////
const { Consumer, KafkaClient } = require('kafka-node');
const client = new KafkaClient({kafkaHost: 'localhost:9092'});
const options = {
    groupId: 'CoinbaseGroup'
};
const consumerSell = new Consumer(client, 
    [{ topic: 'topicBitcoinSell', partition: 0 }], 
    options);
const consumerBuy = new Consumer(client, [{ topic: 'topicBitcoinBuy', partition: 0 }], options);

consumerSell.on('message', function (message) {
    console.log(parseInt(message.value));
});

consumerSell.on('error', function (err) {
    console.log(err);
});

//consumerSell.close(true, function (event) {
    //console.log(event);
//});

///////////////////////
// REST API
///////////////////////
/* const app = express(); 
app.use(bodyParser.json());

app.get('/coinbase', (req, res)=>{
    res.send({ Greetings: 'Kafka Consume+Transform to topicBitcoinBuy+topicBitcoinSell running at Port 5002'});
});

const PORT = process.env.PORT || 5004;
app.listen(PORT); 
*/