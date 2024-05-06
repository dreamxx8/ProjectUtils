import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRRecTabFulIndicator extends Decoration {
  /// Create an underline style selected tab indicator.
  ///
  /// The [borderSide] and [insets] arguments must not be null.
  const CustomRRecTabFulIndicator(
      {this.borderSide = const BorderSide(width: 4.0, color: Colors.white),
      this.insets = EdgeInsets.zero,
      this.width,
      this.radius,
      this.margin = 2,
      this.color})
      : assert(borderSide != null),
        assert(insets != null);

  /// The color and weight of the horizontal line drawn below the selected tab.
  final BorderSide borderSide;

  final double? radius;

  final double? width;

  final Color? color;

  final double margin;

  /// Locates the selected tab's underline relative to the tab's boundary.
  ///
  /// The [TabBar.indicatorSize] property can be used to define the
  /// tab indicator's bounds in terms of its (centered) tab widget with
  /// [TabIndicatorSize.label], or the entire tab with [TabIndicatorSize.tab].
  final EdgeInsetsGeometry? insets;

  @override
  Decoration? lerpFrom(Decoration? a, double t) {
    if (a is CustomRRecTabFulIndicator) {
      return CustomRRecTabFulIndicator(
        borderSide: BorderSide.lerp(a.borderSide, borderSide, t),
        insets: EdgeInsetsGeometry.lerp(a.insets, insets, t),
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  Decoration? lerpTo(Decoration? b, double t) {
    if (b is CustomRRecTabFulIndicator) {
      return CustomRRecTabFulIndicator(
        borderSide: BorderSide.lerp(borderSide, b.borderSide, t),
        insets: EdgeInsetsGeometry.lerp(insets, b.insets, t),
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  _UnderlinePainter createBoxPainter([VoidCallback? onChanged]) {
    return _UnderlinePainter(this, onChanged);
  }
}

class _UnderlinePainter extends BoxPainter {
  _UnderlinePainter(this.decoration, VoidCallback? onChanged)
      : assert(decoration != null),
        super(onChanged);

  final CustomRRecTabFulIndicator decoration;

  BorderSide get borderSide => decoration.borderSide;

  EdgeInsetsGeometry? get insets => decoration.insets;

  Rect _indicatorRectFor(Rect rect, TextDirection textDirection) {
    assert(rect != null);
    assert(textDirection != null);
    final Rect? indicator = insets?.resolve(textDirection).deflateRect(rect);

    //取中间坐标
    if (indicator != null) {
      double cw = (indicator.left + indicator.right) / 2;
      return Rect.fromLTRB(
        indicator.left + decoration.margin,
        indicator.top + decoration.margin,
        indicator.right - decoration.margin,
        indicator.bottom - decoration.margin,
      );
    } else {
      return Rect.zero;
    }
  }

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);
    final Rect rect = offset & configuration.size!;
    final TextDirection textDirection = configuration.textDirection!;
    final Rect rect11 = _indicatorRectFor(rect, textDirection);
    final RRect rRect = RRect.fromRectAndRadius(
        rect11, Radius.circular(decoration.radius ?? 0));
    canvas.drawRRect(
        rRect,
        Paint()
          ..style = PaintingStyle.fill
          ..color = decoration.color ?? Colors.white);
  }
}
