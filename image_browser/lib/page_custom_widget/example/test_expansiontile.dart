import 'package:flutter/material.dart';
import 'package:image_browser/constant/gaps.dart';
import 'package:image_browser/constant/value_const.dart';
import 'package:image_browser/page_custom_widget/widget/custom_gesture_widget.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_badge.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_checkbox.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_divider.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_expansiontile.dart';
import 'package:image_browser/page_custom_widget/widget/other/custom_toast.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/theme/color_ext.dart';


class TestExpansionTitle{

  Widget getExpansionTitle(){
    return Container(
      margin: const EdgeInsets.only(top: 20,left: 20),
      width: 250,
      height: 300,
      child: InkWell(
        onTap: () {
          CustomToast.show("Title-可折叠文字");
        },
        child: CustomGestrureWidget(
          content: "CWCommonExpansionTile(\n" +
              "                    title: \"Top products\",\n" +
              "                    subTitle:\n" +
              "                    \"Top products sub Title Top products sub Title Top products sub Title Top products sub Title Top products sub Title Top products sub Title Top products sub Title \",\n" +
              "                    initiallyExpanded:false\n" +
              "                )",
          child: Container(
            width: double.infinity,
            color: bfGlobal.themeColors.backgroundSecondary,
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                Text("Title-可折叠文字"),
                SizedBox(height: 20),
                CWCommonExpansionTile(
                    title: "Top products",
                    subTitle:
                    "Top products sub Title Top products sub Title Top products sub Title Top products sub Title Top products sub Title Top products sub Title Top products sub Title ",
                    initiallyExpanded:false
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
