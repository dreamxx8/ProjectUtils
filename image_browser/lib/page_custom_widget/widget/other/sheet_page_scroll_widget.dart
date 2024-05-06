import 'package:image_browser/constant/color_const.dart';
import 'package:image_browser/constant/gaps.dart';
import 'package:image_browser/page_custom_widget/widget/other/bottom_cancel_button.dart';
import 'package:image_browser/page_custom_widget/widget/other/list_divider_widget.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/utils/lc_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


typedef SheetSelectScrollIndexBlock = Function(int);

class SheetPageScrollWidget extends StatefulWidget {
  SheetPageScrollWidget({Key? key, this.values, this.title = "", this.selectIndex})
      : super(key: key);

  //选择后回调
  SheetSelectScrollIndexBlock? selectIndex;
  String? currency;
  String title;
  List<String>? values;

  @override
  State<SheetPageScrollWidget> createState() => _SheetPageScrollWidgetState();
}

///添加支付方式选择弹窗
class _SheetPageScrollWidgetState extends State<SheetPageScrollWidget> {
  double rowHeight = 43.0;
  double maxHeight = 600;
  double realHeight = 200;
  @override
  void initState() {
    super.initState();
    if(widget.values == null){
      widget.values = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    maxHeight = 700 - 100;
    realHeight = 150 + widget.values!.length * rowHeight;
    return Container(
      height: maxHeight > realHeight ? realHeight : maxHeight,
      padding: const EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        color: bfGlobal.themeColors.backgroundPrimary,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _headerView(),
          Gaps.hGap15,
          Expanded(child: ListView(
            physics: maxHeight > realHeight?const NeverScrollableScrollPhysics():null,
            children: widgets,
          )),
          _lineView(),
        _cancelButton()
        ],
      ),
    );
  }

  _paymentItem(int index, String value) {

    return InkWell(
      onTap: () {
        if (widget.selectIndex != null) {
          Navigator.pop(context);
          widget.selectIndex!(index);
        }
      },
      child: Container(
        height: rowHeight,
        padding: const EdgeInsets.only(top: 13, bottom: 13),
        child: Center(
          child: Text(
            value,
            style: StBold(14, text_main),
          ),
        )
      ),
    );
  }

  _lineView() {
    return Container(
      height: 7,
      color: bfGlobal.themeColors.backgroundSecondary,
    );
  }

  _headerView() {
    return Center(
      child: Text(
        widget.title,
        style: StBold(16, text_main),
      ),
    );
  }

  _cancelButton() {
    return BottomCancelButton(
      callback: (){
        Navigator.pop(context);
      },
    );
  }

  get widgets {
    List<Widget> views = [];
    if(widget.values != null){
      for(int i = 0;i<widget.values!.length;i++){
        String value = widget.values![i];
        views.add(ListDividerWidget());
        views.add(_paymentItem(i, value));
      }

    }
    return views;
  }
}

