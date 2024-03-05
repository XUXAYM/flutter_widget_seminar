import 'package:flutter/widgets.dart';

class VisibilityInherited extends InheritedWidget {
  final bool isVisible;

  const VisibilityInherited({
    required this.isVisible,
    required super.child,
    super.key,
  });

  static bool of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VisibilityInherited>()!
        .isVisible;
  }

  @override
  bool updateShouldNotify(VisibilityInherited oldWidget) {
    return isVisible != oldWidget.isVisible;
  }
}
