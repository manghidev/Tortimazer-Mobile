import 'package:flutter/material.dart';

class CircularProgressWidget extends StatefulWidget {
  const CircularProgressWidget({super.key});

  @override
  State<CircularProgressWidget> createState() => _CircularProgressState();
}

class _CircularProgressState extends State<CircularProgressWidget>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    animationController.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: animationController.drive(
        ColorTween(
          begin: const Color(0xFF90CC76),
          end: const Color(0xFFF88D08),
        ),
      ),
    );
  }
}
