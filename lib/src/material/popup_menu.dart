import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for the Flutter PopupMenuButton widget.
BridgedClass getPopupMenuButtonBridgingDefinition() {
  return BridgedClass(
    nativeType: PopupMenuButton,
    name: 'PopupMenuButton',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final onSelected = namedArgs.handleValueCallback<dynamic>(
          'onSelected',
          visitor,
        );
        final onCanceled = namedArgs.handleVoidCallback('onCanceled', visitor);
        final tooltip = namedArgs.get<String?>('tooltip');
        final elevation = namedArgs.getToDouble('elevation');
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding');
        final position = namedArgs.get<PopupMenuPosition?>('position');
        final enabled = namedArgs.get<bool?>('enabled');
        final offset = namedArgs.get<Offset?>('offset');

        final icon = visitor.toWidgets(namedArgs['icon']);
        final child = visitor.toWidgets(namedArgs['child']);

        List<PopupMenuEntry> itemBuilder(BuildContext context) {
          final itemsValue = namedArgs['itemBuilder'];

          if (itemsValue is InterpretedFunction) {
            final result = itemsValue.call(visitor, [context]);
            return (visitor.toWidgets(result) as List).cast<PopupMenuEntry>();
          }
          return [];
        }

        return PopupMenuButton(
          key: key,
          itemBuilder: itemBuilder,
          onSelected: onSelected,
          onCanceled: onCanceled,
          tooltip: tooltip,
          elevation: elevation,
          padding: padding ?? const EdgeInsets.all(8.0),
          position: position,
          enabled: enabled ?? true,
          offset: offset ?? Offset.zero,
          icon: icon,
          child: child,
        );
      },
    },
    getters: {
      'tooltip': (visitor, target) => (target as PopupMenuButton).tooltip,
      'elevation': (visitor, target) => (target as PopupMenuButton).elevation,
      'padding': (visitor, target) => (target as PopupMenuButton).padding,
      'enabled': (visitor, target) => (target as PopupMenuButton).enabled,
      'offset': (visitor, target) => (target as PopupMenuButton).offset,
      'key': (visitor, target) => (target as PopupMenuButton).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter PopupMenuItem widget.
BridgedClass getPopupMenuItemBridgingDefinition() {
  return BridgedClass(
    nativeType: PopupMenuItem,
    name: 'PopupMenuItem',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final value = namedArgs['value'];
        final enabled = namedArgs.get<bool?>('enabled') ?? true;
        final height = namedArgs.getToDouble('height');
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding');
        final mouseCursor = namedArgs.get<MouseCursor?>('mouseCursor');
        final child = visitor.toWidgets(namedArgs['child']);

        return PopupMenuItem(
          key: key,
          value: value,
          enabled: enabled,
          height: height ?? kMinInteractiveDimension,
          padding: padding as EdgeInsets?,
          mouseCursor: mouseCursor,
          child: child!,
        );
      },
    },
    getters: {
      'value': (visitor, target) => (target as PopupMenuItem).value,
      'enabled': (visitor, target) => (target as PopupMenuItem).enabled,
      'height': (visitor, target) => (target as PopupMenuItem).height,
      'padding': (visitor, target) => (target as PopupMenuItem).padding,
      'key': (visitor, target) => (target as PopupMenuItem).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter PopupMenuDivider widget.
BridgedClass getPopupMenuDividerBridgingDefinition() {
  return BridgedClass(
    nativeType: PopupMenuDivider,
    name: 'PopupMenuDivider',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final height = namedArgs.getToDouble('height');

        return PopupMenuDivider(key: key, height: height ?? 16.0);
      },
    },
    getters: {
      'height': (visitor, target) => (target as PopupMenuDivider).height,
      'key': (visitor, target) => (target as PopupMenuDivider).key,
    },
  );
}
