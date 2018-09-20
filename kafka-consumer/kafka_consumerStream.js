const express = require('express');
const bodyParser = require('body-parser');
const _ = require('lodash');

const { ConsumerStream, ProducerStream, KafkaClient } = require('kafka-node');
const { Transform } = require('stream');

const client = new KafkaClient({kafkaHost: 'localhost:9092'});
const options = {
    groupId: 'CoinbaseGroup'
};

const consumerStream = new ConsumerStream(client, [{ topic: 'topicCoinbase' }], options)
const resultProducer = new ProducerStream({
    kafkaClient: client,
    producer: {
        partitionerType: 0,
    },
});

const messageTransform = new Transform({
    objectMode: true,
    decodeStrings: true,
    transform (message, encoding, callback) {
      //console.log(`Original Message ${message.value}`);
      let msgObj = JSON.parse(message.value);
      let price='';
      if (msgObj['side']==='buy') { price = msgObj['price']; }
      if (msgObj['side']==='sell') { price = msgObj['price']; }
      console.log('Price=', price);
      callback(null, {
        topic: (msgObj['side']==='sell') ? 'topicBitcoinSell' : 'topicBitcoinBuy',
        messages: price
      });
    }
});

consumerStream.pipe(messageTransform).pipe(resultProducer).on('data', (data) => {
    console.log('Consumed', data);
});

const app = express(); 
app.use(bodyParser.json());

app.get('/coinbase', (req, res)=>{
    res.send({ Greetings: 'Kafka Consume+Transform to topicBitcoinBuy+topicBitcoinSell running at Port 5002'});
});

const PORT = process.env.PORT || 5002;
app.listen(PORT);