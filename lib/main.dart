import 'package:flutter/material.dart';

void main() {
  runApp(const SoundWaveAnimation());
}

class SoundWaveAnimation extends StatelessWidget {
  const SoundWaveAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sound Wave Animation",
      theme: ThemeData(appBarTheme: const AppBarTheme(elevation: 0)),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: SoundWaveWidget(),
        ),
      ),
    );
  }
}

class SoundWaveWidget extends StatefulWidget {
  const SoundWaveWidget({super.key});

  @override
  State<SoundWaveWidget> createState() => _SoundWaveWidgetState();
}

class _SoundWaveWidgetState extends State<SoundWaveWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const count = 6;
    const minHeight = 10.0;
    const maxHeight = 30.0;

    return AnimatedBuilder(
        animation: controller,
        builder: (c, child) {
          double t = controller.value;
          int current = (count * t).floor();
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              count,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 500 ~/ count),
                margin: index == (count - 1)
                    ? EdgeInsets.zero
                    : const EdgeInsets.only(right: 5),
                height: index == current ? maxHeight : minHeight,
                width: 5,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),
          );
        });
  }
}
