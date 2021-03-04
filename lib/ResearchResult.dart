import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hoseo_oceanit2/ResearchResult/HTTP/resultRestClient.dart';
import 'package:hoseo_oceanit2/ResearchResult/ResultWidgets.dart';

class ResultPage extends StatelessWidget {
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

class ResearchResult extends StatefulWidget {
  @override
  _ResearchResultState createState() => _ResearchResultState();
}

class _ResearchResultState extends State<ResearchResult> {
  final _valueList = ['논문', '특허', '발표'];
  var _seletedValue = "논문";

  Future<List<ResultData>> resultData;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    resultData = fetchGet(_seletedValue);
    return Scaffold(
        appBar: AppBar(
          title: Text("연구 성과"),
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
          child: FutureBuilder<List<ResultData>>(
            future: resultData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    // ignore: missing_return
                    itemBuilder: (context, index) {
                      var resultElement = snapshot.data[index];
                      if(_seletedValue == resultElement.classify_ko) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          width: double.infinity,
                          height: 130.0,
                          child: resultCard(resultElement, _seletedValue),
                        );

                      }
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
