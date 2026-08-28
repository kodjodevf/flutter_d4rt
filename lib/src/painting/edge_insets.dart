import 'dart:ui';

import 'package:d4rt/d4rt.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_d4rt/utils/double.dart';
import 'package:flutter_d4rt/utils/extensions/list.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';

/// Returns the BridgedClass for the Flutter EdgeInsets class.
BridgedClass getEdgeInsetsBridgingDefinition() {
  return BridgedClass(
    nativeType: EdgeInsets,
    name: 'EdgeInsets',
    constructors: {
      'all': (visitor, positionalArgs, namedArgs) {
        final value = positionalArgs.getToDouble(0) ??
            namedArgs.getToDouble('value') ??
            0.0;
        return EdgeInsets.all(value);
      },
      'symmetric': (visitor, positionalArgs, namedArgs) {
        final vertical = namedArgs.getToDouble('vertical') ?? 0.0;
        final horizontal = namedArgs.getToDouble('horizontal') ?? 0.0;

        return EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal);
      },
      'only': (visitor, positionalArgs, namedArgs) {
        final left = namedArgs.getToDouble('left') ?? 0.0;
        final top = namedArgs.getToDouble('top') ?? 0.0;
        final right = namedArgs.getToDouble('right') ?? 0.0;
        final bottom = namedArgs.getToDouble('bottom') ?? 0.0;

        return EdgeInsets.only(
          left: left,
          top: top,
          right: right,
          bottom: bottom,
        );
      },
      'fromLTRB': (visitor, positionalArgs, namedArgs) {
        final left = toDouble(positionalArgs.get<dynamic>(0)) ?? 0.0;
        final top = toDouble(positionalArgs.get<dynamic>(1)) ?? 0.0;
        final right = toDouble(positionalArgs.get<dynamic>(2)) ?? 0.0;
        final bottom = toDouble(positionalArgs.get<dynamic>(3)) ?? 0.0;

        return EdgeInsets.fromLTRB(left, top, right, bottom);
      },
      'fromViewPadding': (visitor, positionalArgs, namedArgs) {
        final padding = positionalArgs.get<ViewPadding>(0);
        final devicePixelRatio = toDouble(positionalArgs.get<dynamic>(1));

        return EdgeInsets.fromViewPadding(padding!, devicePixelRatio!);
      },
      'zero': (visitor, positionalArgs, namedArgs) {
        return EdgeInsets.zero;
      },
    },
    staticGetters: {
      'zero': (visitor) {
        return EdgeInsets.zero;
      },
    },
    staticMethods: {
      'all': (visitor, positionalArgs, namedArgs) {
        final value = positionalArgs.getToDouble(0);
        return EdgeInsets.all(value!);
      },
      'symmetric': (visitor, positionalArgs, namedArgs) {
        final vertical = namedArgs.getToDouble('vertical') ?? 0.0;
        final horizontal = namedArgs.getToDouble('horizontal') ?? 0.0;

        return EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal);
      },
      'only': (visitor, positionalArgs, namedArgs) {
        final left = namedArgs.getToDouble('left') ?? 0.0;
        final top = namedArgs.getToDouble('top') ?? 0.0;
        final right = namedArgs.getToDouble('right') ?? 0.0;
        final bottom = namedArgs.getToDouble('bottom') ?? 0.0;

        return EdgeInsets.only(
          left: left,
          top: top,
          right: right,
          bottom: bottom,
        );
      },
      'fromLTRB': (visitor, positionalArgs, namedArgs) {
        final left = toDouble(positionalArgs.get<dynamic>(0));
        final top = toDouble(positionalArgs.get<dynamic>(1));
        final right = toDouble(positionalArgs.get<dynamic>(2));
        final bottom = toDouble(positionalArgs.get<dynamic>(3));

        return EdgeInsets.fromLTRB(left!, top!, right!, bottom!);
      },
      'fromViewPadding': (visitor, positionalArgs, namedArgs) {
        final padding = positionalArgs.get<ViewPadding>(0);
        final devicePixelRatio = toDouble(positionalArgs.get<dynamic>(1));

        return EdgeInsets.fromViewPadding(padding!, devicePixelRatio!);
      },
      'lerp': (visitor, positionalArgs, namedArgs) {
        final a = positionalArgs.get<EdgeInsets?>(0);
        final b = positionalArgs.get<EdgeInsets?>(1);
        final t = toDouble(positionalArgs.get<dynamic>(2));

        return EdgeInsets.lerp(a, b, t!);
      },
    },
    methods: {
      'add': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.get<EdgeInsetsGeometry>(0);
        return (target as EdgeInsets).add(other!);
      },
      'subtract': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.get<EdgeInsetsGeometry>(0);
        return (target as EdgeInsets).subtract(other!);
      },
      'resolve': (visitor, target, positionalArgs, namedArgs) {
        final direction = positionalArgs.get<TextDirection>(0);
        return (target as EdgeInsets).resolve(direction!);
      },
      'deflateRect': (visitor, target, positionalArgs, namedArgs) {
        final rect = positionalArgs.get<Rect>(0);
        return (target as EdgeInsets).deflateRect(rect!);
      },
      'inflateRect': (visitor, target, positionalArgs, namedArgs) {
        final rect = positionalArgs.get<Rect>(0);
        return (target as EdgeInsets).inflateRect(rect!);
      },
    },
    getters: {
      'left': (visitor, target) => (target as EdgeInsets).left,
      'top': (visitor, target) => (target as EdgeInsets).top,
      'right': (visitor, target) => (target as EdgeInsets).right,
      'bottom': (visitor, target) => (target as EdgeInsets).bottom,
      'horizontal': (visitor, target) => (target as EdgeInsets).horizontal,
      'vertical': (visitor, target) => (target as EdgeInsets).vertical,
      'bottomLeft': (visitor, target) => (target as EdgeInsets).bottomLeft,
      'bottomRight': (visitor, target) => (target as EdgeInsets).bottomRight,
      'topLeft': (visitor, target) => (target as EdgeInsets).topLeft,
      'topRight': (visitor, target) => (target as EdgeInsets).topRight,
      'flipped': (visitor, target) => (target as EdgeInsets).flipped,
    },
  );
}

