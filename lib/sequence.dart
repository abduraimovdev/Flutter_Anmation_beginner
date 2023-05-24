import 'package:flutter/material.dart';

class SequencePage extends StatefulWidget {
  const SequencePage({Key? key}) : super(key: key);

  @override
  State<SequencePage> createState() => _SequencePageState();
}

class _SequencePageState extends State<SequencePage>
    with SingleTickerProviderStateMixin {
  bool isActive = false;

  late AnimationController controller;
  late Animation<int> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1 * Colors.accents.length ~/ 2),
    );

    animation = IntTween(
      begin: 0,
      end: 15,
    ).animate(controller);

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.repeat();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sequence'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: animation,
              builder: (context, child) => Container(
                width: 300,
                height: 300,
                color: Colors.accents[animation.value],
              ),
            ),
            ElevatedButton(onPressed: onPress, child: const Text("start")),
          ],
        ),
      ),
    );
  }

  void onPress() {
    setState(() {
      if (!isActive) {
        controller.forward();
      } else {
        controller.stop();
      }
      isActive = !isActive;
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
