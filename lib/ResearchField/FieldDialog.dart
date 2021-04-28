import 'package:flutter/material.dart';
import 'package:marquee_widget/marquee_widget.dart';

class FieldDialog extends StatelessWidget{
  dynamic fieldElement;
  var ContentfontSize = 14.0;
  FieldDialog(dynamic fieldElement){
    this.fieldElement = fieldElement;
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
    height: 650,
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
                "${fieldElement.research_name_ko}",
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
                  Text("부서:  ",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: ContentfontSize
                    ),),
                  Text(
                    "${fieldElement.department_name_ko}",
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
                  Text("사업명:  ",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: ContentfontSize
                    ),),
                  Text(
                    "${fieldElement.business_name_ko}",
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
                  Text("지원기관:  ",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: ContentfontSize
                    ),),
                  Text(
                    "${fieldElement.support_agency_ko}",
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
                  Text("연구기간:  ",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: ContentfontSize
                    ),),
                  Expanded(
                      child:Text(
                        "${fieldElement.date_start+" ~ "+fieldElement.date_end}",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: ContentfontSize
                        ),
                      )
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10.0),
              child: Row(
                children: [
                  Text("참여기관:  ",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: ContentfontSize
                    ),),
                  Expanded(
                      child:Marquee(
                        child: Text(
                          "${fieldElement.participation_agency_ko}",
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
            Container(
              margin: EdgeInsets.only(bottom: 10.0),
              child: Row(
                children: [
                  Text("연구책임자:  ",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: ContentfontSize
                    ),),
                  Expanded(
                      child:Text(
                        "${fieldElement.research_manager_ko}",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: ContentfontSize,
                            color: Colors.indigo
                        ),
                      )
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    alignment: Alignment.centerLeft,
                    child: Text("연구 목표", style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple
                    ),),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black12
                    ),
                    child: Text("${fieldElement.research_goal_ko}"),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    alignment: Alignment.centerLeft,
                    child: Text("연구 내용", style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple
                    ),),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black12
                    ),
                    child: Text("${fieldElement.research_content_ko}"),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    alignment: Alignment.centerLeft,
                    child: Text("기대 성과", style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple
                    ),),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black12
                    ),
                    child: Text("${fieldElement.expectation_result_ko}"),
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