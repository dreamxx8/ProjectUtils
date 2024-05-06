
import 'package:flutter/material.dart';
import 'package:image_browser/constant/color_const.dart';
import 'package:image_browser/constant/value_const.dart';
import 'package:image_browser/extension/string_extension.dart';
import 'package:image_browser/utils/common_border.dart';
import 'package:image_browser/utils/lc_styles.dart';

toGroup(List<CustomTextCheckBox> groupList) {
  CustomTextCheckBox? lastChecked;
  for (var checkBox in groupList) {
    checkBox.onChecked2 = (check) {
      if (check) {
        lastChecked?.innerState?.check(false);
        lastChecked = checkBox;
      }
    };
  }
}

class CustomTextCheckBox extends StatefulWidget {
  final String text;
  final ValueChanged<bool> onChecked;
  ValueChanged<bool>? onChecked2;
  Color checkedColor = accent_main;
  Color normalColor = transparent;
  bool isChecked;
  bool isToCancel = false;
  _CustomCheckBoxState? innerState;

  CustomTextCheckBox(
      {required this.text,
      required this.onChecked,
      this.checkedColor = accent_main,
      this.normalColor = transparent,
      this.isChecked = false,
      this.isToCancel = false});

  @override
  _CustomCheckBoxState createState() {
    innerState = _CustomCheckBoxState();
    return innerState!;
  }

  check(isCheck) {
    isChecked = isCheck;
    innerState?.notify();
  }
}

class _CustomCheckBoxState extends State<CustomTextCheckBox> {
  check(isCheck) {
    setState(() {
      widget.isChecked = isCheck;
    });
  }

  void notify() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.isChecked && !widget.isToCancel) {
          return;
        }
        setState(() {
          widget.isChecked = !widget.isChecked;
        });
        widget.onChecked(widget.isChecked);
        widget.onChecked2?.call(widget.isChecked);
      },
      child: _getTagWidget(widget.isChecked, widget.text),
    );
  }

  _getTagWidget(bool isSelect, String title) {
    Size size = title.boundingTextSize(StRegular(12, colorTheme), maxLines: 1);
    double textWidth = size.width + 40.0;
    return Container(
      width: textWidth,
      height: 26,
      decoration: RegularBorder(
          colorBorder: isSelect ? colorTheme : line_main, radius: 4.0),
      child: Stack(
        children: [
          isSelect ?  Positioned(
            top: 0,
            right: 0,
            child: Image.asset(ImageSourceConst.ASSETS_FILTER_SELECT), width: 14, height: 14,):Container(),
          Center(
            child: Text(
              title,
              style: StRegular(12, isSelect ? text_main : text_main2),
            ),
          ),
        ],
      ),
    );
  }
}
