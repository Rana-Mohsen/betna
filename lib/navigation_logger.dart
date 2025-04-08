import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationLogger extends NavigatorObserver  {
  @override
  void didPush(Route route, Route? previousRoute) {
    print('Navigated to: ${route.settings.name ?? route.settings.arguments}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    print('Popped: ${route.settings.name ?? route.settings.arguments}');
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    print('Removed: ${route.settings.name ?? route.settings.arguments}');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    print('Replaced ${oldRoute?.settings.name ?? oldRoute?.settings.arguments} with ${newRoute?.settings.name ?? newRoute?.settings.arguments}');
  }
}
