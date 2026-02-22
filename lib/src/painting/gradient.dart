import 'dart:math' as math;
import 'package:d4rt/d4rt.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_d4rt/utils/double.dart';

/// Returns all gradient bridge definitions for the painting layer
Map<String, dynamic> getGradientBridgingDefinitions() {
  return {
    'GradientTransform': getGradientTransformBridgingDefinition(),
    'GradientRotation': getGradientRotationBridgingDefinition(),
    'Gradient': getFlutterGradientBridgingDefinition(),
    'LinearGradient': getLinearGradientBridgingDefinition(),
    'RadialGradient': getRadialGradientBridgingDefinition(),
    'SweepGradient': getSweepGradientBridgingDefinition(),
  };
}

/// Returns the BridgedClass for the Flutter painting GradientTransform abstract class.
BridgedClass getGradientTransformBridgingDefinition() {
  return BridgedClass(
    nativeType: GradientTransform,
    name: 'GradientTransform',
    constructors: {},
    getters: {},
    methods: {
      'transform': (visitor, target, positionalArgs, namedArgs) {
        final bounds = positionalArgs.get<Rect>(0)!;
        final textDirection = namedArgs.get<TextDirection>('textDirection');
        return (target as GradientTransform).transform(
          bounds,
          textDirection: textDirection,
        );
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter painting GradientRotation class.
BridgedClass getGradientRotationBridgingDefinition() {
  return BridgedClass(
    nativeType: GradientRotation,
    name: 'GradientRotation',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final radians = toDouble(positionalArgs.get<dynamic>(0))!;
        return GradientRotation(radians);
      },
    },
    getters: {
      'radians': (visitor, target) => (target as GradientRotation).radians,
    },
    methods: {
      'transform': (visitor, target, positionalArgs, namedArgs) {
        final bounds = positionalArgs.get<Rect>(0)!;
        final textDirection = namedArgs.get<TextDirection>('textDirection');
        return (target as GradientRotation).transform(
          bounds,
          textDirection: textDirection,
        );
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter painting Gradient abstract class.
BridgedClass getFlutterGradientBridgingDefinition() {
  return BridgedClass(
    nativeType: Gradient,
    name: 'Gradient',
    constructors: {
      'lerp': (visitor, positionalArgs, namedArgs) {
        final a = positionalArgs.get<Gradient?>(0);
        final b = positionalArgs.get<Gradient?>(1);
        final t = toDouble(positionalArgs.get<dynamic>(2))!;
        return Gradient.lerp(a, b, t);
      },
    },
    getters: {
      'colors': (visitor, target) => (target as Gradient).colors,
      'stops': (visitor, target) => (target as Gradient).stops,
      'transform': (visitor, target) => (target as Gradient).transform,
    },
    methods: {
      'createShader': (visitor, target, positionalArgs, namedArgs) {
        final rect = positionalArgs.get<Rect>(0)!;
        final textDirection = namedArgs.get<TextDirection>('textDirection');
        return (target as Gradient).createShader(
          rect,
          textDirection: textDirection,
        );
      },
      'scale': (visitor, target, positionalArgs, namedArgs) {
        final factor = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as Gradient).scale(factor);
      },
      'withOpacity': (visitor, target, positionalArgs, namedArgs) {
        final opacity = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as Gradient).withOpacity(opacity);
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter painting LinearGradient class.
BridgedClass getLinearGradientBridgingDefinition() {
  return BridgedClass(
    nativeType: LinearGradient,
    name: 'LinearGradient',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final begin =
            namedArgs.get<AlignmentGeometry>('begin') ?? Alignment.centerLeft;
        final end =
            namedArgs.get<AlignmentGeometry>('end') ?? Alignment.centerRight;
        final colors = namedArgs.get<List>('colors')!;
        final stops = namedArgs.get<List?>("stops");
        final tileMode = namedArgs.get<TileMode?>('tileMode') ?? TileMode.clamp;
        final transform = namedArgs.get<GradientTransform?>('transform');
        return LinearGradient(
          begin: begin,
          end: end,
          colors: colors.cast(),
          stops: stops?.cast(),
          tileMode: tileMode,
          transform: transform,
        );
      },
      'lerp': (visitor, positionalArgs, namedArgs) {
        final a = positionalArgs.get<LinearGradient?>(0);
        final b = positionalArgs.get<LinearGradient?>(1);
        final t = toDouble(positionalArgs.get<dynamic>(2))!;
        return LinearGradient.lerp(a, b, t);
      },
    },
    getters: {
      'begin': (visitor, target) => (target as LinearGradient).begin,
      'end': (visitor, target) => (target as LinearGradient).end,
      'colors': (visitor, target) => (target as LinearGradient).colors,
      'stops': (visitor, target) => (target as LinearGradient).stops,
      'tileMode': (visitor, target) => (target as LinearGradient).tileMode,
      'transform': (visitor, target) => (target as LinearGradient).transform,
    },
    methods: {
      'createShader': (visitor, target, positionalArgs, namedArgs) {
        final rect = positionalArgs.get<Rect>(0)!;
        final textDirection = namedArgs.get<TextDirection?>('textDirection');
        return (target as LinearGradient).createShader(
          rect,
          textDirection: textDirection,
        );
      },
      'scale': (visitor, target, positionalArgs, namedArgs) {
        final factor = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as LinearGradient).scale(factor);
      },
      'withOpacity': (visitor, target, positionalArgs, namedArgs) {
        final opacity = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as LinearGradient).withOpacity(opacity);
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter painting RadialGradient class.
BridgedClass getRadialGradientBridgingDefinition() {
  return BridgedClass(
    nativeType: RadialGradient,
    name: 'RadialGradient',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final center =
            namedArgs.get<AlignmentGeometry?>('center') ?? Alignment.center;
        final radius = toDouble(namedArgs.get<dynamic>('radius')) ?? 0.5;
        final colors = namedArgs.get<List>('colors')!;
        final stops = namedArgs.get<List?>("stops");
        final tileMode = namedArgs.get<TileMode?>('tileMode') ?? TileMode.clamp;
        final focal = namedArgs.get<AlignmentGeometry?>('focal');
        final focalRadius =
            toDouble(namedArgs.get<dynamic>('focalRadius')) ?? 0.0;
        final transform = namedArgs.get<GradientTransform?>('transform');
        return RadialGradient(
          center: center,
          radius: radius,
          colors: colors.cast(),
          stops: stops?.cast(),
          tileMode: tileMode,
          focal: focal,
          focalRadius: focalRadius,
          transform: transform,
        );
      },
      'lerp': (visitor, positionalArgs, namedArgs) {
        final a = positionalArgs.get<RadialGradient?>(0);
        final b = positionalArgs.get<RadialGradient?>(1);
        final t = toDouble(positionalArgs.get<dynamic>(2))!;
        return RadialGradient.lerp(a, b, t);
      },
    },
    getters: {
      'center': (visitor, target) => (target as RadialGradient).center,
      'radius': (visitor, target) => (target as RadialGradient).radius,
      'colors': (visitor, target) => (target as RadialGradient).colors,
      'stops': (visitor, target) => (target as RadialGradient).stops,
      'tileMode': (visitor, target) => (target as RadialGradient).tileMode,
      'focal': (visitor, target) => (target as RadialGradient).focal,
      'focalRadius': (visitor, target) =>
          (target as RadialGradient).focalRadius,
      'transform': (visitor, target) => (target as RadialGradient).transform,
    },
    methods: {
      'createShader': (visitor, target, positionalArgs, namedArgs) {
        final rect = positionalArgs.get<Rect>(0)!;
        final textDirection = namedArgs.get<TextDirection?>('textDirection');
        return (target as RadialGradient).createShader(
          rect,
          textDirection: textDirection,
        );
      },
      'scale': (visitor, target, positionalArgs, namedArgs) {
        final factor = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as RadialGradient).scale(factor);
      },
      'withOpacity': (visitor, target, positionalArgs, namedArgs) {
        final opacity = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as RadialGradient).withOpacity(opacity);
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter painting SweepGradient class.
BridgedClass getSweepGradientBridgingDefinition() {
  return BridgedClass(
    nativeType: SweepGradient,
    name: 'SweepGradient',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final center =
            namedArgs.get<AlignmentGeometry>('center') ?? Alignment.center;
        final startAngle =
            toDouble(namedArgs.get<dynamic>('startAngle')) ?? 0.0;
        final endAngle =
            toDouble(namedArgs.get<dynamic>('endAngle')) ?? math.pi * 2;
        final colors = namedArgs.get<List>('colors')!;
        final stops = namedArgs.get<List>('stops')!;
        final tileMode = namedArgs.get<TileMode>('tileMode') ?? TileMode.clamp;
        final transform = namedArgs.get<GradientTransform>('transform');
        return SweepGradient(
          center: center,
          startAngle: startAngle,
          endAngle: endAngle,
          colors: colors.cast(),
          stops: stops.cast(),
          tileMode: tileMode,
          transform: transform,
        );
      },
      'lerp': (visitor, positionalArgs, namedArgs) {
        final a = positionalArgs.get<SweepGradient?>(0);
        final b = positionalArgs.get<SweepGradient?>(1);
        final t = toDouble(positionalArgs.get<dynamic>(2))!;
        return SweepGradient.lerp(a, b, t);
      },
    },
    getters: {
      'center': (visitor, target) => (target as SweepGradient).center,
      'startAngle': (visitor, target) => (target as SweepGradient).startAngle,
      'endAngle': (visitor, target) => (target as SweepGradient).endAngle,
      'colors': (visitor, target) => (target as SweepGradient).colors,
      'stops': (visitor, target) => (target as SweepGradient).stops,
      'tileMode': (visitor, target) => (target as SweepGradient).tileMode,
      'transform': (visitor, target) => (target as SweepGradient).transform,
    },
    methods: {
      'createShader': (visitor, target, positionalArgs, namedArgs) {
        final rect = positionalArgs.get<Rect>(0)!;
        final textDirection = namedArgs.get<TextDirection>('textDirection');
        return (target as SweepGradient).createShader(
          rect,
          textDirection: textDirection,
        );
      },
      'scale': (visitor, target, positionalArgs, namedArgs) {
        final factor = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as SweepGradient).scale(factor);
      },
      'withOpacity': (visitor, target, positionalArgs, namedArgs) {
        final opacity = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as SweepGradient).withOpacity(opacity);
      },
    },
  );
}
