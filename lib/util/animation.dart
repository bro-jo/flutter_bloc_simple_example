import 'package:flutter/material.dart';

Animation<double> makeTweenAnimation({
  @required Animation controller,
  @required double begin,
  @required double end,
  Curve curve = Curves.ease,
}) =>
    Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(begin, end, curve: curve),
      ),
    );
