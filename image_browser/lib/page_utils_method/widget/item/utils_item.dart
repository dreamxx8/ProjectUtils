
import 'package:flutter/material.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/theme/color_ext.dart';

class UtilsItem extends StatelessWidget {

  String title;
  String method;

  UtilsItem(this.title, this.method,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: bfGlobal.themeColors.textPrimary.f18W700,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            method,
            style: bfGlobal.themeColors.textSecondary.f16W400,
          ),
        ],
      ),
    );
  }
}
