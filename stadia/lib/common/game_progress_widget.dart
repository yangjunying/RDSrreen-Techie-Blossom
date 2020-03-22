import 'package:flutter/material.dart';
import '../config_index.dart';

class GameProgressWidget extends StatefulWidget {
  final double gameProgress;
  final double screenWidth;

  GameProgressWidget({Key key, this.gameProgress, this.screenWidth})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _GameProgressWidgetState();
  }
}

class _GameProgressWidgetState extends State<GameProgressWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> progressAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));
    progressAnimation = Tween<double>(
            begin: 0, end: widget.screenWidth * 0.33 * widget.gameProgress)
        .animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final width = widget.screenWidth * 0.33;
    return AnimatedBuilder(
      animation: progressAnimation,
      builder: (context, widget) {
        return Stack(
          children: <Widget>[
            Container(
              width: width,
              height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
                border: Border.all(
                  color: tertiaryTextColor,
                  width: 1,
                ),
              ),
            ),
            Container(
              width: progressAnimation.value,
              height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
                gradient: appGradient,
              ),
            )
          ],
        );
      },
    );
  }
}
