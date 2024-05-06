import 'package:flutter/material.dart';

class CWCommonBadge extends StatefulWidget {
  final String text;
  final TextStyle textStyle;
  final Color? bgColor;

  CWCommonBadge({
    required this.text,
    required this.textStyle,
    this.bgColor,
   });

  @override
  _CWCommonBadgeState createState() => _CWCommonBadgeState();
}

class _CWCommonBadgeState extends State<CWCommonBadge> {
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
        padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
        decoration: BoxDecoration(
          //color: bfGlobal.themeColors.textBrand,
          color:  widget.bgColor,
          borderRadius: BorderRadius.circular(80),
        ),
        child:  Text(
          widget.text,
         // style: bfGlobal.themeColors.negative.f14W700,
          style: widget.textStyle,
        ),
      ),
    );
  }
}
