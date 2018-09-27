const SOCKET_URL = "ws://localhost:5003/";

export const connectKafkaSocket = () => {
    console.log('In KafkaGDXactions connectSocket');

    const ws = new WebSocket(SOCKET_URL, 'echo-protocol');
    
    return function () {
        //open a connection/send a message
        ws.onopen = () => {
            ws.send(JSON.stringify({
                'type': 'subscribe',
                'product_ids': [
                    'BTC-USD',
                    'ETH-USD',
                    'LTC-USD',
                    'BCH-USD'
                ],
                'channels': ['full']
            }));
        };
        ws.onmessage = ( message ) => { 
            console.log('Front End receive price: ', message.data);
        };
        ws.onerror = (e) => { console.log(e.message); }
        ws.onclose = (e) => { console.log(e.code, e.reason); }
    }
}
