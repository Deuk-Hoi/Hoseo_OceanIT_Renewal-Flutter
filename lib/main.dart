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
        primaryColor: Color(0xff182034),
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
        body: Column(
          children: [
            Stack(
              children: [
                Image.asset('assets/OceanMain.jpg'),
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  margin: EdgeInsets.only(left: 5, right: 5, top: 15),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Search",
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(right: 30, top: 15),
                  child: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                ),
                Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(right: 20, left: 20, top: 230),
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2.0,
                            spreadRadius: 0.0,
                            offset: Offset(2.0, 2.0),
                          )
                        ]),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20.0, right: 16.0),
                          child: CircleAvatar(
                            child: Text("득"),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Text(
                                "AI 융합대학 컴퓨터공학전공",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5.0),
                              child: Text(
                                "UIT 연구원 김득회",
                                style: TextStyle(fontSize: 18),
                              ),
                            )
                          ],
                        )
                      ],
                    ))
              ],
            )
          ],
        ));
  }
}
