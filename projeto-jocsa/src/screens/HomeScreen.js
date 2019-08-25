import React, { useState } from 'react';
import { Text, StyleSheet, View, FlatList, Button, TextInput } from 'react-native';
import PhoneBlocker from '../components/PhoneBlockerComponent';

const HomeScreen = () => {

  const [phoneNumbersList, setPhoneNumber] = useState([]);
  const [number, setNumber] = useState("");

  const myRemoveFunction = (number) => {
    const newArray = [...phoneNumbersList];
    newArray.splice(phoneNumbersList.indexOf(number), 1);
    setPhoneNumber(newArray);
  }

  return (<View>
    <TextInput
      value={number}
      style={styles.input}
      keyboardType='numeric'
      onChangeText={(newValue)=> setNumber(newValue)}
      onSubmitEditing={(value) => {

        if(phoneNumbersList.indexOf(number) == -1){
          setPhoneNumber([...phoneNumbersList, value.nativeEvent.text]);
        }
        setNumber('');

      }}
    />

    <FlatList 
      data={phoneNumbersList}
      keyExtractor={(item)=>item}
      renderItem={({item}) => {
        return (<PhoneBlocker number={item} removeFunction={myRemoveFunction} />);
      }}
    />
    { phoneNumbersList.length == 0 ? <Text style={{ alignSelf: 'center' }}>Nenhum número bloqueado ainda...</Text> : <Text></Text> }
  </View>)
};

const styles = StyleSheet.create({
  input: {
    borderColor: 'black',
    borderWidth: 0.5,
    padding: 10
  }
});

export default HomeScreen;
