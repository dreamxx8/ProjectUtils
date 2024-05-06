
import 'package:flutter/material.dart';
import 'package:image_browser/constant/color_const.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/utils/lc_styles.dart';


class BottomCancelButton extends StatelessWidget {
  const BottomCancelButton({Key? key, this.callback}) : super(key: key);
  final VoidCallback? callback;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(callback != null){
          callback!();
        }
      },
      child: Material(
        color: bfGlobal.themeColors.backgroundPrimary,
        child: Container(
          margin: EdgeInsets.only(bottom: 32),
          height: 44,
          child: Center(
            child: Text(
              "取消",
              style: StMedium(14, text_main2),
            ),
          ),
        ),
      ),
    );;
  }
}
