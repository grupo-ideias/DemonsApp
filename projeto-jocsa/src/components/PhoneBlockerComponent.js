import React, { useState } from 'react';
import { Text, StyleSheet, View, Button } from 'react-native';

const PhoneBlocker = ({ number, removeFunction }) => {

    return <View style={styles.view}> 
        
        <View style={styles.viewDois}>
            <Text style={styles.text}>{number}</Text>
        </View>
        
        <Button style={styles.button} title="Remover" onPress={() => removeFunction(number)} />
    </View>;
};

const styles = StyleSheet.create({
    view: {
        flexDirection: 'row',
        justifyContent: 'flex-end'
    },
    viewDois: {
        flexDirection: 'column'
    },
    text: {
        height: 25,
        fontSize: 20,
        justifyContent: 'flex-start'
    },
    button: {
        alignItems: 'flex-end'
    }
});

export default PhoneBlocker;
