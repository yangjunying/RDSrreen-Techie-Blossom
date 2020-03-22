import 'package:flutter/material.dart';
import 'package:stadia/styleguide/text_styles.dart';
import 'package:vector_math/vector_math_64.dart' as math;
import '../styleguide/colors.dart';

class RoundedImageWidget extends StatelessWidget {
  final String imagePath;
  final bool showRanking;
  final String name;
  final isOnline;
  final int ranking;
  final imageSize = 80.0;

  RoundedImageWidget(
      {Key key,
      this.imagePath,
      this.showRanking = false,
      this.name,
      this.isOnline = false,
      this.ranking})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          height: imageSize + 8,
          child: Stack(
            children: <Widget>[
              CustomPaint(
                painter: RoundedImageBorder(isOnline: isOnline),
                child: Container(
                  width: imageSize,
                  height: imageSize,
                  child: ClipOval(
                    child: Image.asset(imagePath, fit: BoxFit.cover),
                  ),
                ),
              ),
              if (showRanking)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: ClipOval(
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        gradient: appGradient,
                      ),
                      child: Center(
                        child: Text(
                          ranking.toString(),
                          style: rankTextStyle,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        if (name != null)
          Text(
            name,
            style: bodyTextStyle,
          ), 
      ],
    );
  }
}

class RoundedImageBorder extends CustomPainter {
  final bool isOnline;
  RoundedImageBorder({this.isOnline});

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Offset center = Offset(size.width / 2, size.height / 2);
    Paint borderPaint = Paint()
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    if (isOnline) {
      borderPaint.shader = appGradient.createShader(
          Rect.fromCircle(center: center, radius: size.width / 2));
    } else {
      borderPaint.color = tertiaryTextColor;
    }

    canvas.drawArc(Rect.fromCircle(center: center, radius: size.width / 2),
        math.radians(-90), math.radians(360), false, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
