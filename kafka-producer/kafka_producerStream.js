const express = require('express');
const bodyParser = require('body-parser');
const _ = require('lodash');
const W3CWebSocket = require('websocket').w3cwebsocket;
//const axios = require('axios');

/////////////////////////
//
/////////////////////////
/* const URL = "https://api-public.sandbox.gdax.com/";
axios.get(`${URL}products`)
                .then(res => res.json())
                .then(json => {
                    console.log(json);
                })
                .catch(e => console.error(e.message));
*/
//////////////////////////
// Kafka
/////////////////////////
const { ProducerStream, KafkaClient } = require('kafka-node');
const { Transform } = require('stream');
const Readable = require('stream').Readable;

//const client = new KafkaClient({kafkaHost: 'my-kafka:9092'});
const client = new KafkaClient({kafkaHost: 'localhost:9092'});
const producer = new ProducerStream({
    kafkaClient: client,
    producer: {
        partitionerType: 0,
    },
});
producer.on('error', (err)=>{
    console.log('Producer Stream Error:', err);
});

const stdinTransform = new Transform({
  objectMode: true,
  decodeStrings: true,
  transform (text, encoding, callback) {
    //text = _.trim(text);
    //const { type,
        //time,
        //product_id,
        //price, 
        //side } = JSON.parse(text);
    const { ['type']:a, 
            ['product_id']:b, 
            ['order_id']:c, 
            ['reason']:d, 
            ['remaining_size']:e, 
            ['order_type']:f,
            ['client_oid']:g,
            ['size']:h,
            ['trade_id']:i,
            ['maker_order_id']:j,
            ['taker_order_id']:k,
            ['sequence']:_, ...newText } = JSON.parse(text);
    console.log(`Push ${JSON.stringify(newText)} to topicCoinbase`);
    callback(null, {
      topic: 'topicCoinbase',
      messages: JSON.stringify(newText)
    });
  }
});

/////////////////////////
// GDX Coinbase Exchange
////////////////////////
const SOCKET_URL = "wss://ws-feed.gdax.com";
const ws = new W3CWebSocket(SOCKET_URL, 'echo-protocol');

ws.onopen =  () => {
    ws.send(JSON.stringify({
        'type': 'subscribe',
        'product_ids': [
            'BTC-USD'
        ],
        'channels': ['full']
    }));
};
const stream = new Readable();
stream._read = () => {};
ws.onmessage = (msg) => {
    //const { type,
        //time,
        //product_id,
        //price, 
        //side } = JSON.parse(msg.data);

    //console.log ('Side', side, ' Price', price, 'Time', Date.now());
    //setInterval(() => {
        stream.push(msg.data);
        //stream.push(null);
        stream.pipe(stdinTransform).pipe(producer);
        //stream.pipe(stdinTransform).pipe(producer).on('data', (data) => {
        //console.log('Produced!', data);
        //});
    //}, 1000);
};
ws.onerror = (e) => { console.log(e.message); }
ws.onclose = (e) => { console.log(e.code, e.reason); }

/////////////////////////
// App URL
/////////////////////////
const app = express(); 
app.use(bodyParser.json());

app.get('/coinbase', (req, res)=>{
    res.send({ Greetings: 'Kafka Producer+Transform Coinbase Exchange Transactions running at Port 5001'});
});

const PORT = process.env.PORT || 5001;
app.listen(PORT);
