import 'package:flutter/material.dart';
import 'package:image_browser/theme/color_ext.dart';
import 'package:image_browser/theme/theme_data.dart';

import 'base_colors.dart';


BFGlobal bfGlobal = BFGlobal();

class BFGlobal {

  factory BFGlobal() => _instance ??= BFGlobal._();
  static BFGlobal? _instance;
  BFGlobal._();

  BaseThemeData? _themeData;

  /// 初始化主题
  initTheme({
    required Function() onThemeChanged,
    Brightness brightness = Brightness.light,
  }) {}

  BaseThemeData get theme => _themeData ?? BaseThemeData(Brightness.light);

  BaseColors get themeColors => theme.colors;

  bool get isDarkMode {
    return theme.brightness == Brightness.dark;
  }

  bool get isLightMode {
    return theme.brightness == Brightness.light;
  }
}


/// 用例
class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bfGlobal.themeColors.brand,
      child: Text(
        "用例",
        style: bfGlobal.themeColors.negative.f57W700,
      ),
    );
  }
}
