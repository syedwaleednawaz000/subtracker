import 'package:flutter/material.dart';

Widget TextWidgetInterBold({
  required String title,
  // Color color = Colors.black,
  double fontSize = 12,
  FontWeight fontWeight = FontWeight.normal,
  TextAlign align = TextAlign.start, required ,
    })
{
  return Text(
    textAlign: align,
    title,style: TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    // color: color,
    height: 1.5,
    wordSpacing: 5,
    fontFamily: 'Inter-Bold',
    // fontFamily: 'Times New Roman',
  ),);
}

Widget TextWidgetInterRegular({required String title,
// Color color = Colors.black,
double fontSize = 12, FontWeight fontWeight = FontWeight.normal,TextAlign align = TextAlign.start}){
  return Text(title,style :TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    // color: color,
    // height: 1.5,
    // wordSpacing: 5,
    fontFamily: 'Inter-Regular',
  ),
    textAlign: align,
  );
}

Widget TextWidgetInterMedium({required String title,
// Color color = Colors.black,
double fontSize = 12, FontWeight fontWeight = FontWeight.normal,TextAlign align = TextAlign.start}){
  return Text(title,style:TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    // color: color,
    // height: 1.5,
    // wordSpacing: 5,
    fontFamily: 'Inter-Medium',
  ),
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
    textAlign: align,
  );


}



Widget TextWidgetMerri({required String title,
// Color color = Colors.black,
double fontSize = 12, FontWeight fontWeight = FontWeight.normal,TextAlign align = TextAlign.start}){
  return Text(title,style:TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    // color: color,
    height: 1.5,
    wordSpacing: 5,
    fontFamily: '',
  ),
    textAlign: align,
  );


}