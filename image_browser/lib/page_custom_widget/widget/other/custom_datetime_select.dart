

import 'package:image_browser/constant/color_const.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/utils/lc_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

DateTime? chooseDateTime;
Future<DateTime?> showCupertinoDatePickerForDate(BuildContext context) {
  return showCupertinoModalPopup(
    context: context,
    builder: (context) {
      final CupertinoDatePicker cupertinoDatePicker = CupertinoDatePicker(
        mode: CupertinoDatePickerMode
            .date, // 日期选择器模式 `time`,`date`,`dateAndTime`, 默认`dateAndTime`
        initialDateTime: DateTime.now(), // 初始化日期
        minimumDate: DateTime(2015, 10, 10), // 最小可选日期
        maximumDate: DateTime(2030, 12, 22), // 最大可选日期
        minimumYear: 2015, // 最小年份
        maximumYear: 2030, // 最大年份
        minuteInterval:
        1, // 分钟间隔  initialDateTime.minute 必须可以整除 minuteInterval 必须是 60 的整数因子
        use24hFormat: true, // 是否使用24小时制
        dateOrder: DatePickerDateOrder.dmy, // 日期选择器排序方式 默认年/月/日
        backgroundColor: bfGlobal.themeColors.backgroundPrimary,
        // 选中日期变化回调
        onDateTimeChanged: (dateTime) {
          chooseDateTime = dateTime;
        },
      );

      // 初始化chooseDateTime
      chooseDateTime = cupertinoDatePicker.initialDateTime;
      return AnimatedContainer(
        duration: Duration(microseconds: 200),
        height: 300,
        width: double.infinity,
        child: Container(
          color: bfGlobal.themeColors.backgroundPrimary,
          child: Column(
            children: [
              getActions(context),
              Expanded(
                child: cupertinoDatePicker,
              ),
            ],
          ),
        ),
      );
    },
  );
}


// CupertinoTimerPicker
getActions(BuildContext context) {
  final Widget actions = Container(
    alignment: AlignmentDirectional.centerEnd,
    constraints: const BoxConstraints(minHeight: 52.0),
    padding: const EdgeInsets.symmetric(horizontal: 8),
    color: bfGlobal.themeColors.backgroundPrimary,
    child: OverflowBar(
      alignment: MainAxisAlignment.spaceBetween,
      spacing: 8,
      children: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            "取消",
            style: StRegular(14, colorTheme),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(chooseDateTime);
          },
          child: Text(
            "确认",
            style: StRegular(14, colorTheme),
          ),
        ),
      ],
    ),
  );
  return actions;
}
