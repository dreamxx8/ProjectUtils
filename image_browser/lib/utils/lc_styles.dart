import 'package:flutter/material.dart';

/// stTitleDarkMedium24
/// TitleDark: 颜色
/// Medium: 字体样式
/// 24: 字体大小

class StBold extends TextStyle {
  StBold(double fontSize, Color color ,{double? height})
      :  super(
            fontSize: fontSize,
            color: color,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w700,
            height: height);
}


class StMedium extends TextStyle {
  StMedium(double fontSize, Color color, {double? height, TextDecoration? decoration = TextDecoration.none})
      :  super(
          fontSize: fontSize,
          color: color,
          decoration: decoration,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          height: height,
        );
}

class StRegular extends TextStyle {
  StRegular(double fontSize, Color color, {double? height})
      :super(
            fontSize: fontSize,
            color: color,
            decoration: TextDecoration.none,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            height: height);
}

class StLight extends TextStyle {
  StLight(double fontSize, Color color, {double? height})
      : super(
      fontSize: fontSize,
      color: color,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      height: height);
}

class StBoldDin extends TextStyle {
  StBoldDin(double fontSize, Color color, {double? height})
      :  super(
            fontSize: fontSize,
            color: color,
            fontFamily: "DinproBlod",
            decoration: TextDecoration.none,
            height: height);
}

class StMediumDin extends TextStyle {
  StMediumDin(double fontSize, Color color, {double? height})
      : super(
          fontSize: fontSize,
          color: color,
          decoration: TextDecoration.none,
          fontStyle: FontStyle.normal,
          fontFamily: "DinproMedium",
          height: height,
        );
}

class StRegularDin extends TextStyle {
  StRegularDin(double fontSize, Color color, {double? height})
      : super(
            fontSize: fontSize,
            color: color,
            decoration: TextDecoration.none,
            fontStyle: FontStyle.normal,
            fontFamily: "DinproRegular",
            height: height);
}

class StCustom extends TextStyle {
  StCustom(double fontSize, Color color,
      {double? height, FontWeight fontWeight = FontWeight.w400})
      : super(
            fontSize: fontSize,
            color: color,
            decoration: TextDecoration.none,
            fontFamily: "Roboto",
            fontStyle: FontStyle.normal,
            fontWeight: fontWeight,
            height: height);
}
