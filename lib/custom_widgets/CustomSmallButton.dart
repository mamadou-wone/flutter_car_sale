import 'package:flutter/material.dart';
import 'package:flutter_by_google/custom_widgets/CustomText.dart';

class CustomSmallButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final FontColor fontColor;
  final FontSize fontSize;
  final FontWeight fontWeight;
  final void Function() onPressed;
  final Color backgroundButton;
  final Color borderColor;

  CustomSmallButton(
      {@required this.text,
      @required this.onPressed,
      @required this.fontColor,
      @required this.backgroundButton,
      @required this.borderColor,
      this.fontSize = FontSize.sm,
      this.fontWeight = FontWeight.normal,
      this.icon});

  @override
  Widget build(BuildContext context) {
    List<Widget> listWidget = [];
    listWidget.add(
      CustomText(
        text: this.text,
        fontColor: this.fontColor,
        fontSize: this.fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
    if (icon != null) {
      listWidget.add(
        Icon(
          this.icon,
          size: CustomText.textSize(this.fontSize),
          color: CustomText.textColor(this.fontColor),
        ),
      );
    }

    return GestureDetector(
      onTap: this.onPressed,
      child: Container(
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.all(const Radius.circular(3)),
          color: this.backgroundButton,
          border: Border.all(color: this.borderColor, width: 1),
        ),
        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 3),
        child: Row(children: listWidget),
      ),
    );
  }
}
