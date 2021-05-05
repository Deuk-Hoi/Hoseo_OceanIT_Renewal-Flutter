import 'package:flutter/material.dart';
import 'package:marquee_widget/marquee_widget.dart';


class ResultDialog extends StatelessWidget{
  var writer="저자";
  var date_name;
  var customColor;
  var middleContents;
  var middleContents_name;
  dynamic resultElement;
  var ContentfontSize = 14.0;
  ResultDialog(dynamic resultElement){
    this.resultElement = resultElement;

    if (resultElement.classify_ko == "논문") {
      date_name = "게재연도";
      middleContents_name="게재지";
      customColor = Colors.red;
      middleContents = resultElement.media_ko;

    } else if (resultElement.classify_ko == "발표") {
      date_name = "발표일자";
      middleContents_name="학술대회명";
      customColor = Colors.purple[700];
      middleContents = resultElement.academic_ko;
    } else {
      writer="발명자";
      date_name = "출원/등록일";
      middleContents_name="출원/등록번호";
      customColor = Colors.orange;
      middleContents = resultElement.application_num;
    }

  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildChild(context),
    );
  }

  _buildChild(BuildContext context) => Container(
      height: 350,
      width: 500,
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:BorderRadius.circular(20)
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  "${resultElement.title_ko}",
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.purple[900],
                      fontWeight: FontWeight.w800
                  ),),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10.0),
                child: Row(
                  children: [
                    Text(writer+" : ",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: ContentfontSize
                      ),),
                   Expanded(
                        child:Marquee(
                          child: Text(
                            "${resultElement.writer_ko}",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: ContentfontSize
                            ),
                          ),
                        )
                    )
                    /*Text(
                      "${resultElement.writer_ko}",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: ContentfontSize
                      ),
                    )*/
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10.0),
                child: Row(
                  children: [
                    Text(date_name +" : ",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: ContentfontSize
                      ),),
                    Text(
                      "${resultElement.date}",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: ContentfontSize
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10.0),
                child: Row(
                  children: [
                    Text(middleContents_name +" : ",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: ContentfontSize
                      ),),
                    Expanded(
                        child:Marquee(
                          child: Text(
                            middleContents,
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: ContentfontSize
                            ),
                          ),
                        )
                    )
                  ],
                ),
              ),


            ],
          ),
        ),

  )

  );
}