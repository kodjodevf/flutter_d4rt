import 'package:d4rt/d4rt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for Flutter CupertinoSegmentedControl.
BridgedClass getCupertinoSegmentedControlBridgingDefinition() {
  return BridgedClass(
    nativeType: CupertinoSegmentedControl,
    name: 'CupertinoSegmentedControl',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final rawChildren = namedArgs['children'];
        final Map<dynamic, Widget> children = {};
        if (rawChildren is Map) {
          rawChildren.forEach((k, v) {
            final widget = visitor.toWidget(v);
            if (widget != null) {
              children[k] = widget;
            }
          });
        }
        final groupValue = namedArgs['groupValue'];
        final rawOnValueChanged = namedArgs['onValueChanged'];
        ValueChanged<dynamic>? onValueChanged;
        if (rawOnValueChanged is InterpretedFunction) {
          onValueChanged = (dynamic val) {
            rawOnValueChanged.call(visitor, [val], {});
          };
        }
        final unselectedColor = namedArgs.get<Color?>('unselectedColor');
        final selectedColor = namedArgs.get<Color?>('selectedColor');
        final borderColor = namedArgs.get<Color?>('borderColor');
        final pressedColor = namedArgs.get<Color?>('pressedColor');
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding');

        return CupertinoSegmentedControl<Object>(
          key: key,
          children: children.cast<Object, Widget>(),
          onValueChanged: onValueChanged != null
              ? (val) => onValueChanged!(val)
              : (_) {},
          groupValue: groupValue,
          unselectedColor: unselectedColor,
          selectedColor: selectedColor,
          borderColor: borderColor,
          pressedColor: pressedColor,
          padding: padding,
        );
      },
    },
    getters: {
      'groupValue': (visitor, target) =>
          (target as CupertinoSegmentedControl).groupValue,
      'unselectedColor': (visitor, target) =>
          (target as CupertinoSegmentedControl).unselectedColor,
      'selectedColor': (visitor, target) =>
          (target as CupertinoSegmentedControl).selectedColor,
      'borderColor': (visitor, target) =>
          (target as CupertinoSegmentedControl).borderColor,
      'pressedColor': (visitor, target) =>
          (target as CupertinoSegmentedControl).pressedColor,
      'padding': (visitor, target) =>
          (target as CupertinoSegmentedControl).padding,
    },
  );
}

/// Returns the BridgedClass for Flutter CupertinoSlidingSegmentedControl.
BridgedClass getCupertinoSlidingSegmentedControlBridgingDefinition() {
  return BridgedClass(
    nativeType: CupertinoSlidingSegmentedControl,
    name: 'CupertinoSlidingSegmentedControl',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final rawChildren = namedArgs['children'];
        final Map<dynamic, Widget> children = {};
        if (rawChildren is Map) {
          rawChildren.forEach((k, v) {
            final widget = visitor.toWidget(v);
            if (widget != null) {
              children[k] = widget;
            }
          });
        }
        final groupValue = namedArgs['groupValue'];
        final rawOnValueChanged = namedArgs['onValueChanged'];
        ValueChanged<dynamic>? onValueChanged;
        if (rawOnValueChanged is InterpretedFunction) {
          onValueChanged = (dynamic val) {
            rawOnValueChanged.call(visitor, [val], {});
          };
        }
        final thumbColor = namedArgs.get<Color?>('thumbColor') ??
            const CupertinoDynamicColor.withBrightness(
              color: Color(0xFFFFFFFF),
              darkColor: Color(0xFF636366),
            );
        final backgroundColor = namedArgs.get<Color?>('backgroundColor') ??
            CupertinoColors.tertiarySystemFill;
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding') ??
            const EdgeInsets.symmetric(vertical: 2, horizontal: 3);

        return CupertinoSlidingSegmentedControl<Object>(
          key: key,
          children: children.cast<Object, Widget>(),
          onValueChanged: onValueChanged != null
              ? (val) => onValueChanged!(val)
              : (_) {},
          groupValue: groupValue,
          thumbColor: thumbColor,
          backgroundColor: backgroundColor,
          padding: padding,
        );
      },
    },
    getters: {
      'groupValue': (visitor, target) =>
          (target as CupertinoSlidingSegmentedControl).groupValue,
      'thumbColor': (visitor, target) =>
          (target as CupertinoSlidingSegmentedControl).thumbColor,
      'backgroundColor': (visitor, target) =>
          (target as CupertinoSlidingSegmentedControl).backgroundColor,
      'padding': (visitor, target) =>
          (target as CupertinoSlidingSegmentedControl).padding,
    },
  );
}
