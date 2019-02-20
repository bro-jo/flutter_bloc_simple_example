import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/bloc/counter_bloc.dart';
import 'package:flutter_bloc_example/const/color.dart';
import 'package:flutter_bloc_example/const/gradient.dart';
import 'package:flutter_bloc_example/const/style.dart';
import 'package:flutter_bloc_example/util/animation.dart';
import 'package:flutter_bloc_example/widget/app_bar.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HelloScreen extends StatefulWidget {
  _HelloScreenState createState() => _HelloScreenState();
}

class _HelloScreenState extends State<HelloScreen> with SingleTickerProviderStateMixin {
  final CounterBloc _counterBloc = CounterBloc();
  List<Animation<double>> _animations;
  AnimationController _controller;

  initState() {
    super.initState();
    _initAnimation();
  }

  dispose() {
    _disposeAnimation();
    _counterBloc.dispose();
    super.dispose();
  }

  void _initAnimation() {
    _controller = AnimationController(duration: Duration(milliseconds: 3500), vsync: this);

    _animations = [
      makeTweenAnimation(controller: _controller, begin: 0.1, end: 0.6),
      makeTweenAnimation(controller: _controller, begin: 0.6, end: 0.7),
      makeTweenAnimation(controller: _controller, begin: 0.7, end: 0.8),
      makeTweenAnimation(controller: _controller, begin: 0.8, end: 0.9),
      makeTweenAnimation(controller: _controller, begin: 0.9, end: 1.0),
    ];

    _controller.forward();
  }

  void _disposeAnimation() {
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      AnimatedBuilder(
        animation: _controller,
        builder: (context, widget) =>
            Scaffold(
              appBar: EmptyAppBar(color: MColor.primary),
              body: Container(
                decoration: BoxDecoration(gradient: MGradient.primary),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(height: 1),
                    _buildTitle(),
                    _buildText(),
                    _buildCount(),
                    Flexible(flex: 1, child: Container()),
                    _buildAddButton(context),
                  ],
                ),
              ),
            ),
      );

  Widget _buildTitle() =>
      Padding(
        padding: const EdgeInsets.all(24),
        child: Opacity(
          opacity: _animations[0].value,
          child: Text('Hello BLoC!', style: MTextStyle.whiteTitle(44 * _animations[0].value)),
        ),
      );

  Widget _buildCount() =>
      BlocBuilder<CounterEvent, int>(
        bloc: _counterBloc,
        builder: (BuildContext context, int count) =>
            Padding(
              padding: const EdgeInsets.all(24),
              child: Opacity(
                opacity: _animations[0].value,
                child: Text('$count', style: MTextStyle.whiteTitle(44 * _animations[4].value)),
              ),
            ),
      );

  Widget _buildText() =>
      Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 6),
            Opacity(
              opacity: _animations[1].value,
              child: Text('separate presentation from business logic', style: MTextStyle.white(15)),
            ),
            Container(height: 6),
            Opacity(
              opacity: _animations[2].value,
              child: Text('making your code fast, easy to test', style: MTextStyle.white(15)),
            ),
            Container(height: 6),
            Opacity(
              opacity: _animations[3].value,
              child: Text('and reusable', style: MTextStyle.white(15)),
            ),
          ],
        ),
      );

  Widget _buildAddButton(BuildContext context) =>
      Container(
        alignment: Alignment.centerRight,
        child: Row(
          children: <Widget>[
            MaterialButton(
              minWidth: 150,
              onPressed: () => _counterBloc.dispatch(CounterEvent.decrement),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
                child: Text('-', style: MTextStyle.primaryBold(50)),
              ),
            ),
            Flexible(flex: 1, child: Container()),
            MaterialButton(
              minWidth: 150,
              onPressed: () => _counterBloc.dispatch(CounterEvent.increment),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
                child: Text('+', style: MTextStyle.primaryBold(50)),
              ),
            ),
          ],
        ),
      );
}
