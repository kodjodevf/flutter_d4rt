import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for the Flutter ToggleButtons widget.
BridgedClass getToggleButtonsBridgingDefinition() {
  return BridgedClass(
    nativeType: ToggleButtons,
    name: 'ToggleButtons',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');

        final List<Widget> children = [];
        final interpretedChildren = visitor.toWidgets(namedArgs['children']);
        if (interpretedChildren is List) {
          children.addAll(interpretedChildren.cast());
        }

        final List<bool> isSelected = [];
        final interpretedIsSelected = namedArgs['isSelected'];
        if (interpretedIsSelected is List) {
          isSelected.addAll(interpretedIsSelected.cast<bool>());
        }

        // Handle onPressed callback
        final onPressed = namedArgs['onPressed'];
        void Function(int)? onPressedCallback;
        if (onPressed != null) {
          if (onPressed is InterpretedFunction) {
            onPressedCallback = (int index) => onPressed.call(visitor, [index]);
          } else if (onPressed is Function) {
            onPressedCallback = onPressed as void Function(int)?;
          }
        }

        final color = namedArgs.get<Color?>('color');
        final selectedColor = namedArgs.get<Color?>('selectedColor');
        final disabledColor = namedArgs.get<Color?>('disabledColor');
        final fillColor = namedArgs.get<Color?>('fillColor');
        final focusColor = namedArgs.get<Color?>('focusColor');
        final highlightColor = namedArgs.get<Color?>('highlightColor');
        final hoverColor = namedArgs.get<Color?>('hoverColor');
        final splashColor = namedArgs.get<Color?>('splashColor');
        final borderColor = namedArgs.get<Color?>('borderColor');
        final selectedBorderColor = namedArgs.get<Color?>(
          'selectedBorderColor',
        );
        final disabledBorderColor = namedArgs.get<Color?>(
          'disabledBorderColor',
        );
        final borderRadius = namedArgs.get<BorderRadius?>('borderRadius');
        final borderWidth = namedArgs.get<double?>('borderWidth');
        final renderBorder = namedArgs.get<bool?>('renderBorder') ?? true;
        final textStyle = namedArgs.get<TextStyle?>('textStyle');
        final constraints = namedArgs.get<BoxConstraints?>('constraints');
        final direction = namedArgs.get<Axis?>('direction') ?? Axis.horizontal;
        final verticalDirection =
            namedArgs.get<VerticalDirection?>('verticalDirection') ??
            VerticalDirection.down;

        return ToggleButtons(
          key: key,
          isSelected: isSelected,
          onPressed: onPressedCallback,
          color: color,
          selectedColor: selectedColor,
          disabledColor: disabledColor,
          fillColor: fillColor,
          focusColor: focusColor,
          highlightColor: highlightColor,
          hoverColor: hoverColor,
          splashColor: splashColor,
          borderColor: borderColor,
          selectedBorderColor: selectedBorderColor,
          disabledBorderColor: disabledBorderColor,
          borderRadius: borderRadius,
          borderWidth: borderWidth,
          renderBorder: renderBorder,
          textStyle: textStyle,
          constraints: constraints,
          direction: direction,
          verticalDirection: verticalDirection,
          children: children,
        );
      },
    },
    getters: {
      'children': (visitor, target) => (target as ToggleButtons).children,
      'isSelected': (visitor, target) => (target as ToggleButtons).isSelected,
      'color': (visitor, target) => (target as ToggleButtons).color,
      'selectedColor': (visitor, target) =>
          (target as ToggleButtons).selectedColor,
      'disabledColor': (visitor, target) =>
          (target as ToggleButtons).disabledColor,
      'fillColor': (visitor, target) => (target as ToggleButtons).fillColor,
      'focusColor': (visitor, target) => (target as ToggleButtons).focusColor,
      'highlightColor': (visitor, target) =>
          (target as ToggleButtons).highlightColor,
      'hoverColor': (visitor, target) => (target as ToggleButtons).hoverColor,
      'splashColor': (visitor, target) => (target as ToggleButtons).splashColor,
      'borderColor': (visitor, target) => (target as ToggleButtons).borderColor,
      'selectedBorderColor': (visitor, target) =>
          (target as ToggleButtons).selectedBorderColor,
      'disabledBorderColor': (visitor, target) =>
          (target as ToggleButtons).disabledBorderColor,
      'borderRadius': (visitor, target) =>
          (target as ToggleButtons).borderRadius,
      'borderWidth': (visitor, target) => (target as ToggleButtons).borderWidth,
      'renderBorder': (visitor, target) =>
          (target as ToggleButtons).renderBorder,
      'textStyle': (visitor, target) => (target as ToggleButtons).textStyle,
      'constraints': (visitor, target) => (target as ToggleButtons).constraints,
      'direction': (visitor, target) => (target as ToggleButtons).direction,
      'verticalDirection': (visitor, target) =>
          (target as ToggleButtons).verticalDirection,
      'key': (visitor, target) => (target as ToggleButtons).key,
    },
  );
}
