import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Animated Gradient',
      home: App(),
    );
  }
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool isChanged = false;
  List<Color> primaryColors = const [
    Colors.white,
    Colors.pinkAccent,
    Colors.pink,
  ];
  List<Color> secondaryColors = const [
    Colors.blue,
    Colors.blueAccent,
    Colors.white,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimateGradient(
        duration: const Duration(seconds: 3),
        primaryBeginGeometry: const AlignmentDirectional(0, -1),
        primaryEndGeometry: const AlignmentDirectional(0, 3),
        secondaryBeginGeometry: const AlignmentDirectional(3, 0),
        secondaryEndGeometry: const AlignmentDirectional(0, -1),
        textDirectionForGeometry: TextDirection.rtl,
        primaryColors: primaryColors,
        secondaryColors: secondaryColors,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Animated Gradient',
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                ),
              ),
              ElevatedButton(
                onPressed: _changeColors,
                style: _buttonStyle(),
                child: const Text(
                  'Change Colors',
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ButtonStyle _buttonStyle() {
    return ButtonStyle(
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  void _changeColors() {
    if (isChanged) {
      isChanged = false;
      primaryColors = const [
        Colors.pink,
        Colors.pinkAccent,
        Colors.white,
      ];
      secondaryColors = const [
        Colors.white,
        Colors.blueAccent,
        Colors.blue,
      ];
    } else {
      isChanged = true;
      primaryColors = [
        Colors.red,
        Colors.redAccent,
        Colors.white,
      ];
      secondaryColors = [
        Colors.white,
        Colors.tealAccent,
        Colors.teal,
      ];
    }

    setState(() {});
  }
}
