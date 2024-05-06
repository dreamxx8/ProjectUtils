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

class UtilCommon extends StatefulWidget {
  const UtilCommon({Key? key}) : super(key: key);

  @override
  State<UtilCommon> createState() => _UtilCommonState();
}

class _UtilCommonState extends State<UtilCommon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      width: 400,
      color: Colors.cyan.withOpacity(0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomGestrureWidget(
            content: "CommonUtils.downOrUpColor(String? value)",
              child: item("获取设备信息",
                  "CommonUtils.downOrUpColor(String? value)")),
          Gaps.hGap24,
          CustomGestrureWidget(
            content: "CommonUtils.downOrUpColorByBool(bool value)",
              child: item("根据bool获取涨跌色", "CommonUtils.downOrUpColorByBool(bool value)")),
          Gaps.hGap24,
          CustomGestrureWidget(
            content: "CommonUtils.downOrUpColorByDirection(String direction)",
            child: item("根据方向（long, short）值获取涨跌色",
                "CommonUtils.downOrUpColorByDirection(String direction)"),
          ),
          Gaps.hGap24,
          CustomGestrureWidget(
            content: "CommonUtils.secondToString(String? time)",
            child: item("秒转时间 例如 3600 转换后是 1:00:00",
                "CommonUtils.secondToString(String? time)"),
          ),
          Gaps.hGap24,
          CustomGestrureWidget(
            content: "CommonUtils.calculateTextHeight(String text, TextStyle style, double width, {int maxLine = 1,})",
            child: item("计算文本高度(必要参数 width style text)",
                "CommonUtils.calculateTextHeight(String text, TextStyle style, double width, {int maxLine = 1,})"),
          ),
        ],
      ),
    );
  }

  Widget item(title, method) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: bfGlobal.themeColors.textPrimary.f18W700,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          method,
          style: bfGlobal.themeColors.textSecondary.f16W400,
        ),
      ],
    );
  }
}
