import 'package:flutter/material.dart';
import 'package:flutterstadia/styleguide/colors.dart';

class GameProgressWidget extends StatefulWidget{

  final double gameProgress, screenWidth;

  const GameProgressWidget({Key key, this.gameProgress, this.screenWidth})
      : super(key: key);

  @override
  _GameProgressWidgetState createState() => _GameProgressWidgetState();
}

class _GameProgressWidgetState extends State<GameProgressWidget>
    with SingleTickerProviderStateMixin {

  Animation<double> progressAnimation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration:
    const Duration(milliseconds: 1500));

    progressAnimation = Tween<double>(begin: 0, end: widget.screenWidth * 0.33
    * widget.gameProgress).animate(controller);

    controller.forward();

  }
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final width = widget.screenWidth *  0.33;

    return AnimatedBuilder(
      animation: progressAnimation,
        builder:(ctx, widget){
          return Stack(
            children: <Widget>[
              Container(
                width: width,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  border: Border.all(color: kTertiaryTextColor,width: 1)
                ),
              ),
              Container(
                width: progressAnimation.value,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  gradient: kAppGradient
                ),
              )
            ],
          );
    }
        );
  }
}
