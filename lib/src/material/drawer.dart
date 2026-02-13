import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for the Flutter Drawer widget.
BridgedClass getDrawerBridgingDefinition() {
  return BridgedClass(
    nativeType: Drawer,
    name: 'Drawer',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final elevation = namedArgs.getToDouble('elevation');
        final shadowColor = namedArgs.get<Color?>('shadowColor');
        final surfaceTintColor = namedArgs.get<Color?>('surfaceTintColor');
        final shape = namedArgs.get<ShapeBorder?>('shape');
        final width = namedArgs.getToDouble('width');
        final semanticLabel = namedArgs.get<String?>('semanticLabel');
        final child = visitor.toWidgets(namedArgs['child']);

        return Drawer(
          key: key,
          backgroundColor: backgroundColor,
          elevation: elevation,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          shape: shape,
          width: width,
          semanticLabel: semanticLabel,
          child: child,
        );
      },
    },
    getters: {
      'backgroundColor': (visitor, target) =>
          (target as Drawer).backgroundColor,
      'elevation': (visitor, target) => (target as Drawer).elevation,
      'shadowColor': (visitor, target) => (target as Drawer).shadowColor,
      'shape': (visitor, target) => (target as Drawer).shape,
      'width': (visitor, target) => (target as Drawer).width,
      'child': (visitor, target) => (target as Drawer).child,
      'key': (visitor, target) => (target as Drawer).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter DrawerHeader widget.
BridgedClass getDrawerHeaderBridgingDefinition() {
  return BridgedClass(
    nativeType: DrawerHeader,
    name: 'DrawerHeader',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final decoration = namedArgs.get<Decoration?>('decoration');
        final margin = namedArgs.get<EdgeInsetsGeometry?>('margin');
        final padding =
            namedArgs.get<EdgeInsetsGeometry?>('padding') ??
            const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0);
        final duration =
            namedArgs.get<Duration?>('duration') ??
            const Duration(milliseconds: 250);
        final curve = namedArgs.get<Curve?>('curve') ?? Curves.fastOutSlowIn;

        Widget? child;
        final childValue = namedArgs['child'];
        if (childValue != null) {
          child = visitor.toWidgets(childValue);
        }

        return DrawerHeader(
          key: key,
          decoration: decoration,
          margin: margin,
          padding: padding,
          duration: duration,
          curve: curve,
          child: child,
        );
      },
    },
    getters: {
      'child': (visitor, target) => (target as DrawerHeader).child,
      'decoration': (visitor, target) => (target as DrawerHeader).decoration,
      'margin': (visitor, target) => (target as DrawerHeader).margin,
      'padding': (visitor, target) => (target as DrawerHeader).padding,
      'key': (visitor, target) => (target as DrawerHeader).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter UserAccountsDrawerHeader widget.
BridgedClass getUserAccountsDrawerHeaderBridgingDefinition() {
  return BridgedClass(
    nativeType: UserAccountsDrawerHeader,
    name: 'UserAccountsDrawerHeader',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final decoration = namedArgs.get<Decoration?>('decoration');
        final margin =
            namedArgs.get<EdgeInsetsGeometry?>('margin') ??
            const EdgeInsets.only(bottom: 8.0);
        final currentAccountPicture = visitor.toWidgets(
          namedArgs['currentAccountPicture'],
        );
        final otherAccountsPictures = namedArgs['otherAccountsPictures'];

        List<Widget>? otherPictures;
        if (otherAccountsPictures != null) {
          final interpreted = visitor.toWidgets(otherAccountsPictures);
          if (interpreted is List) {
            otherPictures = interpreted.cast<Widget>();
          }
        }

        final accountName = visitor.toWidgets(namedArgs['accountName']);
        final accountEmail = visitor.toWidgets(namedArgs['accountEmail']);

        // Handle onDetailsPressed callback
        final onDetailsPressed = namedArgs['onDetailsPressed'];
        VoidCallback? onDetailsPressedCallback;
        if (onDetailsPressed != null) {
          if (onDetailsPressed is InterpretedFunction) {
            onDetailsPressedCallback = () => onDetailsPressed.call(visitor, []);
          } else if (onDetailsPressed is Function) {
            onDetailsPressedCallback = onDetailsPressed as VoidCallback?;
          }
        }

        final arrowColor = namedArgs.get<Color?>('arrowColor');

        return UserAccountsDrawerHeader(
          key: key,
          decoration: decoration,
          margin: margin,
          currentAccountPicture: currentAccountPicture,
          otherAccountsPictures: otherPictures,
          accountName: accountName,
          accountEmail: accountEmail,
          onDetailsPressed: onDetailsPressedCallback,
          arrowColor: arrowColor ?? Colors.white,
        );
      },
    },
    getters: {
      'decoration': (visitor, target) =>
          (target as UserAccountsDrawerHeader).decoration,
      'margin': (visitor, target) =>
          (target as UserAccountsDrawerHeader).margin,
      'currentAccountPicture': (visitor, target) =>
          (target as UserAccountsDrawerHeader).currentAccountPicture,
      'otherAccountsPictures': (visitor, target) =>
          (target as UserAccountsDrawerHeader).otherAccountsPictures,
      'accountName': (visitor, target) =>
          (target as UserAccountsDrawerHeader).accountName,
      'accountEmail': (visitor, target) =>
          (target as UserAccountsDrawerHeader).accountEmail,
      'arrowColor': (visitor, target) =>
          (target as UserAccountsDrawerHeader).arrowColor,
      'key': (visitor, target) => (target as UserAccountsDrawerHeader).key,
    },
  );
}
