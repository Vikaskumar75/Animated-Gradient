# Animate Gradient
 ![pub](https://img.shields.io/badge/pub-v1.0.0-blue) ![Animated-Gradient](https://img.shields.io/badge/Animated--Gradient-passing-brightgreen)

 This Package lets you make animated gradients without any hassle. Just pass the primary and secondary colors and you're done.
 You can do amazing effects using the alignments. For More info read the docs below.

## Usage
### Create your first animated gradient.
 The only two required arguments are the primaryColors and secondaryColors.

```dart
    import 'package:animate_gradient/animate_gradient.dart';

     AnimateGradient(
        primaryColors: const [
          Colors.pink,
          Colors.pinkAccent,
          Colors.white,
        ],
        secondaryColors: const [
          Colors.white,
          Colors.blueAccent,
          Colors.blue,
        ],
        child: YourWidget(),
      ),
```

### Play with alignments.
 Alignments are optional. You can pass any of the following alignments.
 `primaryBegin`
 `primaryEnd`
 `secondaryBegin`
 `secondaryEnd`

 With this in place you can have some crazy effects.

 ```dart
    import 'package:animate_gradient/animate_gradient.dart';

     AnimateGradient(
        primaryBegin: Alignment.topLeft,
        primaryEnd: Alignment.bottomLeft,
        secondaryBegin: Alignment.bottomLeft,
        secondaryEnd: Alignment.topRight,
        primaryColors: const [
          Colors.pink,
          Colors.pinkAccent,
          Colors.white,
        ],
        secondaryColors: const [
          Colors.white,
          Colors.blueAccent,
          Colors.blue,
        ],
        child: YourWidget(),
      ),
```

