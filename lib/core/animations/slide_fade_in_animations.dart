import 'package:flutter/material.dart';

class SlideFadeInAnimations extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double startOffSetX;
  const SlideFadeInAnimations({
    super.key,
    required this.child,
    required this.duration,
    required this.startOffSetX,
  });

  @override
  State<SlideFadeInAnimations> createState() => _SlideFadeInAnimationsState();
}

class _SlideFadeInAnimationsState extends State<SlideFadeInAnimations>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _slideAnimation =
        Tween<Offset>(
          begin: Offset(widget.startOffSetX, 0),
          end: Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeIn,
          ),
        );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: Transform.translate(
            offset: _slideAnimation.value,
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}
