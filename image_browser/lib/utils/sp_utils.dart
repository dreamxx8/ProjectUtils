import 'dart:core';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as JSON;
import 'package:path/path.dart' as path;

///
/// 注意⚠️⚠️
/// 如果在两个Engine中同时使用SPUtils，需要调用 reload方法
/// 例如：在HomePage中保存数据到Sp中，然后在MarketPage中获取数据，需要在MarketPage中调用reload方法
///
class SPUtils {
  static const String COMMAND_PARAMS_LIST = "COMMAND_PARAMS_LIST";

  static late SharedPreferences preferences;
  static late Directory temporaryDirectory;
  static late Directory supportDirectory;

  static Future<bool> initSp() async {

    preferences = await SharedPreferences.getInstance();
    return true;
  }

  static Future<bool> saveCommandList(List<String> commandList) {
    return _saveStringList(COMMAND_PARAMS_LIST, commandList);
  }
  static List<String>? getCommandList() {
    return _getStringList(COMMAND_PARAMS_LIST);
  }

  static Future<bool> _saveString(String key, value) {
    return preferences.setString(key, value);
  }

  static Future<bool> _saveInt(String key, int value) {
    return preferences.setInt(key, value);
  }

  static Future<bool> _saveDouble(String key, double value) {
    return preferences.setDouble(key, value);
  }

  static Future<bool> _saveBool(String key, bool value) {
    return preferences.setBool(key, value);
  }

  static Future<bool> _saveStringList(String key, List<String> value) {
    return preferences.setStringList(key, value);
  }


  static Future<void> reload() {
    return preferences.reload();
  }

  static _get(String key) {
    return preferences.get(key);
  }

  static bool _getBool(String key, {bool defaultValue = false}) {
    return preferences.getBool(key) ?? defaultValue;
  }

  static int _getInt(String key, {int defaultValue = 0}) {
    return preferences.getInt(key) ?? defaultValue;
  }

  static double _getDouble(String key, {double defaultValue = 0.0}) {
    return preferences.getDouble(key) ?? defaultValue;
  }

  static String? _getString(String key, {String? defaultValue}) {
    return preferences.getString(key) ?? defaultValue;
  }

  static List<String>? _getStringList(String key) {
    return preferences.getStringList(key);
  }



  ///移除数据
  static Future<bool> remove(String key) {
    return preferences.remove(key);
  }


}
