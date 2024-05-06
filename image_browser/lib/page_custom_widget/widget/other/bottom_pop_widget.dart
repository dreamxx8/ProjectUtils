import 'package:flutter/material.dart';
import 'package:image_browser/constant/color_const.dart';
import 'package:image_browser/constant/gaps.dart';
import 'package:image_browser/page_custom_widget/widget/other/bottom_cancel_button.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/utils/lc_styles.dart';




///  底部弹框
typedef PopDismissCallBack = void Function();
/// 底部弹窗选中回调
typedef IndexCallback = void Function(String item, int index);
typedef IndexCallback2 = void Function(int index);

showBottomPop({
  required BuildContext context,
  required Widget widget,
  double margin = 0,
  PopDismissCallBack? callBack,
  RouteSettings? routeSettings,
  Color bgColor = Colors.white,
  bool isScrollControlled = true, // false: 最大高度为半屏幕  true: 不再限制
  bool isDismissible = true, //是否点击背景消失
}) {
  if(bgColor == Colors.white){
    bgColor == bfGlobal.themeColors.backgroundPrimary;
  }
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: isScrollControlled,
    isDismissible: isDismissible,
    routeSettings: routeSettings,
    builder: (context) => AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets, //边距（必要）
      duration: const Duration(milliseconds: 100), //时常 （必要）
      child: Container(
        child: widget,
        margin: EdgeInsets.all(margin),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
      ),
    ),
  ).then((v) {
    if (callBack != null) {
      callBack();
    }
  });
}

/// 底部提示弹框
bottomPromptPop(
  BuildContext context, {
  required String title,
  required String content,
  required String buttonText,
  required VoidCallback okCallback,
}) {
  showBottomPop(
    context: context,
    margin: 16,
    bgColor: Colors.transparent,
    widget: InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(48, 0, 48, 0),
            // constraints: BoxConstraints(
            //     minHeight: 175.w, minWidth: double.maxFinite),
            decoration: BoxDecoration(
              color: bfGlobal.themeColors.backgroundPrimary,
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gaps.hGap28,
                Text(
                  title,
                  style: StRegular(24, text_main),
                  textAlign: TextAlign.center,
                ),
                Gaps.hGap20,
                Text(
                  content,
                  textAlign: TextAlign.center,
                  style: StRegular(14, text_main2),
                ),
                Gaps.hGap48
              ],
            ),
          ),
          Gaps.hGap10,
          InkWell(
            onTap: () {
              okCallback();
            },
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                  color: bfGlobal.themeColors.backgroundPrimary,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Center(
                child: Text(
                  buttonText,
                  style: StRegular(14, colorTheme),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

/// 底部选择弹框
bottomSelectPop(
  BuildContext context,
  List<String> itemList,
  String selectedItem,
  IndexCallback callback, {
  selectColor = colorTheme,
  itemDefaultColor = text_main2,
  String title = "",
  titleColor = text_main2,
}) {
  Widget _buildItem(String item, int index) {
    return SizedBox(
      height: 48,
      child: InkWell(
        child: Center(
          child: Text(
            item,
            style: item == selectedItem
                ? StBold(14, selectColor)
                : StRegular(14, itemDefaultColor),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
          callback(item, index);
        },
      ),
    );
  }

  List<Widget> _buildListView() {
    List<Widget> widgetList = [];
    for (int i = 0; i < itemList.length; i++) {
      widgetList.add(_buildItem(itemList[i], i));
      if (i != itemList.length -1) {
        widgetList.add(Container(height: 0.5, color: bfGlobal.themeColors.btnBgQuarterary));
      }
      //globalColorManager.dividerLightColor
    }
    return widgetList;
  }

  _headerView() {
    if (title.isNotEmpty) {
      return Container(
        height: 42,
        decoration: BoxDecoration(
          color: bfGlobal.themeColors.backgroundPrimary,
          border:const Border(bottom:BorderSide(width: 0.5,color: line_main)
          )),
        child: Center(
          child: Text(title, style: StRegular(14, text_main2),),
        ),
      );
    }
    return Container();
  }

  _lineView() {
    return Container(
      height: 8,
      color: bfGlobal.themeColors.btnBgQuarterary,
    );
  }

  _cancelButton() {
    return BottomCancelButton(
      callback: (){
        Navigator.pop(context);
      },
    );
  }
  showBottomPop(
    context: context,
    bgColor: Colors.transparent,
    widget: ConstrainedBox(
      constraints:
      BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
      child: Container(
        //padding: EdgeInsets.only(bottom: 15),
        width: double.maxFinite,
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
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: _buildListView(),
                ),
              ),
            ),
            _lineView(),
            _cancelButton()
          ],
        ),
      ),
    ),
  );
}

/// 底部选择弹框
bottomSelectPopCustomItem(BuildContext context, List<Widget> itemList, String selectedItem, IndexCallback2 callback,
    {selectColor = colorTheme,
    itemDefaultColor = text_main2,
    String title = "",
    titleColor = text_main2,
    itemHeight = 60.0}) {
  Widget _buildItem(Widget item, int index) {
    return Container(
      height: itemHeight,
      child: InkWell(
        child: Center(child: item),
        onTap: () {
          Navigator.pop(context);
          callback(index);
        },
      ),
    );
  }

  _headerView() {
    if (title.isNotEmpty) {
      return Container(
        height: 42,
        decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 0.5, color: line_main))),
        child: Center(
          child: Text(
            title,
            style: StRegular(14, text_main2),
          ),
        ),
      );
    }
    return Container();
  }

  _lineView() {
    return Container(
      height: 8,
      color: bfGlobal.themeColors.btnBgQuarterary,
    );
  }

  _cancelButton() {
    return BottomCancelButton(
      callback: (){
        Navigator.pop(context);
      },
    );
  }

  List<Widget> _buildListView() {
    List<Widget> widgetList = [];
    for (int i = 0; i < itemList.length; i++) {
      widgetList.add(_buildItem(itemList[i], i));
      if (i != itemList.length - 1) {
        widgetList.add(Container(height: 0.5, color: line_main));
      }
    }
    return widgetList;
  }

  showBottomPop(
    context: context,
    bgColor: Colors.transparent,
    widget: ConstrainedBox(
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: bfGlobal.themeColors.backgroundPrimary,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(10),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _headerView(),
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildListView(),
              ),
            ),
            _lineView(),
            _cancelButton()
          ],
        ),
      ),
    ),
  );
}
