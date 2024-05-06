
import 'package:flutter/services.dart';
import 'package:image_browser/page_custom_widget/widget/other/custom_toast.dart';

//复制粘贴
class ClipboardUtil {
  //复制内容
  static setData(String data) {
    if (data != null && data != '') {
      Clipboard.setData(ClipboardData(text: data));
    }
  }

  //复制内容
  static setDataToast(String data) {
    if (data != null && data != '') {
      Clipboard.setData(ClipboardData(text: data));
    }
  }

  //复制内容
  static setDataToastMsg(String data, {String toastMsg = ''}) {
    if (data != null && data != '') {
      Clipboard.setData(ClipboardData(text: data));
      if (toastMsg.isNotEmpty) {
        CustomToast.show(toastMsg);
      }
    }
  }

//将内容复制系统
//   ClipboardUtil.setData('123');
//从系统获取内容
//   ClipboardUtil.getData().then((data){}).catchError((e){});

}
