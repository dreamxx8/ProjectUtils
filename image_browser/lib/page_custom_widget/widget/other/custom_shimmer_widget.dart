import 'package:flutter/material.dart';
import 'package:image_browser/utils/common_border.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerWidget extends StatelessWidget {

  final ShapeBorder shapeBorder;
  final Color baseColor;
  final Color highlightColor;
  final double? height;
  final double? width;
  final double? radius;
  //如果child 不传 需要传width和height，否则没有效果
  final Widget? child;
  const CustomShimmerWidget({
    Key? key,
    this.child,
    this.height,
    this.width,
    this.radius = 2.0,
    this.shapeBorder = const RoundedRectangleBorder(),
    this.baseColor = const Color(0x80000000),
    this.highlightColor = const Color(0x33000000),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Decoration? decoration;
    if(radius != null){
      decoration = RegularRadius(color: const Color(0x4D000000), radius: radius!);
    }
    return Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: child ?? ShimmerContainer(height: height, width: width, decoration: decoration,)
    );
  }
}

/// 封装container 默认背景颜色
class ShimmerContainer extends Container{

  ShimmerContainer({super.key, double? width, double? height, Color? color, Decoration? decoration} ) :
        super(width: width, height: height, color: color ?? (decoration == null ? const Color(0x4D000000) : null), decoration: decoration);

}
