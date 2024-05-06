
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_browser/constant/value_const.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/utils/lc_styles.dart';


typedef BackClick = void Function();

/// 顶部appbar
class CWCommonNavigationBar extends AppBar {
  Color backgroundColor;

  CWCommonNavigationBar(BuildContext context, {
    super.key,
    String title = "",
    Widget? titleWidget,
    final Color titleColor = Colors.black,
    final Color? backgroundColor,
    final Widget? backIcon,
    final Widget? rightWidget,
    final Widget? leftWidget,
    final Function? backAction,
    final Brightness brightness = Brightness.light,
    final PreferredSizeWidget? bottom,
    final double? toolbarHeight = 44,
    BackClick? callback,
    double elevation = 0.0,
  }) :  backgroundColor = bfGlobal.themeColors.backgroundPrimary,super(
    title: titleWidget ?? Text(
      title,
      style: StMedium(17, titleColor),
    ),
    backgroundColor: backgroundColor,
    centerTitle: true,
    elevation: elevation,
    toolbarHeight: toolbarHeight,
    // brightness: brightness,
    leading: Row(
      children: [
        leftWidget != null ? Container(
          margin: EdgeInsets.only(left: 16),
            child: leftWidget) : IconButton(
          icon: backIcon ?? Image.asset(ImageSourceConst.ICON_APPBAR_BACK,
            width: 24, height: 24,),
          onPressed: () {
            if (callback != null) {
              callback();
            }
            if (backAction == null) {
              // Navigator.pop(context);
              if (EasyLoading.isShow) {
                EasyLoading.dismiss();
              } else {
                Navigator.pop(context);
                // BoostNavigator.instance.pop();
              }
            } else {
              backAction();
            }
          },
        ),
      ],
    ),
    actions: <Widget>[ Container(
      margin: EdgeInsets.only(right: 16),
        child: rightWidget ?? Container())],
    bottom: bottom,
  );

}
