import 'dart:math';

import 'package:flutter/material.dart';

class WaveProgress extends StatefulWidget {
  final double size;
  final Color borderColor, fillColor;
  final double progress;

  WaveProgress(this.size, this.borderColor, this.fillColor, this.progress);

  @override
  WaveProgressState createState() => new WaveProgressState();
}

class WaveProgressState extends State<WaveProgress>
    with TickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2500),
    );

    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        width: widget.size,
        height: widget.size,
        decoration: new BoxDecoration(
            color: widget.fillColor.withOpacity(.1),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: widget.fillColor.withOpacity(.2),
                  blurRadius: 10,
                  offset: Offset(0, 10))
            ]),
        child: ClipPath(
            clipper: CircleClipper(),
            child: new AnimatedBuilder(
                animation: controller,
                builder: (BuildContext context, Widget child) {
                  return new CustomPaint(
                      painter: WaveProgressPainter(
                          controller,
                          widget.borderColor,
                          widget.fillColor,
                          widget.progress));
                })));
  }
}

class WaveProgressPainter extends CustomPainter {
  Animation<double> _animation;
  Color borderColor, fillColor;
  double _progress;

  WaveProgressPainter(
      this._animation, this.borderColor, this.fillColor, this._progress)
      : super(repaint: _animation);

  @override
  void paint(Canvas canvas, Size size) {
    // draw small wave
    Paint wave2Paint = new Paint()..color = fillColor.withOpacity(0.5);
    double p = _progress / 100.0;
    double n = 4.2;
    double amp = 1.0;
    double baseHeight = (1 - p) * size.height;

    Path path = Path();
    path.moveTo(0.0, baseHeight);
    for (double i = 0.0; i < size.width; i++) {
      path.lineTo(
          i,
          baseHeight +
              sin((i / size.width * 2 * pi * n) +
                      (_animation.value * 2 * pi) +
                      pi * 1) *
                  amp);
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    canvas.drawPath(path, wave2Paint);

    // draw big wave
    Paint wave1Paint = new Paint()..color = fillColor;
    n = 1.7;
    amp = 4.0;

    path = Path();
    path.moveTo(0.0, baseHeight);
    for (double i = 0.0; i < size.width; i++) {
      path.lineTo(
          i,
          baseHeight +
              sin((i / size.width * 2 * pi * n) + (_animation.value * 2 * pi)) *
                  amp);
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    canvas.drawPath(path, wave1Paint);

    // draw border
    Paint borderPaint = new Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class CircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..addOval(new Rect.fromCircle(
          center: new Offset(size.width / 2, size.height / 2),
          radius: size.width / 2));
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
