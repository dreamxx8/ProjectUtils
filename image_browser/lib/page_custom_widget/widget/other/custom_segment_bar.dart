
import 'package:flutter/material.dart';

class SegmentBar extends StatefulWidget {
  //按钮名字集合
  final List<String> titleNames;

  //默认颜色
  final Color defaultColor;

  //选中时的颜色
  final Color selectedColor;

  //字体大小
  final double textSize;

  //初始时选中的item ，默认第一个
  final int selectItem;

  //点击回调
  final Function(int) onSelectChanged;

  //按钮高度
  final double itemHeight;

  //按钮宽度
  final double itemWidth;

  //按钮边框宽度
  final double borderWidth;

  //按钮圆角角度大小
  final double radius;

  SegmentBar(
      {required this.titleNames,
      required this.onSelectChanged,
      this.defaultColor = Colors.white,
      this.selectedColor = Colors.black,
      this.textSize = 14,
      this.itemHeight = 30,
      this.itemWidth = 110,
      this.borderWidth = 1,
      this.radius = 5,
      this.selectItem = 0});

  @override
  _SegmentBarState createState() => _SegmentBarState();
}

class _SegmentBarState extends State<SegmentBar> {
  late int selectItem;

  @override
  void initState() {
    super.initState();
    selectItem = widget.selectItem;
  }

  _buildSegmentItems(List list) {
    if (list == null && list.isEmpty) {
      return Container();
    }
    List<Widget> items = [];
    for (var i = 0; i < list.length; i++) {
      Widget item = Container(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: _bulidSegemtItem(list[i], i),
      );
      items.add(item);
    }

    return items;
  }

  ///创建item position 是item的位置，根据位置 设置不同 的属性
  _bulidSegemtItem(String name, int position) {
    return Container(
      //有边框的时候按钮高度减去边框宽度 保持按钮高度选中不选中一样
      height: selectItem == position
          ? widget.itemHeight
          : widget.itemHeight - widget.borderWidth,
      width: widget.itemWidth,
      //如果 当前item 是选中的item 则创建 flatButton 如果不是 则创建 带边框属行的 outlineButton
      child: InkWell(
        onTap: () {
          _updateItem(position);
        },
        // decoration: BoxDecoration(border: Border.all(color: color, width: 1), borderRadius: BorderRadius.circular(4)),

        child: Container(
          padding: selectItem == position ? EdgeInsets.all(widget.borderWidth) : const EdgeInsets.all(0),
          alignment: Alignment.center,
          decoration: position == 0
              ? BoxDecoration(
                  border: Border.all(
                      color: selectItem == position
                          ? widget.defaultColor
                          : widget.selectedColor,
                      width: widget.borderWidth),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(widget.radius),
                      bottomLeft: Radius.circular(widget.radius)),
                  color: selectItem == position
                      ? widget.selectedColor
                      : widget.defaultColor)
              : position == widget.titleNames.length - 1
                  ? BoxDecoration(
                      border: Border.all(
                          color: selectItem == position
                              ? widget.selectedColor
                              : widget.defaultColor,
                          width: widget.borderWidth),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(widget.radius),
                          bottomRight: Radius.circular(widget.radius)),
                      color: selectItem == position
                          ? widget.selectedColor
                          : widget.defaultColor)
                  : BoxDecoration(
                      border: Border.all(
                          color: selectItem == position
                              ? widget.selectedColor
                              : widget.defaultColor,
                          width: widget.borderWidth),
                      color: selectItem == position
                          ? widget.selectedColor
                          : widget.defaultColor),
          child: Text(
            name,
            style: TextStyle(
              fontSize: widget.textSize,
              color: selectItem == position
                  ? widget.defaultColor
                  : widget.selectedColor,
            ),
          ),
        ),
      ),
    );
  }

  //点击修改视图样式，回调点击的方法
  _updateItem(int selectedPosition) {
    if (selectedPosition == selectItem) {
      return;
    } else {
      selectItem = selectedPosition;
      widget.onSelectChanged(selectedPosition);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildSegmentItems(widget.titleNames),
    );
  }
}
