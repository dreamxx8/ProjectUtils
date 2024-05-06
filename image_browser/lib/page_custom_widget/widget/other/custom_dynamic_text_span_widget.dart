import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_browser/constant/color_const.dart';
import 'package:image_browser/utils/lc_styles.dart';

/// 动态替换标签中的文案
/// "我已阅读并同意<1>用户协议</1>"
class CustomDynamicTextSpanWidget extends StatelessWidget {
  final String text;
  final TextStyle? defaultStyle;
  final TextStyle? dynamicStyle;
  final VoidCallback? callBack;

  const CustomDynamicTextSpanWidget({
    Key? key,
    required this.text,
    this.defaultStyle,
    this.dynamicStyle,
    this.callBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!text.contains("《1》") && !text.contains("《/1》")) {
      return Text(text, style: defaultStyle ?? StRegular(14, text_main2));
    }
    // 正则表达式匹配<1>标签及其内容
    final RegExp regex = RegExp(r'《1》(.*?)《/1》');

    // 根据正则表达式找到所有匹配项
    List<Match> matches = regex.allMatches(text).toList();

    // 构建TextSpan列表
    List<TextSpan> spans = [];
    int lastMatchEnd = 0;

    for (Match match in matches) {
      // 添加未匹配文本的TextSpan
      if (match.start > lastMatchEnd) {
        spans.add(
          TextSpan(
            text: text.substring(lastMatchEnd, match.start),
            style: defaultStyle ?? StRegular(14, text_main2),
          ),
        );
      }
      // 添加匹配文本的TextSpan
      String? dynamicText = match.group(1); // 获取<1>和</1>之间的文本
      spans.add(
        TextSpan(
          text: dynamicText,
          style: dynamicStyle ?? StRegular(14, accent_main),
          recognizer: (TapGestureRecognizer()
            ..onTap = () {
              callBack?.call();
            }),
        ),
      );
      lastMatchEnd = match.end;
    }

    // 添加剩余文本的TextSpan
    if (lastMatchEnd < text.length) {
      spans.add(
        TextSpan(
          text: text.substring(lastMatchEnd),
          style: defaultStyle ?? StRegular(14, text_main),
        ),
      );
    }

    return RichText(text: TextSpan(children: spans));
  }
}
