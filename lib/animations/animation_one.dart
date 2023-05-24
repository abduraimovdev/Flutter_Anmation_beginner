import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({
    super.key,
  });

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {
  late Tween<double> tween;
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    tween = Tween<double>(begin: 0, end: 0.9);
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.repeat(reverse: true);
      }
    });
    controller.forward();
  }

  Animation<double> get animationOne => tween.animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.1, .3),
        ),
      );

  Animation<double> get animationTwo => tween.animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(.3, .6),
        ),
      );
  Animation<double> get animationThree => tween.animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(.6, .9),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AnimatedContainer(
            width: 80,
            height: 80,
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(animationOne.value * 40),
            ),
          ),
          AnimatedContainer(
            width: 80,
            height: 80,
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(animationTwo.value * 40),
            ),
          ),
          AnimatedContainer(
            width: 80,
            height: 80,
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(animationThree.value * 40),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
