
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_browser/constant/color_const.dart';
import 'package:image_browser/constant/gaps.dart';
import 'package:image_browser/utils/lc_styles.dart';

class ButtonUtils {
  /*防止重复点击方法*/
  static VoidCallback debounce(VoidCallback? callback, {int t = 1000}) {
    int timeOld = 0;
    return () {
      int timeNew = DateTime.now().millisecondsSinceEpoch;
      if (timeNew - timeOld < t) {return;}
      callback?.call();
      timeOld = timeNew;
    };
  }
}

class BigButton extends StatefulWidget {
  final double marginT;
  final double marginB;
  final VoidCallback? onPressed;
  final String text;
  final BigBtnOption? option;

  //图片
  final String? assetUri;
  final ImageOption? imageOption;
  final Decoration? decoration;
  BigButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.marginT = -1,
    this.marginB = -1,
    this.option,
    this.assetUri,
    this.imageOption,
    this.decoration,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BigButtonState();
  }
}

class BigButtonState extends State<BigButton> {
  late BigBtnOption option;
  late ImageOption imageOption;

  @override
  void initState() {
    option = widget.option ?? BlueBigBtnOption();
    imageOption = widget.imageOption ?? ImageOption();
    option.marginT = widget.marginT != -1 ? widget.marginT : option.marginT;
    option.marginB = widget.marginB != -1 ? widget.marginB : option.marginB;
    super.initState();
  }

  @override
  void didUpdateWidget(BigButton oldWidget) {
    option = widget.option ?? BlueBigBtnOption();
    imageOption = widget.imageOption ?? ImageOption();
    option.marginT = widget.marginT != -1 ? widget.marginT : option.marginT;
    option.marginB = widget.marginB != -1 ? widget.marginB : option.marginB;
    super.didUpdateWidget(oldWidget);
  }

  void updateIsEnable(bool isEnable) {
    widget.option?.isEnable = isEnable;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          option.marginL, option.marginT, option.marginR, option.marginB),
      decoration: widget.decoration,
      child: CupertinoButton(
        padding: const EdgeInsets.all(0),
        minSize: option.height,
        color: option.bg,
        disabledColor: option.disabledColor,
        borderRadius: BorderRadius.circular(option.radius),
        onPressed: option.isEnable == true && widget.onPressed != null
            ? ButtonUtils.debounce(widget.onPressed)
            : null,
        child: Container(
          width: option.width,
          padding: EdgeInsets.all(option.padding),
          alignment: Alignment.center,
          constraints: BoxConstraints(
            minHeight: option.height,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.assetUri != null
                  ? Container(
                      width: imageOption.width,
                      height: imageOption.height,
                      child: Image.asset(widget.assetUri!),
                    )
                  : Container(),
              widget.assetUri != null ? Gaps.wGap3 : Container(),
              widget.assetUri != null ? Text(
                widget.text,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: option.textStyle ?? StRegular(14, option.textColor),
              ) : Expanded(
                child: Text(
                  widget.text,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: option.textStyle ?? StRegular(14, option.textColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageOption {
  final double width;
  final double height;

  ImageOption({
    this.width = 16,
    this.height = 16,
  });
}

//配置项
class BigBtnOption {
  final double marginL;
  double marginT;
  final double marginR;
  double marginB;
  final double radius;
  final Color bg;
  final Color disabledColor;
  final Color textColor;
  final double width;
  final double height;
  final double padding;
  bool? isEnable;
  final TextStyle? textStyle;

  BigBtnOption({
    this.bg = colorTheme,
    this.disabledColor = background_btn_disable,
    this.textColor = white,
    this.radius = 4,
    this.width = double.infinity,
    this.height = 38,
    this.marginL = 0,
    this.marginT = 0,
    this.marginR = 0,
    this.marginB = 0,
    this.padding = 10,
    this.isEnable = true,
    this.textStyle,
  });
}

class WhiteBigBtnOption extends BigBtnOption {
  WhiteBigBtnOption({
    Color bg = white,
    Color textColor = colorTheme,
    double radius = 4,
    double width = double.infinity,
    double height = 38,
    double marginL = 0,
    double marginT = 0,
    double marginR = 0,
    double marginB = 0,
    bool isEnable = true,
    TextStyle? textStyle,
  }) : super(
          bg: bg,
          textColor: textColor,
          radius: radius,
          width: width,
          height: height,
          marginL: marginL,
          marginT: marginT,
          marginR: marginR,
          marginB: marginB,
          isEnable: isEnable,
          textStyle: textStyle,
        );
}

class BlueBigBtnOption extends BigBtnOption {
  BlueBigBtnOption({
    Color bg = background_btn,
    Color textColor = white,
    double radius = 4,
    double width = double.infinity,
    double height = 38,
    double marginL = 0,
    double marginT = 0,
    double marginR = 0,
    double marginB = 0,
    double padding = 10,
    bool isEnable = true,
    TextStyle? textStyle,
  }) : super(
          bg: bg,
          textColor: textColor,
          radius: radius,
          width: width,
          height: height,
          marginL: marginL,
          marginT: marginT,
          marginR: marginR,
          marginB: marginB,
          padding: padding,
          isEnable: isEnable,
          textStyle: textStyle,
        );
}
