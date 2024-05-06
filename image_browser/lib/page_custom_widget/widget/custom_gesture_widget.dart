

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_toastr/flutter_toastr.dart';

class CustomGestrureWidget extends StatelessWidget {

  final Widget? child;
  final String? content;
  const CustomGestrureWidget({Key? key, this.child, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onSecondaryTapDown: (detail){
        showPopupMenu(context, detail.globalPosition);
      },
      child: child,
    );
  }


  void showPopupMenu(BuildContext context, Offset position) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(position.dx, position.dy, position.dx, position.dy),
      items: [
        PopupMenuItem(
          child: Text('复制'),
          value: 'edit',
          onTap: () async {
            print(content ?? "");
            Clipboard.setData(ClipboardData(text: content ?? ""));
            _showToast(context, content ?? "");
          },
        ),
      ],
    ).then((value) {
      if (value == 'edit') {
        print('Edit clicked');
      } else if (value == 'delete') {
        print('Delete clicked');
      }
    });
  }

  _showToast(context, String value){
    // 显示Toast消息
    FlutterToastr.show(
        "复制：" + value,
        context,
        duration: FlutterToastr.lengthShort,
        position: FlutterToastr.center);
  }



}
