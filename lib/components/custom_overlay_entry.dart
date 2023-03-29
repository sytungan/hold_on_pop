import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'animated_popup.dart';

/// This class contains static methods for creating overlay entries
/// for displaying popups in a Flutter app.
class HoldOnPopOverlayEntries {
  HoldOnPopOverlayEntries._();

  /// Returns an OverlayEntry with a default popup that displays a semi-transparent
  /// background with a blur effect and an animated child widget.
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

  /// Returns an OverlayEntry with a custom position popup that displays
  /// a child widget at a specific position on the screen.
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

  /// Returns an OverlayEntry with a custom popup that displays a child widget.
  static OverlayEntry customPopup({required Widget child}) {
    return OverlayEntry(builder: (_) => child);
  }
}
