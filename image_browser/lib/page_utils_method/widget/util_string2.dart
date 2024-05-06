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
import 'package:image_browser/page_utils_method/widget/item/utils_item.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/theme/color_ext.dart';

class UtilString2 extends StatefulWidget {
  const UtilString2({Key? key}) : super(key: key);

  @override
  State<UtilString2> createState() => _UtilString2State();
}

class _UtilString2State extends State<UtilString2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      width: 400,
      color: Colors.yellow.withOpacity(0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomGestrureWidget(
              content: "import 'package:module_core/core/extension/string_extension.dart';",
              child: UtilsItem("判断是否是数字", "value.isNumeric")),
          Gaps.hGap24,
          CustomGestrureWidget(
              content: "import 'package:module_core/core/extension/string_extension.dart';",
              child: UtilsItem("是否超过文本范围 true 超过 false 未超过", "bool textExceedMaxLines(TextStyle textStyle, int maxLine, double maxWidth)")),
          Gaps.hGap24,
          CustomGestrureWidget(
              content: "import 'package:module_core/core/extension/string_extension.dart';",
              child: UtilsItem("宽度范围内 获取当前范围内最大字体fontsize", "double getAutoStyle(double maxFontSize, int maxLine, double maxWidth)")),
          Gaps.hGap24,
          CustomGestrureWidget(
              content: "import 'package:module_core/core/extension/string_extension.dart';",
              child: UtilsItem("判断是否是邮箱", "value.isEmail")),
          Gaps.hGap24,
          CustomGestrureWidget(
              content: "import 'package:module_core/core/extension/string_extension.dart';",
              child: UtilsItem("数字处理-小数截取千分分位等操作", " String getNumFormat(int scale, {bool withZero = false,RoundingMode roundingMode = RoundingMode.DOWN,bool withSymbol = false,bool withK_M = false,bool withThousands = false})")),
          Gaps.hGap24,
        ],
      ),
    );
  }

}
