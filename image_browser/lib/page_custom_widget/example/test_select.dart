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
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_select.dart';
import 'package:image_browser/page_custom_widget/widget/other/bottom_pop_widget.dart';
import 'package:image_browser/page_custom_widget/widget/other/custom_toast.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/theme/color_ext.dart';


class TestSelect{
  String _currencyValue = "ETH";

  Widget getSelect(context){
    return Container(
      margin: const EdgeInsets.only(top: 20,left: 20),
      width: 300,
      child:  Column(
        children: [
          SizedBox(height: 50),
          CustomGestrureWidget(
            content: "CWCommonSelect(\n" +
                "                title: \"Field Name\",\n" +
                "                placeholder: \"please Select\",\n" +
                "                selectedTitle: \"选中的文案\",\n" +
                "                callback: () {},\n" +
                "              )",
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
          SizedBox(height: 50),
          CustomGestrureWidget(
            content: "CWCommonSelect(\n" +
                "                  placeholder: \"please Select\",\n" +
                "                  selectedTitle: \"选中的文案\",\n" +
                "                  callback: () {},\n" +
                "                )",
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
          SizedBox(height: 50),
          CustomGestrureWidget(
            content: "CWCommonSelect(\n" +
                "                title: \"Currency\",\n" +
                "                selectedTitle: _currencyValue,\n" +
                "                placeholder: \"please Select\",\n" +
                "                iconWidget: SvgPicture.asset(\n" +
                "                  ImageSourceConst.IC_BASE_NOTIFICATINS,\n" +
                "                  width: 24,\n" +
                "                  height: 24,\n" +
                "                ),\n" +
                "                callback: () {\n" +
                "                  bottomSelectPop(\n" +
                "                      context, [\"BTC\", \"ETH\", \"LTC\", \"ETC\"], _currencyValue,\n" +
                "                      itemDefaultColor: bfGlobal.themeColors.textSecondary,\n" +
                "                          (value, index) {\n" +
                "                        _currencyValue = value;\n" +
                "                      });\n" +
                "                },\n" +
                "              )",
            child: Container(
              color: Colors.white,
              child: CWCommonSelect(
                title: "Currency",
                selectedTitle: _currencyValue,
                placeholder: "please Select",
                iconWidget: SvgPicture.asset(
                  ImageSourceConst.IC_BASE_NOTIFICATINS,
                  width: 24,
                  height: 24,
                ),
                callback: () {
                  bottomSelectPop(
                      context, ["BTC", "ETH", "LTC", "ETC"], _currencyValue,
                      itemDefaultColor: bfGlobal.themeColors.textSecondary,
                          (value, index) {
                        _currencyValue = value;
                      });
                },
              ),
            ),
          ),
          SizedBox(height: 50),
          CustomGestrureWidget(
            content: "CWCommonSelect(\n" +
                "                title: \"Currency\",\n" +
                "                placeholder: \"please Select\",\n" +
                "                iconWidget: SvgPicture.asset(\n" +
                "                  ImageSourceConst.IC_BASE_NOTIFICATINS,\n" +
                "                  width: 24,\n" +
                "                  height: 24,\n" +
                "                ),\n" +
                "                callback: () {},\n" +
                "              )",
            child: Container(
              color: Colors.white,
              child: CWCommonSelect(
                title: "Currency",
                placeholder: "please Select",
                iconWidget: SvgPicture.asset(
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
