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

class UtilClass extends StatefulWidget {
  const UtilClass({Key? key}) : super(key: key);

  @override
  State<UtilClass> createState() => _UtilClassState();
}

class _UtilClassState extends State<UtilClass> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      width: 400,
      color: Colors.pink.withOpacity(0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomGestrureWidget(
            content: "ClipboardUtil",
              child: item("剪切板工具类setData(String data)...",
                  "ClipboardUtil.setData(String data) setDataToast(String data)...")),
          Gaps.hGap24,
          CustomGestrureWidget(
            content: "CollectionUtils",
              child: item("Map或者List判断空（包含length=0 或者null）", "bool CollectionUtils.isNotBlank(var value)...")),
          Gaps.hGap24,
          CustomGestrureWidget(
            content: "CommonShareNewWidget",
            child: item("分享组件 CommonShareNewWidget",
                "CommonShareNewWidget.showCommonShareList(...)"),
          ),
          Gaps.hGap24,
          CustomGestrureWidget(
            content: "StringUtils",
            child: item("字符串StringUtils 判断是否为空，相等，数组转字符串，数字转带单位",
                "StringUtils.isNotBlank()\nStringUtils.equaIgnoreCase(String? value1, String? value2)\nStringUtils.doubleParse(String? value)\nnStringUtils.nFormatter(String num, [int digits = 1])"),
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
