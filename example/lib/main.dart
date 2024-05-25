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

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Gradient'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AnimateGradientScreen()),
                );
              },
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              child: const Text(
                'Go to Animated Gradient',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const AnimateGradientControllerScreen()),
                );
              },
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              child: const Text(
                'Go to Animated Gradient Controller',
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AnimateGradientScreen extends StatefulWidget {
  const AnimateGradientScreen({super.key});

  @override
  State<AnimateGradientScreen> createState() => _AnimateGradientScreenState();
}

class _AnimateGradientScreenState extends State<AnimateGradientScreen> {
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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Gradient'),
      ),
      body: AnimateGradient(
        primaryBeginGeometry: const AlignmentDirectional(0, 1),
        primaryEndGeometry: const AlignmentDirectional(0, 2),
        secondaryBeginGeometry: const AlignmentDirectional(2, 0),
        secondaryEndGeometry: const AlignmentDirectional(0, -0.8),
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
      shape: WidgetStateProperty.all(
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

class AnimateGradientControllerScreen extends StatefulWidget {
  const AnimateGradientControllerScreen({super.key});

  @override
  State<AnimateGradientControllerScreen> createState() =>
      _AnimateGradientControllerScreenState();
}

class _AnimateGradientControllerScreenState
    extends State<AnimateGradientControllerScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

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
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Gradient'),
      ),
      body: AnimateGradient(
        primaryBeginGeometry: const AlignmentDirectional(0, 1),
        primaryEndGeometry: const AlignmentDirectional(0, 2),
        secondaryBeginGeometry: const AlignmentDirectional(2, 0),
        secondaryEndGeometry: const AlignmentDirectional(0, -0.8),
        textDirectionForGeometry: TextDirection.rtl,
        controller: _animationController,
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
      shape: WidgetStateProperty.all(
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
