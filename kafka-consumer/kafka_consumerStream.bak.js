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
      console.log(`Received message ${message.value} transforming input`);
      //const filtered = Object.keys(JSON.parse(msg.value))
        //.filter(key => key==='sell');
        /* .reduce((arr, key) => {
            arr[key] = (msg.value)['sell'];
            return arr;
        }, {}); */
      let msgObj = JSON.parse(message.value);
      if (msgObj['side'] === 'sell') {
        let price = msgObj['price'];
        console.log('Messages SELL', price);
        callback(null, {
            topic: 'topicBitcoinSell',
            messages: price
        });
      }
      if (msgObj['side'] === 'buy') {
        let price = msgObj['price'];
        console.log('Messages BUY', price);
        callback(null, {
            topic: 'topicBitcoinBuy',
            messages: price
        });
      }
    }
});

consumerStream.pipe(messageTransform).pipe(resultProducer).on('data', (data) => {
    console.log('Consumed', data);
});

const app = express(); 
app.use(bodyParser.json());

app.get('/coinbase', (req, res)=>{
    res.send({ Greetings: 'Kafka Producer running at Port 5001'});
});

const PORT = process.env.PORT || 5001;
app.listen(PORT);