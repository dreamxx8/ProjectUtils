import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:image_browser/constant/gaps.dart';
import 'package:image_browser/page_color_manager/widget/color_item.dart';
import 'package:image_browser/page_custom_widget/widget/other/custom_toast.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ColorBrowserPage extends StatefulWidget {
  const ColorBrowserPage({Key? key}) : super(key: key);

  @override
  State<ColorBrowserPage> createState() => _ColorBrowserPageState();
}

class _ColorBrowserPageState extends State<ColorBrowserPage>
    with SingleTickerProviderStateMixin {
  String pathLocal = '';
  final storage = const FlutterSecureStorage();

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
              isCharactersInOrder(textEditingController.text.toLowerCase(), (element.name ?? "").toLowerCase()) ||
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

  bool isCharactersInOrder(String input, String target) {
    if (input.length > target.length) {
      return false;
    }

    int index = 0;
    for (int i = 0; i < target.length; i++) {
      if (target[i] == input[index]) {
        index++;
      }
      if (index == input.length) {
        return true;
      }
    }

    return false;
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

  String fileLightPath(String? parentPath){
    return "${parentPath}/lib/module_base/theme/colors_light.dart";
  }
  String fileDarkPath(String? parentPath){
    return "${parentPath}/lib/module_base/theme/colors_dark.dart";
  }
  String fileConstPath(String? parentPath){
    return "${parentPath}/lib/core/constant/color_const.dart";
  }

  Future<void> getFileContent(String folderPath) async {

    File fileLight = File(fileLightPath(folderPath));
    File fileDark = File(fileDarkPath(folderPath));

    File fileColorConst = File(fileConstPath(folderPath));


    String contentsLight = await fileLight.readAsString();
    String contentsDark = await fileDark.readAsString();
    String fileColorConstContent = await fileColorConst.readAsString();
    List<String> constSplitList = fileColorConstContent.split("\n");
    Map<String, String> colorConstMap = {};
    constSplitList.forEach((element) {
      if (element.contains("Color") && element.contains("0x")) {
        RegExp nameRegex = RegExp(r'(?<=const Color )\w+(?=\s=)');
        RegExp valueRegex = RegExp(r'(?<=\()\w+(?=\))');
        String name = nameRegex.stringMatch(element) ?? '';
        String? color = valueRegex.stringMatch(element) ?? '';
        print('name: $name');
        print('value: $color');
        colorConstMap[name] = color;
      }
    });
    // 查找引用color
    constSplitList.forEach((element) {
      if (element.contains("Color") && !element.contains("0x")) {
        RegExp nameRegex = RegExp(r'(?<=const Color )\w+(?=\s=)');
        RegExp valueRegex = RegExp(r'(?<= = )\w+');
        String name = nameRegex.stringMatch(element) ?? '';
        String value = valueRegex.stringMatch(element) ?? '';

        print('colorBlack50: $name');
        print('value: $value');
        colorConstMap[name] = colorConstMap[value] ?? '';
      }
    });

    
    List<String> splitLight = contentsLight.split("\n");
    List<String> darkLight = contentsDark.split("\n");
    Map<String, String> lightMap = {};
    Map<String, String> darkMap = {};

    splitLight.forEach((element) {
      if (element.contains("Color get")) {
        _decodeColor(element, lightMap, colorConstMap);
      }
    });
    darkLight.forEach((element) {
      if (element.contains("Color get")) {
        _decodeColor(element, darkMap, colorConstMap);
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
                const SizedBox(
                  width: 20,
                ),
                Expanded(child: Text(pathLocal))
              ],
            ),
            Row(
              children: [
                const Text("搜索"),
                const SizedBox(
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
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 0),
                      alignLabelWithHint: false,
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                          gapPadding: 0, borderSide: BorderSide.none),
                      enabledBorder: OutlineInputBorder(
                          gapPadding: 0, borderSide: BorderSide.none),
                      disabledBorder: OutlineInputBorder(
                          gapPadding: 0, borderSide: BorderSide.none),
                      errorBorder: OutlineInputBorder(
                          gapPadding: 0, borderSide: BorderSide.none),
                      focusedErrorBorder: OutlineInputBorder(
                          gapPadding: 0, borderSide: BorderSide.none),
                    ),
                  ),
                ),
                const SizedBox(width: 50,),
                TextButton(onPressed: (){
                  if(pathLocal.isNotEmpty){
                    getFileContent(pathLocal);
                  }
                }, child: Text("刷新")),
                const SizedBox(width: 50,),
                TextButton(onPressed: () async {
                  final SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.clear();
                }, child: Text("清空"))
              ],
            ),
            Gaps.hGap10,
            Expanded(
                child: Container(
              //color: Colors.black.withOpacity(0.05),
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
    File fileLight = File(fileLightPath(folderPath));
    File fileDark = File(fileDarkPath(folderPath));

    if (!await fileLight.exists() || !await fileDark.exists()) {
      CustomToast.showError("文件不存在");
      throw Exception('File does not exist!');
    }
    getFileContent(folderPath ?? "");
  }

  _decodeColor(String element, Map<String, String> map, Map<String, String> colorConstMap) {
    Match? match = colorRegExp.firstMatch(element);
    if (match != null) {
      String colorName = match.group(1)!;
      String colorHex = match.group(2)!;
      print("Color Name: $colorName");
      print("Color Hex: $colorHex");
      map[colorName] = colorHex;
    } else {

      RegExp nameRegex = RegExp(r'(?<=get )\w+(?= =>)');
      RegExp colorRegex = RegExp(r'(?<= => )\w+');
      String? colorName = nameRegex.stringMatch(element) ?? '';
      String? colorHexName = colorRegex.stringMatch(element);
      String color = colorConstMap[colorHexName] ?? '';

      if(colorHexName == 'AppConfig'){
        print("Color Hex: $colorHexName");
        RegExp regex = RegExp(r'(?<=\? )\b\w+\b');
        String? otherName = regex.stringMatch(element);
        if(otherName != null){
          colorHexName = otherName;
          color = colorConstMap[colorHexName] ?? '';
          if(color.isEmpty){
            color = map[colorHexName] ?? '';
          }
        }
      }
      print("Color Name: $colorName");
      print("Color Hex: $colorHexName");
      print("Color: $color");
      RegExp opacityRegex = RegExp(r'\b0\.\d+\b');
      String? opacityValue = opacityRegex.stringMatch(element);
      print('Opacity value: $opacityValue');

      if(opacityValue != null){
        double value = 255.0 * (double.tryParse(opacityValue) ?? 0.0);
        int valueInt = value.round();
        String hexValue = valueInt.toRadixString(16).toUpperCase();
        print('Hex value: $hexValue');
        if(color.length > 4){
          color = color.replaceRange(2, 4, hexValue);
        }
      }


      map[colorName] = color;
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
