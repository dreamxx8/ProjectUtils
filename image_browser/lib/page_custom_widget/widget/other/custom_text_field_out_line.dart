import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_browser/constant/color_const.dart';
import 'package:image_browser/constant/value_const.dart';
import 'package:image_browser/page_custom_widget/widget/other/key_board_input_done.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/utils/lc_styles.dart';
import 'package:image_browser/page_custom_widget/widget/other/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_browser/constant/gaps.dart';
/// 输入框 周围有边框
class CustomTextFieldOutLine extends StatefulWidget {
  final double marginL;
  final double marginT;
  final double marginR;
  final double marginB;
  final String hint;
  final String? error;
  final bool isObscure;
  final bool autoFocus;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final IconType iconType;
  final Widget? prefix; //前缀控件
  final Widget? suffix; //后缀控件
  final TextInputType? textInputType;
  final isEditable; //是否支持编辑，设置为false变成不可编辑
  final Color borderColor;
  final List<TextInputFormatter>? inputFormatters;
  final Color diableBgColor; //不可编辑背景颜色
  final Color focusedBorder;
  final int? maxLength;
  final double textSize;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Color? bgColor;
  final TextInputAction? textInputAction;
  final VoidCallback? onAction;
  final bool showDoneOverlay;
  final double? height;

  @override
  State<StatefulWidget> createState() {
    return _CustomTextFieldOutLinedState();
  }

  CustomTextFieldOutLine({
    Key? key,
    this.hint = '',
    this.error,
    this.marginL = 0,
    this.marginT = 0,
    this.marginR = 0,
    this.marginB = 0,
    this.isObscure = false,
    this.autoFocus = false,
    required this.controller,
    this.focusNode,
    this.iconType = IconType.none,
    this.prefix,
    this.suffix,
    this.textInputType,
    this.isEditable = true,
    this.diableBgColor = background_gray,
    this.inputFormatters,
    this.borderColor = line_main,
    this.focusedBorder = colorTheme,
    this.maxLength,
    this.textSize = 14,
    this.textStyle,
    this.hintStyle,
    this.bgColor,
    this.textInputAction,
    this.onAction,
    this.height,
    this.showDoneOverlay = false,
  })  : assert(maxLength == null || maxLength > 0),
        super(key: key);
}

class _CustomTextFieldOutLinedState extends State<CustomTextFieldOutLine> {
  bool _isVisibility = false;
  VoidCallback? _controllerListener;

  @override
  void initState() {
    super.initState();
    _controllerListener ??= () {
      if (widget.maxLength != null &&
          widget.controller.text.length > widget.maxLength!) {
        widget.controller.text =
            widget.controller.text.substring(0, widget.maxLength);
        setState(() {
          widget.controller.selection =
              TextSelection.collapsed(offset: widget.controller.text.length);
        });
      } else if (widget.iconType == IconType.clear) {
        setState(() {});
      }
    };

    widget.controller.addListener(_controllerListener!);
  }

  @override
  void dispose() {
    if (_controllerListener != null) {
      widget.controller.removeListener(_controllerListener!);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _getExpansion();
  }

  Widget _getExpansion() {
    return ExpansionTextFieldOutLine(
      focusedBorder: widget.focusedBorder,
      controller: widget.controller,
      focusNode: widget.focusNode ?? FocusNode(),
      margin: EdgeInsets.fromLTRB(
          widget.marginL, widget.marginT, widget.marginR, widget.marginB),
      hint: widget.hint,
      error: widget.error,
      borderColor: widget.borderColor,
      bg: Colors.transparent,
      isObscure: widget.isObscure,
      autoFocus: widget.autoFocus,
      prefix: widget.prefix,
      suffix: widget.iconType == IconType.other
          ? widget.suffix
          : _getSuffixButton(),
      textInputType: widget.textInputType,
      maxLength: widget.maxLength,
      isVisibility: _isVisibility,
      inputFormatters: widget.inputFormatters,
      isEditable: widget.isEditable,
      disableBgColor: widget.diableBgColor,
      textSize: widget.textSize,
      textStyle: widget.textStyle,
      hintStyle: widget.hintStyle,
      bgColor: widget.bgColor,
      height: widget.height,
    );
  }

  Widget? _getSuffixButton() {
    switch (widget.iconType) {
      case IconType.eye:
        return SizedBox(
            height: 16,
            child: IconButton(
                padding: const EdgeInsets.all(0),
                icon: Image.asset(
                    _isVisibility
                        ? ImageSourceConst.ICON_EYE_OPEN_GRAY
                        : ImageSourceConst.ICON_EYE_CLOSE_GRAY,
                    height: 16,
                    width: 16),
                onPressed: () {
                  _isVisibility = !_isVisibility;
                  setState(() {});
                }));
      case IconType.clear:
        return widget.controller.text.isEmpty
            ? Text("", style: StMedium(16, Colors.transparent))
            : SizedBox(
                height: 16,
                child: IconButton(
                    padding: const EdgeInsets.all(0),
                    icon: const Icon(Icons.cancel, color: text_main3, size: 17.35),
                    onPressed: () {
                      widget.controller.text = "";
                      setState(() {});
                    }));
      default:
        return null;
    }
  }
}

//展开的输入控件，标题一直在上方
class ExpansionTextFieldOutLine extends StatefulWidget {
  final EdgeInsetsGeometry margin;
  final String hint;
  final String? error;
  final TextEditingController controller;
  final FocusNode focusNode;
  final Color borderColor;
  final Color bg;
  final bool isObscure;
  final bool isVisibility;
  final bool autoFocus;
  final int? maxLength;
  final Widget? prefix;
  final Widget? suffix;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final isEditable; //是否支持编辑，设置为false变成不可编辑
  final disableBgColor;
  final double textSize;
  final Color? bgColor;
  final TextInputAction? textInputAction;
  final VoidCallback? onAction;
  final bool showDoneOverlay;

  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final double? height;
  final Color? focusedBorder;

