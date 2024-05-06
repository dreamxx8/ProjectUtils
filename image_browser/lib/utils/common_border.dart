import 'package:image_browser/constant/color_const.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_browser/utils/lc_styles.dart';

BoxDecoration RegularBorder({
  Color colorBorder = colorTheme,
  Color backgroundColor = background_main,
  double borderWidth = 1.0,
  double radius = 6.0,
}) {
  if(backgroundColor == background_main){
    backgroundColor = bfGlobal.themeColors.backgroundPrimary;
  }
  if(colorBorder == line_main){
    colorBorder = bfGlobal.themeColors.btnBgQuarterary;
  }
  return BoxDecoration(
    color: backgroundColor,
    border: Border.all(
      color: colorBorder,
      width: borderWidth,
    ),
    borderRadius: BorderRadius.circular((radius)),
  );
}

BoxDecoration RegularRadius({Color? color, double radius = 6.0}) {
  return BoxDecoration(
    color: color ?? colorTheme,
    borderRadius: BorderRadius.circular((radius)),
  );
}

/// 阴影
BoxDecoration CustomShadow({Color? color}){
  return BoxDecoration(
    color: color ?? Color(0xFFF9F7FB),
    borderRadius: BorderRadius.circular(8.0),
    boxShadow: [
      BoxShadow(
        color: color_shadow,
          offset: Offset(0.0, 2.0),
          blurRadius: 5.0,
          spreadRadius: 0,
        )
    ]
  );
}


InputDecoration customTextFieldDecoration({String? hint}) {
  return InputDecoration(
    filled: true,
    isDense: true,
    fillColor: transparent,
    contentPadding: EdgeInsets.zero,
    hintStyle: StMedium(14, text_main2.withOpacity(0.5)),
    border: InputBorder.none,
    hintText: hint,
  );
}