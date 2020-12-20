import 'package:flutter/material.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mainpage",
      theme: ThemeData(
        primaryColor: Colors.lightBlue[100],
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("해양IT융합기술연구소"),
        centerTitle: true,
        elevation: 0.0,
      ),
      drawer: Drawer(),
      body: Stack(
        children: [
          Image.asset('assets/OceanMain.jpg'),
          Flexible(
              child: Container(
            alignment: Alignment(0.0, 0.0),
            height: 45,
            margin: EdgeInsets.only(left: 20, right: 20, top: 15),
            padding: EdgeInsets.only(left: 20, right: 20),
            child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Search")),
          ))
        ],
      ),
    );
  }
}
