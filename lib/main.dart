import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const Main());
}

/// Initializing main unchangable WidgetScreen.
class Main extends StatelessWidget {
  /// Forwarded key to the superClass for Flutter to reuse the Widget.
  /// Optimized, so that flutter does not generate it from the beginning.
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: BgChanger());
  }
}

/// Initializing changable Widget that displays Text and reacts on Tap.
class BgChanger extends StatefulWidget {
  /// Key parameter forwarded to the parent constructor to manage the tree.
  const BgChanger({super.key});

  @override
  State<BgChanger> createState() {
    return _BgChanger();
  }
}

class _BgChanger extends State<BgChanger> {
  final randomizer = Random(); // Random class from dart:math package
  Color currentColor = Colors.white; // Default color that is changed on Tap

  /// For each color channel a 0-255 number is generated separately,
  /// so we have all possible rgb 16777216 colors (256^3).
  void randomColor() {
    const a = 255; // Constant alpha channel
    final r = randomizer.nextInt(256);
    final g = randomizer.nextInt(256);
    final b = randomizer.nextInt(256);

    setState(() {
      currentColor = Color.fromARGB(a, r, g, b);
    });
  }

  /// Building the main UI.
  /// Tapping anywhere in the App changes background color to a new generated.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: randomColor,

        /// Added animation feature for slight transition between colors.
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          color: currentColor,

          /// Displays text at the center of the screen.
          child: const Center(child: Text('Hello there')), 
        ),
      ),
    );
  }
}
