import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart';

/// loading 不要直接使用 EasyLoading
class CustomLoading {

  static void show() {
    EasyLoading.instance.backgroundColor = Colors.transparent;
    EasyLoading.show();
  }

  static void dismiss() {
    EasyLoading.dismiss();
  }

}
