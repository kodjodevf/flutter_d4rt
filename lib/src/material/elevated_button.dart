import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/double.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for the Flutter ElevatedButton widget.
BridgedClass getElevatedButtonBridgingDefinition() {
  return BridgedClass(
    nativeType: ElevatedButton,
    name: 'ElevatedButton',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final onPressed = namedArgs.handleVoidCallback('onPressed', visitor);

        final style = namedArgs.get<ButtonStyle?>('style');
        final child = visitor.toWidgets(namedArgs['child']);

        return ElevatedButton(
          key: key,
          onPressed: onPressed,
          style: style,
          child: child,
        );
      },
      'icon': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final onPressed = namedArgs.handleVoidCallback('onPressed', visitor);
        final style = namedArgs.get<ButtonStyle?>('style');
        final icon = visitor.toWidgets(namedArgs['icon']);
        final label = visitor.toWidgets(namedArgs['label']);

        if (icon == null || label == null) {
          throw ArgumentError(
            'Les paramètres icon et label sont requis pour ElevatedButton.icon',
          );
        }

        return ElevatedButton.icon(
          key: key,
          onPressed: onPressed,
          style: style,
          icon: icon,
          label: label,
        );
      },
    },
    staticMethods: {
      'styleFrom': (visitor, positionalArgs, namedArgs) {
        final foregroundColor = namedArgs.get<Color?>('foregroundColor');
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final disabledForegroundColor = namedArgs.get<Color?>(
          'disabledForegroundColor',
        );
        final disabledBackgroundColor = namedArgs.get<Color?>(
          'disabledBackgroundColor',
        );
        final shadowColor = namedArgs.get<Color?>('shadowColor');
        final surfaceTintColor = namedArgs.get<Color?>('surfaceTintColor');
        final elevation = toDouble(namedArgs.get<dynamic>('elevation'));
        final textStyle = namedArgs.get<TextStyle?>('textStyle');
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding');
        final minimumSize = namedArgs.get<Size?>('minimumSize');
        final fixedSize = namedArgs.get<Size?>('fixedSize');
        final maximumSize = namedArgs.get<Size?>('maximumSize');
        final side = namedArgs.get<BorderSide?>('side');
        final shape = namedArgs.get<OutlinedBorder?>('shape');
        final visualDensity = namedArgs.get<VisualDensity?>('visualDensity');
        final tapTargetSize = namedArgs.get<MaterialTapTargetSize?>(
          'tapTargetSize',
        );
        final animationDuration = namedArgs.get<Duration?>('animationDuration');
        final enableFeedback = namedArgs.get<bool?>('enableFeedback');
        final alignment = namedArgs.get<AlignmentGeometry?>('alignment');
        final splashFactory = namedArgs.get<InteractiveInkFeatureFactory?>(
          'splashFactory',
        );

        return ElevatedButton.styleFrom(
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
          disabledForegroundColor: disabledForegroundColor,
          disabledBackgroundColor: disabledBackgroundColor,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          elevation: elevation,
          textStyle: textStyle,
          padding: padding,
          minimumSize: minimumSize,
          fixedSize: fixedSize,
          maximumSize: maximumSize,
          side: side,
          shape: shape,
          visualDensity: visualDensity,
          tapTargetSize: tapTargetSize,
          animationDuration: animationDuration,
          enableFeedback: enableFeedback,
          alignment: alignment,
          splashFactory: splashFactory,
        );
      },
    },
    getters: {
      'onPressed': (visitor, target) => (target as ElevatedButton).onPressed,
      'style': (visitor, target) => (target as ElevatedButton).style,
      'child': (visitor, target) => (target as ElevatedButton).child,
      'key': (visitor, target) => (target as ElevatedButton).key,
    },
  );
}
