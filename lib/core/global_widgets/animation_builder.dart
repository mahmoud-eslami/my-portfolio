import 'package:flutter/material.dart';

class AnimationBuilder extends StatefulWidget {
  const AnimationBuilder({
    super.key,
    required this.child,
    this.fade = true,
    this.offset = true,
  });

  final Widget child;
  final bool fade, offset;

  @override
  State<AnimationBuilder> createState() => _AnimationBuilderState();
}

class _AnimationBuilderState extends State<AnimationBuilder>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600))
      ..forward();
    _fadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    _offsetAnimation =
        Tween<Offset>(begin: const Offset(0, .2), end: const Offset(0, 0))
            .animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.fade) {
      return SlideTransition(
        position: _offsetAnimation,
        child: widget.child,
      );
    }
    if (!widget.offset) {
      return FadeTransition(
        opacity: _fadeAnimation,
        child: widget.child,
      );
    }

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _offsetAnimation,
        child: widget.child,
      ),
    );
  }
}
