import 'package:animation_home_work/container_animations.dart';
import 'package:animation_home_work/on_off.dart';
import 'package:animation_home_work/sequence.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const ContainerAnimation(),
    );
  }
}
