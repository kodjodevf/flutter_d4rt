import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for the Flutter NavigationDrawer widget.
BridgedClass getNavigationDrawerBridgingDefinition() {
  return BridgedClass(
    nativeType: NavigationDrawer,
    name: 'NavigationDrawer',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final shadowColor = namedArgs.get<Color?>('shadowColor');
        final surfaceTintColor = namedArgs.get<Color?>('surfaceTintColor');
        final indicatorColor = namedArgs.get<Color?>('indicatorColor');
        final indicatorShape = namedArgs.get<ShapeBorder?>('indicatorShape');
        final elevation = namedArgs.get<double?>('elevation');
        final selectedIndex = namedArgs.get<int?>('selectedIndex') ?? 0;

        // Handle onDestinationSelected callback
        final onDestinationSelected = namedArgs.handleValueCallback<int?>(
          'onDestinationSelected',
          visitor,
        );

        final List<Widget> children = [];
        final interpretedChildren = visitor.toWidgets(namedArgs['children']);
        if (interpretedChildren is List) {
          children.addAll(interpretedChildren.cast());
        }

        return NavigationDrawer(
          key: key,
          backgroundColor: backgroundColor,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          indicatorColor: indicatorColor,
          indicatorShape: indicatorShape,
          elevation: elevation,
          selectedIndex: selectedIndex,
          onDestinationSelected: onDestinationSelected,
          children: children,
        );
      },
    },
    getters: {
      'backgroundColor': (visitor, target) =>
          (target as NavigationDrawer).backgroundColor,
      'shadowColor': (visitor, target) =>
          (target as NavigationDrawer).shadowColor,
      'surfaceTintColor': (visitor, target) =>
          (target as NavigationDrawer).surfaceTintColor,
      'indicatorColor': (visitor, target) =>
          (target as NavigationDrawer).indicatorColor,
      'indicatorShape': (visitor, target) =>
          (target as NavigationDrawer).indicatorShape,
      'elevation': (visitor, target) => (target as NavigationDrawer).elevation,
      'selectedIndex': (visitor, target) =>
          (target as NavigationDrawer).selectedIndex,
      'children': (visitor, target) => (target as NavigationDrawer).children,
      'key': (visitor, target) => (target as NavigationDrawer).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter NavigationDrawerDestination widget.
BridgedClass getNavigationDrawerDestinationBridgingDefinition() {
  return BridgedClass(
    nativeType: NavigationDrawerDestination,
    name: 'NavigationDrawerDestination',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final icon =
            visitor.toWidgets(namedArgs['icon']) ?? const Icon(Icons.error);
        final selectedIcon = visitor.toWidgets(namedArgs['selectedIcon']);
        final label = visitor.toWidgets(namedArgs['label']) ?? const Text('');
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final enabled = namedArgs.get<bool?>('enabled') ?? true;

        return NavigationDrawerDestination(
          key: key,
          icon: icon,
          selectedIcon: selectedIcon,
          label: label,
          backgroundColor: backgroundColor,
          enabled: enabled,
        );
      },
    },
    getters: {
      'icon': (visitor, target) => (target as NavigationDrawerDestination).icon,
      'selectedIcon': (visitor, target) =>
          (target as NavigationDrawerDestination).selectedIcon,
      'label': (visitor, target) =>
          (target as NavigationDrawerDestination).label,
      'backgroundColor': (visitor, target) =>
          (target as NavigationDrawerDestination).backgroundColor,
      'enabled': (visitor, target) =>
          (target as NavigationDrawerDestination).enabled,
      'key': (visitor, target) => (target as NavigationDrawerDestination).key,
    },
  );
}
