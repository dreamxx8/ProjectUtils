import 'package:flutter/material.dart';
import 'package:image_browser/constant/gaps.dart';
import 'package:image_browser/constant/value_const.dart';
import 'package:image_browser/page_custom_widget/widget/custom_gesture_widget.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_badge.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_checkbox.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_custom_dialog.dart';
import 'package:image_browser/page_custom_widget/widget/other/big_button.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/theme/color_ext.dart';


class TestDialog{

  Widget getDialog(context){
    return Container(
      margin: const EdgeInsets.only(top: 20,left: 30),
      width: 200,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomGestrureWidget(
            content: "CWCommonCustomDialog(\n" +
                "      title: \"Title\",\n" +
                "      subTitle:\"Subtitle\",\n" +
                "      msg: \"Text goes here, Text goes here, Text goes hereText goes here, Text goes here, \"\n" +
                "          \"Text goes hereText goes here, Text goes here, Text goes here\",\n" +
                "      confirmButtonMsg: \"Continue\",\n" +
                "      showCancelButton: true,\n" +
                "      cancelButtonMsg: \"Cancel\",\n" +
                "      confirmCallback: (){\n" +
                "      },\n" +
                "    ).show(context)",
            child: BigButton(
                text: 'dialog1',
                option: BigBtnOption(bg: Color(0xFF1A1A1A), height: 30, radius: 16),
                onPressed: () async {
                  _alertShow(context);
                }),
          ),
          Gaps.hGap20,
          CustomGestrureWidget(
            content: "CWCommonCustomDialog(\n" +
                "      title: \"Title\",\n" +
                "      msg: \"Text goes here, Text goes here, Text goes hereText goes here, Text goes here, \"\n" +
                "          \"Text goes hereText goes here, Text goes here, Text goes here\",\n" +
                "      confirmButtonMsg: \"Continue\",\n" +
                "      showCancelButton: true,\n" +
                "      cancelButtonMsg: \"Cancel\",\n" +
                "      confirmCallback: (){\n" +
                "      },\n" +
                "    ).show(context)",
            child: BigButton(
                text: 'dialog2',
                option: BigBtnOption(bg: Color(0xFF1A1A1A), height: 30, radius: 16),
                onPressed: () async {
                  _alertShow2(context);
                }),
          ),
        ],
      ),
    );
  }

  _alertShow(context){
    CWCommonCustomDialog(
      title: "Title",
      subTitle:"Subtitle",
      msg: "Text goes here, Text goes here, Text goes hereText goes here, Text goes here, "
          "Text goes hereText goes here, Text goes here, Text goes here",
      confirmButtonMsg: "Continue",
      showCancelButton: true,
      cancelButtonMsg: "Cancel",
      confirmCallback: (){
      },
    ).show(context);
  }
  _alertShow2(context){
    CWCommonCustomDialog(
      title: "Title",
      msg: "Text goes here, Text goes here, Text goes hereText goes here, Text goes here, "
          "Text goes hereText goes here, Text goes here, Text goes here",
      confirmButtonMsg: "Continue",
      showCancelButton: true,
      cancelButtonMsg: "Cancel",
      confirmCallback: (){
      },
    ).show(context);
  }
}
