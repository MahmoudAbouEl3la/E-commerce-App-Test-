// import 'package:flutter/material.dart';

// class CustomFadingWidget extends StatefulWidget {
//   const CustomFadingWidget({super.key, required this.child});

//   final Widget child;

//   @override
//   State<CustomFadingWidget> createState() => _CustomFadingWidgetState();
// }

// class _CustomFadingWidgetState extends State<CustomFadingWidget>
//     with SingleTickerProviderStateMixin {
//   late Animation animation;
//   late AnimationController animationController;

//   @override
//   void initState() {
//     super.initState();
//     animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 500),
//     );
//     animation = Tween<double>(
//       begin: 0.2,
//       end: 0.8,
//     ).animate(animationController);
//     animationController.addListener(() {
//       setState(() {});
//     });
//     animationController.repeat(reverse: true);
//   }

//   @override
//   void dispose() {
//     animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Opacity(opacity: animation.value, child: widget.child);
//   }
// }
import 'package:flutter/material.dart';

class CustomFadingWidget extends StatefulWidget {
  const CustomFadingWidget({super.key, required this.child});
  final Widget child;

  @override
  State<CustomFadingWidget> createState() => _CustomFadingWidgetState();
}

class _CustomFadingWidgetState extends State<CustomFadingWidget>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.3, end: 0.8).animate(_controller!);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null || _animation == null) {
      return widget.child;
    }

    return FadeTransition(opacity: _animation!, child: widget.child);
  }
}
