import 'dart:async';
import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/const/color.dart';
import 'package:flutter_bloc_example/const/routes.dart';

class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    _initAnimation();

    Timer(Duration(milliseconds: 2500), () async {
      Navigator.pushReplacementNamed(context, Routes.HELLO);
    });
  }

  dispose() {
    _disposeAnimation();
    super.dispose();
  }

  void _initAnimation() {
    controller = AnimationController(duration: Duration(milliseconds: 2000), vsync: this);

    animation = Tween(begin: 2.5, end: 0.1).animate(controller)
      ..addListener(() => setState(() {}));

    controller.forward();
  }

  void _disposeAnimation() {
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(
          body: Container(
              color: MColor.gray8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(child: Container(), flex: 100),
                  Opacity(
                    child: FlutterLogo(size: 128),
                    opacity: min(1, animation.value),
                  ),
                  Flexible(child: Container(), flex: 105),
                ],
              )
          )
      );
}
