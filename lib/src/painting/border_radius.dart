import 'package:d4rt/d4rt.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_d4rt/utils/double.dart';

/// Returns the BridgedClass for the Flutter BorderRadius class.
BridgedClass getBorderRadiusBridgingDefinition() {
  return BridgedClass(
    nativeType: BorderRadius,
    name: 'BorderRadius',
    constructors: {
      'all': (visitor, positionalArgs, namedArgs) {
        final radius = positionalArgs.get<Radius>(0);
        return BorderRadius.all(radius!);
      },
      'circular': (visitor, positionalArgs, namedArgs) {
        final radius = toDouble(positionalArgs.get<dynamic>(0));
        return BorderRadius.circular(radius!);
      },
      'horizontal': (visitor, positionalArgs, namedArgs) {
        final left = namedArgs.get<Radius?>('left') ?? Radius.zero;
        final right = namedArgs.get<Radius?>('right') ?? Radius.zero;
        return BorderRadius.horizontal(left: left, right: right);
      },
      'vertical': (visitor, positionalArgs, namedArgs) {
        final top = namedArgs.get<Radius?>('top') ?? Radius.zero;
        final bottom = namedArgs.get<Radius?>('bottom') ?? Radius.zero;
        return BorderRadius.vertical(top: top, bottom: bottom);
      },
      'only': (visitor, positionalArgs, namedArgs) {
        final topLeft = namedArgs.get<Radius?>('topLeft') ?? Radius.zero;
        final topRight = namedArgs.get<Radius?>('topRight') ?? Radius.zero;
        final bottomLeft = namedArgs.get<Radius?>('bottomLeft') ?? Radius.zero;
        final bottomRight =
            namedArgs.get<Radius?>('bottomRight') ?? Radius.zero;
        return BorderRadius.only(
          topLeft: topLeft,
          topRight: topRight,
          bottomLeft: bottomLeft,
          bottomRight: bottomRight,
        );
      },
      'zero': (visitor, positionalArgs, namedArgs) {
        return BorderRadius.zero;
      },
    },
    staticGetters: {
      'zero': (visitor) => BorderRadius.zero,
    },
    getters: {
      'topLeft': (visitor, target) => (target as BorderRadius).topLeft,
      'topRight': (visitor, target) => (target as BorderRadius).topRight,
      'bottomLeft': (visitor, target) => (target as BorderRadius).bottomLeft,
      'bottomRight': (visitor, target) => (target as BorderRadius).bottomRight,
    },
  );
}

/// Returns the BridgedClass for the Flutter BorderRadiusGeometry abstract class.
BridgedClass getBorderRadiusGeometryBridgingDefinition() {
  return BridgedClass(
    nativeType: BorderRadiusGeometry,
    name: 'BorderRadiusGeometry',
    constructors: {},
    isSubtypeOfFunc: (value) => value is BorderRadiusGeometry,
  );
}

/// Returns the BridgedClass for the Flutter BorderRadiusDirectional class.
BridgedClass getBorderRadiusDirectionalBridgingDefinition() {
  return BridgedClass(
    nativeType: BorderRadiusDirectional,
    name: 'BorderRadiusDirectional',
    constructors: {
      'all': (visitor, positionalArgs, namedArgs) {
        final radius = positionalArgs.get<Radius>(0);
        return BorderRadiusDirectional.all(radius!);
      },
      'circular': (visitor, positionalArgs, namedArgs) {
        final radius = toDouble(positionalArgs.get<dynamic>(0));
        return BorderRadiusDirectional.circular(radius!);
      },
      'horizontal': (visitor, positionalArgs, namedArgs) {
        final start = namedArgs.get<Radius?>('start') ?? Radius.zero;
        final end = namedArgs.get<Radius?>('end') ?? Radius.zero;
        return BorderRadiusDirectional.horizontal(start: start, end: end);
      },
      'vertical': (visitor, positionalArgs, namedArgs) {
        final top = namedArgs.get<Radius?>('top') ?? Radius.zero;
        final bottom = namedArgs.get<Radius?>('bottom') ?? Radius.zero;
        return BorderRadiusDirectional.vertical(top: top, bottom: bottom);
      },
      'only': (visitor, positionalArgs, namedArgs) {
        final topStart = namedArgs.get<Radius?>('topStart') ?? Radius.zero;
        final topEnd = namedArgs.get<Radius?>('topEnd') ?? Radius.zero;
        final bottomStart =
            namedArgs.get<Radius?>('bottomStart') ?? Radius.zero;
        final bottomEnd = namedArgs.get<Radius?>('bottomEnd') ?? Radius.zero;
        return BorderRadiusDirectional.only(
          topStart: topStart,
          topEnd: topEnd,
          bottomStart: bottomStart,
          bottomEnd: bottomEnd,
        );
      },
      'zero': (visitor, positionalArgs, namedArgs) {
        return BorderRadiusDirectional.zero;
      },
    },
    staticGetters: {
      'zero': (visitor) => BorderRadiusDirectional.zero,
    },
    getters: {
      'topStart': (visitor, target) =>
          (target as BorderRadiusDirectional).topStart,
      'topEnd': (visitor, target) => (target as BorderRadiusDirectional).topEnd,
      'bottomStart': (visitor, target) =>
          (target as BorderRadiusDirectional).bottomStart,
      'bottomEnd': (visitor, target) =>
          (target as BorderRadiusDirectional).bottomEnd,
    },
  );
}

