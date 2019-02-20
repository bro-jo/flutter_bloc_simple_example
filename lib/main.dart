import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/const/color.dart';
import 'package:flutter_bloc_example/const/routes.dart';
import 'package:flutter_bloc_example/screen/hello_screen.dart';
import 'package:flutter_bloc_example/screen/splash_screen.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      _buildMaterialApp(context);

  MaterialApp _buildMaterialApp(context) =>
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter BLoC Example',
        theme: ThemeData.light().copyWith(
          primaryColor: MColor.primary,
        ),
        routes: {
          Routes.SPLASH: (_) => SplashScreen(),
          Routes.HELLO: (_) => HelloScreen(),
        },
      );
}
