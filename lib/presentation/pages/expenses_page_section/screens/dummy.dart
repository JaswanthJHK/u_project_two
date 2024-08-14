import 'package:flutter/material.dart';

class DummyScreen extends StatefulWidget {
  const DummyScreen({super.key});

  @override
  State<DummyScreen> createState() => _DummyScreenState();
}

class _DummyScreenState extends State<DummyScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animController = AnimationController(
    duration: const Duration(seconds: 4),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _animController,
    curve: Curves.elasticOut,
  );

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nothing..."),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: RotationTransition(
              turns: _animation,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: FlutterLogo(
                  size: 150,
                ),
              ),
            ),
          ),
         const Text("nothing"),
        ],
      ),
    );
  }
}
