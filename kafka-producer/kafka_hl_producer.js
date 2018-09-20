const express = require('express');
const kafka = require('kafka-node');
const bodyParser = require('body-parser');

//client = new kafka.Client('my-kafka-zookeeper:2181/'),  //Default localhost:2181/
const HighLevelProducer = kafka.HighLevelProducer;
const client = new kafka.KafkaClient({kafkaHost: 'localhost:9092'});
const options = {
    requireAcks: 1,
    ackTimeoutMs: 100,
    partitionerType: 0
};
var producer = new HighLevelProducer(client, options);

const payloads = [
    { topic: 'topic3', messages: 'hi '},
    { topic: 'topic4', messages: ['hello', 'world'] }
];

producer.on('ready', function () {
    client.refreshMetadata(['topicCoinbase'], function(err3) {
        if (!err3) {
            setInterval(() => {
                producer.send(payloads, function (err, data) {
                  console.log('Send messagge: ', data);
                });
            }, 1000);
        }
    });
});
producer.on('error', (e) => { console.log(e); });

/////////////////////////
// App URL
/////////////////////////
const app = express(); 
app.use(bodyParser.json());

app.get('/coinbase', (req, res)=>{
    res.send({ Greetings: 'Kafka Producer running at Port 5001'});
});

const PORT = process.env.PORT || 5001;
app.listen(PORT);