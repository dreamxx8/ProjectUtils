import 'package:flutter/material.dart';
import 'package:image_browser/theme/bf_global.dart';

/// 分割线
class ListDividerWidget extends StatelessWidget {
  Color? lineColor;
  final double thickness;

  ListDividerWidget({super.key, this.lineColor, this.thickness = 1});

  @override
  Widget build(BuildContext context) {
    lineColor ??= bfGlobal.themeColors.backgroundSecondary;
    return Divider(
      height: 1,
      color: lineColor,
      thickness: thickness,
    );
  }
}

