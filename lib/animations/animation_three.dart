import 'package:flutter/material.dart';

class AnimationThee extends StatefulWidget {
  const AnimationThee({super.key});

  @override
  State<AnimationThee> createState() => _AnimationTheeState();
}

class _AnimationTheeState extends State<AnimationThee>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    animation = Tween<double>(begin: 0, end: 500)
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceIn));
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.repeat(reverse: true);
      }
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedBuilder(
              animation: controller,
              builder: (context, child) => Row(
                children: [
                  AnimatedContainer(
                    width: animation.value * 0.87,
                    duration: Duration(milliseconds: 20),
                  ),
                  Container(
                    width: 150,
                    height: 60,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            AnimatedBuilder(
              animation: controller,
              builder: (context, child) => Row(
                children: [
                  AnimatedContainer(
                    width: animation.value,
                    duration: Duration(milliseconds: 59),
                  ),
                  Container(
                    width: 100,
                    height: 60,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
