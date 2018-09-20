const express = require('express');
const bodyParser = require('body-parser');
const _ = require('lodash');

const { ConsumerStream, ProducerStream, KafkaClient } = require('kafka-node');
const { Transform } = require('stream');
//const resultProducer = new ProducerStream();
const client = new KafkaClient({kafkaHost: 'localhost:9092'});

const options = {
    groupId: 'CoinbaseGroup',
    //autoCommit: true,
    //sessionTimeout: 15000,
    //protocol: ['roundrobin'],
    //asyncPush: false,
    //id: 'consumerCoinbase',
    //fromOffset: 'latest',
    //encoding: 'utf8',
    //keyEncoding: 'utf8',
    //partitionerType: 0
};

//const consumerGroupStream = new ConsumerGroupStream(consumerOptions, 'topicCoinbase');
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
      callback(null, {
        topic: 'topicMobileChart',
        messages: `You have been (${message.value}) made an example of`
      });
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