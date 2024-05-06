import 'dart:async';
import 'dart:io';

import 'package:image_browser/constant/color_const.dart';
import 'package:image_browser/constant/gaps.dart';
import 'package:image_browser/constant/value_const.dart';
import 'package:image_browser/page_custom_widget/widget/other/custom_dialog.dart';
import 'package:image_browser/utils/lc_styles.dart';
import 'package:flutter/material.dart';

class CWCustomDialog extends StatefulWidget {

  final String? title;
  final String? msg;
  final Widget? content; // 自定义显示布局
  final Widget? topImage; // 自定义显示布局
  final String? confirmButtonMsg; // 取消按钮文案
  final String? cancelButtonMsg; // 确认按钮文案
  final VoidCallback? confirmCallback;
  final VoidCallback? cancelCallback;
  final bool showCancelButton; // 是否显示取消按钮
  final bool showCancelIcon;
  final bool buttonVertical;
  final TextAlign? textAlign;
  ValueSetter<bool>? resultCallback;

  CWCustomDialog(
      {Key? key,
        this.title,
        this.msg,
        this.confirmButtonMsg,
        this.cancelButtonMsg,
        this.content,
        this.topImage,
        this.showCancelButton = false,
        this.showCancelIcon = false,
        this.confirmCallback,
        this.cancelCallback,
        this.buttonVertical = false,
        this.textAlign,
        this.resultCallback})
      : super(key: key);

  @override
  State<CWCustomDialog> createState() {
    return _CWCustomDialogState();
  }

  bool noDialog = true;

  Future<bool> show(BuildContext context) {
    if (!noDialog) return Future(() => false);
    var completer = Completer<bool>();

    var arguments = {
      "title": title,
      "msg": msg,
      "flutter": true
    };

    resultCallback = (isConfirm) {
      /// 点击取消或确认重置弹窗状态
      completer.complete(isConfirm);
    };
    /// 去原生弹窗状态管理类CWGlobalAlertManager中更新弹窗状态并判断是否弹出.
    showDialog(context: context, builder: (context) => this);
    return completer.future;
  }
}

class _CWCustomDialogState extends State<CWCustomDialog> {
  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      key: widget.key,
      title: widget.title,
      msg: widget.msg,
      confirmButtonMsg: widget.confirmButtonMsg,
      cancelButtonMsg: widget.cancelButtonMsg,
      content: widget.content,
      topImage: widget.topImage,
      showCancelButton: widget.showCancelButton,
      showCancelIcon: widget.showCancelIcon,
      confirmCallback: widget.confirmCallback,
      cancelCallback: widget.cancelCallback,
      buttonVertical: widget.buttonVertical,
      textAlign: widget.textAlign,
      resultCallback: widget.resultCallback,
    );
  }
}


///带图片的弹框
showImageDialog(BuildContext context, String title, String image,
    {VoidCallback? confirmCallback, VoidCallback? cancelCallback, TextStyle? titleStyle, String? sureButtonTitle, double? imageSize}) {
  CWCustomDialog(
    msg: "登陆中",
    showCancelButton: true,
    showCancelIcon: false,
    confirmButtonMsg: sureButtonTitle ?? "确认",
    cancelCallback: cancelCallback,
    confirmCallback: confirmCallback,
    content: SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: imageSize ?? 32,
            height: imageSize ?? 32,
          ),
          Gaps.hGap16,
          Text(
            title,
            style: titleStyle ?? StRegular(12, text_main),
          )
        ],
      ),
    ),
  ).show(context);
}
