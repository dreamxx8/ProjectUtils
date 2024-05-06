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
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/theme/color_ext.dart';

class UtilClass2 extends StatefulWidget {
  const UtilClass2({Key? key}) : super(key: key);

  @override
  State<UtilClass2> createState() => _UtilClass2State();
}

class _UtilClass2State extends State<UtilClass2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      width: 400,
      color: Colors.blue.withOpacity(0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomGestrureWidget(
              content: "await DeviceInfo.deviceInfo",
              child: item("获取设备信息",
                  "await DeviceInfo.deviceInfo")),
          Gaps.hGap24,
          CustomGestrureWidget(
            content: "EncryptUtils.encryption(content)",
              child: item("密码加密算法RSA", "EncryptUtils.encryption(content)\nEncryptUtils.encryptionWeb(content)")),
          Gaps.hGap24,
          CustomGestrureWidget(
              content: "Log.i(String tag, List? message)",
              child: item("打印日志", "Android-Log.i(String tag, List? message).. \n iOS- Log.inIOS(dynamic message, {String? tag})")),
          Gaps.hGap24,
          CustomGestrureWidget(
              content: "SPUtils.getInstance()",
              child: item("SPUtils 数据持久化", "SPUtils.getInstance()")),
          Gaps.hGap24,
          CustomGestrureWidget(
            content: "时间工具类...",
            child: item("时间工具 CustomDateUtils",
                "CustomDateUtils.(...)"),
          ),
          Gaps.hGap24,
          CustomGestrureWidget(
            content: "CountDownUtils(int start, int end, {this.callBack})",
            child: item("倒计时工具",
                "CountDownUtils(int start, int end, {this.callBack})"),
          ),
        ],
      ),
    );
  }

  Widget item(title, method) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: bfGlobal.themeColors.textPrimary.f18W700,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          method,
          style: bfGlobal.themeColors.textSecondary.f16W400,
        ),
      ],
    );
  }
}
