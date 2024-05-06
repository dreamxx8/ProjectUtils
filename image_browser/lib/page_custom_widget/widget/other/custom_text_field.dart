import 'package:image_browser/constant/color_const.dart';
import 'package:image_browser/constant/gaps.dart';
import 'package:image_browser/constant/value_const.dart';
import 'package:image_browser/utils/lc_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum IconType { none, eye, clear, other }

/// 输入框
class CustomTextField extends StatefulWidget {
  final double marginL;
  final double marginT;
  final double marginR;
  final double marginB;
  final String? label;
  final TextStyle? labelStyle;
  final TextStyle? textStyle;
  final MainAxisAlignment? labelAlignment;
  final String hint;
  final String? error;
  final bool isObscure;
  final bool autoFocus;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final IconType iconType;
  final Widget? prefix; //前缀控件
  final Widget? suffix; //后缀控件
  final Widget? labelSuffix; //标题的后缀，大小控制在14(只有在展开的样式内生效)
  final TextInputType? textInputType;
  final isEditable; //是否支持编辑，设置为false变成不可编辑
  final GestureTapCallback? onEntireTap; //整个条目的点击事件，只有在不可编辑的状态下生效
  final GestureTapCallback? onLabelTap; //标题的后缀(只有在展开的样式内生效)
  final List<TextInputFormatter>? inputFormatters;
  final Color borderColor;
  final Color focusedBorder;
  final bool isExpansion; //编辑模式下，标题是否默认展开
  final int? maxLength;

  @override
  State<StatefulWidget> createState() {
    return _CustomTextFieldState();
  }

  CustomTextField({
    Key? key,
    this.label,
    this.labelStyle,
    this.textStyle,
    this.labelAlignment,
    this.hint = '',
    this.error,
    this.marginL = 0,
    this.marginT = 0,
    this.marginR = 0,
    this.marginB = 0,
    this.isObscure = false,
    this.autoFocus = false,
    required this.controller,
    this.validator,
    this.focusNode,
    this.iconType = IconType.none,
    this.prefix,
    this.suffix,
    this.labelSuffix,
    this.textInputType,
    this.isEditable = true,
    this.onEntireTap,
    this.onLabelTap,
    this.inputFormatters,
    this.borderColor = background_tab,
    this.focusedBorder = colorTheme,
    this.isExpansion = false,
    this.maxLength,
  })  : assert(maxLength == null || maxLength > 0),
        super(key: key);
}

class _CustomTextFieldState extends State<CustomTextField> {
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
    return widget.isEditable
        ? (widget.isExpansion ? _getExpansion() : _getField())
        : _getNoEditableField();
  }

  //不支持编辑的选择框
  Widget _getNoEditableField() {
    if (true) {
      return CustomNoEditField(
        margin: EdgeInsets.fromLTRB(
            widget.marginL, widget.marginT, widget.marginR, widget.marginB),
        label: widget.label,
        controller: widget.controller,
        borderColor: widget.borderColor,
        prefix: widget.prefix,
        suffix: widget.suffix,
        labelSuffix: widget.labelSuffix,
        onLabelTap: widget.onLabelTap,
        onEntireTap: widget.onEntireTap,
      );
    }
  }

  Widget _getExpansion() {
    return ExpansionTextField(
      controller: widget.controller,
      focusNode: widget.focusNode ?? FocusNode(),
      margin: EdgeInsets.fromLTRB(
          widget.marginL, widget.marginT, widget.marginR, widget.marginB),
      label: widget.label,
      labelStyle: widget.labelStyle,
      textStyle: widget.textStyle,
      labelAlignment: widget.labelAlignment,
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
      labelSuffix: widget.labelSuffix,
      textInputType: widget.textInputType,
      onLabelTap: widget.onLabelTap,
      maxLength: widget.maxLength,
      isVisibility: _isVisibility,
      inputFormatters: widget.inputFormatters,
    );
  }

  //支持编辑的选择框
  Widget _getField() {
    return Container(
      margin: EdgeInsets.fromLTRB(
          widget.marginL, widget.marginT, widget.marginR, widget.marginB),
      child: TextFormField(
        autofocus: widget.autoFocus,
        focusNode: widget.focusNode ?? FocusNode(),
        style: StRegular(14, text_main),
        obscureText: widget.isObscure ? !_isVisibility : widget.isObscure,
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
          prefix: widget.prefix,
          labelStyle: StMedium(13, text_main2),
          labelText: widget.label,
          hintStyle: StMedium(14, text_main.withOpacity(0.14)),
          hintText: widget.hint,
          errorStyle: StRegular(14, color_E65261),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: widget.borderColor, width: 1)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: widget.focusedBorder, width: 1)),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: line_main, width: 1)),
          errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: color_E65261, width: 1)),
          focusedErrorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: color_E65261, width: 1)),
          suffix: widget.iconType == IconType.other
              ? widget.suffix
              : _getSuffixButton(),
        ),
        controller: widget.controller,
        validator: widget.validator,
        inputFormatters: widget.inputFormatters,
      ),
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
                    _isVisibility ? ImageSourceConst.ICON_EYE_OPEN_GRAY : ImageSourceConst.ICON_EYE_CLOSE_GRAY,
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

