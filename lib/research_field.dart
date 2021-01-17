import 'package:flutter/material.dart';

class ResearchField extends StatefulWidget {
  @override
  _ResearchFieldState createState() => _ResearchFieldState();
}

class _ResearchFieldState extends State<ResearchField> {
  final _valueList = ['전체 과제', '진행 과제', '완료 과제'];
  var _seletedValue = "전체 과제";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("연구 과제"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              })
        ],
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(top: 10.0, right: 20.0),
            child: DropdownButton(
                value: _seletedValue,
                items: _valueList
                    .map((value) => DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                onChanged: (value) => setState(() => _seletedValue = value)),
          ),
          researchCard(),
          researchCard(),
          researchCard(),
          researchCard(),
          researchCard(),
          researchCard()
        ],
      )),
    );
  }
}

Widget researchCard() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 5.0),
    width: double.infinity,
    height: 150.0,
    child: Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: Colors.blue, width: 2.0)),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text("여기는 제목입니다.",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                "여기는 ㅇ룬어ㅏㄹ어ㅏㄴㄹㄴ어ㅏㅠㄹ너ㅏ윤어ㅏㅠㄹㅇ너ㅏㄹㅇ너ㅏ륜아런유ㅏㅓㄹ유ㅓㅏㄹ유ㅓㅏㄹㄴ유러ㅏㄴ율어ㅏ뉼ㄴ어ㅏㅠㄹㄴ어ㅏㅠㄹㄴ어ㅏㅠㄹㄴ어ㅏㅠㄴ어ㅏㄹㄴ유ㅓㅏㄹㄴ유ㅏㄴ유란유ㅏ어뉴러ㅏㄴ율ㄴ어ㅏㅠㄴ어ㅏㅠ허ㅏㄴ러ㅏㄴ율ㄴ어ㅏㅠㄹㄴ어ㅏㄹ.",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              child: Text(
                "고학림",
                style: TextStyle(
                    color: Colors.purple,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    ),
  );
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
