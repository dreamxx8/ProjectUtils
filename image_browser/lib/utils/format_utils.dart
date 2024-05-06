import 'package:decimal/decimal.dart';
import 'dart:math';

import 'package:image_browser/extension/string_extension.dart';

enum RoundingMode { DOWN, UP, HALF_UP }

/// 格式化数字,默认向下截取小数位
/// withZero: true 保留max位小数, 不足补0
///           false 最多保留max位小数(尾数为0,舍去)
/// withSeparator: 千分位是否使用逗号隔开
String limitFmt(
  num? n, {
  int max = 2,
  RoundingMode mode = RoundingMode.DOWN,
  bool withZero = false,
  bool withSeparator = false,
}) {
  return n.toString().getNumFormat(max,
      withZero: withZero, roundingMode: mode, withSymbol: false, withK_M: false, withThousands: withSeparator);
}

String limitFmtPercent(num n, {
  int max = 0,
  bool withZero = false,
  bool withSeparator = false,
}) {
  var percent = limitFmt(n  * 100, withZero: withZero, withSeparator:
  withSeparator, max: max);
  return '$percent%';
}

//判定字符串是否为数字
bool isNumber(String? s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}

bool isZero(String s) {
  if (!isNumber(s)) {
    return false;
  }
  return double.tryParse(s) == 0;
}

/// 随机6位数字字符串
String randomNumStr(int len) {
  String scopeF = '0123456789abcedfghijklmnopqrstuvwxyz';
  String result = '';
  for (int i = 0; i < len; i++) {
    result = result + scopeF[Random().nextInt(scopeF.length)];
  }
  return result;
}
