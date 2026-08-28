import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';

/// Returns the BridgedClass for Flutter Shadow.
BridgedClass getShadowBridgingDefinition() {
  return BridgedClass(
    nativeType: Shadow,
    name: 'Shadow',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final color = namedArgs.get<Color?>('color') ?? const Color(0xFF000000);
        final offset = namedArgs.get<Offset?>('offset') ?? Offset.zero;
        final blurRadius = namedArgs.getToDouble('blurRadius') ?? 0.0;

        return Shadow(
          color: color,
          offset: offset,
          blurRadius: blurRadius,
        );
      },
    },
    getters: {
      'color': (visitor, target) => (target as Shadow).color,
      'offset': (visitor, target) => (target as Shadow).offset,
      'blurRadius': (visitor, target) => (target as Shadow).blurRadius,
    },
  );
}

/// Returns the BridgedClass for Flutter BoxShadow.
BridgedClass getBoxShadowBridgingDefinition() {
  return BridgedClass(
    nativeType: BoxShadow,
    name: 'BoxShadow',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final color = namedArgs.get<Color?>('color') ?? const Color(0xFF000000);
        final offset = namedArgs.get<Offset?>('offset') ?? Offset.zero;
        final blurRadius = namedArgs.getToDouble('blurRadius') ?? 0.0;
        final spreadRadius = namedArgs.getToDouble('spreadRadius') ?? 0.0;
        final blurStyle = namedArgs.get<BlurStyle?>('blurStyle') ?? BlurStyle.normal;

        return BoxShadow(
          color: color,
          offset: offset,
          blurRadius: blurRadius,
          spreadRadius: spreadRadius,
          blurStyle: blurStyle,
        );
      },
    },
    getters: {
      'color': (visitor, target) => (target as BoxShadow).color,
      'offset': (visitor, target) => (target as BoxShadow).offset,
      'blurRadius': (visitor, target) => (target as BoxShadow).blurRadius,
      'spreadRadius': (visitor, target) => (target as BoxShadow).spreadRadius,
      'blurStyle': (visitor, target) => (target as BoxShadow).blurStyle,
    },
  );
}

/// Returns the BridgedEnumDefinition for BlurStyle enum.
BridgedEnumDefinition<BlurStyle> getBlurStyleBridgingDefinition() {
  return BridgedEnumDefinition<BlurStyle>(
    name: 'BlurStyle',
    values: BlurStyle.values,
  );
}
