import 'package:flutter/material.dart';

import 'animations/on_off_componenets.dart';

class OnOff extends StatelessWidget {
  const OnOff({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Switcher(
          onPress: (isOn) {},
        ),
      ),
    );
  }
}
