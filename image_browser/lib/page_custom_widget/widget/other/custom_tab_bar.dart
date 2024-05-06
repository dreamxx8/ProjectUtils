import 'package:image_browser/constant/color_const.dart';
import 'package:image_browser/page_custom_widget/widget/other/custom_rect_tab_indicator.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/utils/lc_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// tabBar
class CustomTabBar extends TabBar {
    Color labelColor;
  CustomTabBar(
      {Key? key,
      required List<Widget> tabs,
      final TabController? controller,
      final bool isScrollable = false,
      final Color labelColor = text_main,
      final Color unselectedLabelColor = text_main2,
      final EdgeInsetsGeometry? labelPadding,
      final double fontSize = 16,
      final double? unselectfontSize,
      final Color indicatorColor = colorTheme,
      final TextStyle? textStyle,
      final ValueChanged<int>? onTap})
      :labelColor = bfGlobal.themeColors.textPrimary, super(
          controller: controller,
          tabs: tabs,
          labelStyle: textStyle ?? StMedium(fontSize, text_main),
          unselectedLabelStyle: textStyle ?? StMedium(unselectfontSize ?? fontSize, text_main),
          labelPadding: labelPadding ?? const EdgeInsets.only(left: 10, right: 10),
          labelColor: labelColor,
          unselectedLabelColor: unselectedLabelColor,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 2,
          indicator: CustomRRecTabIndicator(
            radius: 2,
            width: 20,
            color: indicatorColor,
          ),
          isScrollable: isScrollable,
          onTap: onTap,
        );
}
