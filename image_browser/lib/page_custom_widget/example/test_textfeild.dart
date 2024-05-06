import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_browser/constant/color_const.dart';
import 'package:image_browser/constant/gaps.dart';
import 'package:image_browser/constant/value_const.dart';
import 'package:image_browser/page_custom_widget/widget/custom_gesture_widget.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_badge.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_checkbox.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_divider.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_expansiontile.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_fab.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_textfield.dart';
import 'package:image_browser/page_custom_widget/widget/other/custom_text_field.dart';
import 'package:image_browser/page_custom_widget/widget/other/custom_toast.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/theme/color_ext.dart';
import 'package:image_browser/utils/lc_styles.dart';


class TestTextField{
  String _currency = '';

  List<FocusNode> _focusN = [FocusNode(), FocusNode(), FocusNode(), FocusNode(), FocusNode(), FocusNode()];
  List<TextEditingController> _controller = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  Widget getTextField(){
    return Container(
      margin: const EdgeInsets.only(top: 20,left: 20),
      width: 300,
      child:  Column(
        children: [
          SizedBox(height: 20),
          CWCommonTextfieldWidget(height: 40,_controller[0],  "请填写地址1", focusNode: _focusN[0]),
          SizedBox(height: 30),
          CWCommonTextfieldWidget(height: 40,_controller[1],  "不可编辑框", canEdit: false),
          SizedBox(height: 30),
          CWCommonTextfieldWidget(height: 40,_controller[2], "请填写地址3", focusNode: _focusN[2]),
          SizedBox(height: 30),
          CWCommonTextfieldWidget(
            height: 48,
            _controller[3],
            "请输入购买金额",
            focusNode: _focusN[3],
            prefix: SvgPicture.asset(
              ImageSourceConst.IC_BASE_ETH_EXAMPLE,
              width: 20,
              height: 20,
            ),
            suffix: _suffixCurrency(),
            iconType: IconType.other,
            maxLength: 20,
            //inputFormatters: [PrecisionLimitFormatter(4), CommaTextInputFormatter()], // 输入框限制
            textInputType: TextInputType.numberWithOptions(decimal: true),
          )
        ],
      ),
    );
  }

  /// 法币输入框后缀
  _suffixCurrency() {
    var suffixText = _currency;
    return _suffix(suffixText);
  }
  Widget _suffix(String suffixText) {
    return Row(
      children: [
        Text(suffixText, style: StMediumDin(14, text_main)),
        SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            CustomToast.show("提示");
          },
          child: SvgPicture.asset(
            ImageSourceConst.IC_BASE_EXCLAMATION,
            width: 16,
            height: 16,
          ),
        ),
        SizedBox(width: 8),
        GestureDetector(
          onTap: () async {
            _clearFocus();
            // otcBottomPpo.showScreenListPop(
            //   context,
            //   callback: (select, index) {
            //     _currency = select;
            //     setState(() {});
            //   },
            //   select: _currency,
            //   itemList: ["CNY", "USD", "ABC"],
            //   //全部法币
            //   title: "全部法币",
            // );
          },
          child : SvgPicture.asset(
            ImageSourceConst.IC_BASE_DOWN_ARROW,
            width: 16,
            height: 16,
          ),
        ),
        SizedBox(width: 10),
      ],
    );
  }
  /// 失去焦点
  _clearFocus() {
    _focusN.forEach((FocusNode node) {
      node.unfocus();
    });
  }
}
