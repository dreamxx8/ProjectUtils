import 'package:image_browser/constant/color_const.dart';
import 'package:flutter/material.dart';
import 'package:image_browser/theme/bf_global.dart';

class CustomCheckBox extends StatelessWidget {
  final bool? isChecked;
  final ValueChanged callBack;

  const CustomCheckBox(
      {Key? key, required this.isChecked, required this.callBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 20,
      child: Transform.scale(
        scale: 0.8,
        child: Checkbox(
          side: BorderSide(color: color_C3C4CE),
          checkColor: bfGlobal.themeColors.backgroundPrimary,
          activeColor: colorTheme,
          onChanged: (bool? value) {
            callBack(value);
          },
          value: isChecked,
        ),
      ),
    );
  }
}
