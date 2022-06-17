# Animate Gradient

![pub](https://img.shields.io/badge/pub-v1.0.0-blue) ![Animated-Gradient](https://img.shields.io/badge/Animated--Gradient-passing-brightgreen)

This Package lets you make animated gradients without any hassle. Just pass the primary and secondary colors and you're done.
You can do amazing effects using the alignments. For More info read the docs below.

## Usage

### Create your first animated gradient.

The only two required arguments are the primaryColors and secondaryColors.

| primaryColors length must greater or equal to 2.|
| secondaryColors length must be equal to primaryColors length.|

```dart
    import 'package:animate_gradient/animate_gradient.dart';

     AnimateGradient(
        primaryColors: const [
          Colors.pink,
          Colors.pinkAccent,
          Colors.white,
        ],
        secondaryColors: const [
          Colors.blue,
          Colors.blueAccent,
          Colors.white,
        ],
        child: YourWidget(),
      ),
```

<img src="https://user-images.githubusercontent.com/48128175/174312925-0da71117-f4cd-4275-a83f-6e8993d5a02e.gif" alt="drawing" width="200"/>

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

<img src="https://user-images.githubusercontent.com/48128175/174311300-d3d0fa14-9bf6-4345-a450-d91ef080a9a7.gif" alt="drawing" width="200"/>

## Available properties

| Property          | Type                 | Description                                             |
| ----------------- | -------------------- | ------------------------------------------------------- |
| `primaryColors`   | List<Color>          | Starting colors of the animation.                       |
| `secondaryColors` | List<Color>          | Ending colors of the animation.                         |
| `primaryBegin`    | AlignmentGeometry?   | Starting alignment of primaryColrs.                     |
| `primaryEnd`      | AlignmentGeometry?   | Ending alignment of primaryColrs.                       |
| `secondaryEnd`    | AlignmentGeometry?   | Starting alignment of secondaryColors.                  |
| `secondaryEnd`    | AlignmentGeometry?   | Ending alignment of secondaryColors.                    |
| `duration`        | Duration?            | Duration between the transition.                        |
| `controller`      | AnimationController? | You can pass your own animation controller and use that |
|                   |                      | to control animation however you want.                  |
| animateAlignments | bool?                | If you want to animate alignments.                      |
| reverse           | bool?                | If you want to reverse the animation.                   |
| child             | Widget?              | You can pass your own widget.                           |

## Author

This plugin is developed by Vikas Kumar.

- [Github](https://github.com/Vikaskumar75)
- [LinkedIn](https://www.linkedin.com/in/vikas-kumar-6564a7185/)
