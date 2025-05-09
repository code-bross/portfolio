import 'dart:async';
import 'package:flutter/material.dart';

class Animator extends StatefulWidget {
  final Widget child;
  final Duration time;

  const Animator({Key? key, required this.child, required this.time}) : super(key: key);

  @override
  _AnimatorState createState() => _AnimatorState();
}

class _AnimatorState extends State<Animator> with SingleTickerProviderStateMixin {
  late Timer timer;
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );
    timer = Timer(widget.time, animationController.forward);
  }

  @override
  void dispose() {
    animationController.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: widget.child,
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: animation.value,
          child: Transform.translate(
            offset: Offset(0.0, -50 + animation.value * 50),
            child: child,
          ),
        );
      },
    );
  }
}

// 글로벌 변수 관리
Timer? _globalTimer;
Duration _globalDuration = Duration();

Duration wait() {
  _globalTimer?.cancel();
  _globalTimer = Timer(const Duration(microseconds: 120), () {
    _globalDuration = Duration();
  });
  _globalDuration += const Duration(milliseconds: 300);
  return _globalDuration;
}

class WidgetAnimator extends StatelessWidget {
  final Widget child;

  const WidgetAnimator({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Animator(
      child: child,
      time: wait(),
    );
  }
}
