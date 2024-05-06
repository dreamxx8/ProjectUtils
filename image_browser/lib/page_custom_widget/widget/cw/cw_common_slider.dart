// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:image_browser/theme/bf_global.dart';
import 'package:image_browser/theme/color_ext.dart';
import 'package:intl/intl.dart' show NumberFormat;
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class CWCustomSlider extends StatefulWidget {
  Function? callBack;
  double? sliderValue;
  double? interval;
  double? min;
  double? max;
  bool? showDividers;
  bool? showCircle;
  bool enableTooltip;

  CWCustomSlider({
    Key? key,
    this.sliderValue = 0,
    this.interval,
    this.min,
    this.max,
    this.callBack,
    this.showDividers,
    this.showCircle = false,
    this.enableTooltip = true
  }) : super(key: key);

  @override
  CWCustomSliderState createState() => CWCustomSliderState();
}

class CWCustomSliderState extends State<CWCustomSlider> {
  @override
  String sliderText = '';
  final NumberFormat _numberFormat = NumberFormat('#');
  Widget build(BuildContext context) {
    return SfSliderTheme(
        data: SfSliderThemeData(
          tooltipTextStyle: bfGlobal.themeColors.textWhite.f14W700,
          activeDividerColor: widget.showCircle == true ? bfGlobal.themeColors.iconBrand : bfGlobal.themeColors.iconPrimary,
          activeDividerStrokeColor:  widget.showCircle == true ? bfGlobal.themeColors.iconBrand : bfGlobal.themeColors.iconPrimary,
          inactiveDividerColor:  bfGlobal.themeColors.strokeSecondary,// Color(0xffD7D7D7),
          inactiveDividerStrokeColor: bfGlobal.themeColors.strokeSecondary,

          activeTrackColor: widget.showCircle == true ?  bfGlobal.themeColors.iconBrand : bfGlobal.themeColors.iconPrimary,
          activeTrackHeight: 3,
          inactiveTrackColor: bfGlobal.themeColors.backgroundPrimary,
          inactiveTrackHeight: 3,
          overlayRadius: 0,
          tooltipBackgroundColor: widget.showCircle == true ?  bfGlobal.themeColors.iconBrand : bfGlobal.themeColors.iconPrimary,

          thumbColor: widget.showCircle == true ?  bfGlobal.themeColors.iconBrand : bfGlobal.themeColors.iconPrimary,
          thumbStrokeWidth: 2.0,
          thumbStrokeColor: widget.showCircle == true ?  bfGlobal.themeColors.iconBrand : bfGlobal.themeColors.iconPrimary,
        ),
        child: widget.showCircle == true
            ? SfSlider(
                interval: widget.interval ?? 25,
                showDividers: false,
                min: widget.min ?? 0.0,
                max: widget.max ?? 100.0,
                value: widget.sliderValue ?? 0.0,
                onChanged: (value) {
                  updateSlider(value, "onChanged : $value");
                },
                enableTooltip: widget.enableTooltip,
                // numberFormat: NumberFormat('#.##'),
                numberFormat: NumberFormat('#'),
                tooltipShape: CustomSliderTooltipShape(
                  sliderText: _numberFormat.format(widget.sliderValue).toString(),
                  thumbRadius: 16,
                  fillColor:  bfGlobal.themeColors.iconBrand,
                  borderColor:  bfGlobal.themeColors.iconBrand,
                ),
              )
            : SfSlider(
                interval: widget.interval ?? 25,
                showDividers: widget.showDividers ?? true,
                min: widget.min ?? 0.0,
                max: widget.max ?? 100.0,
                value: widget.sliderValue ?? 0.0,
                thumbShape: CustomSliderThumbShape(
                  thumbRadius: 8,
                  fillColor: bfGlobal.themeColors.backgroundPrimary,
                  borderColor: bfGlobal.themeColors.iconPrimary,
                ),
                dividerShape: _DividerShape(),
                onChanged: (value) {
                  updateSlider(value, "onChanged : $value");
                },
                onChangeStart: (value) {
                  updateSlider(value, "onChangeStart : $value");
                },
                onChangeEnd: (value) {
                  updateSlider(value, "onChangeEnd : $value");
                },
                enableTooltip: widget.enableTooltip,
                numberFormat: NumberFormat('#')));
  }

  void updateSlider(double value, text) {
    widget.sliderValue = value;
    sliderText = text;

    if (widget.callBack != null) {
      widget.callBack!(value.toString());
    }

    setState(() {});
  }
}

class CustomSliderTooltipShape extends SfTooltipShape {
  final double thumbRadius;
  final Color fillColor;
  final Color borderColor;
  final String sliderText;

