import 'package:image_browser/constant/color_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(this.title,
      {Key? key,
      this.callBack,
      this.padding,
      this.bgColor = colorTheme,
      this.radius = 6})
      : super(key: key);
  Text title;
  GestureTapCallback? callBack;
  EdgeInsetsGeometry? padding;
  Color bgColor;
  double radius;

  @override
  Widget build(BuildContext context) {
    if (padding == null) {
      padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 5);
    }
    return InkWell(
        onTap: () {
          if (callBack != null) {
            callBack!();
          }
        },
        child: Container(
          padding: padding,
          decoration:
              BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(this.radius)),
                color: bgColor,
              ),
          child: this.title,
        ),

    );
  }
}
