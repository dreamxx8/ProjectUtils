import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_browser/constant/color_const.dart';
import 'package:image_browser/constant/gaps.dart';
import 'package:image_browser/page_custom_widget/widget/other/custom_text_field.dart';
import 'package:image_browser/page_custom_widget/widget/other/custom_text_field_out_line.dart';
import 'package:image_browser/theme/bf_global.dart';

import 'package:image_browser/utils/lc_styles.dart';

/// 通用输入框
/// 2023.9.19 设计新出的通用设计框
/// https://www.figma.com/file/8qjSdjCOXnAUrqwgxvC7Dp/%E2%91%A2-App-Components?type=design&node-id=14-2&mode=design&t=KMMYEurAGgeeuhhM-0
class CustomInputFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final Color? disableBgColor;
  final String title;
  final String placeholder;
  final bool canEdit;
  final IconType iconType;
  final String subTitle;
  final Widget? prefix;
  final Widget? suffix;
  final Color? titleTextColor;
  final GestureTapCallback? callback;
  final Color? borderColor;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final TextStyle? titleStyle;
  final Color? bgColor;
  final int? maxLength;
  final TextStyle? textStyle;

  const CustomInputFieldWidget(this.controller, this.title, this.placeholder,
      {Key? key,
      this.canEdit = true,
      this.disableBgColor,
      this.iconType = IconType.none,
      this.prefix,
      this.suffix,
      this.subTitle = "",
      this.borderColor,
      this.titleTextColor,
      this.inputFormatters,
      this.callback,
      this.focusNode,
      this.textInputType,
      this.titleStyle,
      this.maxLength,
      this.bgColor,
      this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title.isNotEmpty || subTitle.isNotEmpty)
            ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (title.isNotEmpty)
                    Text(
                      title,
                      style: titleStyle ?? StRegular(14, titleTextColor ?? text_main2),
                    ),
                  Gaps.wGap8,
                  Expanded(
                    child: Text(
                      subTitle,
                      style: StRegular(12, text_main2),
                      textAlign: TextAlign.end,
                    ),
                  )
                ],
              ),
              Gaps.hGap10,
            ],
          InkWell(
            onTap: () {
              if (callback != null && canEdit == false) {
                callback!();
              }
            },
            child: CustomTextFieldOutLine(
              controller: controller,
              borderColor: borderColor ?? Colors.transparent,
              textStyle: textStyle,
              hint: placeholder,
              isEditable: canEdit,
              iconType: iconType,
              isObscure: iconType == IconType.eye,
              prefix: prefix,
              suffix: suffix,
              diableBgColor: disableBgColor ?? bfGlobal.themeColors.btnBgQuarterary,
              inputFormatters: inputFormatters,
              focusNode: focusNode,
              textInputType: textInputType,
              maxLength: maxLength,
              bgColor: bgColor ?? bfGlobal.themeColors.backgroundPrimary,
              hintStyle: canEdit
                  ? StRegular(14, bfGlobal.themeColors.textPrimary)
                  : StRegular(14, bfGlobal.themeColors.textSecondary),
            ),
          )
        ],
      ),
    );
  }
}
