import React, { Component } from 'react';
import { Provider } from 'react-redux';

import AuthFB from './src/screens/AuthFB';

import store from './src/store';

class App extends Component {
  render() {
    return (
      <Provider store={store}>
        <AuthFB />
      </Provider>
    );
  }
}

export default App;