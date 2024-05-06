
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:image_browser/utils/format_utils.dart';
import 'package:image_browser/utils/string_utils.dart';
import 'package:intl/intl.dart' as intl;

extension StringConvert on String {
  ///保留两位小数，无小数则不添加小数
  String keepTwoDecimal() {
    try {
      return getNumFormat(2, withZero: false);
    } catch (e) {
      return this;
    }
  }

  ///保留position小数，无小数则不添加小数,不四舍五入
  String keepDecimal(int position) {
    try {
      return getNumFormat(position, withZero: false);
    } catch (e) {
      return this;
    }
  }

  ///文字尺寸
  Size boundingTextSize(TextStyle style,  {int maxLines = 2^31, double maxWidth = double.infinity}) {
    if (this == null || this.isEmpty) {
      return Size.zero;
    }
    final TextPainter textPainter = TextPainter(
        textDirection: TextDirection.ltr,
        text: TextSpan(text: this, style: style), maxLines: maxLines)
      ..layout(maxWidth: maxWidth);
    return textPainter.size;
  }


  /// 防止文字自动换行
  /// 当中英文混合，或者中文与数字或者特殊符号，或则英文单词时，文本会被自动换行，
  /// 这样会导致，换行时上一行可能会留很大的空白区域
  /// 把每个字符插入一个0宽的字符， \u{200B}
  String fixAutoLines() {
    return Characters(this).join('\u{200B}');
  }

  ///数字很大的显示优化
  get fixNumberTwoDecimal{
    if(this.length > 0){
      double value = double.tryParse(this) ?? 0;
      double valueAbs = value.abs();
      String data = this.keepTwoDecimal();
      if(valueAbs > 1000){
        data = "${value/1000.0}".keepTwoDecimal() + "K";
      }
      if(valueAbs > 1000000){
        data = "${value/1000000.0}".keepTwoDecimal() + "M";
      }
      if(valueAbs > 1000000000){
        data = "${value/1000000000.0}".keepTwoDecimal() + "B";
      }
      if(valueAbs > 1000000000000){
        data = "${value/1000000000000.0}".keepTwoDecimal() + "T";
      }
      if(valueAbs > 1000000000000000){
        data = "${value/1000000000000000.0}".keepTwoDecimal() + "Q";
      }
      return data;
    }
  }

  //转换成整型
  String fixNumberDecimal(int decimal){
    if(this.length > 0){
      double value = double.tryParse(this) ?? 0;
      double valueAbs = value.abs();
      String data = this.keepDecimal(decimal);
      if(valueAbs > 1000){
        data = "${value/1000.0}".keepDecimal(decimal) + "K";
      }
      if(valueAbs > 1000000){
        data = "${value/1000000.0}".keepDecimal(decimal) + "M";
      }
      if(valueAbs > 1000000000){
        data = "${value/1000000000.0}".keepDecimal(decimal) + "B";
      }
      return data;
    }
    return this;
  }


  //百分之 工具 *100 保留两位小数
  get percent {
    if (this.length > 0) {
      double value = double.tryParse(this) ?? 0;
      value = value * 100;
      if (value == value.toInt()) {
        return value.toStringAsFixed(0);
      }
      return value.toStringAsFixed(2);
    }
    return this;
  }

  String shorten() {
    double value = StringUtils.doubleParse(this);
    if (value >= 1000000000) {
      int rounded = value ~/ 1000000.0;
      return "${(rounded / 1000).toString()}B";
    } else if (value >= 1000000) {
      int rounded = value ~/ 1000.0;
      return "${(rounded / 1000).toString()}M";
    } else if (value >= 1000) {
      int rounded = value ~/ 1.0;
      return "${(rounded / 1000).toString()}K";
    }
    return this;
  }

  // 判断是否是number
  bool get isNumeric {
    final parsed = double.tryParse(this);
    if (parsed != null) {
      return true;
    } else {
      return false;
    }
  }

  /**
   * 是否超过文本范围 true 超过 false 未超过
   * textStyle 样式
   * maxLine 最大支持行数
   * 宽度
   */
  bool textExceedMaxLines(TextStyle textStyle, int maxLine, double maxWidth) {
    TextSpan textSpan = TextSpan(text: this, style: textStyle);
    TextPainter textPainter = TextPainter(text: textSpan, maxLines: maxLine, textDirection: TextDirection.ltr);
    textPainter.layout(maxWidth: maxWidth);
   // print(textPainter.height);
    if (textPainter.didExceedMaxLines) {
      return true;
    }
    return false;
  }

