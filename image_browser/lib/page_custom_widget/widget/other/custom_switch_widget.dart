import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_switch.dart';
import 'package:image_browser/theme/bf_global.dart';

class CustomSwitchWidget extends StatelessWidget {
  final bool isOpen;
  final ValueChanged callBack;
  final double? scale;

  const CustomSwitchWidget(
      {Key? key, required this.isOpen, required this.callBack, this.scale = 0.8})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: CWCommonSwitch(
        activeColor: bfGlobal.themeColors.iconBrand,
        thumbColor: bfGlobal.themeColors.btnBgWhite,
        trackColor: bfGlobal.themeColors.backgroundSecondary,
        value: isOpen,
        onChanged: (value) {
          callBack(value);
        },
      ),
    );
  }
}
