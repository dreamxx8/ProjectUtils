import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import 'dart:convert' as convert;

import 'package:image_browser/utils/sp_utils.dart';

class Global {
  static Future init({void Function()? additionalDependencies}) async {
    // WidgetsFlutterBinding.ensureInitialized();
    await SPUtils.initSp();
    return Future.value(null);
  }
}
