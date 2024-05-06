import 'package:flutter/material.dart';
import 'package:image_browser/constant/color_const.dart';
import 'package:image_browser/constant/gaps.dart';
import 'package:image_browser/constant/value_const.dart';
import 'package:image_browser/page_custom_widget/widget/custom_gesture_widget.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_badge.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_checkbox.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_divider.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_expansiontile.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_fab.dart';
import 'package:image_browser/page_custom_widget/widget/other/custom_input_field_widget.dart';
import 'package:image_browser/page_custom_widget/widget/other/custom_text_field.dart';
import 'package:image_browser/page_custom_widget/widget/other/custom_toast.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/theme/color_ext.dart';
import 'package:image_browser/utils/lc_styles.dart';

class TestInput {
  bool _isInitialized = false;
  bool _isOpen = false;

  String _currency = '';

  List<FocusNode> _focusN = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode()
  ];
  List<TextEditingController> _controller = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  /// 失去焦点
  _clearFocus() {
    _focusN.forEach((FocusNode node) {
      node.unfocus();
    });
  }

  Widget getInput() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20),
      width: 300,
      child: Column(
        children: [
          CustomGestrureWidget(
            content: "CustomInputFieldWidget(_controller[0], \"地址1\", \"请填写地址1\",\n" +
                "                  focusNode: _focusN[0])",
              child: CustomInputFieldWidget(_controller[0], "地址1", "请填写地址1",
                  focusNode: _focusN[0])
          ),
          CustomGestrureWidget(
            content: "CustomInputFieldWidget(_controller[1], \"不可编辑框\", \"不可编辑框\",\n" +
                "                canEdit: false)",
            child: CustomInputFieldWidget(_controller[1], "不可编辑框", "不可编辑框",
                canEdit: false),
          ),
          CustomGestrureWidget(
            content:  "CustomInputFieldWidget(_controller[2], \"地址3\", \"请填写地址3\",\n" +
                "                focusNode: _focusN[2])",
            child: CustomInputFieldWidget(_controller[2], "地址3", "请填写地址3",
                focusNode: _focusN[2]),
          ),
          CustomGestrureWidget(
            content: "CustomInputFieldWidget(\n" +
                "              _controller[3],\n" +
                "              \"金额1\",\n" +
                "              \"请输入购买金额\",\n" +
                "              focusNode: _focusN[3],\n" +
                "              suffix: _suffixCurrency(),\n" +
                "              iconType: IconType.other,\n" +
                "              maxLength: 20,\n" +
                "              textInputType: TextInputType.numberWithOptions(decimal: true),\n" +
                "            )",
            child: CustomInputFieldWidget(
              _controller[3],
              "金额1",
              "请输入购买金额",
              focusNode: _focusN[3],
              suffix: _suffixCurrency(),
              iconType: IconType.other,
              maxLength: 20,
              textInputType: TextInputType.numberWithOptions(decimal: true),
            ),
          )
        ],
      ),
    );
  }

  /// 法币输入框后缀
  _suffixCurrency() {
    var suffixText = _currency;
    return InkWell(
      onTap: () async {
        _clearFocus();
      },
      child: _suffix(suffixText),
    );
  }

  Widget _suffix(String suffixText) {
    return Row(
      children: [
        Text(suffixText, style: StMediumDin(14, text_main)),
        SizedBox(width: 8),
        Image.asset(ImageSourceConst.ICON_FULL_ARROW_DOWN,
            width: 16, height: 16, color: text_main2),
        SizedBox(width: 10),
      ],
    );
  }
}
