import 'package:flutter/material.dart';
import 'package:proyectop2/src/screens/AddCardScreen.dart';
import 'package:proyectop2/src/screens/Api.dart';

class CardData {
  final String username;
  final String descripcion;
  final String lugar;
  final String imagen;

  CardData(
      {required this.username,
      required this.descripcion,
      required this.lugar,
      required this.imagen});
}

class CardsScreen extends StatefulWidget {
  final String username;
  CardsScreen({required this.username});

  @override
  _CardsScreenState createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  final List<CardData> cardDataList = [];

  void eliminarTarjeta(int index) {
    setState(() {
      cardDataList.removeAt(index);
    });
  }

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
          iconTheme: IconThemeData(color: Colors.blue),
          shape: Border(bottom: BorderSide(color: Colors.red, width: 2.0)),
        ),
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            ListView.builder(
              itemCount: cardDataList.length,
              itemBuilder: (BuildContext context, int index) {
                return CardWidget(
                  nombre: cardDataList[index].username,
                  descripcion: cardDataList[index].descripcion,
                  lugar: cardDataList[index].lugar,
                  imagen: cardDataList[index].imagen,
                  onDelete: () {
                    eliminarTarjeta(index);
                  },
                );
              },
            ),
            Positioned(
              top: 1.0,
              right: 20.0,
              child: IconButton(
                icon: Icon(Icons.add),
                iconSize: 40.0,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute
(builder: (context) => AddCardScreen(username: widget.username)),
                  ).then((nuevaCard) {
                    if (nuevaCard != null) {
                      setState(() {
                        cardDataList.add(nuevaCard);
                      });
                    }
                  });
                },
              ),
            ),
            Positioned(
              bottom: 20.0,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ApiScreen()),
                      );
                    },
                    child: Text("API", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String nombre;
  final String descripcion;
  final String lugar;
  final String imagen;
  final Function onDelete;

  CardWidget({
    required this.nombre,
    required this.descripcion,
    required this.lugar,
    required this.imagen,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 50.0, left: 25.0, right: 25.0),
      child: Card(
        color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: BorderSide(color: Colors.red, width: 2.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Image.network(
                      imagen,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0, left: 70.0),
                          child: Text(
                          nombre,
                          style: TextStyle(color: Colors.red), 
                        ),),
                        
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0, left: 70.0),
                          child: Text(
                          descripcion,
                          style: TextStyle(color: Colors.white), 
                        ),),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0, left: 70.0),
                          child: Text(
                          lugar,
                          style: TextStyle(color: Colors.white), 
                        ),),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    onDelete();
                  },
                  child: Text(
                    'Eliminar',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
