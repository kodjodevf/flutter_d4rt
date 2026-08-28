import 'package:d4rt/d4rt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for Flutter CupertinoContextMenu.
BridgedClass getCupertinoContextMenuBridgingDefinition() {
  return BridgedClass(
    nativeType: CupertinoContextMenu,
    name: 'CupertinoContextMenu',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final child = visitor.toWidget(namedArgs['child']) ?? const SizedBox();
        final actions = visitor.toWidgetList(namedArgs['actions']);

        return CupertinoContextMenu(
          key: key,
          actions: actions,
          child: child,
        );
      },
    },
    getters: {
      'child': (visitor, target) => (target as CupertinoContextMenu).child,
      'actions': (visitor, target) => (target as CupertinoContextMenu).actions,
    },
  );
}

/// Returns the BridgedClass for Flutter CupertinoContextMenuAction.
BridgedClass getCupertinoContextMenuActionBridgingDefinition() {
  return BridgedClass(
    nativeType: CupertinoContextMenuAction,
    name: 'CupertinoContextMenuAction',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final child = visitor.toWidget(namedArgs['child']) ?? const SizedBox();
        final isDefaultAction =
            namedArgs.get<bool?>('isDefaultAction') ?? false;
        final isDestructiveAction =
            namedArgs.get<bool?>('isDestructiveAction') ?? false;
        final onPressed = namedArgs.handleVoidCallback('onPressed', visitor);
        final trailingIcon = namedArgs.get<IconData?>('trailingIcon');

        return CupertinoContextMenuAction(
          key: key,
          onPressed: onPressed,
          isDefaultAction: isDefaultAction,
          isDestructiveAction: isDestructiveAction,
          trailingIcon: trailingIcon,
          child: child,
        );
      },
    },
    getters: {
      'child': (visitor, target) =>
          (target as CupertinoContextMenuAction).child,
      'isDefaultAction': (visitor, target) =>
          (target as CupertinoContextMenuAction).isDefaultAction,
      'isDestructiveAction': (visitor, target) =>
          (target as CupertinoContextMenuAction).isDestructiveAction,
      'trailingIcon': (visitor, target) =>
          (target as CupertinoContextMenuAction).trailingIcon,
    },
  );
}

/// Returns the BridgedClass for Flutter CupertinoPopupSurface.
BridgedClass getCupertinoPopupSurfaceBridgingDefinition() {
  return BridgedClass(
    nativeType: CupertinoPopupSurface,
    name: 'CupertinoPopupSurface',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final child = visitor.toWidget(namedArgs['child']) ?? const SizedBox();
        final isSurfacePainted =
            namedArgs.get<bool?>('isSurfacePainted') ?? true;

        return CupertinoPopupSurface(
          key: key,
          isSurfacePainted: isSurfacePainted,
          child: child,
        );
      },
    },
    getters: {
      'child': (visitor, target) => (target as CupertinoPopupSurface).child,
      'isSurfacePainted': (visitor, target) =>
          (target as CupertinoPopupSurface).isSurfacePainted,
    },
  );
}
