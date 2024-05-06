import 'package:flutter/material.dart';
import 'package:image_browser/constant/gaps.dart';
import 'package:image_browser/constant/value_const.dart';
import 'package:image_browser/page_custom_widget/widget/custom_gesture_widget.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_badge.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_checkbox.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_divider.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_expansiontile.dart';
import 'package:image_browser/page_custom_widget/widget/cw/cw_common_fab.dart';
import 'package:image_browser/page_custom_widget/widget/other/custom_toast.dart';
import 'package:image_browser/page_utils_method/widget/item/utils_item.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/theme/color_ext.dart';

class UtilClass3 extends StatefulWidget {
  const UtilClass3({Key? key}) : super(key: key);

  @override
  State<UtilClass3> createState() => _UtilClass3State();
}

class _UtilClass3State extends State<UtilClass3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      width: 400,
      color: Colors.red.withOpacity(0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomGestrureWidget(
              content: "SystemUtils",
              child: UtilsItem("SystemUtils返回 endRefresh",
                  "SystemUtils.backToSystomApp()\nSystemUtils.endRefresh(RefreshController refreshController)")),
          Gaps.hGap24,
          CustomGestrureWidget(
            content: "EncryptUtils.encryption(content)",
              child: UtilsItem("密码加密算法RSA", "EncryptUtils.encryption(content)\nEncryptUtils.encryptionWeb(content)")),
          Gaps.hGap24,
          CustomGestrureWidget(
              content: "Map<String, dynamic> verifyResult = await GT4Captcha().verify();",
              child: UtilsItem("极验 GT4Captcha", "Map<String, dynamic> verifyResult = await GT4Captcha().verify();")),
          Gaps.hGap24,
        ],
      ),
    );
  }

}
