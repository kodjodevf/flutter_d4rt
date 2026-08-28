// ignore_for_file: deprecated_member_use

import 'package:d4rt/d4rt.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';

// Helper function for ValueChanged<bool> callback handling
ValueChanged<bool>? _handleBoolValueCallback(
  InterpreterVisitor visitor,
  dynamic callback,
) {
  if (callback == null) return null;
  if (callback is InterpretedFunction) {
    return (bool value) => callback.call(visitor, [value]);
  }
  return callback as ValueChanged<bool>?;
}

/// Returns the BridgedClass for the Flutter Switch widget.
BridgedClass getSwitchBridgingDefinition() {
  return BridgedClass(
    nativeType: Switch,
    name: 'Switch',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final value = namedArgs.get<bool?>('value')!;
        final onChanged = _handleBoolValueCallback(
          visitor,
          namedArgs['onChanged'],
        );
        final activeColor = namedArgs.get<Color?>('activeColor');
        final activeTrackColor = namedArgs.get<Color?>('activeTrackColor');
        final inactiveThumbColor = namedArgs.get<Color?>('inactiveThumbColor');
        final inactiveTrackColor = namedArgs.get<Color?>('inactiveTrackColor');
        final activeThumbImage = namedArgs.get<ImageProvider?>(
          'activeThumbImage',
        );
        final onActiveThumbImageError = namedArgs.get<ImageErrorListener?>(
          'onActiveThumbImageError',
        );
        final inactiveThumbImage = namedArgs.get<ImageProvider?>(
          'inactiveThumbImage',
        );
        final onInactiveThumbImageError = namedArgs.get<ImageErrorListener?>(
          'onInactiveThumbImageError',
        );
        final thumbColor = namedArgs.get<WidgetStateProperty<Color?>?>(
          'thumbColor',
        );
        final trackColor = namedArgs.get<WidgetStateProperty<Color?>?>(
          'trackColor',
        );
        final materialTapTargetSize = namedArgs.get<MaterialTapTargetSize?>(
          'materialTapTargetSize',
        );
        final dragStartBehavior =
            namedArgs.get<DragStartBehavior?>('dragStartBehavior') ??
            DragStartBehavior.start;
        final mouseCursor = namedArgs.get<MouseCursor?>('mouseCursor');
        final focusColor = namedArgs.get<Color?>('focusColor');
        final hoverColor = namedArgs.get<Color?>('hoverColor');
        final overlayColor = namedArgs.get<WidgetStateProperty<Color?>?>(
          'overlayColor',
        );
        final splashRadius = namedArgs.getToDouble('splashRadius');
        final focusNode = namedArgs.get<FocusNode?>('focusNode');
        final autofocus = namedArgs.get<bool?>('autofocus') ?? false;

        return Switch(
          key: key,
          value: value,
          onChanged: onChanged,
          activeColor: activeColor,
          activeTrackColor: activeTrackColor,
          inactiveThumbColor: inactiveThumbColor,
          inactiveTrackColor: inactiveTrackColor,
          activeThumbImage: activeThumbImage,
          onActiveThumbImageError: onActiveThumbImageError,
          inactiveThumbImage: inactiveThumbImage,
          onInactiveThumbImageError: onInactiveThumbImageError,
          thumbColor: thumbColor,
          trackColor: trackColor,
          materialTapTargetSize: materialTapTargetSize,
          dragStartBehavior: dragStartBehavior,
          mouseCursor: mouseCursor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          overlayColor: overlayColor,
          splashRadius: splashRadius,
          focusNode: focusNode,
          autofocus: autofocus,
        );
      },
    },
    getters: {
      'value': (visitor, target) => (target as Switch).value,
      'activeColor': (visitor, target) => (target as Switch).activeColor,
      'activeTrackColor': (visitor, target) =>
          (target as Switch).activeTrackColor,
      'inactiveThumbColor': (visitor, target) =>
          (target as Switch).inactiveThumbColor,
      'inactiveTrackColor': (visitor, target) =>
          (target as Switch).inactiveTrackColor,
      'autofocus': (visitor, target) => (target as Switch).autofocus,
      'key': (visitor, target) => (target as Switch).key,
    },
  );
}