  /**
   * 宽度范围内 获取当前范围内最大字体fontsize
   */
  double getAutoStyle(double maxFontSize, int maxLine, double maxWidth){
    double fontSize = maxFontSize;
    for(double i = 45; i > 10; i--){
      fontSize = i;
      TextStyle style = TextStyle(fontSize: i, fontWeight: FontWeight.w700);
      if(!textExceedMaxLines(style, 1, maxWidth)){
        break;
      }
    }
    return fontSize;
  }

}

extension StringVerify on String {
  bool isEmail() {
    const String emailRegex = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';
    return RegExp(emailRegex).hasMatch(this);
  }
}

extension StringConvertNullEnable on String? {
  String getNum() {
    try {
      if (isNumber(this)) {
        return this!;
      } else {
        return "";
      }
    } catch (e) {
      return "";
    }
  }

  /// scale 保留位数
  /// withZero 是否补零
  /// roundingMode 格式化模式
  /// withSymbol true:大于0时加 "+"
  /// withK_M 大于1000时结尾加"K" 大于1000000时结尾加"M"
  String getNumFormat(
    int scale, {
    bool withZero = false,
    RoundingMode roundingMode = RoundingMode.DOWN,
    bool withSymbol = false,
    bool withK_M = false,
    bool withThousands = false
  }) {
    var result = "";
    try {
      if (this != null && this!.isNotEmpty) {
        //num number = double.tryParse(this!) ?? 0;
        Decimal number = Decimal.parse(this!);
        var decimalPow = Decimal.parse("10").pow(scale);
        if (roundingMode == RoundingMode.DOWN) {
          var valueBigInt = (Decimal.parse(this!) * decimalPow).toBigInt();
          //number = (Decimal.fromBigInt(valueBigInt) / decimalPow).toDouble();
          number = (Decimal.fromBigInt(valueBigInt) / decimalPow);

        } else if (roundingMode == RoundingMode.UP) {
          var valueBigInt = ((Decimal.parse(number.toString()) * decimalPow) + Decimal.parse("1")).toBigInt();
          //number = (Decimal.fromBigInt(valueBigInt) / decimalPow).toDouble();
          number = (Decimal.fromBigInt(valueBigInt) / decimalPow);
        }

        var doubleValue = Decimal.parse(number.toString());

        var k_mSymbol = "";

        if (withK_M) {
          if ((doubleValue / (Decimal.fromInt(1000000))).toDouble() >= 1) {
            doubleValue = doubleValue / (Decimal.fromInt(1000000));
            k_mSymbol = "M";
          } else if ((doubleValue / (Decimal.fromInt(1000))).toDouble() >= 1) {
            doubleValue = doubleValue / (Decimal.fromInt(1000));
            k_mSymbol = "K";
          }
        }

        result = doubleValue.toString();
        if(withZero){
          List<String> split = result.split(".");
          if(split.length == 1){
             String pow = "0"*scale;
             result = "$result.$pow";
          }else if(split.length == 2 && split[1].length < scale){
             int offset = scale - split[1].length;
             String pow = "0"*offset;
             result = "$result$pow";
          }
        }

        if (withSymbol && doubleValue.toDouble() > 0) {
          result = "+$result";
        }

        if (withK_M) {
          result = "$result$k_mSymbol";
        }

        /// 展示千位位
        if(withThousands){
          List<String> split = result.split(".");
          final df = getDecimalFormat("#,###");
          result = df.format(split[0].getInt());
          result = result + (split.length > 1 ? ".${split[1]}" : "");
        }
      }

      return result;
    } catch (e) {
      return "0"
          .getNumFormat(scale, withZero: withZero, roundingMode: roundingMode);
    }
  }

  intl.NumberFormat getDecimalFormat(String pattern) {
    final df = intl.NumberFormat(pattern, 'en_US');
    return df;
  }

  double getDouble() {
    try {
      return (this != null && this!.isNotEmpty) ? double.parse(this!) : 0.0;
    } catch (e) {
      return 0.0;
    }
  }

  int getInt() {
    try {
      return (this != null && this!.isNotEmpty) ? int.parse(this!) : 0;
    } catch (e) {
      return 0;
    }
  }


}