BridgedClass getEdgeInsetsDirectionalBridgingDefinition() {
  return BridgedClass(
    nativeType: EdgeInsetsDirectional,
    name: 'EdgeInsetsDirectional',
    constructors: {
      'all': (visitor, positionalArgs, namedArgs) {
        final all = toDouble(positionalArgs.get<dynamic>(0));
        return EdgeInsetsDirectional.all(all!);
      },
      'symmetric': (visitor, positionalArgs, namedArgs) {
        final horizontal = toDouble(positionalArgs.get<dynamic>(0)) ?? 0.0;
        final vertical = toDouble(positionalArgs.get<dynamic>(1)) ?? 0.0;
        return EdgeInsetsDirectional.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        );
      },
      'only': (visitor, positionalArgs, namedArgs) {
        final start = positionalArgs.getToDouble(0) ?? 0.0;
        final top = positionalArgs.getToDouble(1) ?? 0.0;
        final end = positionalArgs.getToDouble(2) ?? 0.0;
        final bottom = positionalArgs.getToDouble(3) ?? 0.0;
        return EdgeInsetsDirectional.only(
          start: start,
          top: top,
          end: end,
          bottom: bottom,
        );
      },
      'fromSTEB': (visitor, positionalArgs, namedArgs) {
        final start = toDouble(positionalArgs.get<dynamic>(0));
        final top = toDouble(positionalArgs.get<dynamic>(1));
        final end = toDouble(positionalArgs.get<dynamic>(2));
        final bottom = toDouble(positionalArgs.get<dynamic>(3));
        return EdgeInsetsDirectional.fromSTEB(start!, top!, end!, bottom!);
      },

      'lerp': (visitor, positionalArgs, namedArgs) {
        final a = positionalArgs.get<EdgeInsetsDirectional>(0);
        final b = positionalArgs.get<EdgeInsetsDirectional>(1);
        final t = toDouble(positionalArgs.get<dynamic>(2));
        return EdgeInsetsDirectional.lerp(a, b, t!);
      },
      'zero': (visitor, positionalArgs, namedArgs) {
        return EdgeInsetsDirectional.zero;
      },
    },
    getters: {
      'start': (visitor, target) => (target as EdgeInsetsDirectional).start,
      'top': (visitor, target) => (target as EdgeInsetsDirectional).top,
      'end': (visitor, target) => (target as EdgeInsetsDirectional).end,
      'bottom': (visitor, target) => (target as EdgeInsetsDirectional).bottom,
      'horizontal': (visitor, target) =>
          (target as EdgeInsetsDirectional).horizontal,
      'vertical': (visitor, target) =>
          (target as EdgeInsetsDirectional).vertical,
      'flipped': (visitor, target) => (target as EdgeInsetsDirectional).flipped,
    },
  );
}

