import 'package:flutter/material.dart';
import 'package:image_browser/constant/gaps.dart';
import 'package:image_browser/constant/value_const.dart';
import 'package:image_browser/page_custom_widget/widget/custom_gesture_widget.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_badge.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_checkbox.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/theme/color_ext.dart';


class TestCheckbox{

  Widget getCheckbox(){
    return Container(
      margin: const EdgeInsets.only(top: 20,left: 50),
      width: 100,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomGestrureWidget(
            content: "Row(\n" +
                "              children: [\n" +
                "                CWCommonCheckBox(\n" +
                "                  onChanged: (bool) {},\n" +
                "                  selectedImage: ImageSourceConst.IC_BASE_CHECKBOX_ON,\n" +
                "                  unselectedImage: ImageSourceConst.IC_BASE_CHECKBOX_OFF,\n" +
                "                ),\n" +
                "                Gaps.wGap8,\n" +
                "                Text(\n" +
                "                  \"TP/SL\",\n" +
                "                  style: bfGlobal.themeColors.negative.f12W400,\n" +
                "                ),\n" +
                "              ],\n" +
                "            )",
            child: Row(
              children: [
                CWCommonCheckBox(
                  onChanged: (bool) {},
                  selectedImage: ImageSourceConst.IC_BASE_CHECKBOX_ON,
                  unselectedImage: ImageSourceConst.IC_BASE_CHECKBOX_OFF,
                ),
                Gaps.wGap8,
                Text(
                  "TP/SL",
                  style: bfGlobal.themeColors.negative.f12W400,
                ),
              ],
            ),
          ),
          Gaps.hGap20,
          CustomGestrureWidget(
            content: "Row(\n" +
                "              children: [\n" +
                "                CWCommonCheckBox(\n" +
                "                  onChanged: (bool) {},\n" +
                "                  selectedImage: ImageSourceConst.IC_BASE_CHECKBOX_BLACK_ON,\n" +
                "                  unselectedImage: ImageSourceConst.IC_BASE_CHECKBOX_GRAY_OFF,\n" +
                "                ),\n" +
                "                Gaps.wGap8,\n" +
                "                Text(\n" +
                "                  \"TP/SL\",\n" +
                "                  style: bfGlobal.themeColors.negative.f12W400,\n" +
                "                ),\n" +
                "              ],\n" +
                "            )",
            child: Row(
              children: [
                CWCommonCheckBox(
                  onChanged: (bool) {},
                  selectedImage: ImageSourceConst.IC_BASE_CHECKBOX_BLACK_ON,
                  unselectedImage: ImageSourceConst.IC_BASE_CHECKBOX_GRAY_OFF,
                ),
                Gaps.wGap8,
                Text(
                  "TP/SL",
                  style: bfGlobal.themeColors.negative.f12W400,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}
