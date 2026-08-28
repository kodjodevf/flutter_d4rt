// ignore_for_file: non_const_argument_for_const_parameter

import 'package:d4rt/d4rt.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for the Flutter Icon widget.
BridgedClass getIconBridgingDefinition() {
  return BridgedClass(
    nativeType: Icon,
    name: 'Icon',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final icon = positionalArgs.get<IconData?>(0);
        final key = namedArgs.get<Key?>('key');
        final size = namedArgs.getToDouble('size');
        final color = namedArgs.get<Color?>('color');
        final semanticLabel = namedArgs.get<String?>('semanticLabel');
        final textDirection = namedArgs.get<TextDirection?>('textDirection');

        return Icon(
          icon,
          key: key,
          size: size,
          color: color,
          semanticLabel: semanticLabel,
          textDirection: textDirection,
        );
      },
    },
    getters: {
      'icon': (visitor, target) => (target as Icon).icon,
      'size': (visitor, target) => (target as Icon).size,
      'color': (visitor, target) => (target as Icon).color,
      'semanticLabel': (visitor, target) => (target as Icon).semanticLabel,
      'textDirection': (visitor, target) => (target as Icon).textDirection,
      'key': (visitor, target) => (target as Icon).key,
    },
  );
}

/// Returns the BridgedClass for IconData.
BridgedClass getIconDataBridgingDefinition() {
  return BridgedClass(
    nativeType: IconData,
    name: 'IconData',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final codePoint = positionalArgs.isNotEmpty
            ? positionalArgs[0] as int
            : namedArgs['codePoint'] as int? ?? 0;
        final fontFamily = namedArgs.get<String?>('fontFamily');
        final fontPackage = namedArgs.get<String?>('fontPackage');
        final matchTextDirection =
            namedArgs.get<bool?>('matchTextDirection') ?? false;

        return IconData(
          codePoint,
          fontFamily: fontFamily,
          fontPackage: fontPackage,
          matchTextDirection: matchTextDirection,
        );
      },
    },
    getters: {
      'codePoint': (visitor, target) => (target as IconData).codePoint,
      'fontFamily': (visitor, target) => (target as IconData).fontFamily,
      'fontPackage': (visitor, target) => (target as IconData).fontPackage,
      'matchTextDirection': (visitor, target) =>
          (target as IconData).matchTextDirection,
    },
    isSubtypeOfFunc: (value) => value is IconData,
  );
}

/// Returns the BridgedClass for IconThemeData.
BridgedClass getIconThemeDataBridgingDefinition() {
  return BridgedClass(
    nativeType: IconThemeData,
    name: 'IconThemeData',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final color = namedArgs.get<Color?>('color');
        final opacity = namedArgs.getToDouble('opacity');
        final size = namedArgs.getToDouble('size');
        final shadows = namedArgs.get<List<Shadow>?>('shadows');

        return IconThemeData(
          color: color,
          opacity: opacity,
          size: size,
          shadows: shadows,
        );
      },
      'fallback': (visitor, positionalArgs, namedArgs) {
        return const IconThemeData.fallback();
      },
    },
    getters: {
      'color': (visitor, target) => (target as IconThemeData).color,
      'opacity': (visitor, target) => (target as IconThemeData).opacity,
      'size': (visitor, target) => (target as IconThemeData).size,
      'shadows': (visitor, target) => (target as IconThemeData).shadows,
    },
    methods: {
      'copyWith': (visitor, target, positionalArgs, namedArgs) {
        final color = namedArgs.get<Color?>('color');
        final opacity = namedArgs.getToDouble('opacity');
        final size = namedArgs.getToDouble('size');
        final shadows = namedArgs.get<List<Shadow>?>('shadows');

        return (target as IconThemeData).copyWith(
          color: color,
          opacity: opacity,
          size: size,
          shadows: shadows,
        );
      },
    },
    isSubtypeOfFunc: (value) => value is IconThemeData,
  );
}

/// Returns the BridgedClass for IconTheme.
BridgedClass getIconThemeBridgingDefinition() {
  return BridgedClass(
    nativeType: IconTheme,
    name: 'IconTheme',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final data =
            namedArgs.get<IconThemeData>('data') ?? const IconThemeData();
        final child = visitor.toWidgets(namedArgs['child']) ?? const SizedBox.shrink();

        return IconTheme(key: key, data: data, child: child);
      },
    },
    staticMethods: {
      'of': (visitor, positionalArgs, namedArgs) {
        final context = positionalArgs[0] as BuildContext;
        return IconTheme.of(context);
      },
    },
    getters: {
      'data': (visitor, target) => (target as IconTheme).data,
      'child': (visitor, target) => (target as IconTheme).child,
      'key': (visitor, target) => (target as IconTheme).key,
    },
  );
}

