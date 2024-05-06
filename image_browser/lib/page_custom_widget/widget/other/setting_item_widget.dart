import 'package:image_browser/constant/color_const.dart';
import 'package:image_browser/constant/value_const.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/utils/lc_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_browser/constant/gaps.dart';

class AccountItem extends GestureDetector {
  AccountItem(
      {Key? key,
      String? name,
      String? state = "",
      String? icon,
      bool isFlag = false,
      bool isSHowMark = true,
      bool isShowPadding = true,
      GestureTapCallback? onPress})
      : super(
          key: key,
          onTap: onPress,
          child: Container(
            height: 56,
            decoration: BoxDecoration(
              color: bfGlobal.themeColors.backgroundPrimary,
              border: Border(
                bottom: BorderSide(color: line_main, width: 0.5),
              ),
            ),
            child: Row(
              children: <Widget>[
                if (isShowPadding) Gaps.wGap16,
                icon != null
                    ? Image.asset(
                      icon,
                      width: 24,
                      height: 24,
                    )
                    : Container(),
                Text(name ?? '', style: StMedium(16, text_main)),
                if (isFlag)
                  Container(
                    height: 5,
                    width: 5,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                        color: color_E65261,
                        borderRadius: BorderRadius.circular(2.5)),
                  ),
                Expanded(
                    child: Text(state ?? '', style: StRegular(13, text_main2),
                        textAlign: TextAlign.right,)),
                if (isSHowMark) Gaps.wGap8,
                if (isSHowMark)
                  Image.asset(ImageSourceConst.ICON_ARROW_GRAY_RIGHT,
                      height: 14, width: 14),
                if (isShowPadding) Gaps.wGap16,
              ],
            ),
          ),
        );
}
