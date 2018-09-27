import React, { Component } from 'react';
import { View } from 'react-native';
import ChartView from 'react-native-highcharts';

import { connect } from 'react-redux';
import * as actions from '../actions';

class ChartCoinBase extends Component {
    componentDidMount() {
        console.log('In ChartCoinBase componentDidMount()');
        
        //this.props.connectKafkaSocket();
    }
    
    render() {
        Highcharts='Highcharts';
        conf={
            chart: {
                type: 'spline',
                animation: Highcharts.svg, // don't animate in old IE
                marginRight: 10,
                events: {
                    load: function () {
                        // set up the updating of the chart each second
                        var series = this.series[0];
                        setInterval(function () {
                            var x = (new Date()).getTime(), // current time
                            y = Math.random();
                            series.addPoint([x, y], true, true);
                        }, 1000);
                    }
                },
                backgroundColor: {
                    linearGradient: [0, 0, 500, 500],
                    stops: [
                        [0, '#1C1B1A'],
                        [1, '#050505']
                    ]
                },
            },
            title: {
                text: 'Live from Coinbase Exchange',
                style: {
                    color: 'white',
                    font: 'bold 16px "Trebuchet MS", Verdana, sans-serif'
                }
            },
            xAxis: {
                type: 'datetime',
                tickPixelInterval: 100,
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: 'white'
                }],
                labels: {
                    style: {
                        color: 'white',
                        font: '10px "Trebuchet MS", Verdana, sans-serif'
                    }
                }
            },
            yAxis: {
                title: {
                    text: 'Transactions',
                    style: {
                        color: 'white',
                        font: 'bold 16px "Trebuchet MS", Verdana, sans-serif'
                    }
                },
                      //plotBands: [{
                        //color: 'black', // Color value
                        //from: 0, // Start of the plot band
                        //to: 4 // End of the plot band
                      //}],
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: 'white'
                }],
                labels: {
                    style: {
                        color: 'white',
                        font: '10px "Trebuchet MS", Verdana, sans-serif'
                    }
                }
            },
            tooltip: {
                formatter: function () {
                    return '<b>' + this.series.name + '</b><br/>' +
                        Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br/>' +
                        Highcharts.numberFormat(this.y, 2);
                }
            },
            legend: {
                enabled: false
            },
            exporting: {
                enabled: false
            },
            series: [{
                name: 'Coinbase Exchange Transactions',
                data: (function () {
                    var data = [],
                    time = (new Date()).getTime(),
                    i;
      
                    for (i = -19; i <= 0; i += 1) {
                        data.push({
                            x: time + i * 1000,
                            y: Math.random()
                        });
                    }
                    return data;
                }()),
                color: '#FE7701'
            }]
        };
      
        options = {
            global: {
                useUTC: false
            },
            lang: {
                decimalPoint: ',',
                thousandsSep: '.'
            }
        };
        return (
            <View style={styles.viewStyle}>
                <ChartView style={styles.chartViewStyle} config={conf} options={options}></ChartView>
            </View>
        );
    }
}

const styles = {
    chartViewStyle: {
        paddingTop: 5,
        height:585,
    },
    viewStyle: { 
        flex: 1,
        paddingTop: 20,
        justifyContent: 'flex-start',
        alignItems: 'stretch',
        backgroundColor: 'black'
    }
}

export default connect(null, actions)(ChartCoinBase);