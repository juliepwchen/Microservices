import { combineReducers } from 'redux';
import auth from './authfb_reducer';

export default combineReducers ({
    //defaul reducer: expect an empty object vs. null
    //auth: ()=>{ return {} }

    auth
});