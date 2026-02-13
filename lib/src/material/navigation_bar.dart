import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for the Flutter NavigationBar widget.
BridgedClass getNavigationBarBridgingDefinition() {
  return BridgedClass(
    nativeType: NavigationBar,
    name: 'NavigationBar',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final animationDuration = namedArgs.get<Duration?>('animationDuration');
        final selectedIndex = namedArgs.get<int?>('selectedIndex') ?? 0;

        // Handle onDestinationSelected callback
        final onDestinationSelected = namedArgs['onDestinationSelected'];
        void Function(int)? onDestinationSelectedCallback;
        if (onDestinationSelected != null) {
          if (onDestinationSelected is InterpretedFunction) {
            onDestinationSelectedCallback = (int index) =>
                onDestinationSelected.call(visitor, [index]);
          } else if (onDestinationSelected is Function) {
            onDestinationSelectedCallback =
                onDestinationSelected as void Function(int)?;
          }
        }

        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final elevation = namedArgs.get<double?>('elevation');
        final shadowColor = namedArgs.get<Color?>('shadowColor');
        final surfaceTintColor = namedArgs.get<Color?>('surfaceTintColor');
        final indicatorColor = namedArgs.get<Color?>('indicatorColor');
        final indicatorShape = namedArgs.get<ShapeBorder?>('indicatorShape');
        final height = namedArgs.get<double?>('height');
        final labelBehavior = namedArgs
            .get<NavigationDestinationLabelBehavior?>('labelBehavior');
        final overlayColor = namedArgs.get<MaterialStateProperty<Color?>?>(
          'overlayColor',
        );

        final List<Widget> destinations = [];
        final interpretedDestinations = visitor.toWidgets(
          namedArgs['destinations'],
        );
        if (interpretedDestinations is List) {
          destinations.addAll(interpretedDestinations.cast());
        }

        return NavigationBar(
          key: key,
          animationDuration: animationDuration,
          selectedIndex: selectedIndex,
          onDestinationSelected: onDestinationSelectedCallback,
          backgroundColor: backgroundColor,
          elevation: elevation,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          indicatorColor: indicatorColor,
          indicatorShape: indicatorShape,
          height: height,
          labelBehavior: labelBehavior,
          overlayColor: overlayColor,
          destinations: destinations,
        );
      },
    },
    getters: {
      'animationDuration': (visitor, target) =>
          (target as NavigationBar).animationDuration,
      'selectedIndex': (visitor, target) =>
          (target as NavigationBar).selectedIndex,
      'backgroundColor': (visitor, target) =>
          (target as NavigationBar).backgroundColor,
      'elevation': (visitor, target) => (target as NavigationBar).elevation,
      'shadowColor': (visitor, target) => (target as NavigationBar).shadowColor,
      'surfaceTintColor': (visitor, target) =>
          (target as NavigationBar).surfaceTintColor,
      'indicatorColor': (visitor, target) =>
          (target as NavigationBar).indicatorColor,
      'indicatorShape': (visitor, target) =>
          (target as NavigationBar).indicatorShape,
      'height': (visitor, target) => (target as NavigationBar).height,
      'labelBehavior': (visitor, target) =>
          (target as NavigationBar).labelBehavior,
      'destinations': (visitor, target) =>
          (target as NavigationBar).destinations,
      'key': (visitor, target) => (target as NavigationBar).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter NavigationDestination widget.
BridgedClass getNavigationDestinationBridgingDefinition() {
  return BridgedClass(
    nativeType: NavigationDestination,
    name: 'NavigationDestination',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final icon =
            visitor.toWidgets(namedArgs['icon']) ?? const Icon(Icons.error);
        final selectedIcon = visitor.toWidgets(namedArgs['selectedIcon']);
        final label = namedArgs.get<String>('label') ?? '';
        final tooltip = namedArgs.get<String?>('tooltip');
        final enabled = namedArgs.get<bool?>('enabled') ?? true;

        return NavigationDestination(
          key: key,
          icon: icon,
          selectedIcon: selectedIcon,
          label: label,
          tooltip: tooltip,
          enabled: enabled,
        );
      },
    },
    getters: {
      'icon': (visitor, target) => (target as NavigationDestination).icon,
      'selectedIcon': (visitor, target) =>
          (target as NavigationDestination).selectedIcon,
      'label': (visitor, target) => (target as NavigationDestination).label,
      'tooltip': (visitor, target) => (target as NavigationDestination).tooltip,
      'enabled': (visitor, target) => (target as NavigationDestination).enabled,
      'key': (visitor, target) => (target as NavigationDestination).key,
    },
  );
}
