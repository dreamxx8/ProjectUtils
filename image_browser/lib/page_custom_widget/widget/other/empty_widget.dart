import 'package:image_browser/constant/color_const.dart';
import 'package:image_browser/constant/gaps.dart';
import 'package:image_browser/constant/value_const.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_browser/utils/event_bus_utils.dart';
import 'package:image_browser/utils/lc_styles.dart';
import 'package:flutter/material.dart';



class EmptyWidget extends StatefulWidget {

  static bool isGlobalError = false;

  EmptyWidget({Key? key,this.text, this.height, this.isNotNetworkError = false}) : isNetworkError = EmptyWidget.isGlobalError , super(key: key);
  final String? text;
  final double? height;
  bool isNetworkError;
  final bool isNotNetworkError;
  @override
  State<EmptyWidget> createState() => _EmptyWidgetState();
}

class _EmptyWidgetState extends State<EmptyWidget> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    String defaut = "无数据";
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        Container(
            height: widget.height,
            alignment: Alignment.center,
            child: (EmptyWidget.isGlobalError && !widget.isNotNetworkError) ? netErrorNoData(context) : normalNoData(widget.text ?? defaut)
        ),
      ],
    );
  }

  Widget normalNoData(String text){
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(ImageSourceConst.ICON_NO_DATA, height: 85, width: 64),
        Gaps.hGap8,
        Text(text, style: StRegular(14, text_main2),textAlign: TextAlign.center,),
        Gaps.hGap16,
      ],
    );
  }

  Widget netErrorNoData(BuildContext context){
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(ImageSourceConst.IC_NETWORK_ERROR, height: 81, width: 81),
        Gaps.hGap15,
        Text("网络错误", style: StMedium(14, text_main),textAlign: TextAlign.center,),
        Gaps.hGap9,
        //请检网络连接,然后下拉刷新页面
        Text("请检网络连接,然后下拉刷新页面", style: StRegular(12, text_main2),textAlign: TextAlign.center,),

      ],
    );
  }
}


/// 空态页面
// class EmptyWidget extends StatefulWidget {
//   final String? text;
//   final double? height;
//   final bool isNetworkError;
//   EmptyWidget({this.text, this.height, this.isNetworkError = false}) : super(child: _getChild(text, height, isNetworkError));
//
//   static Widget _getChild(String? text, double? height, bool isNetworkError) {
//     BuildContext? context =
//         inject<NavigateService>().navigator?.overlay?.context;
//     String defaut = "";
//     if(context != null){
//       defaut = S.of(context).assets_common_no_data;
//     }
//     Widget normal = normalNoData(text ?? defaut);
//     Widget error = normalNoData(text ?? defaut);
//     if(context != null && isNetworkError){
//       error = netErrorNoData(context);
//     }
//     return ListView(
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       children: <Widget>[
//         Container(
//           height: height,
//           alignment: Alignment.center,
//           child: isNetworkError ? error : normal
//         ),
//       ],
//     );
//   }
//
//  static Widget normalNoData(String text){
//     return  Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Image.asset(ImageSourceConst.ICON_NO_DATA, height: 90, width: 90),
//         Text(text, style: StRegular(14, text_main2),textAlign: TextAlign.center,),
//       ],
//     );
//   }
//
//   static Widget netErrorNoData(BuildContext? context){
//     return  Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Image.asset(ImageSourceConst.IC_NETWORK_ERROR, height: 81, width: 81),
//         SizedBox(height: 15,),
//         Text("网络错误", style: StMedium(14, text_main),textAlign: TextAlign.center,),
//         SizedBox(height: 9,),
//         Text("请检网略连接,然后下拉刷新页面", style: StRegular(12, text_main2),textAlign: TextAlign.center,),
//
//       ],
//     );
//   }
// }
