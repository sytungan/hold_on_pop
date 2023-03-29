/// A Flutter package that provides a widget for displaying a popup when the
/// user presses their finger and automatically closes it when they release it.
/// The widget provides similar functionality to the hold-to-view feature found
/// in social media apps like Instagram.
library hold_on_pop;

import 'package:flutter/widgets.dart';
import 'components/components.dart';

class HoldOnPop extends StatefulWidget {
  /// Creates a widget that displays a draggable child with a popup that appears
  /// when the child is held.
  ///
  /// The [child] parameter is the widget that is displayed and can be dragged by
  /// the user. The [popup] parameter is the widget that is displayed when the
  /// [child] is held and the [customPosition] parameter can be used to position
  /// the [popup] widget at a specific point on the screen.
  const HoldOnPop({
    super.key, // The super keyword should be used to call the constructor of the superclass, but here it seems like a typo.
    required this.child,
    required this.popup,
    this.customPosition,
  });

  // The widget to which the HoldOnPop should be attached.
  final Widget child;

  // The widget that should be displayed as a popup when the HoldOnPop is activated.
  final Widget popup;

  // The position of the popup in case of a custom placement.
  final Offset? customPosition;

  @override
  State<HoldOnPop> createState() => _HoldOnPopState();
}

class _HoldOnPopState extends State<HoldOnPop> {
  OverlayEntry? popupOverlay;

  @override
  Widget build(BuildContext context) {
    return LongPressDraggable(
      onDragStarted: () {
        // Creates and shows the overlay containing the popup widget when the user starts dragging the widget.
        popupOverlay = _createOverlayEntry();
        Overlay.of(context).insert(popupOverlay!);
      },
      onDragEnd: (_) => popupOverlay
          ?.remove(), // Removes the overlay when the user stops dragging the widget.
      data: '', // The data that should be used for drag and drop operations.
      feedback: const SizedBox(
        height: 60,
        width: 60,
      ), // The widget that should be displayed as a feedback when the widget is being dragged.
      delay: const Duration(
        milliseconds: 400,
      ), // The delay before the dragging operation starts.
      childWhenDragging:
          Container(), // The widget that should be displayed as a placeholder when the widget is being dragged.
      child: widget
          .child, // The child widget to which the HoldOnPop should be attached.
    );
  }

  /// Creates an OverlayEntry containing the popup widget using the default popup style from the HoldOnPopOverlayEntries class.
  OverlayEntry _createOverlayEntry() {
    return HoldOnPopOverlayEntries.defaultPopup(child: widget.popup);
  }
}