BridgedClass getEdgeInsetsGeometryBridgingDefinition() {
  return BridgedClass(
    nativeType: EdgeInsetsGeometry,
    name: 'EdgeInsetsGeometry',
    constructors: {
      'all': (visitor, positionalArgs, namedArgs) {
        final value = positionalArgs.getToDouble(0);
        return EdgeInsetsGeometry.all(value!);
      },
      'symmetric': (visitor, positionalArgs, namedArgs) {
        final vertical = namedArgs.getToDouble('vertical') ?? 0.0;
        final horizontal = namedArgs.getToDouble('horizontal') ?? 0.0;

        return EdgeInsetsGeometry.symmetric(
          vertical: vertical,
          horizontal: horizontal,
        );
      },
      'only': (visitor, positionalArgs, namedArgs) {
        final left = namedArgs.getToDouble('left') ?? 0.0;
        final top = namedArgs.getToDouble('top') ?? 0.0;
        final right = namedArgs.getToDouble('right') ?? 0.0;
        final bottom = namedArgs.getToDouble('bottom') ?? 0.0;

        return EdgeInsetsGeometry.only(
          left: left,
          top: top,
          right: right,
          bottom: bottom,
        );
      },
      'fromLTRB': (visitor, positionalArgs, namedArgs) {
        final left = toDouble(positionalArgs.get<dynamic>(0));
        final top = toDouble(positionalArgs.get<dynamic>(1));
        final right = toDouble(positionalArgs.get<dynamic>(2));
        final bottom = toDouble(positionalArgs.get<dynamic>(3));

        return EdgeInsetsGeometry.fromLTRB(left!, top!, right!, bottom!);
      },
      'fromViewPadding': (visitor, positionalArgs, namedArgs) {
        final padding = positionalArgs.get<ViewPadding>(0);
        final devicePixelRatio = toDouble(positionalArgs.get<dynamic>(1));

        return EdgeInsetsGeometry.fromViewPadding(padding!, devicePixelRatio!);
      },
      'zero': (visitor, positionalArgs, namedArgs) {
        return EdgeInsetsGeometry.zero;
      },
      'lerp': (visitor, positionalArgs, namedArgs) {
        final a = positionalArgs.get<EdgeInsets?>(0);
        final b = positionalArgs.get<EdgeInsets?>(1);
        final t = toDouble(positionalArgs.get<dynamic>(2));

        return EdgeInsetsGeometry.lerp(a, b, t!);
      },
    },
    getters: {
      'collapsedSize': (visitor, target) =>
          (target as EdgeInsetsGeometry).collapsedSize,
      'flipped': (visitor, target) => (target as EdgeInsetsGeometry).flipped,
      'horizontal': (visitor, target) =>
          (target as EdgeInsetsGeometry).horizontal,
      'vertical': (visitor, target) => (target as EdgeInsetsGeometry).vertical,
    },
  );
}
