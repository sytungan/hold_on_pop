import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'animated_popup.dart';

class HoldOnPopOverlayEntries {
  HoldOnPopOverlayEntries._();

  static OverlayEntry defaultPopup({required Widget child}) {
    return OverlayEntry(builder: (_) {
      return AnimatedPopup(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5.0,
            sigmaY: 5.0,
          ),
          child: child,
        ),
      );
    });
  }

  static OverlayEntry customPositionPopup({
    required Widget child,
    required Offset position,
  }) {
    return customPopup(
      child: Stack(
        fit: StackFit.expand,
        children: [
          const SizedBox(
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            left: position.dx,
            top: position.dy,
            child: child,
          )
        ],
      ),
    );
  }

  static OverlayEntry customPopup({required Widget child}) {
    return OverlayEntry(builder: (_) => child);
  }
}
