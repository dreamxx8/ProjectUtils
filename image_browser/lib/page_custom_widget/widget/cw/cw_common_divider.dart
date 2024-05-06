import 'package:image_browser/theme/bf_global.dart';
import 'package:flutter/material.dart';

/// 分割线
class CWCommonDivider extends StatelessWidget {
  Color? lineColor;
  final double thickness;

  CWCommonDivider({super.key, this.lineColor, this.thickness = 1});

  @override
  Widget build(BuildContext context) {
    lineColor ??= bfGlobal.themeColors.textBrand;
    return Divider(
      height: 1,
      color: lineColor,
      thickness: thickness,
    );
  }
}
