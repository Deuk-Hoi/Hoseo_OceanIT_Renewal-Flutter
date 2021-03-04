import 'package:flutter/material.dart';

researchCard(dynamic fieldElement) {
  var startDate = DateTime.parse(fieldElement.date_start);
  var endDate = DateTime.parse(fieldElement.date_end);
  var now = DateTime.now();
  Text researchStatus;
  if (endDate.difference(now).inDays > 0) {
    researchStatus = Text(
      "연구진행중",
      style: TextStyle(
          color: Colors.red, fontSize: 15.0, fontWeight: FontWeight.bold),
    );
  } else {
    researchStatus = Text(
      "연구완료",
      style: TextStyle(
          color: Colors.blue, fontSize: 15.0, fontWeight: FontWeight.bold),
    );
  }
  return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: Colors.blue, width: 2.0)),
      child: InkWell(
        onTap: () {
          print(fieldElement.rfid);
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  fieldElement.research_name_ko,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  fieldElement.research_goal_ko,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      "${fieldElement.date_start} ~ ${fieldElement.date_end}",
                      style: TextStyle(
                          color: Colors.purple,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: researchStatus,
                  ),
                ],
              ),
            ],
          ),
        ),
      ));
}
