import axios from 'axios';

const URL = "https://api-public.sandbox.gdax.com/", 
      SOCKET_URL = "wss://ws-feed.gdax.com"             //wss://ws-feed-public.sandbox.gdax.com

export const initData = () => {
    return function (dispatch) {
        axios.get(`${URL}products`)
                //.then(fetch.throwErrors)
                .then(res => res.json())
                .then(json => {
                    //dispatch(setProducts(json));
                    //dispatch(connectSocket());
                })
                .catch(e => console.error(e.message));
    };
}

export const connectSocket = () => {
    console.log('In GDXactions connectSocket');

    const ws = new WebSocket(SOCKET_URL);

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

        ws.onerror = (e) => {
            console.log(e.message);
        }

        ws.onclose = (e) => {
            console.log(e.code, e.reason);
        }
    }
}

export const setProducts = (products) => ({
    type: 'SET_PRODUCTS',
    products: products.filter(({ quote_currency }) => quote_currency === 'USD')
});

export const addValue = (product, value) => ({
    type: 'ADD_VALUE',
    product,
    value
});