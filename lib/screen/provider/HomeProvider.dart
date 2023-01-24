import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier
{
  List y1=[31,28,31,30,31,30,31,31,30,31,30,31];
  int? d,m,y,Y,M,D,ND,NM,NY;
  bool vis = false;

  TextEditingController txtTD= TextEditingController();
  TextEditingController txtDD= TextEditingController();
  TextEditingController txtMM= TextEditingController();
  TextEditingController txtYY= TextEditingController();
  DateTime? selectDate;
  GlobalKey<FormState> key = GlobalKey<FormState>();


  Future<DateTime?> Date(BuildContext context)async{
    DateTime? newDate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime(2050),);
    if(newDate!=null){
      selectDate = newDate;
      txtTD = TextEditingController(text: "${newDate.day}/${newDate.month}/${newDate.year}");
      notifyListeners();
    }
  }
  void clear(){
    txtDD.clear();
    txtTD.clear();
    txtYY.clear();
    txtMM.clear();
    vis=false;
    D=0;
    M=0;
    Y=0;
    ND=0;
    NM=0;
    NY=0;

    notifyListeners();
  }
  void Result()
  {
    d = int.parse("${txtDD.text}");
    m = int.parse("${txtMM.text}");
    y = int.parse("${txtYY.text}");

    Y= int.parse("${selectDate!.year}") - y!;
    if(int.parse("${selectDate!.month}") < m!)
      {
        Y=Y!-1;
        M = 12 - (m! - int.parse("${selectDate!.month}"));
      }
    else{
      M = int.parse("${selectDate!.month}") - m!;
    }
    if(int.parse("${selectDate!.day}") < d!)
      {
        M=M!-1;
        D= y1[int.parse("${selectDate!.month - 1}")] - (d! - int.parse("${selectDate!.day}"));
      }
    else
      {
        D = int.parse("${selectDate!.day}") - d!;
      }
    vis = true;
    notifyListeners();
  }
  void nextBirth(){
    d = int.parse("${txtDD.text}");
    m = int.parse("${txtMM.text}");
    y = int.parse("${txtYY.text}");

    NY= int.parse("${selectDate!.year}") + 1;
    if(int.parse("${selectDate!.month}") >= m!)//1>=1
    {
      //NY=NY!-1;
      NM = 12 - (int.parse("${selectDate!.month}") - m!);
    }
    else{
      NM = m! - int.parse("${selectDate!.month}");//5-1
    }
    if(int.parse("${selectDate!.day}") > d!)//24>18
    {
      NM=NM!-1;//3
      ND= y1[int.parse("${selectDate!.month - 1}")] - (int.parse("${selectDate!.day}") - d!);//31-24-18
    }
    else
    {
      ND = d! - int.parse("${selectDate!.day}");
    }
  }
}

