import 'package:flutter/material.dart';
import 'package:image_browser/constant/gaps.dart';
import 'package:image_browser/constant/value_const.dart';
import 'package:image_browser/page_custom_widget/widget/custom_gesture_widget.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_badge.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_direction_button.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/theme/color_ext.dart';


class TestButton {

  Widget getButton() {
    return Container(
      width: 200,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomGestrureWidget(
            content: "CWCommonDirectionButton(\n" +
                "                option: CWCommonDirectionBigBtnOption(\n" +
                "                  bg:  bfGlobal.themeColors.backgroundMask,\n" +
                "                ),\n" +
                "                text: \"Get Started\",\n" +
                "                leftAssetUri:ImageSourceConst.IC_BASE_BUTTON_ARROW_LEFT,\n" +
                "                rightAssetUri:ImageSourceConst.IC_BASE_BUTTON_ARROW_RIGHT,\n" +
                "                onPressed: () {\n" +
                "                  ///点击事件\n" +
                "                },\n" +
                "              )",
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              child: CWCommonDirectionButton(
                option: CWCommonDirectionBigBtnOption(
                  bg:  bfGlobal.themeColors.backgroundMask,
                ),
                text: "Get Started",
                leftAssetUri:ImageSourceConst.IC_BASE_BUTTON_ARROW_LEFT,
                rightAssetUri:ImageSourceConst.IC_BASE_BUTTON_ARROW_RIGHT,
                onPressed: () {
                  ///点击事件
                },
              ),
            ),
          ),
          Gaps.hGap10,
          CustomGestrureWidget(
            content: "CWCommonDirectionButton(\n" +
                "                option: CWCommonDirectionBigBtnOption(\n" +
                "                  bg:  bfGlobal.themeColors.backgroundMask,\n" +
                "                ),\n" +
                "                text: \"Get Started\",\n" +
                "                leftAssetUri:ImageSourceConst.IC_BASE_BUTTON_ARROW_LEFT,\n" +
                "                onPressed: () {\n" +
                "                  ///点击事件\n" +
                "                },\n" +
                "              )",
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              child: CWCommonDirectionButton(
                option: CWCommonDirectionBigBtnOption(
                  bg:  bfGlobal.themeColors.backgroundMask,
                ),
                text: "Get Started",
                leftAssetUri:ImageSourceConst.IC_BASE_BUTTON_ARROW_LEFT,
                onPressed: () {
                  ///点击事件
                },
              ),
            ),
          ),
          Gaps.hGap10,
          CustomGestrureWidget(
            content: "CWCommonDirectionButton(\n" +
                "                option: CWCommonDirectionBigBtnOption(\n" +
                "                  bg:  bfGlobal.themeColors.backgroundMask,\n" +
                "                ),\n" +
                "                text: \"Get Started\",\n" +
                "                rightAssetUri:ImageSourceConst.IC_BASE_BUTTON_ARROW_RIGHT,\n" +
                "                onPressed: () {\n" +
                "                  ///点击事件\n" +
                "                },\n" +
                "              )",
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              child: CWCommonDirectionButton(
                option: CWCommonDirectionBigBtnOption(
                  bg:  bfGlobal.themeColors.backgroundMask,
                ),
                text: "Get Started",
                rightAssetUri:ImageSourceConst.IC_BASE_BUTTON_ARROW_RIGHT,
                onPressed: () {
                  ///点击事件
                },
              ),
            ),
          ),
          Gaps.hGap10,
          CustomGestrureWidget(
            content: "CWCommonDirectionButton(\n" +
                "                option: CWCommonDirectionBigBtnOption(\n" +
                "                  bg:  bfGlobal.themeColors.backgroundMask,\n" +
                "                ),\n" +
                "                text: \"Get Started\",\n" +
                "                onPressed: () {\n" +
                "                  ///点击事件\n" +
                "                },\n" +
                "              )",
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              child: CWCommonDirectionButton(
                option: CWCommonDirectionBigBtnOption(
                  bg:  bfGlobal.themeColors.backgroundMask,
                ),
                text: "Get Started",
                onPressed: () {
                  ///点击事件
                },
              ),
            ),
          ),
          Gaps.hGap10,
          CustomGestrureWidget(
            content: "CWCommonDirectionButton(\n" +
                "                option: CWCommonDirectionBigBtnOption(\n" +
                "                  bg:  bfGlobal.themeColors.backgroundMask,\n" +
                "                ),\n" +
                "                text: \"\",\n" +
                "                rightAssetUri:ImageSourceConst.IC_BASE_BUTTON_ARROW_RIGHT,\n" +
                "                onPressed: () {\n" +
                "                  ///点击事件\n" +
                "                },\n" +
                "              )",
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              child: CWCommonDirectionButton(
                option: CWCommonDirectionBigBtnOption(
                  bg:  bfGlobal.themeColors.backgroundMask,
                ),
                text: "",
                rightAssetUri:ImageSourceConst.IC_BASE_BUTTON_ARROW_RIGHT,
                onPressed: () {
                  ///点击事件
                },
              ),
            ),
          ),
        ],
      ),
    );
  }


}
