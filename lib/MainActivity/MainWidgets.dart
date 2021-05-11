import 'package:flutter/material.dart';
import 'package:hoseo_oceanit2/MainActivity/MainHeader.dart';
import 'package:hoseo_oceanit2/ResearchField.dart';
import 'package:hoseo_oceanit2/researchResult.dart';
import 'package:hoseo_oceanit2/Member.dart';
import 'package:marquee_widget/marquee_widget.dart';
import 'package:hoseo_oceanit2/MainActivity/HTTP/MainClient.dart';

Widget nameCard(dynamic context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    transform: Matrix4.translationValues(0.0, -35.0, 0.0),
    margin: EdgeInsets.only(right: 20, left: 20),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                "AI 융합대학 컴퓨터공학전공",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Text(
                "UIT 연구원 김득회",
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        )
      ],
    ),
  );
}

Widget researchCard(dynamic mainElement) {
  return Container(
      height: 150.0,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Card(
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: InkWell(
            splashColor: Colors.blue.withAlpha(60),
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    margin: EdgeInsets.only(left: 15.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/OceanMain.jpg',
                        fit: BoxFit.fill,
                        width: 140,
                        height: 100,
                      ),
                    ),
                  ),
                ),
                Expanded(
                    flex: 6,
                    child: Container(
                      height: double.infinity,
                      margin: EdgeInsets.only(bottom: 20, right: 10),
                      child: ListTile(
                        title: Marquee(
                          child: Text(
                            mainElement.research_name_ko,
                            style: TextStyle(fontSize: 20, height: 2.5),
                          ),
                        ),
                        subtitle: Text(
                          mainElement.research_content_ko,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )),
              ],
            )),
      ));
}

Widget quickMenu(dynamic context, MainHeader mainHeader) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Card(
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
              padding: EdgeInsets.all(10.0),
              child: InkWell(
                splashColor: Colors.blue.withAlpha(60),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Researcher()));
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.group,
                      color: Colors.purple[900],
                      size: 50,
                    ),
                    Text(mainHeader.member)
                  ],
                ),
              ))),
      Card(
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
              padding: EdgeInsets.all(10.0),
              child: InkWell(
                splashColor: Colors.blue.withAlpha(60),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResearchResult()));
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.biotech,
                      color: Colors.purple[900],
                      size: 50,
                    ),
                    Text(mainHeader.researchResult)
                  ],
                ),
              ))),
      Card(
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
              padding: EdgeInsets.all(10.0),
              child: InkWell(
                splashColor: Colors.blue.withAlpha(60),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ResearchField()));
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.create,
                      color: Colors.purple[900],
                      size: 50,
                    ),
                    Text(mainHeader.researchField)
                  ],
                ),
              ))),
      Card(
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
              padding: EdgeInsets.all(10.0),
              child: InkWell(
                splashColor: Colors.blue.withAlpha(60),
                onTap: () {
                  print("분산형 수증관측망");
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.waves,
                      color: Colors.purple[900],
                      size: 50,
                    ),
                    Text(mainHeader.observ)
                  ],
                ),
              ))),
    ],
  );
}
