import { AsyncStorage } from 'react-native';
import { Facebook } from 'expo';
import { 
    FACEBOOK_LOGIN_SUCCESS,
    FACEBOOK_LOGIN_FAIL
}
from './types';

import axios from 'axios';

// export const facebookLogin = async () => {
//     return async (dispatch) => {
//         let token = await AsyncStorage.getItem('fb_token');
//         if (token) {

//         } else {

//         }
//     }
// };

export const facebookLogin = () => async (dispatch)=>{
    //console.log('Inside facebookLogin');
    try {
        let token = await AsyncStorage.getItem('fb_token');
        if (token) {
            dispatch({ type: FACEBOOK_LOGIN_SUCCESS, payload: token });
        } else {
            doFacebookLogin(dispatch);
        }
        
    } catch (err) {
        console.log(err);
    }
};

const doFacebookLogin = async (dispatch)=>{
    //console.log('Inside doFacebookLogin');
    try {
        let { type, token } = await Facebook.logInWithReadPermissionsAsync('2042520592728469', {
            permissions: ['public_profile', 'email', 'user_friends']
        });
    
        if (type === 'cancel') {
            return dispatch({ type: FACEBOOK_LOGIN_FAIL });
        }

        //const response = await axios.get(
            //`https://graph.facebook.com/me?access_token=${token}`);

        const response = await axios.get(
            `https://graph.facebook.com/me?locale=en_US&fields=name,email&access_token=${token}`);

        console.log(
            'Logged in!',
            response.data
        );

        const user = { 
            id: response.data.id,
            name: response.data.name,
            email: response.data.email
        };
        console.log('User=', user);

        //const res = await axios.post('http://localhost:5000/auth', user);
        //const res = await axios.post('http://18.236.186.255:5000/auth', user);

        //const res = await axios.post('http://afed4589db13611e8bc4c0a2f8f184d4-602151654.us-west-2.elb.amazonaws.com:5000/auth', user);
        //console.log('Res from EC2 =', res);

        //const id = response.data.id;
        //const res = await axios.get(`https://graph.facebook.com/v2.11/${id}/friends?access_token=${token}`);
        //console.log('Friends', res.data);
    
        console.log('Token=', token);
        await AsyncStorage.setItem('fb_token', token);
        dispatch({ type: FACEBOOK_LOGIN_SUCCESS, payload: token });

    } catch(err) {
        console.log(err);
    }
};