//不支持编辑的Field
class CustomNoEditField extends GestureDetector {
  CustomNoEditField({
    Key? key,
    String? label,
    EdgeInsetsGeometry? margin,
    TextEditingController? controller,
    required Color borderColor,
    Widget? prefix,
    Widget? suffix,
    Widget? labelSuffix,
    GestureTapCallback? onEntireTap,
    GestureTapCallback? onLabelTap,
  }) : super(
            key: key,
            onTap: onEntireTap,
            child: Container(
              margin: margin,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: borderColor, width: 1))),
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.all(0),
                children: <Widget>[
                  Gaps.hGap8,
                  if (label != null || labelSuffix != null)
                    GestureDetector(
                      onTap: onLabelTap,
                      child: Row(
                        children: <Widget>[
                          if (label != null)
                            Text(label, style: StMedium(13, text_main2)),
                          if (labelSuffix != null) Gaps.wGap4,
                          if (labelSuffix != null)
                            SizedBox(
                              height: 14,
                              child: labelSuffix,
                            )
                        ],
                      ),
                    ),
                  Container(
                    padding: const EdgeInsets.only(top: 8, bottom: 15),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: <Widget>[
                        if (prefix != null) SizedBox(child: prefix),
                        if (prefix != null) Gaps.wGap12,
                        Text(controller?.text ?? "",
                            style: StMedium(16, text_main)),
                        if (suffix != null) const Spacer(),
                        if (suffix != null) suffix,
                      ],
                    ),
                  )
                ],
              ),
            ));
}

//展开的输入控件，标题一直在上方
class ExpansionTextField extends StatefulWidget {
  final double height;
  final EdgeInsetsGeometry margin;
  final String? label;
  final TextStyle? labelStyle;
  final TextStyle? textStyle;
  final MainAxisAlignment? labelAlignment;
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
  final Widget? labelSuffix; //label的后缀，size：14
  final TextInputType? textInputType;
  final GestureTapCallback? onLabelTap; //标题的后缀(只有在展开的样式内生效)
  final List<TextInputFormatter>? inputFormatters;

  ExpansionTextField({
    Key? key,
    required this.controller,
    required this.focusNode,
    this.height = 70,
    this.margin = const EdgeInsets.all(0),
    this.label,
    this.labelStyle,
    this.labelAlignment,
    this.textStyle,
    this.hint = '',
    this.error,
    this.borderColor = line_main,
    this.bg = Colors.transparent,
    this.isObscure = false,
    this.autoFocus = false,
    this.isVisibility = true,
    this.prefix,
    this.suffix,
    this.labelSuffix,
    this.textInputType,
    this.onLabelTap,
    this.maxLength,
    this.inputFormatters,
  })  : assert(maxLength == null || maxLength > 0),
        super(key: key);

  @override
  _ExpansionTextFieldState createState() => _ExpansionTextFieldState();
}

class _ExpansionTextFieldState extends State<ExpansionTextField> {
  VoidCallback? _focusListener;
  VoidCallback? _controllerListener;

