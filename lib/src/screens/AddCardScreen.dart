import 'package:flutter/material.dart';
import 'package:proyectop2/src/screens/CardsScreen.dart';

class AddCardScreen extends StatefulWidget {
  final String username;
  AddCardScreen({required this.username});

  @override
  _AddCardScreenState createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final descripcionController = TextEditingController();
  final lugarController = TextEditingController();
  final imagenController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          iconTheme: IconThemeData(color: Colors.red),
          shape: Border(bottom: BorderSide(color: Colors.red, width: 2.0)),
        ),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        body: Stack(
          children: [
            Post(
              username: widget.username,
              descripcionController: descripcionController,
              lugarController: lugarController,
              imagenController: imagenController,
            ),
            Positioned(
              bottom: 20.0,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red, 
                      onPrimary: Colors.black, 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0), 
                        side: BorderSide(color: Colors.white), 
                      ),
                    ),
                    onPressed: () {
                      String descripcion = descripcionController.text;
                      String lugar = lugarController.text;
                      String imagen = imagenController.text;

                      CardData nuevaCard = CardData(username: widget.username,
                       descripcion: descripcion, lugar: lugar, imagen: imagen);
  
                      Navigator.pop(context, nuevaCard);
                    },
                    child: Icon(Icons.add, size: 30.0,),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {

    descripcionController.dispose();
    lugarController.dispose();
    imagenController.dispose();
    super.dispose();
  }
}

class Post extends StatelessWidget {
  final String username;
  final TextEditingController descripcionController;
  final TextEditingController lugarController;
  final TextEditingController imagenController;

  Post({
    required this.username,
    required this.descripcionController,
    required this.lugarController,
    required this.imagenController,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 70.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Text(
                'POST:',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            SizedBox(height: 10.0),
            Text('NOMBRE:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            Text(username, style: TextStyle(color: Colors.red, )),
            SizedBox(height: 10.0),
            Text('DESCRIPCIÓN:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            TextField(
              controller: descripcionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(0)
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 10.0),
            Text('LUGAR:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            TextField(
              controller: lugarController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(0)
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 10.0),
            Text('IMAGEN:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            TextField(
              controller: imagenController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.yellow),
                  borderRadius: BorderRadius.circular(0)
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
