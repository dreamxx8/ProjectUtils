import 'package:image_browser/constant/color_const.dart';
import 'package:image_browser/page_custom_widget/widget/other/custom_rect_tab_full_indicator.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/utils/lc_styles.dart';
import 'package:image_browser/constant/color_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CWCommonSwitchBar extends StatefulWidget {
  final List<String> titles;
  final ValueChanged<int> callBack;

  const CWCommonSwitchBar({Key? key, required this.titles , required this.callBack}) : super(key: key);

  @override
  _CWCommonSwitchBarState createState() => _CWCommonSwitchBarState();
}

class _CWCommonSwitchBarState extends State<CWCommonSwitchBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabTopController;
  @override
  void initState() {
    super.initState();
    var index = 0;
    _tabTopController =
        TabController(length: widget.titles.length, vsync: this, initialIndex: index);
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
    return Container(child: _topTabBar());
  }

  Widget _topTabBar() {
    return Container(
      height: 36,
      decoration: BoxDecoration(
        border: Border.all(width: 1.5, color: bfGlobal.themeColors.strokeSecondary,),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Material(
        color:  bfGlobal.themeColors.btnBgWhite,
        borderRadius: BorderRadius.circular(18),
        child: TabBar(
          controller: _tabTopController,
          tabs: widget.titles.map((e) => Tab(text: e, height: 36)).toList(),
          labelStyle: StMedium(14, text_main),
          labelColor: white,
          unselectedLabelStyle: StMedium(14, text_main),
          unselectedLabelColor:  bfGlobal.themeColors.iconPrimary,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 0,
          indicator: CustomRRecTabFulIndicator(
            radius: 18,
            color: bfGlobal.themeColors.iconPrimary,
            margin: 2,
          ),
        ),
      ),
    );
  }
}
