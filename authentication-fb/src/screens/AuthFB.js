import React, { Component } from 'react';
import { Button } from 'react-native-elements'
import { View, Text, AsyncStorage } from 'react-native';
import ChartCoinBase from './ChartCoinBase';

import { connect } from 'react-redux';
import * as actions from '../actions';

class AuthFB extends Component {
    constructor(props) {
        super(props);
        this.onButtonPress=this.onButtonPress.bind(this);
    }

    componentDidMount() {
        //this.props.facebookLogin();
        //this.onAuthComplete(this.props);
        AsyncStorage.removeItem('fb_token');
    }

    componentWillReceiveProps(nextProps) {
        //this.onAuthComplete(nextProps);
    }

    onAuthComplete(props) {
        if (props.token) {
            Alert.alert('token already exist' + token);
        }
    }

    onButtonPress() {
        this.props.facebookLogin();
    }

    render() {
        if (this.props.token === null) {
            return (
                <View style={styles.viewStyle}>  
                    <Button
                        raised
                        icon={{name: 'facebook-square', type: 'font-awesome'}}
                        backgroundColor='#4267b2'
                        borderRadius={10}
                        title='Login with Facebook' 
                        fontSize={20}
                        onPress={this.onButtonPress}
                    />
                </View>
            )
        } else {
            return <ChartCoinBase />;
        }
    }
}

const styles = {
    viewStyle: {
      flex: 1,
      backgroundColor: '#fff',
      alignItems: 'center',
      justifyContent: 'center',
    }
};

function mapStateToProps({ auth }) {
    return { token: auth.token };
}

export default connect(mapStateToProps, actions)(AuthFB);