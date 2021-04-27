import 'package:flutter/material.dart';
import 'package:hoseo_oceanit2/ResearchField/FieldDialog.dart';

class DialogHelper{
  static exit(context, fieldElement) => showDialog(context: context, builder: (context)=> FieldDialog(fieldElement));
}