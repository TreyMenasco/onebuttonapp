import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const OneButtonApp());

class OneButtonApp extends StatelessWidget {
  const OneButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'One Little Button',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF182820)),
      ),
      home: const ColorPage(),
    );
  }
}

class ColorPage extends StatefulWidget {
  const ColorPage({super.key});

  @override
  State<ColorPage> createState() => _ColorPageState();
}

class _ColorPageState extends State<ColorPage> {
  static const ink = Color(0xFF182820);
  static const palette = [
    (name: 'Mint condition', hex: 'C8F0DF', color: Color(0xFFC8F0DF)),
    (name: 'Peach of a day', hex: 'FFD6BD', color: Color(0xFFFFD6BD)),
    (name: 'Lavender daydream', hex: 'E0D4FA', color: Color(0xFFE0D4FA)),
    (name: 'Blue sky thinking', hex: 'C5E5FA', color: Color(0xFFC5E5FA)),
    (name: 'Hello, sunshine', hex: 'F8E6A0', color: Color(0xFFF8E6A0)),
    (name: 'Rose-colored moment', hex: 'F6CDDB', color: Color(0xFFF6CDDB)),
    (name: 'Fresh perspective', hex: 'DFECC1', color: Color(0xFFDFECC1)),
  ];
  final random = Random();
  int current = 0;

  void changeColor() {
    setState(() {
      current = (current + 1 + random.nextInt(palette.length - 1)) %
          palette.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = palette[current];
    final reduceMotion = MediaQuery.of(context).disableAnimations;

    return Scaffold(
      body: AnimatedContainer(
        duration: reduceMotion ? Duration.zero : const Duration(milliseconds: 500),
        curve: Curves.ease,
        color: color.color,
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final headingSize = (constraints.maxWidth * .09).clamp(42.0, 80.0);
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('ONE LITTLE BUTTON',
                              style: TextStyle(color: ink, fontSize: 12,
                                  fontWeight: FontWeight.w700, letterSpacing: 2.6)),
                          const SizedBox(height: 24),
                          Text('A change of scenery.',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: ink, fontSize: headingSize,
                                  height: 1.05, letterSpacing: -2,
                                  fontWeight: FontWeight.w800)),
                          const SizedBox(height: 16),
                          const Text('A little color can change your day.',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Color(0xB3182820), fontSize: 17)),
                          const SizedBox(height: 42),
                          ElevatedButton(
                            onPressed: changeColor,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ink,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 22),
                              shape: const StadiumBorder(),
                              textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            child: const Text('Give me a new color ↗', textAlign: TextAlign.center),
                          ),
                          const SizedBox(height: 30),
                          Semantics(
                            liveRegion: true,
                            child: Text('${color.name} · #${color.hex}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: Color(0xB3182820),
                                    fontSize: 13, letterSpacing: .5)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
