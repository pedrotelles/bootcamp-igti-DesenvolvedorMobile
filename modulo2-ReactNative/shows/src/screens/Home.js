import React from "react";
import { View,StyleSheet,Text } from "react-native";

const HomeScreen = () => {
    return (
        <View style={styles.viewStyle}>
            <Text>Olá Mundo</Text> 
        </View>
    )
}

export default HomeScreen;

const styles = StyleSheet.create({
    viewStyle:{
        flex:1,
        alignItems: "center",
        justifyContent: "center"
    }
})