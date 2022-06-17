part of 'animate_gradient.dart';

class AnimateGradient extends StatefulWidget {
  const AnimateGradient({
    Key? key,
    required this.primaryColors,
    required this.secondaryColors,
    this.child,
    this.primaryBegin,
    this.primaryEnd,
    this.secondaryBegin,
    this.secondaryEnd,
    this.controller,
    this.duration = const Duration(seconds: 4),
    this.animateAlignments = true,
    this.reverse = true,
  })  : assert(primaryColors.length >= 2),
        assert(primaryColors.length == secondaryColors.length),
        super(key: key);

  /// [controller]: pass this to have a fine control over the [Animation]
  final AnimationController? controller;

  /// [duration]: Time to switch between [Gradient].
  /// By default its value is [Duration(seconds:4)]
  final Duration duration;

  /// [primaryColors]: These will be the starting colors of the [Animation].
  final List<Color> primaryColors;

  /// [secondaryColors]: These Colors are those in which the [primaryColors] will transition into.
  final List<Color> secondaryColors;

  /// [primaryBegin]: This is begin [Alignment] for [primaryColors].
  /// By default its value is [Alignment.topLeft]
  final Alignment? primaryBegin;

  /// [primaryBegin]: This is end [Alignment] for [primaryColors].
  /// By default its value is [Alignment.topRight]
  final Alignment? primaryEnd;

  /// [secondaryBegin]: This is begin [Alignment] for [secondaryColors].
  /// By default its value is [Alignment.bottomLeft]
  final Alignment? secondaryBegin;

  /// [secondaryEnd]: This is end [Alignment] for [secondaryColors].
  /// By default its value is [Alignment.bottomRight]
  final Alignment? secondaryEnd;

  /// [animateAlignments]: set to false if you don't want to animate the alignments.
  /// This can provide you way cooler animations
  final bool animateAlignments;

  /// [reverse]: set it to false if you don't want to reverse the animation.
  /// using that it will go into one direction only
  final bool reverse;

  final Widget? child;

  @override
  State<AnimateGradient> createState() => _AnimateGradientState();
}

class _AnimateGradientState extends State<AnimateGradient>
    with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;

  late List<ColorTween> _colorTween;

  late AlignmentTween begin;
  late AlignmentTween end;
  List<Color> primaryColors = [];
  List<Color> secondaryColors = [];

  @override
  void initState() {
    primaryColors = widget.primaryColors;
    secondaryColors = widget.secondaryColors;

    _colorTween = getColorTweens();
    begin = AlignmentTween(
      begin: widget.primaryBegin ?? Alignment.topLeft,
      end: widget.primaryEnd ?? Alignment.topRight,
    );
    end = AlignmentTween(
      begin: widget.secondaryBegin ?? Alignment.bottomLeft,
      end: widget.secondaryEnd ?? Alignment.bottomRight,
    );

    _controller = widget.controller ??
        (AnimationController(
          vsync: this,
          duration: widget.duration,
        )..repeat(reverse: widget.reverse));
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: widget.animateAlignments
                  ? begin.evaluate(_animation)
                  : (widget.primaryBegin as Alignment),
              end: widget.animateAlignments
                  ? end.evaluate(_animation)
                  : widget.primaryEnd as Alignment,
              colors: evaluateColors(_animation),
            ),
          ),
          child: widget.child,
        );
      },
    );
  }

  List<ColorTween> getColorTweens() {
    if (widget.primaryColors.length != widget.secondaryColors.length) {
      throw Exception('primaryColors.length != secondaryColors.length');
    }

    final List<ColorTween> _colorTweens = [];

    for (int i = 0; i < primaryColors.length; i++) {
      _colorTweens.add(
        ColorTween(
          begin: primaryColors[i],
          end: secondaryColors[i],
        ),
      );
    }

    return _colorTweens;
  }

  List<Color> evaluateColors(Animation<double> animation) {
    final List<Color> _colors = [];
    for (int i = 0; i < _colorTween.length; i++) {
      _colors.add(_colorTween[i].evaluate(animation)!);
    }
    return _colors;
  }
}
