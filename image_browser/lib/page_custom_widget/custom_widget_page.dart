

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
import 'package:image_browser/page_custom_widget/example/test_text_span.dart';
import 'package:image_browser/page_custom_widget/example/test_textfeild.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_badge.dart';
import 'package:image_browser/page_custom_widget/widget/other/custom_app_bar.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/theme/color_ext.dart';

class CustomWidgetPage extends StatefulWidget {
  const CustomWidgetPage({Key? key}) : super(key: key);

  @override
  State<CustomWidgetPage> createState() => _CustomWidgetPageState();
}

class _CustomWidgetPageState extends State<CustomWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        title: "Badge",
        backAction: (){

        },
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: ListView(
          children: [
            Wrap(
              children: [
                TestBadge().getBadges(),
                TestButton().getButton(),
                TestCheckbox().getCheckbox(),
                TestDialog().getDialog(context),
                TestDivider().getDivider(),
                TestExpansionTitle().getExpansionTitle(),
                TestFab().getFab(),
                TestInput().getInput(),
                TestNavigation().getNavigation(context),
                TestSelect().getSelect(context),
                TestSlider().getSlider(),
                TestSwitch().getSwitch(),
                TestTab().getTab(),
                TestTextField().getTextField(),
                TestTextSpan().getTextSpan(),
              ],
            ),
          ],
        ),
      )
    );
  }
}
