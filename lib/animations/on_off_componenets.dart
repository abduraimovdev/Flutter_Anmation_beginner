import 'package:flutter/material.dart';

class Switcher extends StatefulWidget {
  final bool? isActive;
  final void Function(bool isOn)? onPress;
  const Switcher({
    super.key,
    this.isActive,
    this.onPress,
  });

  @override
  State<Switcher> createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {
  bool _isOn = true;
  @override
  void initState() {
    super.initState();
    _isOn = widget.isActive ?? true;
  }

  Color get color => _isOn ? Colors.green : Colors.red;

  double get size => _isOn ? 0 : 120;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: AnimatedContainer(
        width: 200,
        height: 80,
        padding: const EdgeInsets.only(left: 10, right: 10),
        duration: const Duration(seconds: 1),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: color,
            boxShadow: [
              BoxShadow(
                color: (color).withOpacity(0.5),
                offset: const Offset(0, 10),
                blurRadius: 10,
              )
            ]),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              width: size,
            ),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onPress() => setState(() {
        _isOn = !_isOn;
        if (null != widget.onPress) {
          widget.onPress!(_isOn);
        }
      });
}
