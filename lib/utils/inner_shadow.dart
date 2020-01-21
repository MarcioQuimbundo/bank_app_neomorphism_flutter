import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;

class InnerShadow extends SingleChildRenderObjectWidget {
  const InnerShadow({
    Key key,
    this.color,
    this.blur,
    this.offset,
    Widget child,
  }) : super(key: key, child: child);

  final Color color;
  final double blur;
  final Offset offset;

  @override
  RenderInnerShadow createRenderObject(BuildContext context) {
    return RenderInnerShadow()
      ..color = color
      ..blur = blur
      ..offset = offset;
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderInnerShadow renderObject) {
    renderObject
      ..color = color
      ..blur = blur
      ..offset = offset;
  }
}

class RenderInnerShadow extends RenderProxyBox {
  RenderInnerShadow({
    RenderBox child,
  }) : super(child);

  @override
  bool get alwaysNeedsCompositing => child != null;

  Color _color;
  double _blur;
  Offset _offset;

  Color get color => _color;
  set color(Color value) {
    if (_color == value) return;
    _color = value;
    markNeedsPaint();
  }

  double get blur => _blur;
  set blur(double value) {
    if (_blur == value) return;
    _blur = value;
    markNeedsPaint();
  }

  Offset get offset => _offset;
  set offset(Offset value) {
    if (_offset == value) return;
    _offset = value;
    markNeedsPaint();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child != null) {
      var layerPaint = Paint()..color = Colors.white;

      var canvas = context.canvas;
      canvas.saveLayer(offset & size, layerPaint);
      context.paintChild(child, offset);
      var shadowPaint = Paint()
        ..blendMode = ui.BlendMode.srcATop
        ..imageFilter = ui.ImageFilter.blur(sigmaX: blur, sigmaY: blur)
        ..colorFilter = ui.ColorFilter.mode(color, ui.BlendMode.srcIn);
      canvas.saveLayer(offset & size, shadowPaint);

      // Invert the alpha to compute inner part.
      var invertPaint = Paint()
        ..colorFilter = const ui.ColorFilter.matrix([
          1,
          0,
          0,
          0,
          0,
          0,
          1,
          0,
          0,
          0,
          0,
          0,
          1,
          0,
          0,
          0,
          0,
          0,
          -1,
          255,
        ]);
      canvas.saveLayer(offset & size, invertPaint);
      canvas.translate(_offset.dx, _offset.dy);
      context.paintChild(child, offset);
      context.canvas.restore();
      context.canvas.restore();
      context.canvas.restore();
    }
  }

  @override
  void visitChildrenForSemantics(RenderObjectVisitor visitor) {
    if (child != null) visitor(child);
  }
}