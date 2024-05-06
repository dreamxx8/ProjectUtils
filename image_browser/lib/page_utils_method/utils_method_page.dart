

import 'package:flutter/material.dart';
import 'package:image_browser/constant/gaps.dart';
import 'package:image_browser/page_custom_widget/example/test_badge.dart';
import 'package:image_browser/page_custom_widget/example/test_button.dart';
import 'package:image_browser/page_custom_widget/example/test_checkbox.dart';
import 'package:image_browser/page_custom_widget/example/test_dialog.dart';
import 'package:image_browser/page_custom_widget/example/test_divider.dart';
import 'package:image_browser/page_custom_widget/example/test_expansiontile.dart';
import 'package:image_browser/page_custom_widget/example/test_fab.dart';
import 'package:image_browser/page_custom_widget/example/test_input.dart';
import 'package:image_browser/page_custom_widget/example/test_navigation.dart';
import 'package:image_browser/page_custom_widget/example/test_select.dart';
import 'package:image_browser/page_custom_widget/example/test_slider.dart';
import 'package:image_browser/page_custom_widget/example/test_switch.dart';
import 'package:image_browser/page_custom_widget/example/test_tab.dart';
import 'package:image_browser/page_custom_widget/example/test_textfeild.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_badge.dart';
import 'package:image_browser/page_custom_widget/widget/other/custom_app_bar.dart';
import 'package:image_browser/page_utils_method/widget/util_class.dart';
import 'package:image_browser/page_utils_method/widget/util_class2.dart';
import 'package:image_browser/page_utils_method/widget/util_class3.dart';
import 'package:image_browser/page_utils_method/widget/util_common.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/theme/color_ext.dart';

class UtilsMethodPage extends StatefulWidget {
  const UtilsMethodPage({Key? key}) : super(key: key);

  @override
  State<UtilsMethodPage> createState() => _UtilsMethodPageState();
}

class _UtilsMethodPageState extends State<UtilsMethodPage> {
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
