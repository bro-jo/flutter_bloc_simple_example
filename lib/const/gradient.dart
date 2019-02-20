import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/const/color.dart';

class MGradient {
  static final primary = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomRight,
    colors: [MColor.primary, MColor.secondary],
  );
}