  @override
  void initState() {
    _focusListener = () => setState(() {});
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
      //height: widget.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //Spacer(),
          if (widget.label != null || widget.labelSuffix != null)
            GestureDetector(
              onTap: widget.onLabelTap,
              child: Row(
                mainAxisAlignment: widget.labelAlignment ?? MainAxisAlignment.start,
                children: <Widget>[
                  if (widget.label != null)
                    Text(widget.label!, style: widget.labelStyle != null ? widget.labelStyle! : StMedium(13, text_main2)),
                  if (widget.labelSuffix != null) Gaps.wGap4,
                  if (widget.labelSuffix != null)
                    widget.labelSuffix!,
                ],
              ),
            ),
          Gaps.hGap2,
          SizedBox(
            height: 40,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (widget.prefix != null) widget.prefix!,
                if (widget.prefix != null) Gaps.wGap8,
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: TextField(
                      enableInteractiveSelection: false,
                      cursorColor: colorTheme,
                      focusNode: widget.focusNode,
                      controller: widget.controller,
                      autofocus: widget.autoFocus,
                      // obscureText: widget.isObscure,
                      obscureText: widget.isObscure
                          ? !widget.isVisibility
                          : widget.isObscure,
                      style: widget.textStyle != null ? widget.textStyle! : StMediumDin(16, text_main),
                      keyboardType: widget.textInputType,
                      decoration: InputDecoration(
                        hintText: widget.hint,
                        contentPadding: const EdgeInsets.symmetric(vertical: 0),
                        labelStyle: StMedium(13, text_main2),
                        alignLabelWithHint: false,
                        hintStyle: StMediumDin(16, text_main.withOpacity(0.14)),
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
                    ),
                  ),
                ),
                if (widget.suffix != null) Gaps.wGap8,
                if (widget.suffix != null)
                  Center(
                    child: SizedBox(/*height: 20,*/ child: widget.suffix),
                  ),
              ],
            ),
          ),
          //Spacer(),
          Container(
            color: widget.error != null
                ? color_E65261
                : (widget.focusNode.hasFocus ? colorTheme : widget
                .borderColor),
            height: 1,
          ),
          if (widget.error != null)
            Text(widget.error ?? '', style: StRegular(10, color_E65261)),
        ],
      ),
    );
  }
}

//默认的icon后缀
class CustomSvgSuffix extends Container {
  CustomSvgSuffix(String asset)
      : super(
            child: Image.asset(ImageSourceConst.ICON_ARROW_GRAY_RIGHT,
                height: 16, width: 16));
}

//默认的文字后缀
class CustomTextSuffix extends Container {
  CustomTextSuffix(String text,
      {VoidCallback? onPressed, Color color = colorTheme})
      : super(
          height: 20,
          child: InkWell(
            onTap: onPressed,
            child: Text(text, style: StRegular(13, color)),
          ),
        );
}

//默认的文字后缀 + 箭头
class CustomWidgetSuffix extends Container {
  CustomWidgetSuffix(String text,
      {VoidCallback? onPressed, Color color = colorTheme,
        bool showArrow = true})
      : super(
          height: 20,
          child: InkWell(
            onTap: showArrow ? onPressed : null,
            child: Row(
              children: [
                Text(text, style: StRegular(13, color)),
                Gaps.wGap8,
                showArrow ?
                Image.asset(ImageSourceConst.ICON_ARROW_GRAY_RIGHT, width: 16, height: 16) : Container(),
              ],
            ),
          ),
        );
}

//电话区号选择前缀
class PhoneCodePrefix extends Container {
  PhoneCodePrefix({
    String? code,
    required GestureTapCallback onTap,
    width = 58,
  }) : super(
    width: 58,
    padding: const EdgeInsets.only(right: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        GestureDetector(
          onTap: onTap,
          child: Container(
              padding: const EdgeInsets.only(top: 8),
              width: 40,
              child: Text(code ?? '',
                  textAlign: TextAlign.start,
                  style: StMedium(16, text_main))),
        ),
        Container(
            alignment: Alignment.bottomLeft,
            child: Image.asset(ImageSourceConst.ICON_ARROW_GRAY_RIGHT,
                width: 16, height: 16)),
      ],
    ),
  );
}