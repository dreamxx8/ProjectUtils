
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_browser/constant/color_const.dart';
import 'package:image_browser/constant/gaps.dart';
import 'package:image_browser/constant/value_const.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/utils/lc_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ToastType {
  success,
  failure,
  warning,
}

extension ToastTypeExtension on ToastType {
  String get iconName {
    switch (this) {
      case ToastType.success:
        return ImageSourceConst.BASE_TOAST_ICON_SUCCESS;
      case ToastType.failure:
        return ImageSourceConst.BASE_TOAST_ICON_FAILURE;
      case ToastType.warning:
        return ImageSourceConst.BASE_TOAST_ICON_WARNING;
    }
  }
}

/// toast 不要直接使用 EasyLoading
class CustomToast {

  static void showError(String? message){
    CustomToast.show(message, toastType: ToastType.failure);
  }

  static void show(String? message, {ToastType toastType = ToastType.success}) {
    if (message == null) {
      return;
    }
    if (message.isEmpty) {
      return;
    }
    EasyLoading.instance
      ..backgroundColor = bfGlobal.themeColors.backgroundSecondary
      ..radius = 8.0
      ..displayDuration = const Duration(milliseconds: 3000)
      ..contentPadding = const EdgeInsets.symmetric(vertical: 8, horizontal: 12);
    // EasyLoading.showToast(
    //   toastPosition: EasyLoadingToastPosition.center,
    //   toastWidget: ConstrainedBox(
    //     constraints: const BoxConstraints(
    //       maxWidth: 300,
    //     ),
    //     child: Row(
    //       mainAxisSize: MainAxisSize.min,
    //       children: [
    //         SvgPicture.asset(
    //           toastType.iconName,
    //           width: 20,
    //           height: 20,
    //         ),
    //         Gaps.wGap10,
    //         Flexible(
    //           child: Text(
    //             message,
    //             style: StRegular(14, text_main),
    //             maxLines: 4,
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
