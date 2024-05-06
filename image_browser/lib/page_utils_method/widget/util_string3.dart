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

class UtilString3 extends StatefulWidget {
  const UtilString3({Key? key}) : super(key: key);

  @override
  State<UtilString3> createState() => _UtilString3State();
}

class _UtilString3State extends State<UtilString3> {
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
              child: UtilsItem("数字很大后加单位", "value.fixNumberTwoDecimal")),
          Gaps.hGap24,
          CustomGestrureWidget(
              content: "import 'package:module_core/core/extension/string_extension.dart';",
              child: UtilsItem("转换成 Double", "value.getDouble")),
          Gaps.hGap24,
          CustomGestrureWidget(
              content: "import 'package:module_core/core/extension/string_extension.dart';",
              child: UtilsItem("转换成 Double", "value.getDouble")),
          Gaps.hGap24,
          CustomGestrureWidget(
              content: "import 'package:module_core/core/extension/string_extension.dart';",
              child: UtilsItem("转换成 Int", "value.getInt")),
          Gaps.hGap24,
        ],
      ),
    );
  }

}
