
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_browser/constant/color_const.dart';
import 'package:image_browser/constant/gaps.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/utils/lc_styles.dart';

class CustomDirectionButtonUtils {
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

//配置项
class CWCommonDirectionBigBtnOption {
  final double marginL;
  double marginT;
  final double marginR;
  double marginB;
  final double radius;
  final Color bg;
  final Color textColor;
  final double width;
  final double height;
  final double padding;
  bool? isEnable;
  final TextStyle? textStyle;

  CWCommonDirectionBigBtnOption({
    this.bg = colorTheme,
    this.textColor = white,
    this.radius = 16,
    this.width = 20,
    this.height = 56,
    this.marginL = 0,
    this.marginT = 0,
    this.marginR = 0,
    this.marginB = 0,
    this.padding = 16,
    this.isEnable = true,
    this.textStyle,
  });
}

class CWCommonDirectionImageOption {
  final double width;
  final double height;

  CWCommonDirectionImageOption({
    this.width = 20,
    this.height = 20,
  });
}

class CWCommonDirectionButton extends StatefulWidget {
  final double marginT;
  final double marginB;
  final VoidCallback? onPressed;
  final String text;
  Color? bg;
  final CWCommonDirectionBigBtnOption? option;

  //图片
  final String? leftAssetUri;
  final String? rightAssetUri;
  final CWCommonDirectionImageOption? imageOption;
  final Decoration? decoration;
  CWCommonDirectionButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.marginT = -1,
    this.marginB = -1,
    this.option,
    this.leftAssetUri,
    this.rightAssetUri,
    this.imageOption,
    this.decoration,
  }) : super(key: key){
    bg = bfGlobal.themeColors.textBrand;
  }

  @override
  State<StatefulWidget> createState() {
    return CustomDirectionButtonState();
  }
}

class CustomDirectionButtonState extends State<CWCommonDirectionButton> {
  late CWCommonDirectionBigBtnOption option;
  late CWCommonDirectionImageOption imageOption;

  @override
  void initState() {
    option = widget.option ?? CWCommonDirectionBigBtnOption();
    imageOption = widget.imageOption ?? CWCommonDirectionImageOption();
    option.marginT = widget.marginT != -1 ? widget.marginT : option.marginT;
    option.marginB = widget.marginB != -1 ? widget.marginB : option.marginB;
    super.initState();
  }

  @override
  void didUpdateWidget(CWCommonDirectionButton oldWidget) {
    option = widget.option ?? CWCommonDirectionBigBtnOption();
    imageOption = widget.imageOption ?? CWCommonDirectionImageOption();
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
      //height : 50,
      margin: EdgeInsets.fromLTRB(
          option.marginL, option.marginT, option.marginR, option.marginB),
      decoration: widget.decoration,
      child: Row(
        mainAxisSize:MainAxisSize.min,
        children: [
          CupertinoButton(
          padding: const EdgeInsets.all(0),
          minSize: option.height,
          color: option.bg,
          disabledColor: background_btn_disable,
          borderRadius: BorderRadius.circular(option.radius),
          onPressed: option.isEnable == true && widget.onPressed != null
              ? CustomDirectionButtonUtils.debounce(widget.onPressed)
              : null,
          child: Container(
            //width: option.width,
            height: option.height,
            padding: EdgeInsets.all(option.padding),
            alignment: Alignment.center,
            constraints: BoxConstraints(
              minHeight: option.height,
            ),
            child: Row(
              //mainAxisSize:MainAxisSize.min,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Gaps.wGap16,
                widget.leftAssetUri != null
                    ? Container(
                  width: imageOption.width,
                  height: imageOption.height,
                  child: Image.asset(widget.leftAssetUri!),
                )
                    : Container(),
                widget.leftAssetUri != null ? Gaps.wGap8 : Container(),
                widget.text.isNotEmpty?Text(
                  widget.text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: option.textStyle ?? StRegular(14, option.textColor),
                ):Container(),
                widget.rightAssetUri != null ? Gaps.wGap8 : Container(),
                widget.rightAssetUri != null
                    ? Container(
                  width: imageOption.width,
                  height: imageOption.height,
                  child: Image.asset(widget.rightAssetUri!),
                )
                    : Container(),
                //Gaps.wGap16,
              ],
            ),
          ),
        ),
  ],
      ),
    );
  }
}

// class WhiteBigBtnOption extends BigBtnOption {
//   WhiteBigBtnOption({
//     Color bg = white,
//     Color textColor = colorTheme,
//     double radius = 4,
//     double width = double.infinity,
//     double height = 38,
//     double marginL = 0,
//     double marginT = 0,
//     double marginR = 0,
//     double marginB = 0,
//     bool isEnable = true,
//     TextStyle? textStyle,
//   }) : super(
//           bg: bg,
//           textColor: textColor,
//           radius: radius,
//           width: width,
//           height: height,
//           marginL: marginL,
//           marginT: marginT,
//           marginR: marginR,
//           marginB: marginB,
//           isEnable: isEnable,
//           textStyle: textStyle,
//         );
// }

// class CustomDirectionBlueBigBtnOption extends CustomDirectionBigBtnOption {
//   CustomDirectionBlueBigBtnOption({
//     Color bg = background_btn,
//     Color textColor = white,
//     double radius = 4,
//     double width = double.infinity,
//     double height = 38,
//     double marginL = 0,
//     double marginT = 0,
//     double marginR = 0,
//     double marginB = 0,
//     bool isEnable = true,
//     TextStyle? textStyle,
//   }) : super(
//     bg: bg,
//     textColor: textColor,
//     radius: radius,
//     width: width,
//     height: height,
//     marginL: marginL,
//     marginT: marginT,
//     marginR: marginR,
//     marginB: marginB,
//     isEnable: isEnable,
//     textStyle: textStyle,
//   );
// }
