
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_browser/constant/color_const.dart';
import 'package:image_browser/constant/gaps.dart';
import 'package:image_browser/constant/value_const.dart';
import 'package:image_browser/utils/common_border.dart';
import 'package:image_browser/utils/lc_styles.dart';

class CustomWarningWidget extends StatelessWidget {

  final String content;
  const CustomWarningWidget({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: RegularRadius(color: text_waiting.withOpacity(0.1), radius: 4.0),
      child: Row(
        children: [
          SvgPicture.asset(ImageSourceConst.COMMON_WARNING_2, height: 16, width: 16,),
          Gaps.wGap4,
          Expanded(
              child: Text(content, style: StRegular(12, text_waiting),))
        ],
      ),


    );
  }
}
