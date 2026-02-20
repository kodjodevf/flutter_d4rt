import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/double.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for the Flutter OutlinedButton widget.
BridgedClass getOutlinedButtonBridgingDefinition() {
  return BridgedClass(
    nativeType: OutlinedButton,
    name: 'OutlinedButton',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final onPressed = namedArgs.handleVoidCallback('onPressed', visitor);
        final style = namedArgs.get<ButtonStyle?>('style');
        final child = visitor.toWidgets(namedArgs['child']);

        return OutlinedButton(
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
            'Les paramètres icon et label sont requis pour OutlinedButton.icon',
          );
        }

        return OutlinedButton.icon(
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
        try {
          return OutlinedButton.styleFrom(
            foregroundColor: namedArgs.get<Color?>('foregroundColor'),
            backgroundColor: namedArgs.get<Color?>('backgroundColor'),
            disabledForegroundColor: namedArgs.get<Color?>(
              'disabledForegroundColor',
            ),
            disabledBackgroundColor: namedArgs.get<Color?>(
              'disabledBackgroundColor',
            ),
            shadowColor: namedArgs.get<Color?>('shadowColor'),
            surfaceTintColor: namedArgs.get<Color?>('surfaceTintColor'),
            elevation: toDouble(namedArgs.get<dynamic>('elevation')),
            textStyle: namedArgs.get<TextStyle?>('textStyle'),
            padding: namedArgs.get<EdgeInsetsGeometry?>('padding'),
            minimumSize: namedArgs.get<Size?>('minimumSize'),
            fixedSize: namedArgs.get<Size?>('fixedSize'),
            maximumSize: namedArgs.get<Size?>('maximumSize'),
            side: namedArgs.get<BorderSide?>('side'),
            shape: namedArgs.get<OutlinedBorder?>('shape'),
            visualDensity: namedArgs.get<VisualDensity?>('visualDensity'),
            tapTargetSize: namedArgs.get<MaterialTapTargetSize?>(
              'tapTargetSize',
            ),
            animationDuration: namedArgs.get<Duration?>('animationDuration'),
            enableFeedback: namedArgs.get<bool?>('enableFeedback'),
            alignment: namedArgs.get<AlignmentGeometry?>('alignment'),
            splashFactory: namedArgs.get<InteractiveInkFeatureFactory?>(
              'splashFactory',
            ),
          );
        } catch (e) {
          throw Exception(
            'Erreur lors de la création de OutlinedButton.styleFrom: $e',
          );
        }
      },
    },
    getters: {
      'onPressed': (visitor, target) => (target as OutlinedButton).onPressed,
      'style': (visitor, target) => (target as OutlinedButton).style,
      'child': (visitor, target) => (target as OutlinedButton).child,
      'key': (visitor, target) => (target as OutlinedButton).key,
    },
  );
}
