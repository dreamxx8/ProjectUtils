import 'package:flutter/material.dart';
import 'package:image_browser/constant/color_const.dart';
import 'package:image_browser/page_custom_widget/widget/other/list_divider_widget.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/utils/lc_styles.dart';
import 'package:image_browser/utils/string_utils.dart';


class SheetCommonPageWidget extends StatefulWidget {
  SheetCommonPageWidget({Key? key, this.values, this.title = "", this.selectIndex, this.currency})
      : super(key: key);

  //选择后回调
  ValueChanged<int>? selectIndex;
  String? currency;
  String title;
  List<String>? values;

  @override
  State<SheetCommonPageWidget> createState() => _SheetCommonPageWidgetState();
}

///添加支付方式选择弹窗
class _SheetCommonPageWidgetState extends State<SheetCommonPageWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: bfGlobal.themeColors.backgroundPrimary,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: widgets,
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
          padding: const EdgeInsets.only(top: 13, bottom: 13),
          child: Center(
            child: Text(
              value,
              style: StBold(14, _itemTextColor(value)),
            ),
          )),
    );
  }

  Color _itemTextColor(String value){
    if(widget.currency != null && widget.currency == value){
      return colorTheme;
    }
    return text_main;
  }

  _lineView() {
    return Container(
      height: 7,
      color: bfGlobal.themeColors.textSecondary,
    );
  }

  _headerView() {
    return Center(
      child: Text(
        widget.title,
        style: StRegular(14, text_main2),
      ),
    );
  }

  _cancelButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text(
            "cancel",
            style: StRegular(14, text_main2),
          ),
        ),
      ),
    );
  }

  get widgets {
    List<Widget> views = [];
    if (StringUtils.isNotBlank(widget.title)) {
      views.add(_headerView());
      views.add( const SizedBox(
        height: 15,
      ));
    }
    if (widget.values != null) {
      for (int i = 0; i < widget.values!.length; i++) {
        String value = widget.values![i];
        if (!(StringUtils.isBlank(widget.title) && i == 0)) {
          views.add(ListDividerWidget());
        }
        views.add(_paymentItem(i, value));
      }
    }
    views.add(_lineView());
    views.add(_cancelButton());
    return views;
  }
}
