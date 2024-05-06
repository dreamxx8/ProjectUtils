import 'package:image_browser/constant/color_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_browser/page_custom_widget/widget/other/custom_tab_bar.dart';
import 'package:image_browser/page_custom_widget/widget/other/list_divider_widget.dart';
import 'package:image_browser/theme/color_ext.dart';
import 'package:image_browser/utils/lc_styles.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CWCommonTabs extends StatefulWidget {
  final List<String> titles;
  final List<String>? icons;
  final ValueChanged<int> callBack;

  const CWCommonTabs(
      {Key? key, required this.titles, this.icons, required this.callBack})
      : super(key: key);

  @override
  _CWCommonTabsState createState() => _CWCommonTabsState();
}

class _CWCommonTabsState extends State<CWCommonTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabTopController;

  @override
  void initState() {
    super.initState();
    var index = 0;
    _tabTopController = TabController(
        length: widget.titles.length, vsync: this, initialIndex: index);
    _tabTopController.addListener(() {
      if (_tabTopController.indexIsChanging) {
        widget.callBack(_tabTopController.index);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabTopController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8, bottom: 8),
      height: 46,
      child: Stack(children: [
        _tabbar(),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0.5,
          child: ListDividerWidget(),
        ),
      ]),
    );
  }

  CustomTabBar _tabbar() {
    return CustomTabBar(
      controller: _tabTopController,
      indicatorColor: bfGlobal.themeColors.textPrimary,
      tabs: _tabs(),
      isScrollable: true,
      textStyle: bfGlobal.themeColors.textPrimary.f16W700,
    );
  }

  List<Widget> _tabs() {
    List<Widget> list = [];
    for (var i = 0; i < widget.titles.length; i++) {
      String title = widget.titles[i];
      String? icon =
          (widget.icons != null && widget.icons?.length == widget.titles.length)
              ? widget.icons![i]
              : null;
      Widget item = Row(
        children: [
          icon != null
              ? SvgPicture.asset(
                  icon,
                  width: 20,
                  height: 20,
                )
              : Container(),
          icon != null ? SizedBox(width: 5) : Container(),
          Tab(
            text: title,
          ),
        ],
      );
      list.add(item);
    }
    return list;
  }
}
