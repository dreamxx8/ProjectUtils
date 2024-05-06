
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_browser/page_image_manager/image_browser_page.dart';
import 'package:image_browser/page_image_manager/image_grid_widget.dart';
import 'package:path/path.dart' as path;
import 'package:shared_preferences/shared_preferences.dart';

class ImageSearchPage extends StatefulWidget {
  const ImageSearchPage({Key? key}) : super(key: key);

  @override
  State<ImageSearchPage> createState() => _ImageSearchPageState();
}

class _ImageSearchPageState extends State<ImageSearchPage> {

  TextEditingController textEditingController = TextEditingController();
  List<File> imageFiles = [];
  GlobalKey globalKey = GlobalKey();
  String size = "100";
  @override
  void initState() {
    super.initState();
    List<File> allPngs = segmentPngMap['all'] ?? [];
    List<File> allSvgs = segmentSvgMap['all'] ?? [];
    List<File> all = [];
    all.addAll(allSvgs);
    all.addAll(allPngs);
    textEditingController.addListener(() {
      List<File> filters = [];
      if(textEditingController.text.isNotEmpty){
        all.forEach((file) {
          String fileName = path.basename(file.path).toUpperCase();
          String directoryName = file.parent.path.split('/').last.toUpperCase();
          if(directoryName.contains(textEditingController.text.toUpperCase())
              || fileName.contains(textEditingController.text.toUpperCase())){
            filters.add(file);
          }
        });
      }
      setState(() {
        imageFiles = filters;
      });
    });

    _getLocalPath();

  }


  _getLocalPath() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? contentSize = prefs.getString("size");
    if(contentSize != null){
      setState(() {
        size = contentSize;
      });
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("搜索"),),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 40,
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
                  contentPadding:  EdgeInsets.symmetric(vertical: 0),
                  alignLabelWithHint: false,
                  border: InputBorder.none,
                  hintText: "输入搜索名称",
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
            SizedBox(height: 20,),
            Expanded(
                child: ImageGridWidget(imageFiles: this.imageFiles, size: size,)),
          ],


        ),
      ),
    );
  }
}