  ExpansionTextFieldOutLine({
    Key? key,
    required this.controller,
    required this.focusNode,
    this.margin = const EdgeInsets.all(0),
    this.hint = '',
    this.error,
    this.borderColor = line_main,
    this.bg = Colors.transparent,
    this.isObscure = false,
    this.autoFocus = false,
    this.isVisibility = true,
    this.prefix,
    this.suffix,
    this.textInputType,
    this.maxLength,
    this.inputFormatters,
    this.isEditable = true,
    this.disableBgColor = background_gray,
    this.textSize = 14,
    this.textStyle,
    this.hintStyle,
    this.bgColor,
    this.textInputAction,
    this.onAction,
    this.height,
    this.focusedBorder,
    this.showDoneOverlay = false,
  })  : assert(maxLength == null || maxLength > 0),
        super(key: key);

  @override
  _ExpansionTextFieldOutLineState createState() =>
      _ExpansionTextFieldOutLineState();
}

class _ExpansionTextFieldOutLineState extends State<ExpansionTextFieldOutLine> {
  VoidCallback? _focusListener;
  VoidCallback? _controllerListener;
  OverlayEntry? overlayEntry;
  @override
  void initState() {
    _focusListener = () {
      if (widget.focusNode.hasFocus) {
        showOverlay(context);
      } else {
        removeOverlay();
      }
      setState(() {});
    };
    if (_focusListener != null) {
      widget.focusNode.addListener(_focusListener!);
    }
    _controllerListener ??= () {
      if (widget.maxLength != null &&
          widget.controller.text.length > widget.maxLength!) {
        widget.controller.text =
            widget.controller.text.substring(0, widget.maxLength);
        setState(() {});
      }
    };
    if (_controllerListener != null) {
      widget.controller.addListener(_controllerListener!);
    }
    super.initState();
  }

  @override
  void dispose() {
    if (_focusListener != null) {
      widget.focusNode.removeListener(_focusListener!);
    }
    if (_controllerListener != null) {
      widget.controller.removeListener(_controllerListener!);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color:
                  widget.isEditable ? widget.bgColor ?? bfGlobal.themeColors.backgroundPrimary :bfGlobal.themeColors.backgroundSecondary,
              border: Border.all(
                  color: widget.error != null
                      ? color_E65261
                      : (widget.focusNode.hasFocus
                          ? (widget.focusedBorder ?? colorTheme)
                          : bfGlobal.themeColors.btnBgQuarterary),
                  width: 1),
            ),
            height: widget.height ?? 44,
            child: Container(
              padding: const EdgeInsets.only(top: 3),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  if (widget.prefix != null) Gaps.wGap10,
                  if (widget.prefix != null) widget.prefix!,
                  Gaps.wGap10,
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: TextField(
                        enableInteractiveSelection: true,
                        cursorColor: colorTheme,
                        focusNode: widget.focusNode,
                        controller: widget.controller,
                        autofocus: widget.autoFocus,
                        obscureText: widget.isObscure
                            ? !widget.isVisibility
                            : widget.isObscure,
                        style: widget.textStyle != null
                            ? widget.textStyle
                            : StMedium(widget.textSize, text_main),
                        keyboardType: widget.textInputType,
                        decoration: InputDecoration(
                          enabled: widget.isEditable,
                          hintText: widget.hint,
                          contentPadding: const EdgeInsets.symmetric(vertical: 0),
                          alignLabelWithHint: false,
                          hintStyle: widget.hintStyle != null
                              ? widget.hintStyle
                              : StRegular(widget.textSize, text_main3),
                          border: InputBorder.none,
                          focusedBorder: const OutlineInputBorder(
                              gapPadding: 0, borderSide: BorderSide.none),
                          enabledBorder: const OutlineInputBorder(
                              gapPadding: 0, borderSide: BorderSide.none),
                          disabledBorder: const OutlineInputBorder(
                              gapPadding: 0, borderSide: BorderSide.none),
                          errorBorder: const OutlineInputBorder(
                              gapPadding: 0, borderSide: BorderSide.none),
                          focusedErrorBorder: const OutlineInputBorder(
                              gapPadding: 0, borderSide: BorderSide.none),
                        ),
                        inputFormatters: widget.inputFormatters,
                        textInputAction: widget.textInputAction,
                        onEditingComplete: widget.onAction,
                      ),
                    ),
                  ),
                  if (widget.suffix != null) Gaps.wGap8,
                  if (widget.suffix != null)
                    Center(
                      child: SizedBox(child: widget.suffix),
                    ),
                  // if (widget.suffix != null) SizedBox(width: 10.w),
                ],
              ),
            ),
          ),
          if (widget.error != null)
            Text(widget.error ?? '', style: StRegular(10, color_E65261)),
        ],
      ),
    );
  }

  showOverlay(BuildContext context) {
    if (overlayEntry != null || widget.showDoneOverlay) return;
    overlayEntry = OverlayEntry(builder: (context) {
      return !Platform.isIOS ? Container() : Positioned(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          right: 0.0,
          left: 0.0,
          child: const KeyBoardInputDoneView());
    });

    Overlay.of(context).insert(overlayEntry!);
  }

  removeOverlay() {
    if (overlayEntry != null || widget.showDoneOverlay) {
      overlayEntry?.remove();
      overlayEntry = null;
    }
  }
}
