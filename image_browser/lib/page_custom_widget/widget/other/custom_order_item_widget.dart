import 'package:image_browser/constant/color_const.dart';
import 'package:image_browser/constant/gaps.dart';
import 'package:image_browser/constant/value_const.dart';
import 'package:image_browser/page_custom_widget/widget/other/custom_cached_network_image.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/utils/clipboard_util.dart';
import 'package:image_browser/utils/lc_styles.dart';
import 'package:flutter/material.dart';

///订单中 item
class CustomOrderItemWidget extends StatelessWidget {
  String title;
  String content;
  String? contentImage;
  bool isNetworkImage = false;

  //是否有复制按钮
  bool isCopy = false;
  TextStyle? contentStyle;
  TextStyle? titleStyle;
  GestureTapCallback? callback;
  Color? background;

  CustomOrderItemWidget(
      {Key? key,
      required this.title,
      required this.content,
      this.isCopy = false,
      this.isNetworkImage = false,
      this.contentStyle,
      this.titleStyle,
      this.contentImage,
      this.callback,
      this.background})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          //title
          Container(
            constraints: const BoxConstraints(maxWidth: 120),
            child: Text(
              title,
              style: titleStyle != null ? titleStyle : StRegular(12, text_main2),
            ),
          ),
          Gaps.wGap20,
          //content
          Expanded(
            child: InkWell(
              onTap: () {
                _copyContent(context);
                if (this.callback != null) {
                  this.callback!();
                }
              },
              child: Container(
                color: this.background ?? bfGlobal.themeColors.backgroundPrimary,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    this.contentImage != null
                        ? getContentImage(this.contentImage!): Container(),
                    Gaps.wGap8,
                    Flexible(
                      // constraints: BoxConstraints(
                      //   maxWidth: 220,
                      //   minWidth: 0
                      // ),
                      child: Text(
                        content,
                        textAlign: TextAlign.end,
                        style: contentStyle != null ? contentStyle : StMedium(12, text_main),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //复制
          isCopy
              ? InkWell(
                  onTap: () {
                    _copyContent(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Image.asset(
                      ImageSourceConst.ICON_COPY,
                      width: 16,
                      height: 16,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  _copyContent(BuildContext context) {
    if (isCopy == true) {
      ClipboardUtil.setDataToastMsg(content, toastMsg: "复制成功");
    }
  }

  Widget getContentImage(String contentImage){
    if(this.isNetworkImage){
      return ClipOval(child: CustomCachedNetworkImage(this.contentImage, width: 20, height: 20));
    }
    if(contentImage.startsWith("http")){
      return CustomCachedNetworkImage(
        contentImage,
        width: 20,
        height: 20,
      );
    }else{
      return Image.asset(
        contentImage,
        width: 20,
        height: 20,
      );
    }

  }

}
