import 'package:flutter/material.dart';
import 'package:image_browser/constant/value_const.dart';
import 'package:image_browser/theme/bf_global.dart';

class CWCommonFab extends StatefulWidget {
  String? icon;
  Color? bgColor;

  CWCommonFab({
    this.icon,
    this.bgColor,
  });

  @override
  _CWCommonFabState createState() => _CWCommonFabState();
}

class _CWCommonFabState extends State<CWCommonFab> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Container(
        width: 52,
        height: 52,
        //padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
        decoration: BoxDecoration(
          //color: bfGlobal.themeColors.textBrand,
          color: widget.bgColor ??= bfGlobal.themeColors.textBrand,
          borderRadius: BorderRadius.circular(80),
        ),
        child: IconButton(
          icon: Image.asset(
            widget.icon ??= ImageSourceConst.IC_BASE_FAB,
            width: 20,
            height: 20,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
