import 'package:flutter/material.dart';
import 'package:image_browser/constant/gaps.dart';
import 'package:image_browser/page_custom_widget/widget/custom_gesture_widget.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_badge.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/theme/color_ext.dart';


class TestBadge{

  Widget getBadges(){
    return Container(
      width: 100,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomGestrureWidget(
            content: "CWCommonBadge(\ntext: \"Label1\",\nbgColor: bfGlobal.themeColors.functionBuy.withOpacity(0.1),\ntextStyle: bfGlobal.themeColors.functionBuy.f14W700,\n)",
            child: Container(
              margin: const EdgeInsets.only(top: 20, left: 20),
              child: CWCommonBadge(
                text: "Label1",
                bgColor: bfGlobal.themeColors.functionBuy.withOpacity(0.1),
                textStyle: bfGlobal.themeColors.functionBuy.f14W700,
              ),
            ),
          ),
          Gaps.hGap10,
          CustomGestrureWidget(
            content: "CWCommonBadge(\ntext: \"Label2\", \nbgColor: bfGlobal.themeColors.btnBgPrimary.withOpacity(0.1), \ntextStyle: bfGlobal.themeColors.btnBgPrimary.f14W700,\n)",
            child: Container(
              margin: const EdgeInsets.only(top: 20, left: 20),
              child: CWCommonBadge(
                text: "Label2",
                bgColor: bfGlobal.themeColors.btnBgPrimary.withOpacity(0.1),
                textStyle: bfGlobal.themeColors.btnBgPrimary.f14W700,
              ),
            ),
          ),
        ],
      ),
    );
  }


}
