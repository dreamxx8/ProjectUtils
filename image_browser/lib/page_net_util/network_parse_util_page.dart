

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_browser/constant/gaps.dart';
import 'package:image_browser/constant/value_const.dart';
import 'package:image_browser/page_color_manager/widget/color_item.dart';
import 'package:image_browser/page_custom_widget/widget/other/big_button.dart';
import 'package:image_browser/page_custom_widget/widget/other/custom_toast.dart';
import 'package:image_browser/page_net_util/rsa_utils.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/utils/clipboard_util.dart';
import 'package:image_browser/utils/common_border.dart';
//import 'package:encrypt/encrypt.dart';


class NetworkParseUtilPage extends StatefulWidget {
  const NetworkParseUtilPage({Key? key}) : super(key: key);

  @override
  State<NetworkParseUtilPage> createState() => _NetworkParseUtilPageState();
}

class _NetworkParseUtilPageState extends State<NetworkParseUtilPage> {
  TextEditingController controller = TextEditingController();

  FocusNode focusNode = FocusNode();

  String result = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('网络工具'),
        ),
        body: GestureDetector(
          onTap: (){
            focusNode.unfocus();
          },
          child: Container(
            padding: EdgeInsets.symmetric( horizontal: 24),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Container(
                        decoration: RegularBorder(),
                        height: 200,
                        child: TextField(
                          controller: controller,
                          maxLines: null,
                          focusNode: focusNode,
                          decoration: InputDecoration(
                            hintText: '输入加密信息',
                            border: InputBorder.none, // 去掉边框
                          ),
                        ),
                      )
                    ),
                    Gaps.hGap8,
                    Row(
                      children: [
                        BigButton(onPressed: (){
                          parseText();
                        }, text: "解析", option: BigBtnOption(width: 80,),),
                        Gaps.wGap24,
                        BigButton(onPressed: (){
                          ClipboardUtil.setDataToastMsg(result, toastMsg: "复制成功");
                        }, text: "复制", option: BigBtnOption(width: 80),),
                      ],
                    ),
                    Gaps.hGap16,
                    Text("结果", style: bfGlobal.theme.f18W500,),
                    Gaps.hGap16,
                    Text(result, style: bfGlobal.theme.f14W400,),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  void parseText(){
    if(controller.text.isEmpty){
      CustomToast.showError("解析数据不能是空");
      return;
    }
    String decodedString = utf8.decode(base64.decode(controller.text));

    print('Base64解码后的字符串为: $decodedString');

    // final publicKey = RSAKeyParser().parse(CommonConst.NET_RSA_KEY);
    // final encrypter = Encrypter(RSA(publicKey: publicKey));

    // final decrypted = encrypter.decrypt64(decodedString);
    //
    // print(decrypted); // 打印解密后的数据

    String text = RSAUtils.rsaParse(decodedString);
    setState(() {
      result = text;
    });
  }
}



