// ignore_for_file: deprecated_member_use

import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';

// Helper function for ValueChanged callback handling
ValueChanged<dynamic>? _handleDynamicValueCallback(
  InterpreterVisitor visitor,
  dynamic callback,
) {
  if (callback == null) return null;
  if (callback is InterpretedFunction) {
    return (dynamic value) => callback.call(visitor, [value]);
  }
  return callback as ValueChanged<dynamic>?;
}

/// Returns the BridgedClass for the Flutter Radio widget.
BridgedClass getRadioBridgingDefinition() {
  return BridgedClass(
    nativeType: Radio,
    name: 'Radio',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final value = namedArgs.get<dynamic>('value');
        final groupValue = namedArgs.get<dynamic>('groupValue');
        final onChanged = _handleDynamicValueCallback(
          visitor,
          namedArgs['onChanged'],
        );
        final toggleable = namedArgs.get<bool?>('toggleable') ?? false;
        final activeColor = namedArgs.get<Color?>('activeColor');
        final fillColor = namedArgs.get<WidgetStateProperty<Color?>?>(
          'fillColor',
        );
        final focusColor = namedArgs.get<Color?>('focusColor');
        final hoverColor = namedArgs.get<Color?>('hoverColor');
        final overlayColor = namedArgs.get<WidgetStateProperty<Color?>?>(
          'overlayColor',
        );
        final splashRadius = namedArgs.getToDouble('splashRadius');
        final materialTapTargetSize = namedArgs.get<MaterialTapTargetSize?>(
          'materialTapTargetSize',
        );
        final visualDensity = namedArgs.get<VisualDensity?>('visualDensity');
        final focusNode = namedArgs.get<FocusNode?>('focusNode');
        final autofocus = namedArgs.get<bool?>('autofocus') ?? false;

        return Radio<dynamic>(
          key: key,
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          toggleable: toggleable,
          activeColor: activeColor,
          fillColor: fillColor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          overlayColor: overlayColor,
          splashRadius: splashRadius,
          materialTapTargetSize: materialTapTargetSize,
          visualDensity: visualDensity,
          focusNode: focusNode,
          autofocus: autofocus,
        );
      },
    },
    getters: {
      'value': (visitor, target) => (target as Radio).value,
      'groupValue': (visitor, target) => (target as Radio).groupValue,
      'toggleable': (visitor, target) => (target as Radio).toggleable,
      'activeColor': (visitor, target) => (target as Radio).activeColor,
      'focusColor': (visitor, target) => (target as Radio).focusColor,
      'hoverColor': (visitor, target) => (target as Radio).hoverColor,
      'autofocus': (visitor, target) => (target as Radio).autofocus,
      'key': (visitor, target) => (target as Radio).key,
    },
  );
}
