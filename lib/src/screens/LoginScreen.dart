import 'package:flutter/material.dart';
import 'package:proyectop2/src/bloc/bloc.dart';
import 'package:proyectop2/src/bloc/validators.dart';
import 'package:proyectop2/src/screens/CardsScreen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final bloc = Bloc(); 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TECBOOK',
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "TECBOOK",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.red),
          shape: Border(bottom: BorderSide(color: Colors.red, width: 2.0)),
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: 24.0),
                  Text(
                    'WELCOME TO TECBOOK',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(height: 140.0),
                  Text(
                    'LOGIN:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 28.0),
                  Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                      side: BorderSide(color: Colors.red, width: 2.0),
                    ),
                    color: Colors.black,
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          _buildTextFieldWithLabel(
                            label: 'USER:',
                            obscureText: false,
                            controller: userController,
                            stream: bloc.user,
                            onChanged: bloc.changeUser,
                          ),
                          SizedBox(height: 10.0),
                          _buildTextFieldWithLabel(
                            label: 'PASSWORD:',
                            obscureText: true,
                            controller: passController,
                            stream: bloc.password,
                            onChanged: bloc.changePassword,
                          ),
                          SizedBox(height: 10.0),
                          SizedBox(height: 25.0),
                          TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Colors.black,
                              side: BorderSide(color: Colors.white, width: 2.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                            onPressed: () {
                              if (userController.text == "Liliana" &&
                                  passController.text == "12345") {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CardsScreen(
                                        username: userController.text),
                                  ),
                                );
                              } else if (userController.text == "Jair" &&
                                  passController.text == "54321") {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CardsScreen(
                                        username: userController.text),
                                  ),
                                );
                              } else if (userController.text == "Elizabeth" &&
                                  passController.text == "67890") {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CardsScreen(
                                        username: userController.text),
                                  ),
                                );
                              } 
                              else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Incorrecto"),
                                      content: Text(
                                          "Usuario y/o contraseña incorrecto."),
                                      actions: [
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            primary: Colors.white,
                                            backgroundColor: Colors.black,
                                            side: BorderSide(color: Colors.white, width: 2.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(0),
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Cerrar"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                            child: Text("ENTRAR"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldWithLabel({
    required String label,
    required bool obscureText,
    TextEditingController? controller,
    required Stream<String> stream,
    required Function(String) onChanged,
  }) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        return Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 16.0),
            Expanded(
              flex: 2,
              child: TextField(
                onChanged: onChanged,
                obscureText: obscureText,
                controller: controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  errorText:
                      snapshot.error == null ? null : snapshot.error.toString(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

