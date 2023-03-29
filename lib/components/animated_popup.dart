import 'package:flutter/material.dart';

class AnimatedPopup extends StatefulWidget {
  /// A widget that shows a popup with an animation when it is displayed.
  ///
  /// The [AnimatedPopup] widget displays a popup with a semi-transparent
  /// background and an animated child widget. The popup is displayed using a
  /// fade and scale animation, and is automatically dismissed after a set
  /// duration.
  const AnimatedPopup({Key? key, required this.child}) : super(key: key);

  // The child widget to display within the popup.
  final Widget child;

  @override
  State<StatefulWidget> createState() => AnimatedPopupState();
}

class AnimatedPopupState extends State<AnimatedPopup>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> opacityAnimation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Set up the animation controller and animations for the popup.
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeOutExpo);
    opacityAnimation = Tween<double>(begin: 0.0, end: 0.6).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOutExpo));

    // Update the state when the animation controller changes.
    controller.addListener(() => setState(() {}));

    // Start the animation when the popup is displayed.
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      // Use a semi-transparent white color for the background.
      color: Colors.white.withOpacity(0.6),
      child: Center(
        child: FadeTransition(
          opacity: scaleAnimation,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
