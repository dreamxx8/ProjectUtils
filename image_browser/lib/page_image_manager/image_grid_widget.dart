
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:image_browser/page_image_manager/image_browser_page.dart';
import 'package:path/path.dart' as path;
import 'package:process_runner/process_runner.dart';

class ImageGridWidget extends StatefulWidget {
  String size;
  List<File> imageFiles = [];
  bool isCopyCode;

  ImageGridWidget({Key? key, this.size = "70", required this.imageFiles, this.isCopyCode = false}) : super(key: key);

  @override
  State<ImageGridWidget> createState() => _ImageGridWidgetState();
}

class _ImageGridWidgetState extends State<ImageGridWidget> with WidgetsBindingObserver {
  int crossAxisCount = 10;
  late double _currentWidth;
  bool _init =false;

  _initMethod(){
    _calculateCrossCount();
  }
  @override
  void didChangeMetrics() {
    super.didChangeMetrics();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      // 在屏幕大小变化后执行代码
      _calculateCrossCount();
    });
  }

  _calculateCrossCount(){
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double screenWidth = mediaQueryData.size.width;
    double sizeD = double.tryParse(widget.size) ?? 70;
    double sizeM = sizeD + 50;
    _currentWidth = sizeD;
    int count = (screenWidth/sizeM).truncate();
    if(count != crossAxisCount){
      setState(() {
        crossAxisCount = count;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double sizeD = double.tryParse(widget.size) ?? 70;
    double sizeM = sizeD + 40;
    WidgetsBinding.instance.addObserver(this);
    if(!_init){
      _init = true;
      _initMethod();
    }
    if(_currentWidth.compareTo(sizeD) != 0){
      _calculateCrossCount();
    }
    return  GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.95
        ),
        itemCount: widget.imageFiles.length,
        itemBuilder: (context, index) {
          File file = widget.imageFiles[index];
          print("fileNamePath = ${file.path}");
          String fileName = path.basename(file.path);
          ImageDecode? imageDecode = imageDecodeMap[file.path];
          return GestureDetector(
            onSecondaryTapDown: (detail){
              showPopupMenu(context, detail.globalPosition, file);
            },
            onTap: (){
              //ImageSourceConst
              // String directoryName = file.parent.path.split('/').last;
              // if(directoryName.endsWith(".imageset")){
              //   String value = directoryName.replaceAll(".imageset", '');
              //   _copyIos(value);
              // } else if(path.extension(file.path) == '.svg'){
              //   String copyValue = "ImageSourceConst.${fileName.split('.')[0].toUpperCase()}";
              //   _copySvg(fileName.split('.')[0].toUpperCase());
              // }else{
              //   String copyValue = "ImageSourceConst.${fileName.split('.')[0].toUpperCase()}";
              //   _copyPng(fileName.split('.')[0].toUpperCase());
             // }

            },
            child: Container(
              width: sizeM,
              child: Column(
                children: [
                  Container(
                    width: sizeD,
                    height: sizeD,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    child: path.extension(file.path) == '.svg'
                        ? SvgPicture.file(file)
                        : Image.file(file),
                  ),
                  Text("${fileName}${imageDecode != null ? "-${imageDecode.height}*${imageDecode.width}" : ""}", style: TextStyle(fontSize: fontSize(sizeD/8)),)
                ],
              ),
            ),
          );

        });
  }

  void showPopupMenu(BuildContext context, Offset position, File file) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(position.dx, position.dy, position.dx, position.dy),
      items: [
        PopupMenuItem(
          child: Text('Show in Finder'),
          value: 'edit',
          onTap: () async {
            //final result = await Process.run('open', [file.parent.absolute.path]);
            final directoryPath = file.parent.absolute.path;
            final result = await Process.run('open', ['-R', file.path], workingDirectory: directoryPath);
            print(result.stdout);
            print(result.stderr);
          },
        ),
        PopupMenuItem(
          child: Text('Copy Code'),
          value: 'Copy',
          onTap: () async {
            copy(file, true);
          },
        ),
        PopupMenuItem(
          child: Text('Copy Name'),
          value: 'Copy',
          onTap: () async {
            copy(file, false);
          },
        ),
      ],
    ).then((value) {
      if (value == 'edit') {
        print('Edit clicked');
      } else if (value == 'delete') {
        print('Delete clicked');
      }
    });
  }

  void copy(File file, bool isCode){
    //ImageSourceConst
    widget.isCopyCode = isCode;
    String fileName = path.basename(file.path);
    String directoryName = file.parent.path.split('/').last;
    if(directoryName.endsWith(".imageset")){
      String value = directoryName.replaceAll(".imageset", '');
      _copyIos(value);
    } else if(path.extension(file.path) == '.svg'){
      String copyValue = "ImageSourceConst.${fileName.split('.')[0].toUpperCase()}";
      _copySvg(fileName.split('.')[0].toUpperCase());
    }else{
      String copyValue = "ImageSourceConst.${fileName.split('.')[0].toUpperCase()}";
      _copyPng(fileName.split('.')[0].toUpperCase());
    }
  }


  double fontSize(double size){
    if(size > 16){
      return 16.0;
    }
    if(size < 8){
      return 8.0;
    }

    return size;
  }

  _copySvg(String copyValue){
    copyValue = "ImageSourceConst.${copyValue}";
    if(widget.isCopyCode){
      copyValue = "SvgPicture.asset(${copyValue})";
    }
    print(copyValue);
    Clipboard.setData(ClipboardData(text: copyValue));
    // 显示Toast消息
    _showToast(copyValue);

  }

  _copyPng(String copyValue){
    copyValue = "ImageSourceConst.${copyValue}";
    if(widget.isCopyCode){
      copyValue = "Image.asset(${copyValue})";
    }
    print(copyValue);
    Clipboard.setData(ClipboardData(text: copyValue));
    // 显示Toast消息
    _showToast(copyValue);

  }


  _copyIos(String copyValue){
    print(copyValue);
    Clipboard.setData(ClipboardData(text: copyValue));
    _showToast(copyValue);
  }


  _showToast(String value){
    // 显示Toast消息
    FlutterToastr.show(
        "复制：" + value,
        context,
        duration: FlutterToastr.lengthShort,
        position: FlutterToastr.center);
  }

}
