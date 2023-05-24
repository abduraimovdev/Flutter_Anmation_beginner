import 'package:flutter/material.dart';

import 'animations/animation_one.dart';
import 'animations/animation_three.dart';
import 'animations/animation_two.dart';

class ContainerAnimation extends StatefulWidget {
  const ContainerAnimation({super.key});

  @override
  State<ContainerAnimation> createState() => _ContainerAnimationState();
}

class _ContainerAnimationState extends State<ContainerAnimation> {
  String page = "first";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Curve",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: switch (page) {
              'first' => Loading(),
              'second' => AnimationTwo(),
              'third' => AnimationThee(),
              _ => SizedBox.shrink(),
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: firstAnimation,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 60),
                    ),
                    child: const Text("Loading"),
                  ),
                  ElevatedButton(
                    onPressed: secondAnimation,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 60),
                    ),
                    child: const Text("Easping"),
                  ),
                  ElevatedButton(
                    onPressed: thirdAnimation,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 60),
                    ),
                    child: const Text("Delay"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void firstAnimation() {
    page = 'first';
    setState(() {});
  }

  void secondAnimation() {
    page = 'second';
    setState(() {});
  }

  void thirdAnimation() {
    page = 'third';
    setState(() {});
  }
}