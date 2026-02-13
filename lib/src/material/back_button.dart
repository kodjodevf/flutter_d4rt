import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';

/// Returns the BridgedClass for the Flutter BackButton widget.
BridgedClass getBackButtonBridgingDefinition() {
  return BridgedClass(
    nativeType: BackButton,
    name: 'BackButton',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final color = namedArgs.get<Color?>('color');
        final style = namedArgs.get<ButtonStyle?>('style');

        // Handle onPressed callback
        final onPressed = namedArgs['onPressed'];
        VoidCallback? onPressedCallback;
        if (onPressed != null) {
          if (onPressed is InterpretedFunction) {
            onPressedCallback = () => onPressed.call(visitor, []);
          } else if (onPressed is Function) {
            onPressedCallback = onPressed as VoidCallback?;
          }
        }

        return BackButton(
          key: key,
          color: color,
          style: style,
          onPressed: onPressedCallback,
        );
      },
    },
    getters: {
      'color': (visitor, target) => (target as BackButton).color,
      'style': (visitor, target) => (target as BackButton).style,
      'key': (visitor, target) => (target as BackButton).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter CloseButton widget.
BridgedClass getCloseButtonBridgingDefinition() {
  return BridgedClass(
    nativeType: CloseButton,
    name: 'CloseButton',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final color = namedArgs.get<Color?>('color');
        final style = namedArgs.get<ButtonStyle?>('style');

        // Handle onPressed callback
        final onPressed = namedArgs['onPressed'];
        VoidCallback? onPressedCallback;
        if (onPressed != null) {
          if (onPressed is InterpretedFunction) {
            onPressedCallback = () => onPressed.call(visitor, []);
          } else if (onPressed is Function) {
            onPressedCallback = onPressed as VoidCallback?;
          }
        }

        return CloseButton(
          key: key,
          color: color,
          style: style,
          onPressed: onPressedCallback,
        );
      },
    },
    getters: {
      'color': (visitor, target) => (target as CloseButton).color,
      'style': (visitor, target) => (target as CloseButton).style,
      'key': (visitor, target) => (target as CloseButton).key,
    },
  );
}
