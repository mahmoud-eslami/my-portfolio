import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomMouseRegion extends StatelessWidget {
  const CustomMouseRegion({
    super.key,
    required this.child,
    required this.onEnter,
    required this.onExit,
    required this.cursor,
  });

  final Widget child;
  final PointerEnterEventListener? onEnter;
  final PointerExitEventListener? onExit;
  final MouseCursor cursor;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return MouseRegion(
        cursor: cursor,
        onEnter: onEnter,
        onExit: onExit,
        child: child,
      );
    }
    return child;
  }
}
