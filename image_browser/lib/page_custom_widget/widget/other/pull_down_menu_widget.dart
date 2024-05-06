import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/constant/color_const.dart';
import 'package:image_browser/constant/gaps.dart';
import 'package:image_browser/constant/value_const.dart';
import 'package:image_browser/utils/lc_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter_svg/flutter_svg.dart';

class ItemModel {
  String? title;
  String? image;
  bool isLine;

  /// 点击回调
  VoidCallback? callback;

  ItemModel({
    this.title,
    this.image,
    this.isLine = false,
    this.callback,
  });
}

class PullDownMenuWidget {
  PullDownMenuWidget(this.context, this.menuItems);

  final BuildContext context;

  final List<ItemModel> menuItems;

  final CustomPopupMenuController _popupController = CustomPopupMenuController();

  menuShow() {
    showGeneralDialog(
      transitionBuilder: _buildMaterialDialogTransitions,
      context: context,
      barrierDismissible: true,
      barrierLabel: "",
      pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
        return Builder(
          builder: (BuildContext context) {
            return _buildDialog(context);
          },
        );
      },
    );
  }

  Widget _buildMaterialDialogTransitions(
      BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    Animation<Offset> custom;
    custom = Tween<Offset>(
      begin: Offset(0.0, -1.0),
      end: Offset(0.0, 0.0),
    ).animate(animation);

    return SlideTransition(
      position: custom,
      child: child,
    );
  }

  Widget _buildDialog(BuildContext context) {
    return Dialog(
      alignment: Alignment.topCenter,
      insetPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: bfGlobal.themeColors.backgroundPrimary,
          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
        ),
        padding: EdgeInsets.only(left: 16, right: 16, top: 9 + MediaQueryData.fromWindow(window).padding.top),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text("更多", style: StBold(18, text_main)),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    child: Image.asset(ImageSourceConst.IC_ASSETS_CLOSE, width: 20, height: 20, ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Wrap(
                alignment: WrapAlignment.start,
                runSpacing: 16,
                children: List.generate(this.menuItems.length, (index) => _buildGridItem(index)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(int index) {
    var width = (MediaQuery.of(context).size.width - 32) / 4;
    var item = this.menuItems[index];
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        _popupController.hideMenu();
        if (item.callback != null) {
          item.callback!();
        }
      },
      child: Container(
        width: width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: bfGlobal.themeColors.textTertiary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(child: SvgPicture.asset(item.image ?? "", width: 20, height: 20)),
            ),
            Gaps.hGap6,
            Text(item.title ?? "", style: StRegular(10, text_main2)),
          ],
        ),
      ),
    );
  }
}
