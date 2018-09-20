const SOCKET_URL = "wss://ws-feed.gdax.com";

export const connectSocket = () => {
    console.log('In GDXactions connectSocket');
    const ws = new WebSocket(SOCKET_URL);
    return function () {
        //open a connection/send a message
        ws.onopen = () => {
            ws.send(JSON.stringify({
                'type': 'subscribe',
                'product_ids': [
                    'BTC-USD'
                ],
                'channels': ['full']
            }));
        };
    }
}

export const consumeMessageFromGDX = () => {
    console.log('In GDXactions consumeMessageFromGDX');
    return function () {
        //a message was received
        ws.onmessage = (msg) => {
            const { type,
                time,
                product_id,
                price, 
                side } = JSON.parse(msg.data);

            //console.log(type);
            //data.push(msg.data);
            //console.log('Type=', type);         //received, open, 
            //console.log('Time=', time);         //Time= 2018-09-05T23:41:09.011000Z
            //console.log('Product ID=', product_id); //BTC-USD, ETH-USD
            //console.log('Price', price);        //536.58000000
            //console.log('Side', side);          //buy, sell
        };
    }
}

export const websocketOnError = () => {
    return function () {
        ws.onerror = (e) => {
            console.log(e.message);
        }
    }
}
export const websocketOnClose = () => {
    return function () {
        ws.onclose = (e) => {
            console.log(e.code, e.reason);
        }
    }
}
