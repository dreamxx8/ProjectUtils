

import 'package:flutter/material.dart';
import 'package:image_browser/constant/gaps.dart';
import 'package:image_browser/page_color_manager/color_browser_page.dart';
import 'package:image_browser/page_custom_widget/widget/custom_gesture_widget.dart';
import 'package:image_browser/page_custom_widget/widget/other/list_divider_widget.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/theme/color_ext.dart';
import 'package:image_browser/utils/common_border.dart';

class ColorItem extends StatelessWidget {

  final ColorDecode colorDecode;

  const ColorItem(this.colorDecode, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomGestrureWidget(
          content: "bfGlobal.themeColors.${colorDecode.name}",
          child: Container(
            //decoration: RegularBorder(),
            width: 240,
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(colorDecode.name ?? "", style: bfGlobal.themeColors.textPrimary.f16W600,),
                Gaps.hGap10,
                Container(
                  height: 60,
                  decoration: CustomShadow(color: colorDecode.lightColor),
                ),
                Gaps.hGap10,
                Text("light - ${colorDecode.light ?? "--"}", style: bfGlobal.themeColors.textPrimary.f14W400,),
                Gaps.hGap24,
                Container(
                  height: 60,
                  decoration: CustomShadow(color: colorDecode.darkColor),
                ),
                Gaps.hGap5,
                Text("dark - ${colorDecode.dark ?? "--"}", style: bfGlobal.themeColors.textPrimary.f14W400,),
              ],
            ),
          ),
        ),
        Container(
          width: 240,
            child: ListDividerWidget(lineColor: Colors.black.withOpacity(0.3)))
      ],
    );
  }
}
