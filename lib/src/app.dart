import 'package:flutter/material.dart';
import 'package:proyectop2/src/screens/LoginScreen.dart';

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
    
  }
}