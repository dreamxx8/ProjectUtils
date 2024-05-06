import 'package:flutter/material.dart';
import 'package:image_browser/constant/gaps.dart';
import 'package:image_browser/constant/value_const.dart';
import 'package:image_browser/page_custom_widget/widget/custom_gesture_widget.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_badge.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_checkbox.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_divider.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_expansiontile.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_fab.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_switchbar.dart';
import 'package:image_browser/page_custom_widget/widget/other/custom_switch_widget.dart';
import 'package:image_browser/page_custom_widget/widget/other/custom_toast.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/theme/color_ext.dart';


class TestSwitch{

  Widget getSwitch(){
    return Container(
      margin: const EdgeInsets.only(top: 20,left: 20),
      width: 250,
      child: Column(
        children: [
          SizedBox(height: 50),
          /// switch
          CustomGestrureWidget(
            content:  " CustomSwitchWidget(\n" +
                "                  isOpen: false,\n" +
                "                  callBack: (value) {\n" +
                "\n" +
                "                  })",
            child: Container(
              height: 50,
              color: Colors.white,
              child: CustomSwitchWidget(
                  isOpen: false,
                  callBack: (value) {

                  }),
            ),
          ),
          SizedBox(height: 50),
          /// switch
          CustomGestrureWidget(
            content: "CustomSwitchWidget(\n" +
                "                  isOpen: true,\n" +
                "                  callBack: (value) {\n" +
                "\n" +
                "                  })",
            child: Container(
              height: 50,
              color: Colors.white,
              child: CustomSwitchWidget(
                  isOpen: true,
                  callBack: (value) {

                  }),
            ),
          ),
          SizedBox(height: 50),
          CustomGestrureWidget(
            content: "CWCommonSwitchBar(\n" +
                "              titles: [\"Lite\",  \"Pro\"],\n" +
                "              callBack: (int index) {\n" +
                "              },)",
            child: CWCommonSwitchBar(
              titles: ["Lite",  "Pro"],
              callBack: (int index) {
                CustomToast.show("切换到第${index+1}个");
              },),
          ),
          SizedBox(height: 50),
          CustomGestrureWidget(
            content: "CWCommonSwitchBar(\n" +
                "              titles: [\"Lite\", \"Standard\", \"Pro\",  \"Premium\"],\n" +
                "              callBack: (int index) {\n" +
                "              },)",
            child: CWCommonSwitchBar(
              titles: ["Lite", "Standard", "Pro",  "Premium"],
              callBack: (int index) {
                CustomToast.show("切换到第${index+1}个");
              },),
          ),
        ],
      ),
    );
  }


}
