import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';

/// Returns the BridgedClass for the Flutter ElevatedButtonThemeData class.
BridgedClass getElevatedButtonThemeDataBridgingDefinition() {
  return BridgedClass(
    nativeType: ElevatedButtonThemeData,
    name: 'ElevatedButtonThemeData',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return ElevatedButtonThemeData(
          style: namedArgs['style'] as ButtonStyle?,
        );
      },
    },
    getters: {
      'style': (visitor, target) => (target as ElevatedButtonThemeData).style,
    },
  );
}

WidgetStateProperty<T?>? _castProperty<T>(dynamic raw) {
  if (raw == null) return null;
  if (raw is WidgetStateProperty<T?>) return raw;
  if (raw is WidgetStateProperty<T>) {
    return WidgetStateProperty.resolveWith((states) => raw.resolve(states));
  }
  if (raw is WidgetStateProperty) {
    return WidgetStateProperty.resolveWith((states) {
      final res = raw.resolve(states);
      return res is BridgedInstance ? res.nativeObject as T? : res as T?;
    });
  }
  if (raw is T) {
    return WidgetStateProperty.all(raw);
  }
  return null;
}

/// Returns the BridgedClass for the Flutter ButtonStyle class.
BridgedClass getButtonStyleBridgingDefinition() {
  return BridgedClass(
    nativeType: ButtonStyle,
    name: 'ButtonStyle',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return ButtonStyle(
          textStyle: _castProperty<TextStyle>(namedArgs['textStyle']),
          backgroundColor: _castProperty<Color>(namedArgs['backgroundColor']),
          foregroundColor: _castProperty<Color>(namedArgs['foregroundColor']),
          overlayColor: _castProperty<Color>(namedArgs['overlayColor']),
          shadowColor: _castProperty<Color>(namedArgs['shadowColor']),
          surfaceTintColor: _castProperty<Color>(namedArgs['surfaceTintColor']),
          elevation: _castProperty<double>(namedArgs['elevation']),
          padding: _castProperty<EdgeInsetsGeometry>(namedArgs['padding']),
          minimumSize: _castProperty<Size>(namedArgs['minimumSize']),
          fixedSize: _castProperty<Size>(namedArgs['fixedSize']),
          maximumSize: _castProperty<Size>(namedArgs['maximumSize']),
          side: _castProperty<BorderSide>(namedArgs['side']),
          shape: _castProperty<OutlinedBorder>(namedArgs['shape']),
          mouseCursor: _castProperty<MouseCursor>(namedArgs['mouseCursor']),
          visualDensity: namedArgs['visualDensity'] as VisualDensity?,
          tapTargetSize: namedArgs['tapTargetSize'] as MaterialTapTargetSize?,
          animationDuration: namedArgs['animationDuration'] as Duration?,
          enableFeedback: namedArgs['enableFeedback'] as bool?,
          alignment: namedArgs['alignment'] as AlignmentGeometry?,
          splashFactory: namedArgs['splashFactory'] as InteractiveInkFeatureFactory?,
        );
      },
    },
    staticMethods: {
      'resolveWith': (visitor, positionalArgs, namedArgs) {
        final callback = positionalArgs.first as WidgetPropertyResolver;
        return WidgetStateProperty.resolveWith(callback);
      },
    },
    getters: {
      'textStyle': (visitor, target) => (target as ButtonStyle).textStyle,
      'backgroundColor': (visitor, target) =>
          (target as ButtonStyle).backgroundColor,
      'foregroundColor': (visitor, target) =>
          (target as ButtonStyle).foregroundColor,
      'overlayColor': (visitor, target) => (target as ButtonStyle).overlayColor,
      'shadowColor': (visitor, target) => (target as ButtonStyle).shadowColor,
      'surfaceTintColor': (visitor, target) =>
          (target as ButtonStyle).surfaceTintColor,
      'elevation': (visitor, target) => (target as ButtonStyle).elevation,
      'padding': (visitor, target) => (target as ButtonStyle).padding,
      'minimumSize': (visitor, target) => (target as ButtonStyle).minimumSize,
      'fixedSize': (visitor, target) => (target as ButtonStyle).fixedSize,
      'maximumSize': (visitor, target) => (target as ButtonStyle).maximumSize,
      'side': (visitor, target) => (target as ButtonStyle).side,
      'shape': (visitor, target) => (target as ButtonStyle).shape,
      'mouseCursor': (visitor, target) => (target as ButtonStyle).mouseCursor,
      'visualDensity': (visitor, target) =>
          (target as ButtonStyle).visualDensity,
      'tapTargetSize': (visitor, target) =>
          (target as ButtonStyle).tapTargetSize,
      'animationDuration': (visitor, target) =>
          (target as ButtonStyle).animationDuration,
      'enableFeedback': (visitor, target) =>
          (target as ButtonStyle).enableFeedback,
      'alignment': (visitor, target) => (target as ButtonStyle).alignment,
      'splashFactory': (visitor, target) =>
          (target as ButtonStyle).splashFactory,
    },
    methods: {
      'copyWith': (visitor, target, positionalArgs, namedArgs) {
        return (target as ButtonStyle).copyWith(
          textStyle: namedArgs.get<WidgetStateProperty<TextStyle?>?>(
            'textStyle',
          ),
          backgroundColor: namedArgs.get<WidgetStateProperty<Color?>?>(
            'backgroundColor',
          ),
          foregroundColor: namedArgs.get<WidgetStateProperty<Color?>?>(
            'foregroundColor',
          ),
          overlayColor: namedArgs.get<WidgetStateProperty<Color?>?>(
            'overlayColor',
          ),
          shadowColor: namedArgs.get<WidgetStateProperty<Color?>?>(
            'shadowColor',
          ),
          surfaceTintColor: namedArgs.get<WidgetStateProperty<Color?>?>(
            'surfaceTintColor',
          ),
          elevation: namedArgs.get<WidgetStateProperty<double?>?>('elevation'),
          padding: namedArgs.get<WidgetStateProperty<EdgeInsetsGeometry?>?>(
            'padding',
          ),
          minimumSize: namedArgs.get<WidgetStateProperty<Size?>?>(
            'minimumSize',
          ),
          fixedSize: namedArgs.get<WidgetStateProperty<Size?>?>('fixedSize'),
          maximumSize: namedArgs.get<WidgetStateProperty<Size?>?>(
            'maximumSize',
          ),
          side: namedArgs.get<WidgetStateProperty<BorderSide?>?>('side'),
          shape: namedArgs.get<WidgetStateProperty<OutlinedBorder?>?>('shape'),
          mouseCursor: namedArgs.get<WidgetStateProperty<MouseCursor?>?>(
            'mouseCursor',
          ),
          visualDensity: namedArgs.get<VisualDensity?>('visualDensity'),
          tapTargetSize: namedArgs.get<MaterialTapTargetSize?>('tapTargetSize'),
          animationDuration: namedArgs.get<Duration?>('animationDuration'),
          enableFeedback: namedArgs.get<bool?>('enableFeedback'),
          alignment: namedArgs.get<AlignmentGeometry?>('alignment'),
          splashFactory: namedArgs.get<InteractiveInkFeatureFactory?>(
            'splashFactory',
          ),
        );
      },
      'merge': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.firstOrNull as ButtonStyle?;
        return (target as ButtonStyle).merge(other);
      },
    },
  );
}
