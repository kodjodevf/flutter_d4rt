import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';

Animation<Color?>? _extractValueColor(dynamic raw) {
  if (raw == null) return null;
  final obj = raw is BridgedInstance ? raw.nativeObject : raw;
  if (obj is Animation<Color?>) {
    return obj;
  }
  if (obj is Animation<Color>) {
    return obj;
  }
  if (obj is AlwaysStoppedAnimation) {
    return AlwaysStoppedAnimation<Color?>(obj.value as Color?);
  }
  if (obj is Animation) {
    return obj.drive(
      Animatable.fromCallback((value) => value as Color?),
    );
  }
  return null;
}

/// Returns the BridgedClass for the Flutter CircularProgressIndicator widget.
BridgedClass getCircularProgressIndicatorBridgingDefinition() {
  return BridgedClass(
    nativeType: CircularProgressIndicator,
    name: 'CircularProgressIndicator',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final value = namedArgs.getToDouble('value');
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final color = namedArgs.get<Color?>('color');
        final valueColor = _extractValueColor(namedArgs['valueColor']);
        final strokeWidth = namedArgs.getToDouble('strokeWidth') ?? 4.0;
        final semanticsLabel = namedArgs.get<String?>('semanticsLabel');
        final semanticsValue = namedArgs.get<String?>('semanticsValue');

        return CircularProgressIndicator(
          key: key,
          value: value,
          backgroundColor: backgroundColor,
          color: color,
          valueColor: valueColor,
          strokeWidth: strokeWidth,
          semanticsLabel: semanticsLabel,
          semanticsValue: semanticsValue,
        );
      },
      'adaptive': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final value = namedArgs.getToDouble('value');
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final valueColor = _extractValueColor(namedArgs['valueColor']);
        final strokeWidth = namedArgs.getToDouble('strokeWidth') ?? 4.0;
        final semanticsLabel = namedArgs.get<String?>('semanticsLabel');
        final semanticsValue = namedArgs.get<String?>('semanticsValue');

        return CircularProgressIndicator.adaptive(
          key: key,
          value: value,
          backgroundColor: backgroundColor,
          valueColor: valueColor,
          strokeWidth: strokeWidth,
          semanticsLabel: semanticsLabel,
          semanticsValue: semanticsValue,
        );
      },
    },
    getters: {
      'value': (visitor, target) => (target as CircularProgressIndicator).value,
      'backgroundColor': (visitor, target) =>
          (target as CircularProgressIndicator).backgroundColor,
      'color': (visitor, target) => (target as CircularProgressIndicator).color,
      'valueColor': (visitor, target) =>
          (target as CircularProgressIndicator).valueColor,
      'strokeWidth': (visitor, target) =>
          (target as CircularProgressIndicator).strokeWidth,
      'semanticsLabel': (visitor, target) =>
          (target as CircularProgressIndicator).semanticsLabel,
      'semanticsValue': (visitor, target) =>
          (target as CircularProgressIndicator).semanticsValue,
    },
  );
}

/// Returns the BridgedClass for the Flutter LinearProgressIndicator widget.
BridgedClass getLinearProgressIndicatorBridgingDefinition() {
  return BridgedClass(
    nativeType: LinearProgressIndicator,
    name: 'LinearProgressIndicator',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final value = namedArgs.getToDouble('value');
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final color = namedArgs.get<Color?>('color');
        final valueColor = _extractValueColor(namedArgs['valueColor']);
        final minHeight = namedArgs.getToDouble('minHeight');
        final semanticsLabel = namedArgs.get<String?>('semanticsLabel');
        final semanticsValue = namedArgs.get<String?>('semanticsValue');
        final borderRadius = namedArgs.get<BorderRadiusGeometry?>('borderRadius');

        return LinearProgressIndicator(
          key: key,
          value: value,
          backgroundColor: backgroundColor,
          color: color,
          valueColor: valueColor,
          minHeight: minHeight,
          semanticsLabel: semanticsLabel,
          semanticsValue: semanticsValue,
          borderRadius: borderRadius,
        );
      },
    },
    getters: {
      'value': (visitor, target) => (target as LinearProgressIndicator).value,
      'backgroundColor': (visitor, target) =>
          (target as LinearProgressIndicator).backgroundColor,
      'valueColor': (visitor, target) =>
          (target as LinearProgressIndicator).valueColor,
      'minHeight': (visitor, target) =>
          (target as LinearProgressIndicator).minHeight,
      'semanticsLabel': (visitor, target) =>
          (target as LinearProgressIndicator).semanticsLabel,
      'semanticsValue': (visitor, target) =>
          (target as LinearProgressIndicator).semanticsValue,
    },
  );
}
