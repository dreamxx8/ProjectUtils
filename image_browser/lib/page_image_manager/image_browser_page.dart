
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:image_browser/page_image_manager/image_display_page.dart';
import 'package:image_browser/utils/event_bus_utils.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image/image.dart' as img;

class ImageBrowserPage extends StatefulWidget {
  const ImageBrowserPage({Key? key}) : super(key: key);
  @override
  State<ImageBrowserPage> createState() => _ImageBrowserPageState();
}

Map<String, List<File>> segmentPngMap = {};
Map<String, List<File>> segmentSvgMap = {};
Map<String, ImageDecode> imageDecodeMap = {};

class _ImageBrowserPageState extends State<ImageBrowserPage> with SingleTickerProviderStateMixin {
  
  List<File> imageFilesPng = [];
  List<File> imageFilesSvg = [];

  late TabController _controller;
  String pathLocal = '';
  final storage = FlutterSecureStorage();
  final String PATH_FILE = "path.txt";
  // false 赋值名称 true 复制代码
  bool isCopyCode = false;
  String size = "100";
  TextEditingController textEditingController = TextEditingController();

  /// 判断ios文件 去重
  Set<String> iosFilePath = {};
  bool isLoading = true;


  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
    textEditingController.text = size;
    _getLocalPath();
  }

  _getLocalPath() async {
     final SharedPreferences prefs = await SharedPreferences.getInstance();
     String? path = prefs.getString("path");
     if(path != null){
       setState(() {
         pathLocal = path;
       });
       Future.delayed(Duration(seconds: 0), (){
         displayImages(path);
       });
     }

     String? contentSize = prefs.getString("size");
     if(contentSize != null){
       setState(() {
         textEditingController.text = contentSize;
         size = contentSize;
       });
     }


  }

  void getFileContent(String fileName) {
    final file = File(fileName);

    // 读取文件内容
    file.readAsString().then((content) {
      print('File content: $content');
      if(content != null){
        displayImages(content);
        setState(() {
          pathLocal = content;
        });
      }
    }).catchError((error) {
      print('Error reading file: $error');
      return null;
    });
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

  _saveSize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('size', textEditingController.text);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ImageBrowser"),),
      body: Container(
        padding: const EdgeInsets.only(left: 24, bottom: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                TextButton(onPressed: (){
                  openFolderPicker();
                }, child: const Text("Select File")),
                const SizedBox(width: 20,),
                Expanded(child: Text(pathLocal))
              ],
            ),
            Row(
              children: [
                TextButton(onPressed: (){
                  _copySvg("import 'package:flutter_svg/flutter_svg.dart';");
                }, child: const Text("复制svg头文件")),
                const SizedBox(width: 50,),
                const Text("图片大小"),
                const SizedBox(width: 10,),
                Container(
                  width: 50,
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
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 0),
                      alignLabelWithHint: false,
                      border: InputBorder.none,
                      focusedBorder:  OutlineInputBorder(
                          gapPadding: 0, borderSide: BorderSide.none),
                      enabledBorder:  OutlineInputBorder(
                          gapPadding: 0, borderSide: BorderSide.none),
                      disabledBorder:  OutlineInputBorder(
                          gapPadding: 0, borderSide: BorderSide.none),
                      errorBorder:  OutlineInputBorder(
                          gapPadding: 0, borderSide: BorderSide.none),
                      focusedErrorBorder:  OutlineInputBorder(
                          gapPadding: 0, borderSide: BorderSide.none),
                    ),
                  ),
                ),
                TextButton(onPressed: (){
                  setState(() {
                    size = textEditingController.text;
                  });
                  _saveSize();

                }, child: const Text("确定")),
                const SizedBox(width: 20,),
                TextButton(onPressed: () async {
                  Navigator.pushNamed(context, '/ImageSearchPage');
                }, child: const Text("搜索")),
              ],
            ),
            TabBar(
              controller: _controller,
                tabs: const [
              Tab(
                child: Text("PNG"),
              ),
              Tab(
                child: Text("SVG"),
              )
            ]),
            if(segmentPngMap.isNotEmpty && segmentSvgMap.isNotEmpty)
            Expanded(
                child: TabBarView(
                  controller: _controller,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    !isLoading ? ImageDisplayPage(imageFilesMap: segmentPngMap, isCopyCode: isCopyCode, size: size,) : Container(),
                    !isLoading ? ImageDisplayPage(imageFilesMap: segmentSvgMap, isCopyCode: isCopyCode, size: size,) : Container()
                  ],
                )
            )
          ],
        ),
      ),
    );
  }





  // 打开文件夹选择器
  void openFolderPicker() async {
    // 选择文件夹
    String? folderPath = await FilePicker.platform.getDirectoryPath(initialDirectory: pathLocal);

    if (folderPath != null) {
      print('Selected folder path: $folderPath');
      // 存储数据
      //createFile(PATH_FILE, folderPath);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('path', folderPath);
      //displayImages(folderPath);
      pathLocal = folderPath;
      _clearData();
      eventBus.fire(EventReselectImageUrl());
      // 处理选择的文件夹路径
    } else {
      print('No folder selected.');
      //displayImages(pathLocal);
    }
  }

  _clearData(){
    segmentPngMap.clear();
    segmentSvgMap.clear();
  }

  // 显示图片
  Future<void> displayImages(String folderPath) async {
    EasyLoading.show(
      status: 'loading...',
      maskType: EasyLoadingMaskType.black,
    );
    isLoading = true;
    Directory folder = Directory(folderPath);
    List<FileSystemEntity> files = folder.listSync(recursive: true);
    imageFilesPng.clear();
    imageFilesSvg.clear();
    _clearData();
    for (int i = 0; i < files.length; i++) {
      var file = files[i];
      if (file is File) {
        String filePath = file.path;
        // 处理文件

        if (path.extension(filePath) == '.jpg' ||
            path.extension(filePath) == '.jpeg' ||
            path.extension(filePath) == '.png') {
          // 如果文件位于文件夹中，则将其路径添加到列表中
          // 获取图像路径列表并更新UI

          await getImageSize(file);
          String? key = _fileDirectoryName(file);
          if(key!=null){
            imageFilesPng.add(file);
            List<File>? datas =  segmentPngMap[key];
            if(datas == null){
              datas = [];
              datas.add(file);
              segmentPngMap[key] = datas;
            }else{
              datas.add(file);
            }
          }
        }

        if (path.extension(filePath) == '.svg') {
          // 如果文件位于文件夹中，则将其路径添加到列表中
          // 获取图像路径列表并更新UI
          String? key = _fileDirectoryName(file);
          if(key!=null){
            imageFilesSvg.add(file);
            List<File>? datas =  segmentSvgMap[key];
            if(datas == null){
              datas = [];
              datas.add(file);
              segmentSvgMap[key] = datas;
            }else{
              datas.add(file);
            }
          }
        }

      }
    };
    segmentSvgMap['all'] = imageFilesSvg;
    segmentPngMap['all'] = imageFilesPng;

    print(segmentSvgMap);
    print(segmentPngMap);
    isLoading = false;
    setState(() {});
    EasyLoading.dismiss();
  }


  Future<void> getImageSize(File imageFile) async {
    if (imageFile.existsSync()) {
      if(imageDecodeMap[imageFile.path] != null){
        return;
      }
      img.Image? image = await img.decodeImageFile(imageFile.path);

      if (image != null) {
        int width = image.width;
        int height = image.height;

        print('Image Width: $width');
        print('Image Height: $height');
        var imageDecode = ImageDecode(imageFile: imageFile, width: width, height: height);
        imageDecodeMap[imageFile.path] = imageDecode;
      } else {
        print('Failed to decode image.');
      }

    } else {
      print('Image file does not exist.');
    }
  }

  ///获取父目录
  String? _fileDirectoryName(File file){
    String directoryName = file.parent.path.split('/').last;
    if(directoryName.endsWith(".imageset")){
      if(iosFilePath.contains(file.parent.path)){
          return null;
      }
      iosFilePath.add(file.parent.path);
      //是 ios文件
      directoryName = file.parent.parent.path.split('/').last;
    }
    return directoryName;
  }

  _copySvg(String copyValue){
    print(copyValue);
    Clipboard.setData(ClipboardData(text: copyValue));
    // 显示Toast消息
    FlutterToastr.show(
        copyValue,
        context,
        duration: FlutterToastr.lengthLong,
        position: FlutterToastr.center);
  }


}

class ImageDecode{
  File? imageFile;
  int? width;
  int? height;
  ImageDecode({this.imageFile, this.width, this.height});
}


