import 'package:flutter/material.dart';
import 'package:hoseo_oceanit2/ResearchResult/DialogHelper/DialogHelper.dart';
resultCard(dynamic resultElement, dynamic _seletedValue, BuildContext context) {
  var writer;
  var customColor;
  var middleContents;
  if (resultElement.writer_ko.length > 13) {
    writer = resultElement.writer_ko.substring(0, 13) + "...";
  } else {
    writer = resultElement.writer_ko;
  }

  if (resultElement.classify_ko == "논문") {
    customColor = Colors.red;
    middleContents = resultElement.media_ko;
  } else if (resultElement.classify_ko == "발표") {
    customColor = Colors.purple[700];
    middleContents = resultElement.academic_ko;
  } else {
    customColor = Colors.orange;
    middleContents = "출원번호 : ${resultElement.application_num}";
  }
  return Card(
      elevation: 7.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: InkWell(
        onTap: () {
          print(resultElement.rrid);
          DialogHelper.exit(context, resultElement);
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  resultElement.title_ko,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  middleContents,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      child: Row(
                    children: [
                      Text(
                        resultElement.date,
                        style: TextStyle(
                            color: Colors.purple,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        writer,
                        style: TextStyle(
                            color: Colors.purple,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Text("[ ${resultElement.classify_ko} ]",
                        style: TextStyle(
                            color: customColor,
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ));
}
