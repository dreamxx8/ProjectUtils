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

class UtilString extends StatefulWidget {
  const UtilString({Key? key}) : super(key: key);

  @override
  State<UtilString> createState() => _UtilStringState();
}

class _UtilStringState extends State<UtilString> {
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
              child: UtilsItem("保留两位小数，无小数则不添加小数",
                  "value.keepTwoDecimal")),
          Gaps.hGap24,
          CustomGestrureWidget(
              content: "import 'package:module_core/core/extension/string_extension.dart';",
              child: UtilsItem("保留position小数，无小数则不添加小数,不四舍五入", "value.keepDecimal(int position)")),
          Gaps.hGap24,
          CustomGestrureWidget(
              content: "import 'package:module_core/core/extension/string_extension.dart';",
              child: UtilsItem("获取文字尺寸", "Size boundingTextSize(TextStyle style,  {int maxLines = 2^31, double maxWidth = double.infinity})")),
          Gaps.hGap24,
          CustomGestrureWidget(
              content: "import 'package:module_core/core/extension/string_extension.dart';",
              child: UtilsItem("防止文字自动换行", "fixAutoLines()")),
          Gaps.hGap24,
          CustomGestrureWidget(
              content: "import 'package:module_core/core/extension/string_extension.dart';",
              child: UtilsItem("百分之 工具 *100 保留两位小数", "value.percent")),
          Gaps.hGap24,
          CustomGestrureWidget(
              content: "import 'package:module_core/core/extension/string_extension.dart';",
              child: UtilsItem("数字很大后加单位", "value.fixNumberTwoDecimal")),
          Gaps.hGap24,
        ],
      ),
    );
  }

}
