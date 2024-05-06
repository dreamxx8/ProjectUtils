import 'package:flutter/material.dart';
import 'package:image_browser/constant/color_const.dart';
import 'package:image_browser/constant/gaps.dart';
import 'package:image_browser/constant/value_const.dart';
import 'package:image_browser/page_custom_widget/widget/custom_gesture_widget.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_badge.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_checkbox.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_divider.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_expansiontile.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_fab.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_slider.dart';
import 'package:image_browser/page_custom_widget/widget/other/custom_toast.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/theme/color_ext.dart';


class TestSlider{

  Widget getSlider(){
    return Container(
      margin: const EdgeInsets.only(top: 20,left: 20),
      width: 300,
      child: Column(
        children: [
          SizedBox(height: 50),
          Text("展示Tooltip"),
          CustomGestrureWidget(
            content: "CWCustomSlider(\n" +
                "                min: 0,\n" +
                "                max: 100,\n" +
                "                sliderValue: 60,\n" +
                "                showCircle: true,\n" +
                "                callBack: (dynamic value) {\n" +
                "                },\n" +
                "              )",
            child: Container(
              height: 100,
              color: background_mantle,
              child: CWCustomSlider(
                min: 0,
                max: 100,
                sliderValue: 60,
                showCircle: true,
                callBack: (dynamic value) {
                  print("滑动到 $value");
                },
              ),
            ),
          ),
          Text("不展示Tooltip"),
          CustomGestrureWidget(
            content: "CWCustomSlider(\n" +
                "                min: 0,\n" +
                "                max: 100,\n" +
                "                sliderValue: 60,\n" +
                "                showCircle: true,\n" +
                "                enableTooltip: false,\n" +
                "                callBack: (dynamic value) {\n" +
                "                },\n" +
                "              )",
            child: Container(
              height: 100,
              color: background_mantle,
              child: CWCustomSlider(
                min: 0,
                max: 100,
                sliderValue: 60,
                showCircle: true,
                enableTooltip: false,
                callBack: (dynamic value) {
                  print("滑动到 $value");
                },
              ),
            ),
          ),
          Text("展示分割节点"),
          CustomGestrureWidget(
            content: "CWCustomSlider(\n" +
                "                min: 0,\n" +
                "                max: 100,\n" +
                "                sliderValue: 60,\n" +
                "                callBack: (dynamic value) {\n" +
                "                },\n" +
                "              )",
            child: Container(
              height: 100,
              color: background_mantle,
              child: CWCustomSlider(
                min: 0,
                max: 100,
                sliderValue: 60,
                callBack: (dynamic value) {
                  print("滑动到 $value");
                },
              ),
            ),
          )
        ],
      ),
    );
  }


}
