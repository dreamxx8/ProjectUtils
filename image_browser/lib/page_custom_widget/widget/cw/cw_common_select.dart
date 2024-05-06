import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_browser/constant/gaps.dart';
import 'package:image_browser/constant/value_const.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/theme/color_ext.dart';

class CWCommonSelect extends StatefulWidget {
  final String? title;
  final String? placeholder;
  final String? selectedTitle;
  final Widget? iconWidget;
  VoidCallback? callback;

  CWCommonSelect(
      {this.title,
      this.placeholder,
      this.selectedTitle,
      this.iconWidget,
      this.callback});

  @override
  _CWCommonSelectState createState() => _CWCommonSelectState();
}

class _CWCommonSelectState extends State<CWCommonSelect> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.title != null
                ? Text(widget.title!,
                    style: bfGlobal.themeColors.textSecondary.f14W400)
                : Container(),
            widget.title != null ? Gaps.hGap4 : Container(),
            GestureDetector(
              onTap: () {
                if (widget.callback!= null) {
                  widget.callback!();
                }
              },
              child: Container(
                height: 48,
                padding: EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: bfGlobal.themeColors.backgroundSecondary,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          (widget.iconWidget != null &&
                                  widget.selectedTitle != null)
                              ? Container(
                                  width: 20,
                                  height: 20,
                                  child: widget.iconWidget!)
                              : Container(),
                          Gaps.wGap8,
                          widget.selectedTitle != null
                              ? Text(widget.selectedTitle!,
                                  style:
                                      bfGlobal.themeColors.textPrimary.f16W500)
                              : (widget.placeholder != null
                                  ? Text(widget.placeholder!,
                                      style: bfGlobal
                                          .themeColors.textSecondary.f16W500)
                                  : Container())
                        ],
                      ),
                    ),
                    SvgPicture.asset(
                      ImageSourceConst.IC_BASE_DOWN_ARROW,
                      width: 16,
                      height: 16,
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
