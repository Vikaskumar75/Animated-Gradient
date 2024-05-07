# Animate Gradient

![pub](https://img.shields.io/badge/pub-v0.0.3-blue) ![Animated-Gradient](https://img.shields.io/badge/Animated--Gradient-passing-brightgreen)

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

### Alternatively! Use AlignemntGeometry for better control

With the apps built in rtl format normal `Alignments` cannot always work.
So, you can use `AlignemntGeometry` instead.

`primaryBegin` --> `primaryBeginGeometry`
`primaryEnd` --> `primaryEndGeometry`
`secondaryBegin` --> `secondaryBeginGeometry`
`secondaryEnd` --> `secondaryEndGeometry`

With this you also have an additional property `textDirectionForGeometry`.
This will be used to resolve the AlignmentGeometry

```dart
   import 'package:animate_gradient/animate_gradient.dart';

    AnimateGradient(
      primaryBeginGeometry: const AlignmentDirectional(0, 1),
      primaryEndGeometry: const AlignmentDirectional(0, 2),
      secondaryBeginGeometry: const AlignmentDirectional(2, 0),
      secondaryEndGeometry: const AlignmentDirectional(0, -0.8),
      textDirectionForGeometry: TextDirection.rtl,
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

== Please note that `AlignmentGeometry` will be given more priority over `Alignment` ==

## Available properties

| Property                  | Type                 | Description                                                                                                      |
| ------------------------- | -------------------- | ---------------------------------------------------------------------------------------------------------------- |
| `primaryColors`           | List                 | Starting colors of the animation.                                                                                |
| `secondaryColors`         | List                 | Ending colors of the animation.                                                                                  |
| `primaryBegin`            | Alignment?           | Starting Alignment of primaryColors.                                                                             |
| `primaryEnd`              | Alignment?           | Ending Alignment of primaryColors.                                                                               |
| `secondaryEnd`            | Alignment?           | Starting Alignment of secondaryColors.                                                                           |
| `secondaryEnd`            | Alignment?           | Ending Alignment of secondaryColors.                                                                             |
| `primaryBeginGeometry`    | AlignmentGeometry?   | Starting AlignmentGeometry of primaryColrs.                                                                      |
| `primaryEndGeometry`      | AlignmentGeometry?   | Ending AlignmentGeometry of primaryColrs.                                                                        |
| `secondaryEndGeometry`    | AlignmentGeometry?   | Starting AlignmentGeometry of secondaryColors.                                                                   |
| `secondaryEndGeometry`    | AlignmentGeometry?   | Ending AlignmentGeometry of secondaryColors.                                                                     |
| `textDirectionForGeometry`| TextDierction?       | TextDirection that will be used to resolve AlignmentGeometry                                                     |
| `duration`                | Duration?            | Duration between the transition.                                                                                 |
| `controller`              | AnimationController? | <br> You can pass your own animation controller and use that</br><br>to control animation however you want.</br> |
| `animateAlignments`       | bool?                | If you want to animate alignments.                                                                               |
| `reverse`                 | bool?                | If you want to reverse the animation.                                                                            |
| `child`                   | Widget?              | You can pass your own widget.                                                                                    |

## Author

This plugin is developed by Vikas Kumar.

- [Github](https://github.com/Vikaskumar75)
- [LinkedIn](https://www.linkedin.com/in/vikas-kumar-6564a7185/)
