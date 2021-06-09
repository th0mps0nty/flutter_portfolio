import 'package:flutter/material.dart';

class TabControllerHandler extends InheritedWidget {
  final TabController tabController;

  TabControllerHandler({
    required Key key,
    required this.tabController,
    required Widget child,
  }) : super(key: key, child: child);

  static TabControllerHandler of(BuildContext context) {
    final TabControllerHandler? result =
        context.dependOnInheritedWidgetOfExactType<TabControllerHandler>();
    assert(result != null, 'No TabControllerHandler found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TabControllerHandler oldWidget) {
    return oldWidget.tabController != tabController;
  }
}
