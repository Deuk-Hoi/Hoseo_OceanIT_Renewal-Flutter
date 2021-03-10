import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hoseo_oceanit2/ResearchField/HTTP/FieldRestClient.dart';
import 'package:hoseo_oceanit2/ResearchField/FieldWidgets.dart';

class Field extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

class ResearchField extends StatefulWidget {
  @override
  _ResearchFieldState createState() => _ResearchFieldState();
}

class _ResearchFieldState extends State<ResearchField> {
  final _valueList = ['전체 과제', '진행 과제', '완료 과제'];
  var _seletedValue = "전체 과제";

  Future<List<FieldData>> fieldData;

  @override
  void initState() {
    super.initState();
    fieldData = fetchGet();
  }

  @override
  Widget build(BuildContext context) {
    fieldData = fetchGet();
    fieldData = fetchGet();
    return Scaffold(
        appBar: AppBar(
          title: Text("연구 과제"),
          actions: <Widget>[
            Container(
                child: DropdownButtonHideUnderline(
              child: DropdownButton(
                  dropdownColor: Colors.purple,
                  value: _seletedValue,
                  items: _valueList
                      .map((value) => DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: Colors.white),
                            ),
                          ))
                      .toList(),
                  onChanged: (value) => setState(() => _seletedValue = value)),
            )),
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(context: context, delegate: DataSearch());
                }),
          ],
          elevation: 0.0,
        ),
        body: Center(
          child: FutureBuilder<List<FieldData>>(
            future: fieldData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      var fieldElement = snapshot.data[index];
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        width: double.infinity,
                        height: 140.0,
                        child: researchCard(fieldElement),
                      );
                    });
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ));
  }
}

class DataSearch extends SearchDelegate<String> {
  final recentSearch = ["apple", "banana"];
  final searchList = ["apple", "banana", "pineapple"];
  var clickList = "";
  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {})];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () => close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    query = clickList; //쿼리를 완성해서 보여준다
    return Container(
      child: Text(clickList), //리스트에서 원하는 제목을 불러온다.
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentSearch
        : searchList.where((element) => element.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          clickList = suggestionList[index];
          showResults(context);
        }, //결과 화면
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(color: Colors.grey))
              ]),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}
