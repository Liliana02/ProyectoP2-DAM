import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(ApiScreen());

class ApiScreen extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<ApiScreen> {
  late Future<List<NasaImageData>> _listadoImages;

  Future<List<NasaImageData>> _getNasaImages() async {
    final Uri url = Uri.parse(
        "https://api.nasa.gov/planetary/apod?api_key=DzyLSgK2rSQ8Vj2fVme3dCQwfRIAohRaNqgvp3GV&count=10");

    final response = await http.get(url);

    List<NasaImageData> images = [];

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
 
      for (var item in jsonData) {
        images.add(NasaImageData(item["title"], item["url"], item["explanation"]));
      }

      return images;
    } else {
      throw Exception("Falló la conexión");
    }
  }

  @override
  void initState() {
    super.initState();
    _listadoImages = _getNasaImages();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('NASA Images'),
          ),
          body: FutureBuilder(
            future: _listadoImages,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Text("Error");
              } else {
                final data = snapshot.data as List<NasaImageData>;
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        children: [
                          Image.network(data[index].url),
                          ListTile(
                            title: Text(data[index].title),
                            subtitle: Text(data[index].explanation),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
            },
          )),
    );
  }
}

class NasaImageData {
  String title;
  String url;
  String explanation;

  NasaImageData(this.title, this.url, this.explanation);
}
