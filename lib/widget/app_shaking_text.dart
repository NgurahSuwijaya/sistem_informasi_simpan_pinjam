import 'package:flutter/material.dart';

class ShakingText extends StatefulWidget {
  final String text;
  final TextStyle style;

  const ShakingText({
    super.key,
    required this.text,
    required this.style,
  });

  @override
  _ShakingTextState createState() => _ShakingTextState();
}

class _ShakingTextState extends State<ShakingText>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat(reverse: true);
    _animation =
        Tween<double>(begin: -5.0, end: 5.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(_animation.value, 0),
          child: Text(
            widget.text,
            style: widget.style,
          ),
        );
      },
    );
  }
}
