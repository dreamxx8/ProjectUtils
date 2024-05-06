

import 'package:flutter/material.dart';
import 'package:image_browser/page_custom_widget/widget/other/custom_app_bar.dart';
import 'package:image_browser/page_utils_method/widget/util_class.dart';
import 'package:image_browser/page_utils_method/widget/util_class2.dart';
import 'package:image_browser/page_utils_method/widget/util_class3.dart';
import 'package:image_browser/page_utils_method/widget/util_common.dart';
import 'package:image_browser/page_utils_method/widget/util_string.dart';
import 'package:image_browser/page_utils_method/widget/util_string2.dart';
import 'package:image_browser/page_utils_method/widget/util_string3.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/theme/color_ext.dart';

class UtilsMethodPage extends StatefulWidget {
  const UtilsMethodPage({Key? key}) : super(key: key);

  @override
  State<UtilsMethodPage> createState() => _UtilsMethodPageState();
}

class _UtilsMethodPageState extends State<UtilsMethodPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          context,
          title: "Utils",
          backAction: (){

          },
        ),
        body: Container(
          padding: EdgeInsets.all(24),
          child: ListView(
            children: [
              Wrap(
                spacing: 30,
                runSpacing: 30,
                children: [
                  UtilString(),
                  UtilString2(),
                  UtilString3(),
                  UtilCommon(),
                  UtilClass(),
                  UtilClass2(),
                  UtilClass3(),

                ],
              ),
            ],
          ),
        )
    );
  }
}
