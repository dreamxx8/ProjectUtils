
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:image_browser/constant/color_const.dart';

class DottedUnderlineText extends StatelessWidget {
  final String text;
  final TextStyle style;
  VoidCallback? clickAction;
  DottedUnderlineText(this.text, this.style, {this.clickAction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(this.clickAction != null){
          this.clickAction!();
        }
      },
      child: CustomPaint(
        painter: MyDashPainter(),
        child: Text(
          text,
          style: this.style,
        ),
      ),
    );
  }
}

/// 虚线
class MyDashPainter extends CustomPainter {
  late Rect _rect;
  late Paint _paint;

  MyDashPainter() {
    _paint = Paint();
    _paint.style = PaintingStyle.stroke;
    _paint.strokeWidth = 2;
  }

  @override
  void paint(Canvas canvas, Size size) {
    //canvas.drawColor(Colors.black, BlendMode.color);

    _rect = Rect.fromLTWH(
        2, 0, size.width-2, size.height+2);

    _paint.color = color_dash;
    canvas.drawDashLine(_rect.bottomLeft, _rect.bottomRight, 2, 2, _paint);
    //canvas.drawDashLine(_rect.topLeft, _rect.topRight, 3, 3, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

/// Canvas扩展函数
/// @Author weitianpeng
/// @Create 2021-3-28
///
extension CanvasExt on Canvas {
  ///绘制虚线
  ///[p1] 起点
  ///[p2] 终点
  ///[dashWidth] 实线宽度
  ///[spaceWidth] 空隙宽度
  void drawDashLine(
      Offset p1,
      Offset p2,
      double dashWidth,
      double spaceWidth,
      Paint paint,
      ) {
    assert(dashWidth > 0);
    assert(spaceWidth > 0);

    double radians;

    if (p1.dx == p2.dx) {
      radians = (p1.dy < p2.dy) ? pi / 2 : pi / -2;
    } else {
      radians = atan2(p2.dy - p1.dy, p2.dx - p1.dx);
    }

    this.save();
    this.translate(p1.dx, p1.dy);
    this.rotate(radians);

    var matrix = Matrix4.identity();
    matrix.translate(p1.dx, p1.dy);
    matrix.rotateZ(radians);
    matrix.invert();

    var endPoint = MatrixUtils.transformPoint(matrix, p2);

    double tmp = 0;
    double length = endPoint.dx;
    double delta;

    while (tmp < length) {
      delta = (tmp + dashWidth < length) ? dashWidth : length - tmp;
      this.drawLine(Offset(tmp, 0), Offset(tmp + delta, 0), paint);
      if (tmp + delta >= length) {
        break;
      }

      tmp = (tmp + dashWidth + spaceWidth < length)
          ? (tmp + dashWidth + spaceWidth)
          : (length);
    }

    this.restore();
  }

  ///绘制虚线
  ///[rect] 矩形
  ///[dashWidth] 实线宽度
  ///[spaceWidth] 空隙宽度
  void drawDashRect(
      Rect rect,
      double dashWidth,
      double spaceWidth,
      Paint paint,
      ) {
    drawDashLine(rect.topLeft, rect.topRight, dashWidth, spaceWidth, paint);
    drawDashLine(rect.topRight, rect.bottomRight, dashWidth, spaceWidth, paint);
    drawDashLine(
        rect.bottomRight, rect.bottomLeft, dashWidth, spaceWidth, paint);
    drawDashLine(rect.bottomLeft, rect.topLeft, dashWidth, spaceWidth, paint);
  }
}
