import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_browser/constant/color_const.dart';
import 'package:image_browser/constant/gaps.dart';
import 'package:image_browser/theme/color_ext.dart';

import 'package:image_browser/utils/lc_styles.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/page_custom_widget/widget/other/custom_text_field.dart';
import 'package:image_browser/page_custom_widget/widget/other/custom_text_field_out_line.dart';

class CWCommonTextfieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final bool canEdit;
  final IconType iconType;
  final Widget? prefix;
  final Widget? suffix;
  final GestureTapCallback? callback;
  final Color? borderColor;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final Color? bgColor;
  final int? maxLength;
  final TextStyle? textStyle;
  final double? height;
  final Color? focusedBorder;

  const CWCommonTextfieldWidget(this.controller,this.placeholder,
      {Key? key,
        this.canEdit = true,
        this.iconType = IconType.none,
        this.prefix,
        this.suffix,
        this.borderColor,
        this.inputFormatters,
        this.callback,
        this.focusNode,
        this.textInputType,
        this.maxLength,
        this.bgColor,
        this.height,
        this.textStyle,
        this.focusedBorder
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () {
          if (callback != null && canEdit == false) {
            callback!();
          }
        },
        child: CustomTextFieldOutLine(
          focusedBorder: focusedBorder ?? bfGlobal.themeColors.textPrimary,
          height: height,
          controller: controller,
          borderColor: canEdit == true ?  bfGlobal.themeColors.textPrimary : Colors.transparent,
          textStyle: bfGlobal.themeColors.textPrimary.f14W700,
          hint: placeholder,
          isEditable: canEdit,
          iconType: iconType,
          isObscure: iconType == IconType.eye,
          prefix: prefix,
          suffix: suffix,
          diableBgColor: canEdit == true ? bfGlobal.themeColors.textTertiary : (bgColor ?? bfGlobal.themeColors.backgroundPrimary),
          inputFormatters: inputFormatters,
          focusNode: focusNode,
          textInputType: textInputType,
          maxLength: maxLength,
          bgColor: bgColor ?? bfGlobal.themeColors.backgroundPrimary,
          hintStyle: canEdit
              ? bfGlobal.themeColors.textQuarterary.f14W700
              : bfGlobal.themeColors.textQuarterary.f14W700,
        ),
      ),
    );
  }
}
