import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_browser/page_image_manager/image_grid_widget.dart';

class ImageDisplayPage extends StatefulWidget {
  Map<String, List<File>> imageFilesMap;
  bool isCopyCode;
  String size;
  ImageDisplayPage({Key? key, required this.imageFilesMap, this.isCopyCode = false, this.size = "70"})
      : super(key: key);

  @override
  State<ImageDisplayPage> createState() => _ImageDisplayPageState();
}

class _ImageDisplayPageState extends State<ImageDisplayPage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  List<File> imageFiles = [];
  late TabController _controller;
  List<String> titles = [];
  int crossAxisCount = 10;


  @override
  void initState() {
    super.initState();
    titles = widget.imageFilesMap.keys.toList();
    titles.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    _controller =
        TabController(length: widget.imageFilesMap.keys.length, vsync: this);
    _controller.index = 0;
    imageFiles = widget.imageFilesMap[titles[0]] ?? [];
    _controller.addListener(() {
      setState(() {
        imageFiles = widget.imageFilesMap[titles[_controller.index]] ?? [];
      });
    });


  }

  @override
  Widget build(BuildContext context) {
    // double sizeD = double.tryParse(widget.size) ?? 70;
    // double sizeM = sizeD + 40;
    // WidgetsBinding.instance.addObserver(this);
    // if(!_init){
    //   _init = true;
    //   _initMethod();
    // }
    // if(_currentWidth.compareTo(sizeD) != 0){
    //   _calculateCrossCount();
    // }
    imageFiles = widget.imageFilesMap[titles[_controller.index]] ?? [];
    print(_controller.index);
    return Container(
      child: Column(
        children: [
          TabBar(
            controller: _controller,
            tabs: titles.map((title) {
              return Tab(
                child: Text(title),
              );
            }).toList(),
            isScrollable: true,
          ),
          const SizedBox(height: 20,),
          Expanded(
              child: ImageGridWidget(imageFiles: this.imageFiles, isCopyCode: widget.isCopyCode, size: widget.size,)),
        ],
      ),
    );
  }



  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;




}