  const CustomSliderTooltipShape({
    this.sliderText = "",
    this.thumbRadius = 6.0,
    this.fillColor = Colors.white,
    this.borderColor = Colors.black,
  });

  @override
  void paint(PaintingContext context, Offset thumbCenter, Offset offset,
      TextPainter textPainter,
      {required RenderBox parentBox,
      required SfSliderThemeData sliderThemeData,
      required Paint paint,
      required Animation<double> animation,
      required Rect trackRect}) {
    // TODO: implement paint

    final Canvas canvas = context.canvas;

    final rect = Rect.fromCircle(center: Offset(thumbCenter.dx,thumbCenter.dy - 35), radius: thumbRadius);

    final rrect = RRect.fromRectAndRadius(
      Rect.fromPoints(
        Offset(rect.left, rect.top),
        Offset(rect.right, rect.bottom),
      ),
      Radius.circular(thumbRadius),
    );

    final fillPaint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = borderColor
      ..strokeWidth = 0
      ..style = PaintingStyle.stroke;

    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: '$sliderText',
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xffFEFEFE)),
      ),
      textDirection: TextDirection.ltr,
    );

    canvas.drawRRect(rrect, fillPaint);
    textPainter.layout();
    textPainter.paint(context.canvas, Offset(thumbCenter.dx - textPainter.width / 2, thumbCenter.dy  - textPainter.height / 2  - 35));
  }
}

class CustomSliderThumbShape extends SfThumbShape {
  final double thumbRadius;
  final Color fillColor;
  final Color borderColor;

  const CustomSliderThumbShape({
    this.thumbRadius = 6.0,
    this.fillColor = Colors.white,
    this.borderColor = Colors.black,
  });

  Size getPreferredSize(SfSliderThemeData themeData) {
    return Size.fromRadius(themeData.thumbRadius);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required RenderBox parentBox,
      required RenderBox? child,
      required SfSliderThemeData themeData,
      SfRangeValues? currentValues,
      dynamic currentValue,
      required Paint? paint,
      required Animation<double> enableAnimation,
      required TextDirection textDirection,
      required SfThumb? thumb}) {
    final Canvas canvas = context.canvas;

    final rect = Rect.fromCircle(center: center, radius: thumbRadius);

    final rrect = RRect.fromRectAndRadius(
      Rect.fromPoints(
        Offset(rect.left , rect.top ),
        Offset(rect.right , rect.bottom ),
      ),
      Radius.circular(thumbRadius),
    );

    final fillPaint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = borderColor
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    canvas.drawRRect(rrect, fillPaint);
    canvas.drawRRect(rrect, borderPaint);
  }
}

class _DividerShape extends SfDividerShape {
  @override
  void paint(PaintingContext context, Offset center, Offset? thumbCenter,
      Offset? startThumbCenter, Offset? endThumbCenter,
      {required RenderBox parentBox,
      required SfSliderThemeData themeData,
      SfRangeValues? currentValues,
      dynamic currentValue,
      required Paint? paint,
      required Animation<double> enableAnimation,
      required TextDirection textDirection}) {
    final Canvas canvas = context.canvas;

    final rect = Rect.fromCircle(center: center, radius: 4);

    final rrect = RRect.fromRectAndRadius(
      Rect.fromPoints(
        Offset(rect.left , rect.top ),
        Offset(rect.right, rect.bottom ),
      ),
      Radius.circular(4),
    );

    Color? fillColor;
    Color? borderColor;
    switch (textDirection) {
      case TextDirection.ltr:
        final bool isTickMarkRightOfThumb = center.dx > thumbCenter!.dx;
        fillColor = isTickMarkRightOfThumb
            ? themeData.inactiveTrackColor
            : themeData.activeTrackColor!;
        borderColor = isTickMarkRightOfThumb ? themeData.inactiveDividerStrokeColor! : themeData.activeDividerStrokeColor!;
        break;
      case TextDirection.rtl:
        final bool isTickMarkLeftOfThumb = center.dx < thumbCenter!.dx;
        fillColor = isTickMarkLeftOfThumb
            ? themeData.inactiveTrackColor
            : themeData.activeTrackColor!;
        borderColor = isTickMarkLeftOfThumb ? themeData.activeDividerStrokeColor! :  themeData.inactiveDividerStrokeColor!;
        break;
    }
    fillColor = Color(0xfffefefe);

    final borderPaint = Paint()
      ..color = borderColor
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final fillPaint = Paint()
      ..color = fillColor!
      ..style = PaintingStyle.fill;

    canvas.drawRRect(rrect, fillPaint);
    canvas.drawRRect(rrect, borderPaint);
  }
}
