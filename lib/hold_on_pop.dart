/// A Flutter package that provides a widget for displaying a popup when the
/// user presses their finger and automatically closes it when they release it.
/// The widget provides similar functionality to the hold-to-view feature found
/// in social media apps like Instagram.
library hold_on_pop;

import 'package:flutter/widgets.dart';
import 'components/components.dart';

class HoldOnPop extends StatefulWidget {
  const HoldOnPop({
    super.key,
    required this.child,
    required this.popup,
    this.customPosition,
  });
  final Widget child;
  final Widget popup;
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
        popupOverlay = _createOverlayEntry();
        Overlay.of(context).insert(popupOverlay!);
      },
      onDragEnd: (_) => popupOverlay?.remove(),
      data: '',
      feedback: const SizedBox(
        height: 60,
        width: 60,
      ),
      delay: const Duration(milliseconds: 400),
      childWhenDragging: Container(),
      child: widget.child,
    );
  }

  OverlayEntry _createOverlayEntry() {
    return HoldOnPopOverlayEntries.defaultPopup(child: widget.popup);
  }
}
