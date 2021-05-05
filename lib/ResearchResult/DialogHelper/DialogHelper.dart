import 'package:flutter/material.dart';
import 'package:hoseo_oceanit2/ResearchResult/ResultDialog.dart';

class DialogHelper{
  static exit(context, resultElement) => showDialog(context: context, builder: (context)=> ResultDialog(resultElement));
}