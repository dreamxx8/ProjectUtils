import 'package:flutter/material.dart';
import 'package:image_browser/constant/gaps.dart';
import 'package:image_browser/constant/value_const.dart';
import 'package:image_browser/page_custom_widget/widget/custom_gesture_widget.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_badge.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_checkbox.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_divider.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/theme/color_ext.dart';


class TestDivider{

  Widget getDivider(){
    return Container(
      margin: const EdgeInsets.only(top: 20,left: 20),
      width: 250,
      child: Column(
        children: [
          CustomGestrureWidget(
            content: "CWCommonDivider(lineColor: bfGlobal.themeColors.textBrand)",
            child: Container(
              color: Colors.white,
              height: 50,
              margin: const EdgeInsets.only(top: 0, left: 30,right: 30),
              child: CWCommonDivider(lineColor: bfGlobal.themeColors.textBrand),
            ),
          ),
          Gaps.hGap20,
          CustomGestrureWidget(
            content:"CWCommonDivider(lineColor: bfGlobal.themeColors.strokePrimary)",
            child: Container(
              height: 50,
              color: Colors.white,
              margin: const EdgeInsets.only(top: 0, left: 30,right: 30),
              child: CWCommonDivider(lineColor: bfGlobal.themeColors.strokePrimary),
            ),
          ),
          Gaps.hGap20,
          CustomGestrureWidget(
            content:"CWCommonDivider(lineColor: bfGlobal.themeColors.btnBgTertiary)",
            child: Container(
              height: 50,
              color: Colors.white,
              margin: const EdgeInsets.only(top: 0, left: 30,right: 30),
              child: CWCommonDivider(lineColor: bfGlobal.themeColors.btnBgTertiary),
            ),
          ),
          Gaps.hGap20,
          CustomGestrureWidget(
            content:"CWCommonDivider(lineColor: bfGlobal.themeColors.strokePrimary)",
            child: Container(
              height: 50,
              color: Colors.white,
              margin: const EdgeInsets.only(top: 0, left: 30,right: 30),
              child: CWCommonDivider(lineColor: bfGlobal.themeColors.strokePrimary),
            ),
          ),
        ],
      ),
    );
  }


}
