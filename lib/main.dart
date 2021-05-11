import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hoseo_oceanit2/MainActivity/MainHeader.dart';
import 'package:hoseo_oceanit2/MainActivity/MainWidgets.dart';
import 'package:hoseo_oceanit2/MainActivity/MainDrawble.dart';
import 'package:hoseo_oceanit2/MainActivity/HTTP/MainClient.dart';

Locale deviceLang;

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
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
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // 영어
        const Locale('ko'), // 한국어
      ],
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  MainHeader mainHeader;
  Future<MainData> mainData;
  @override

  void initState() {
    super.initState();
    mainData = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    mainData = fetchPost();
    mainData = fetchPost();
    deviceLang = Localizations.localeOf(context);
    if (deviceLang.languageCode == "ko") {
      mainHeader =
          MainHeader("해양IT융합기술연구소", "최근 연구 과제", "연구성과", "연구과제", "연구인력", "수중관측");
    } else {
      mainHeader = MainHeader("Ocean IT", "Recent research task", "Result",
          "Field", "Member", "Observ");
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(mainHeader.title),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        Stack(
          children: [
            Image.asset('assets/OceanMain.jpg'),
            Container(
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
                    hintStyle: TextStyle(height: 3.0)),
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
          ],
        ),
        nameCard(context),
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: 20),
          child: Text(
            mainHeader.recentResearch,
            style: TextStyle(
                fontSize: 16,
                fontFamily: "HangeulNuri",
                fontWeight: FontWeight.bold),
          ),
        ),
        FutureBuilder(
            future:mainData,
            builder:(context, snapshot){
            if(snapshot.hasData){
              researchCard(snapshot.data);
            }
            return CircularProgressIndicator();
        }),
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(top: 10, left: 20, bottom: 20),
          child: Text(
            "Quick Menu",
            style: TextStyle(
                fontSize: 16,
                fontFamily: "HangeulNuri",
                fontWeight: FontWeight.bold),
          ),
        ),
        quickMenu(context, mainHeader),
        Container(
          margin: EdgeInsets.only(top: 50),
          alignment: Alignment.bottomCenter,
          child: Text(
            "Copyright ⓒ 2021. Deuk. All rights reserved.",
            style: TextStyle(
                fontSize: 12,
                fontFamily: "HangeulNuri",
                fontWeight: FontWeight.bold),
          ),
        )
      ])),
      drawer: drawerLayout(context),
    );
  }
}
