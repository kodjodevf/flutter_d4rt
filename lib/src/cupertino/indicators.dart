import 'package:d4rt/d4rt.dart';
import 'package:flutter/cupertino.dart';

/// Returns the BridgedClass for Flutter CupertinoActivityIndicator.
BridgedClass getCupertinoActivityIndicatorBridgingDefinition() {
  return BridgedClass(
    nativeType: CupertinoActivityIndicator,
    name: 'CupertinoActivityIndicator',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final color = namedArgs.get<Color?>('color');
        final animating = namedArgs.get<bool?>('animating') ?? true;
        final radius = (namedArgs['radius'] as num?)?.toDouble() ?? 10.0;

        return CupertinoActivityIndicator(
          key: key,
          color: color,
          animating: animating,
          radius: radius,
        );
      },
      'partiallyRevealed': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final color = namedArgs.get<Color?>('color');
        final radius = (namedArgs['radius'] as num?)?.toDouble() ?? 10.0;
        final progress = (namedArgs['progress'] as num?)?.toDouble() ?? 1.0;

        return CupertinoActivityIndicator.partiallyRevealed(
          key: key,
          color: color,
          radius: radius,
          progress: progress,
        );
      },
    },
    getters: {
      'color': (visitor, target) =>
          (target as CupertinoActivityIndicator).color,
      'animating': (visitor, target) =>
          (target as CupertinoActivityIndicator).animating,
      'radius': (visitor, target) =>
          (target as CupertinoActivityIndicator).radius,
      'progress': (visitor, target) =>
          (target as CupertinoActivityIndicator).progress,
    },
  );
}
