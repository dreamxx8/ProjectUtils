import 'package:flutter/material.dart';
import 'package:image_browser/constant/gaps.dart';
import 'package:image_browser/constant/value_const.dart';
import 'package:image_browser/page_custom_widget/widget/custom_gesture_widget.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_badge.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_checkbox.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_divider.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_expansiontile.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_fab.dart';
import 'package:image_browser/page_custom_widget/widget/other/custom_toast.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/theme/color_ext.dart';

import '../widget/cw/cw_common_tabs.dart';


class TestTab{

  Widget getTab(){
    return Container(
      margin: const EdgeInsets.only(top: 20,left: 20),
      width: 300,
      child: Column(
        children: [
          SizedBox(height: 50),
          CustomGestrureWidget(
            content:  "CWCommonTabs(\n" +
                "              titles: [\"纵览ff\", \"Spot\", \"Hot\", \"Futures\", \"ETF\"],\n" +
                "              callBack: (int index) {\n" +
                "              },\n" +
                "            )",
            child: CWCommonTabs(
              titles: ["纵览ff", "Spot", "Hot", "Futures", "ETF"],
              callBack: (int index) {
                // CustomToast.show("切换到第${index + 1}个");
              },
            ),
          ),
          SizedBox(height: 50),
          CustomGestrureWidget(
            content: "CWCommonTabs(\n" +
                "              titles: [\"Overview\", \"Funding\", \"P2P\", \"Spot\"],\n" +
                "              callBack: (int index) {\n" +
                "              },\n" +
                "            )",
            child: CWCommonTabs(
              titles: ["Overview", "Funding", "P2P", "Spot"],
              callBack: (int index) {
                // CustomToast.show("切换到第${index + 1}个");
              },
            ),
          ),
          SizedBox(height: 50),
          CustomGestrureWidget(
            content: "CWCommonTabs(\n" +
                "              titles: [\"Spot\", \"ETF\", \"Buy crypto\"],\n" +
                "              callBack: (int index) {\n" +
                "              },\n" +
                "            )",
            child: CWCommonTabs(
              titles: ["Spot", "ETF", "Buy crypto"],
              callBack: (int index) {
                // CustomToast.show("切换到第${index + 1}个");
              },
            ),
          ),
          SizedBox(height: 50),
          CustomGestrureWidget(
            content: "CWCommonTabs(\n" +
                "              titles: [\"Buy\", \"Sell\"],\n" +
                "              callBack: (int index) {\n" +
                "              },\n" +
                "            )",
            child: CWCommonTabs(
              titles: ["Buy", "Sell"],
              callBack: (int index) {
                // CustomToast.show("切换到第${index + 1}个");
              },
            ),
          ),
          SizedBox(height: 50),
          CustomGestrureWidget(
            content: "CWCommonTabs(\n" +
                "              titles: [\"Lite\", \"Standard\", \"Pro\", \"Premium\"],\n" +
                "              callBack: (int index) {\n" +
                "              },\n" +
                "            )",
            child: CWCommonTabs(
              titles: ["Lite", "Standard", "Pro", "Premium"],
              callBack: (int index) {
                // CustomToast.show("切换到第${index + 1}个");
              },
            ),
          ),
          SizedBox(height: 50),
          CustomGestrureWidget(
            content:  "CWCommonTabs(\n" +
                "                titles: [\"Favorites\", \"Favorites\"],\n" +
                "                icons: [ImageSourceConst.USER_KYC_SUCCESS,ImageSourceConst.USER_INVENT_MONEY,],\n" +
                "                callBack: (int index) {\n" +
                "\n" +
                "                }\n" +
                "            )",
            child: CWCommonTabs(
                titles: ["Favorites", "Favorites"],
                icons: [ImageSourceConst.USER_KYC_SUCCESS,ImageSourceConst.USER_INVENT_MONEY,],
                callBack: (int index) {

                }
            ),
          ),
        ],
      ),
    );
  }




}
