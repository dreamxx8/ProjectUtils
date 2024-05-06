import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_browser/constant/color_const.dart';
import 'package:image_browser/constant/gaps.dart';
import 'package:image_browser/constant/value_const.dart';
import 'package:image_browser/page_custom_widget/widget/other/big_button.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/theme/color_ext.dart';
import 'package:image_browser/utils/lc_styles.dart';


/// 通用dialog
class CWCommonCustomDialog extends StatefulWidget {
  final String? title;
  final String? subTitle;
  final String? msg;
  final Widget? content; // 自定义显示布局
  final Widget? topImage; // 自定义显示布局
  final String? confirmButtonMsg; // 取消按钮文案
  final String? cancelButtonMsg; // 确认按钮文案
  final VoidCallback? confirmCallback;
  final VoidCallback? cancelCallback;
  final bool showCancelButton; // 是否显示取消按钮
  final bool showConfirmButton; // 是否显示确定按钮
  final bool showCancelIcon;
  final bool buttonVertical;
  final TextAlign? textAlign;
  ValueSetter<bool>? resultCallback;

   CWCommonCustomDialog(
      {Key? key,
      this.title,
      this.subTitle,
      this.msg,
      this.confirmButtonMsg,
      this.cancelButtonMsg,
      this.content,
      this.topImage,
      this.showCancelButton = false,
      this.showConfirmButton = true,
      this.showCancelIcon = false,
      this.confirmCallback,
      this.cancelCallback,
      this.buttonVertical = false,
      this.textAlign,
      this.resultCallback})
      : super(key: key);

  @override
  _CustomDialogState createState() => _CustomDialogState();

  Future<bool> show(BuildContext context) {
    var completer = Completer<bool>();

    resultCallback = (isConfirm) {
      completer.complete(isConfirm);
    };

    showDialog(context: context, builder: (context) => this);
    return completer.future;
  }
}

class _CustomDialogState extends State<CWCommonCustomDialog> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x01000000),
      body: Theme(
        data: ThemeData(
          dialogBackgroundColor: bfGlobal.themeColors.backgroundPrimary, // 设置AlertDialog的背景颜色为蓝色
        ),
        child: AlertDialog(
            contentPadding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
            scrollable: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            content: Stack(
              children: [
                Container(
                  color: bfGlobal.themeColors.backgroundPrimary,
                  // padding: EdgeInsets.symmetric(horizontal: 0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      if (widget.title == null) Gaps.hGap10,
                      _topImage(),
                      if (widget.topImage != null) Gaps.hGap10,
                      if (widget.title != null)
                        Text(widget.title ?? '', style: StMedium(24, text_main), textAlign: TextAlign.center),
                      if (widget.title != null) Gaps.hGap8,
                      if (widget.subTitle != null)
                        Text(widget.subTitle ?? '', style: StMedium(22, text_main), textAlign: TextAlign.center),
                      if (widget.subTitle != null) Gaps.hGap10,
                      _content(),
                      Gaps.hGap20,
                      _bottomButtonWidget(context)
                    ],
                  ),
                ),
                widget.showCancelIcon ? Positioned(child: _iconClose(), right: 0) : Container()
              ],
            )),
      ),
    );
  }

  Widget _bottomButtonWidget(BuildContext context) {
    if (!widget.showConfirmButton) {
      return Container();
    }
    return widget.buttonVertical
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.showCancelButton ? _cancel() : Container(),
              widget.showCancelButton ? Gaps.wGap16 : Container(),
              _buildConfirmButton(context)
            ],
          )
        : Row(
            children: [
              widget.showCancelButton ? Expanded(child: _cancel()) : Container(),
              widget.showCancelButton ? Gaps.wGap16 : Container(),
              Expanded(child: _buildConfirmButton(context))
            ],
          );
  }

  Widget _buildConfirmButton(BuildContext context) {
    return BigButton(
      onPressed: () {
        widget.resultCallback?.call(true);
        if (widget.confirmCallback != null) {
          Navigator.pop(context);

          /// todo: 这样处理不太好, 需优化. 不加Future直接返回,
          /// 如果在confirmCallback里调用接口,
          /// api loading弹出失败.
          Future.delayed(Duration(milliseconds: 300), () {
            widget.confirmCallback!();
          });
        } else {
          Navigator.pop(context);
        }
      },
      text: widget.confirmButtonMsg != null ? widget.confirmButtonMsg ?? '' :"确认",
      option: BlueBigBtnOption(
        textStyle: bfGlobal.themeColors.textWhite.f14W700,
        radius: 12,
        height: 44,
        bg: bfGlobal.themeColors.textPrimary,
        textColor: bfGlobal.themeColors.textWhite,
      ),
    );
  }

  Widget _iconClose() {
    return InkWell(
      child: Image.asset(
        ImageSourceConst.ICON_CLOSE,
        width: 16,
        height: 16,
      ),
      onTap: () {
        widget.resultCallback?.call(true);
        Navigator.pop(context);
      },
    );
  }

  Widget _cancel() {
    return BigButton(
      onPressed: () {
        if (widget.cancelCallback != null) {
          widget.cancelCallback!();
        }
        widget.resultCallback?.call(false);
        Navigator.pop(context);
      },
      option: BlueBigBtnOption(
        textStyle: bfGlobal.themeColors.textPrimary.f14W700,
        height: 44,
        radius:12,
        bg: bfGlobal.themeColors.backgroundSecondary,
        textColor: bfGlobal.themeColors.textPrimary,
      ),
      text: widget.cancelButtonMsg != null ? widget.cancelButtonMsg ?? '' : "取消",
    );
  }

  Widget _content() {
    if (widget.content != null) {
      return widget.content!;
    } else {
      if (widget.title != null) {
        return Text(widget.msg ?? '',
            //style: StRegular(24, text_main2, height: 1.5), textAlign: widget.textAlign ?? TextAlign.center);
            style: bfGlobal.themeColors.textSecondary.f14W400);
        //   Center(
        //   child:
        // );
      }
      return Center(
        child: Text(widget.msg ?? '',
            style: StRegular(16, text_main, height: 1.5), textAlign: widget.textAlign ?? TextAlign.center),
      );
    }
  }

  Widget _topImage() {
    if (widget.topImage != null) {
      return Center(
        child: widget.topImage!,
      );
    } else {
      return Container();
    }
  }
}
