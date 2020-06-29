import 'package:flutter/material.dart';

Widget builSeparator(double width){
  return Container(
    height: 3,
    width: width,
    color: Colors.grey[300],
  );
}


void showSnacbar(GlobalKey<ScaffoldState> scaffoldkey , String text){
  final snackbar = SnackBar(content: Text(text));
  scaffoldkey.currentState.hideCurrentSnackBar();
  scaffoldkey.currentState.showSnackBar(snackbar);
}