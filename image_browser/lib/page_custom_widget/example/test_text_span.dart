import 'package:flutter/material.dart';
import 'package:image_browser/constant/gaps.dart';
import 'package:image_browser/constant/value_const.dart';
import 'package:image_browser/page_custom_widget/widget/custom_gesture_widget.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_badge.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_checkbox.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_divider.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_expansiontile.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_fab.dart';
import 'package:image_browser/page_custom_widget/widget/other/custom_dynamic_text_span_widget.dart';
import 'package:image_browser/page_custom_widget/widget/other/custom_toast.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/theme/color_ext.dart';


class TestTextSpan{

  Widget getTextSpan(){
    return CustomGestrureWidget(
      content: "CustomDynamicTextSpanWidget(text: \"我已阅读并同意《1》用户协议《/1》\")",
      child: Container(
        margin: const EdgeInsets.only(top: 20,left: 20),
        width: 200,
        height: 100,
        child: Column(
          children: [
            Text("我已阅读并同意《1》用户协议《/1》 文案处理"),
            SizedBox(
              height: 40,
            ),
            CustomDynamicTextSpanWidget(text: "我已阅读并同意《1》用户协议《/1》")
          ],
        ),
      ),
    );
  }


}
