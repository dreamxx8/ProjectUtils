import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_browser/constant/gaps.dart';
import 'package:image_browser/constant/value_const.dart';
import 'package:image_browser/page_custom_widget/widget/custom_gesture_widget.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_badge.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_checkbox.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_divider.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_expansiontile.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_fab.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_navigation_bar.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_select.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_switchbar.dart';
import 'package:image_browser/page_custom_widget/widget/other/custom_toast.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/theme/color_ext.dart';


class TestNavigation{

  Widget getNavigation(context){
    return Container(
      margin: const EdgeInsets.only(top: 20,left: 20),
      width: 300,
      child: Column(
        children: [
          SizedBox(height: 20),
          CustomGestrureWidget(
            content: "CWCommonNavigationBar(\n" +
                "              context,\n" +
                "              title: \"Switch\",\n" +
                "            )",
            child: CWCommonNavigationBar(
              context,
              title: "Switch",
            ),
          ),
          SizedBox(height: 20),
          CustomGestrureWidget(
            content: "CWCommonNavigationBar(\n" +
                "              context,\n" +
                "              leftWidget: GestureDetector(\n" +
                "                child: SvgPicture.asset(\n" +
                "                  ImageSourceConst.IC_BASE_MORE,\n" +
                "                  width: 24,\n" +
                "                  height: 24,\n" +
                "                ),\n" +
                "                onTap: () {},\n" +
                "              ),\n" +
                "              rightWidget: GestureDetector(\n" +
                "                child: SvgPicture.asset(\n" +
                "                  ImageSourceConst.IC_BASE_NOTIFICATINS,\n" +
                "                  width: 24,\n" +
                "                  height: 24,\n" +
                "                ),\n" +
                "                onTap: () {},\n" +
                "              ),\n" +
                "              titleWidget: Container(\n" +
                "                width: 120,\n" +
                "                height: 36,\n" +
                "                child: CWCommonSwitchBar(\n" +
                "                  titles: [\n" +
                "                    \"Lite\",\n" +
                "                    \"Pro\",\n" +
                "                  ],\n" +
                "                  callBack: (int index) {},\n" +
                "                ),\n" +
                "              ),\n" +
                "            )",
            child: CWCommonNavigationBar(
              context,
              leftWidget: GestureDetector(
                child: SvgPicture.asset(
                  ImageSourceConst.IC_BASE_MORE,
                  width: 24,
                  height: 24,
                ),
                onTap: () {},
              ),
              rightWidget: GestureDetector(
                child: SvgPicture.asset(
                  ImageSourceConst.IC_BASE_NOTIFICATINS,
                  width: 24,
                  height: 24,
                ),
                onTap: () {},
              ),
              titleWidget: Container(
                width: 120,
                height: 36,
                child: CWCommonSwitchBar(
                  titles: [
                    "Lite",
                    "Pro",
                  ],
                  callBack: (int index) {},
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          CustomGestrureWidget(
            content: "CWCommonSelect(\n" +
                "                title: \"Field Name\",\n" +
                "                placeholder: \"please Select\",\n" +
                "                selectedTitle: \"选中的文案\",\n" +
                "                callback: () {},\n" +
                "              ),",
            child: Container(
              color: Colors.white,
              child: CWCommonSelect(
                title: "Field Name",
                placeholder: "please Select",
                selectedTitle: "选中的文案",
                callback: () {},
              ),
            ),
          ),
          SizedBox(height: 20),
          CustomGestrureWidget(
            content: "CWCommonSelect(\n" +
                "                  placeholder: \"please Select\",\n" +
                "                  selectedTitle: \"选中的文案\",\n" +
                "                  callback: () {},\n" +
                "                ),",
            child: Container(
              color: Colors.white,
              child: Center(
                child: CWCommonSelect(
                  placeholder: "please Select",
                  selectedTitle: "选中的文案",
                  callback: () {},
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          CustomGestrureWidget(
            content: "CWCommonSelect(\n" +
                "                title: \"Currency\",\n" +
                "                placeholder: \"please Select\",\n" +
                "                iconWidget:  SvgPicture.asset(\n" +
                "                  ImageSourceConst.IC_BASE_NOTIFICATINS,\n" +
                "                  width: 24,\n" +
                "                  height: 24,\n" +
                "                ),\n" +
                "                selectedTitle: \"ETH\",\n" +
                "                callback: () {},\n" +
                "              ),",
            child: Container(
              color: Colors.white,
              child: CWCommonSelect(
                title: "Currency",
                placeholder: "please Select",
                iconWidget:  SvgPicture.asset(
                  ImageSourceConst.IC_BASE_NOTIFICATINS,
                  width: 24,
                  height: 24,
                ),
                selectedTitle: "ETH",
                callback: () {},
              ),
            ),
          ),
          SizedBox(height: 20),
          CustomGestrureWidget(
            content: "CWCommonSelect(\n" +
                "                title: \"Currency\",\n" +
                "                placeholder: \"please Select\",\n" +
                "                iconWidget:  SvgPicture.asset(\n" +
                "                  ImageSourceConst.IC_BASE_NOTIFICATINS,\n" +
                "                  width: 24,\n" +
                "                  height: 24,\n" +
                "                ),\n" +
                "                callback: () {},\n" +
                "              ),",
            child: Container(
              color: Colors.white,
              child: CWCommonSelect(
                title: "Currency",
                placeholder: "please Select",
                iconWidget:  SvgPicture.asset(
                  ImageSourceConst.IC_BASE_NOTIFICATINS,
                  width: 24,
                  height: 24,
                ),
                callback: () {},
              ),
            ),
          )
        ],
      ),
    );
  }


}
