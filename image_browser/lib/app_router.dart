import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_browser/terminal/model/command_model.dart';
import 'package:image_browser/terminal/terminal_page.dart';


Widget generatePageWidget(BuildContext context, String? name, {Object? arguments}) {
  ///合约相关页面
  if (name == TerminalToolPage.routeName){
    Object model = arguments ?? CommandModel("", "", "", "");
    return TerminalToolPage(model as CommandModel);
  }
  return Container();
}

Route<dynamic> generateRoute(RouteSettings settings) {
  // CupertinoPageRoute 的builder在android手机上会重复调用; 把generatePageWidget方法加上非null判断，避免重复调用页面构造方法
  Widget? routerWidget = null;
  return CupertinoPageRoute(
      builder: (context) {
        if (routerWidget == null) {
          routerWidget = generatePageWidget(context, settings.name, arguments: settings.arguments);
        }
        return routerWidget!;
      },
      settings: settings);
}

popAndStartNoAnimation(BuildContext context, String routerName, {Object? arguments}) {
  Widget? routerWidget = null;
  var router = PageRouteBuilder<void>(
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      if (routerWidget == null) {
        routerWidget =
            generatePageWidget(context, routerName, arguments: arguments);
      }
      return routerWidget!;
    },
    transitionDuration: const Duration(milliseconds: 200),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // 添加一个平移动画
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      );
      // 平移
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-1.0, 0.0),
          end: Offset.zero,
        ).animate(curvedAnimation),
        child: child,
      );
    },
  );
  Navigator.of(context).pushReplacement(router);
}
