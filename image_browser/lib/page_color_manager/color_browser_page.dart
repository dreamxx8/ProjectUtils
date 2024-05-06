import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:image_browser/page_color_manager/widget/color_item.dart';
import 'package:image_browser/page_custom_widget/widget/other/custom_toast.dart';
import 'package:image_browser/page_image_manager/image_display_page.dart';
import 'package:image_browser/utils/event_bus_utils.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image/image.dart' as img;

class ColorBrowserPage extends StatefulWidget {
  const ColorBrowserPage({Key? key}) : super(key: key);

  @override
  State<ColorBrowserPage> createState() => _ColorBrowserPageState();
}

class _ColorBrowserPageState extends State<ColorBrowserPage>
    with SingleTickerProviderStateMixin {
  String pathLocal = '';
  final storage = FlutterSecureStorage();

  // false 赋值名称 true 复制代码
  bool isCopyCode = false;
  String size = "100";
  TextEditingController textEditingController = TextEditingController();

  /// 判断ios文件 去重
  bool isLoading = true;

  final RegExp colorRegExp =
      RegExp(r"Color get (\w+) => const Color\((0x[A-F0-9]+)\);");
  List<ColorDecode> allColors = [];
  List<ColorDecode> allFilterColors = [];

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(() {
      if(textEditingController.text.isNotEmpty){
        List<ColorDecode> filter = [];
        allColors.forEach((element) {
          if((element.name ?? "").toLowerCase().contains(textEditingController.text.toLowerCase()) ||
              (element.light ?? "").toLowerCase().contains(textEditingController.text.toLowerCase()) ||
              (element.dark ?? "").toLowerCase().contains(textEditingController.text.toLowerCase())){
            filter.add(element);
          }
        });
        allFilterColors = filter;
      }else{
        allFilterColors = allColors;
      }
      setState(() {});
    });
    _getLocalPath();
  }

  _getLocalPath() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? path = prefs.getString("color_path");
    if (path != null) {
      setState(() {
        pathLocal = path;
      });
      Future.delayed(Duration(seconds: 0), () {
        getFileContent(path);
      });
    }
  }

  Future<void> getFileContent(String folderPath) async {

    File fileLight = File("${folderPath}/colors_light.dart");
    File fileDark = File("${folderPath}/colors_dark.dart");

    String contentsLight = await fileLight.readAsString();
    String contentsDark = await fileDark.readAsString();

    List<String> splitLight = contentsLight.split("\n");
    List<String> darkLight = contentsDark.split("\n");
    Map<String, String> lightMap = {};
    Map<String, String> darkMap = {};

    splitLight.forEach((element) {
      if (element.contains("0x")) {
        _decodeColor(element, lightMap);
      }
    });
    darkLight.forEach((element) {
      if (element.contains("0x")) {
        _decodeColor(element, darkMap);
      }
    });
    allColors.clear();
    for (var key in lightMap.keys) {
      String? light = lightMap[key];
      String? dark = darkMap[key];
      Color? colorLight;
      Color? colorDark;
      if (light != null) {
        colorLight = Color(int.parse(light));
      }
      if (dark != null) {
        colorDark = Color(int.parse(dark));
      }
      ColorDecode colorDecode = ColorDecode(
          name: key,
          light: light,
          dark: dark,
          lightColor: colorLight,
          darkColor: colorDark);
      allColors.add(colorDecode);
    }

    print(allColors);
    allFilterColors = allColors;
    setState(() {});
  }

  void createFile(String fileName, String content) {
    final file = File(fileName);

    // 将文本写入文件
    file.writeAsString(content).then((value) {
      print('File created successfully!');
    }).catchError((error) {
      print('Error creating file: $error');
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ColorBrowser"),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 24, bottom: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      openFolderPicker();
                    },
                    child: const Text("Select File")),
                SizedBox(
                  width: 20,
                ),
                Expanded(child: Text(pathLocal))
              ],
            ),
            Row(
              children: [
                Text("搜索"),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 200,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  child: TextField(
                    controller: textEditingController,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 0),
                      alignLabelWithHint: false,
                      border: InputBorder.none,
                      focusedBorder: const OutlineInputBorder(
                          gapPadding: 0, borderSide: BorderSide.none),
                      enabledBorder: const OutlineInputBorder(
                          gapPadding: 0, borderSide: BorderSide.none),
                      disabledBorder: const OutlineInputBorder(
                          gapPadding: 0, borderSide: BorderSide.none),
                      errorBorder: const OutlineInputBorder(
                          gapPadding: 0, borderSide: BorderSide.none),
                      focusedErrorBorder: const OutlineInputBorder(
                          gapPadding: 0, borderSide: BorderSide.none),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
                child: Container(
              color: Colors.black.withOpacity(0.05),
              child: ListView(
                children: [
                  Wrap(
                    spacing: 0,
                    runSpacing: 0,
                    children: _getWidgets(),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  _getWidgets() {
    List<Widget> widgets = [];
    allFilterColors.forEach((element) {
      widgets.add(ColorItem(element));
    });
    return widgets;
  }

  // 打开文件夹选择器
  void openFolderPicker() async {
    // 选择文件夹
    String? folderPath =
        await FilePicker.platform.getDirectoryPath(initialDirectory: pathLocal);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('color_path', folderPath ?? "");
    File fileLight = File("${folderPath}/colors_light.dart");
    File fileDark = File("${folderPath}/colors_dark.dart");

    if (!await fileLight.exists() || !await fileDark.exists()) {
      CustomToast.showError("文件不存在");
      throw Exception('File does not exist!');
    }
    getFileContent(folderPath ?? "");
  }

  _decodeColor(String element, Map<String, String> map) {
    Match? match = colorRegExp.firstMatch(element);
    if (match != null) {
      String colorName = match.group(1)!;
      String colorHex = match.group(2)!;
      print("Color Name: $colorName");
      print("Color Hex: $colorHex");
      map[colorName] = colorHex;
    } else {
      print("No match found!");
    }
  }

  _copySvg(String copyValue) {
    print(copyValue);
    Clipboard.setData(ClipboardData(text: copyValue));
    // 显示Toast消息
    FlutterToastr.show(copyValue, context,
        duration: FlutterToastr.lengthLong, position: FlutterToastr.center);
  }
}

class ColorDecode {
  String? name;
  String? dark;
  String? light;
  Color? darkColor;
  Color? lightColor;

  ColorDecode(
      {this.name, this.dark, this.light, this.darkColor, this.lightColor});
}
