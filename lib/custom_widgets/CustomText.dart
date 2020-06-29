// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// L'embles de propriétés possibles que pourra prendre mes textes

enum FontOpacity{max , medium , min , none}

/// L'ensemble des couleur possibles

enum FontColor{white , dark , lightGrey , darkGrey , blue}

/// Les tailles possibles

enum FontSize{sm , md , xs ,lg ,xl}


class CustomText  extends StatelessWidget{
  //Les attribut d'un stateLessWidget ne changent pas donc c'est des final
  final String text;
  final FontColor fontColor;
  final FontSize fontSize;
  final FontOpacity fontOpacity;
  final FontWeight fontWeight;
  final TextAlign alignment;
  final int maxLines;
  final bool underline;
  final TextOverflow overflowStyle;

  CustomText({
    @required this.text , 
    @required this.fontColor,
    @required this.fontSize,
    this.fontWeight = FontWeight.normal,
    this.fontOpacity = FontOpacity.none,
    this.alignment = TextAlign.start,
    this.maxLines = 2,
    this.underline = false,
    this.overflowStyle = TextOverflow.ellipsis
  });

  static double textSize(FontSize fontSize){
    double size;
    switch (fontSize) {
      case FontSize.xs:
        size = 10;
        break;
        case FontSize.sm:
        size = 12;
        break;
        case FontSize.md:
        size = 14;
        break;
        case FontSize.lg:
        size = 16;
        break;
        case FontSize.xl:
        size = 18;
        break;
    }
    return size;
  }

  static Color textColor(FontColor fontColor){
    Color color;
    switch (fontColor) {
      case FontColor.white:
        color = Colors.white;
        break;
     case FontColor.dark:
        color = Colors.black;
        break;
        case FontColor.blue:
        color = Colors.blue;
        break;
        case FontColor.lightGrey:
        color = Color(0xff999999);
        break;
        case FontColor.darkGrey:
        color = Color(0xff666666);
        break;
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return new Text(
      this.text,
      maxLines: this.maxLines,
      textAlign: this.alignment,
      style: TextStyle(
        decoration: this.underline ? TextDecoration.underline : TextDecoration.none,
        fontSize: textSize(this.fontSize),
        color: textColor(this.fontColor),
        fontWeight: this.fontWeight
      ),
    );
  }



}