// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/double.dart';
import 'package:flutter_d4rt/utils/extensions/list.dart';

/// Returns the BridgedClass for the Flutter MaterialColor class.
BridgedClass getMaterialColorBridgingDefinition() {
  return BridgedClass(
    nativeType: MaterialColor,
    name: 'MaterialColor',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final primary = positionalArgs[0] as int;
        final swatch = positionalArgs[1] as Map;
        return MaterialColor(primary, swatch.cast());
      },
    },
    getters: {
      'shade50': (visitor, target) => (target as MaterialColor).shade50,
      'shade100': (visitor, target) => (target as MaterialColor).shade100,
      'shade200': (visitor, target) => (target as MaterialColor).shade200,
      'shade300': (visitor, target) => (target as MaterialColor).shade300,
      'shade400': (visitor, target) => (target as MaterialColor).shade400,
      'shade500': (visitor, target) => (target as MaterialColor).shade500,
      'shade600': (visitor, target) => (target as MaterialColor).shade600,
      'shade700': (visitor, target) => (target as MaterialColor).shade700,
      'shade800': (visitor, target) => (target as MaterialColor).shade800,
      'shade900': (visitor, target) => (target as MaterialColor).shade900,
      'value': (visitor, target) => (target as MaterialColor).value,
    },
    methods: {
      '[]': (visitor, target, positionalArgs, namedArgs) {
        final color = target as MaterialColor;
        final index = positionalArgs[0] as int;
        return color[index];
      },
      'computeLuminance': (visitor, target, positionalArgs, namedArgs) {
        return (target as MaterialColor).computeLuminance();
      },
      'toARGB32': (visitor, target, positionalArgs, namedArgs) {
        return (target as MaterialColor).toARGB32();
      },
      'withAlpha': (visitor, target, positionalArgs, namedArgs) {
        final alpha = positionalArgs.get<int?>(0);
        return (target as MaterialColor).withAlpha(alpha!);
      },
      'withRed': (visitor, target, positionalArgs, namedArgs) {
        final red = positionalArgs.get<int?>(0);
        return (target as MaterialColor).withRed(red!);
      },
      'withGreen': (visitor, target, positionalArgs, namedArgs) {
        final green = positionalArgs.get<int?>(0);
        return (target as MaterialColor).withGreen(green!);
      },
      'withBlue': (visitor, target, positionalArgs, namedArgs) {
        final blue = positionalArgs.get<int?>(0);
        return (target as Color).withBlue(blue!);
      },
      'withOpacity': (visitor, target, positionalArgs, namedArgs) {
        final opacity = toDouble(positionalArgs.get<dynamic>(0));
        return (target as MaterialColor).withOpacity(opacity!);
      },
      'withValues': (visitor, target, positionalArgs, namedArgs) {
        final red = positionalArgs.getToDouble(0);
        final green = positionalArgs.getToDouble(1);
        final blue = positionalArgs.getToDouble(2);
        final alpha = positionalArgs.getToDouble(3);
        final colorSpace = positionalArgs.get<ColorSpace?>(4);
        return (target as MaterialColor).withValues(
          alpha: alpha,
          green: green,
          blue: blue,
          red: red,
          colorSpace: colorSpace,
        );
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter MaterialAccentColor class.
BridgedClass getMaterialAccentColorBridgingDefinition() {
  return BridgedClass(
    nativeType: MaterialAccentColor,
    name: 'MaterialAccentColor',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final primary = positionalArgs[0] as int;
        final swatch = positionalArgs[1] as Map;
        return MaterialAccentColor(primary, swatch.cast());
      },
    },
    getters: {
      'shade100': (visitor, target) => (target as MaterialAccentColor).shade100,
      'shade200': (visitor, target) => (target as MaterialAccentColor).shade200,
      'shade400': (visitor, target) => (target as MaterialAccentColor).shade400,
      'shade700': (visitor, target) => (target as MaterialAccentColor).shade700,
      'value': (visitor, target) => (target as MaterialAccentColor).value,
    },
    methods: {
      '[]': (visitor, target, positionalArgs, namedArgs) {
        final color = target as MaterialAccentColor;
        final index = positionalArgs[0] as int;
        return color[index];
      },
      'computeLuminance': (visitor, target, positionalArgs, namedArgs) {
        return (target as MaterialAccentColor).computeLuminance();
      },
      'toARGB32': (visitor, target, positionalArgs, namedArgs) {
        return (target as MaterialAccentColor).toARGB32();
      },
      'withAlpha': (visitor, target, positionalArgs, namedArgs) {
        final alpha = positionalArgs.get<int?>(0);
        return (target as MaterialAccentColor).withAlpha(alpha!);
      },
      'withRed': (visitor, target, positionalArgs, namedArgs) {
        final red = positionalArgs.get<int?>(0);
        return (target as MaterialAccentColor).withRed(red!);
      },
      'withGreen': (visitor, target, positionalArgs, namedArgs) {
        final green = positionalArgs.get<int?>(0);
        return (target as MaterialAccentColor).withGreen(green!);
      },
      'withBlue': (visitor, target, positionalArgs, namedArgs) {
        final blue = positionalArgs.get<int?>(0);
        return (target as Color).withBlue(blue!);
      },
      'withOpacity': (visitor, target, positionalArgs, namedArgs) {
        final opacity = toDouble(positionalArgs.get<dynamic>(0));
        return (target as MaterialAccentColor).withOpacity(opacity!);
      },
      'withValues': (visitor, target, positionalArgs, namedArgs) {
        final red = positionalArgs.getToDouble(0);
        final green = positionalArgs.getToDouble(1);
        final blue = positionalArgs.getToDouble(2);
        final alpha = positionalArgs.getToDouble(3);
        final colorSpace = positionalArgs.get<ColorSpace?>(4);
        return (target as MaterialAccentColor).withValues(
          alpha: alpha,
          green: green,
          blue: blue,
          red: red,
          colorSpace: colorSpace,
        );
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter Colors class with all predefined colors.
BridgedClass getColorsBridgingDefinition() {
  return BridgedClass(
    nativeType: Colors,
    name: 'Colors',
    staticGetters: {
      // Basic colors
      'transparent': (visitor) => Colors.transparent,
      'black': (visitor) => Colors.black,
      'black87': (visitor) => Colors.black87,
      'black54': (visitor) => Colors.black54,
      'black45': (visitor) => Colors.black45,
      'black38': (visitor) => Colors.black38,
      'black26': (visitor) => Colors.black26,
      'black12': (visitor) => Colors.black12,
      'white': (visitor) => Colors.white,
      'white70': (visitor) => Colors.white70,
      'white60': (visitor) => Colors.white60,
      'white54': (visitor) => Colors.white54,
      'white38': (visitor) => Colors.white38,
      'white30': (visitor) => Colors.white30,
      'white24': (visitor) => Colors.white24,
      'white12': (visitor) => Colors.white12,
      'white10': (visitor) => Colors.white10,

      // Material colors
      'red': (visitor) => Colors.red,
      'pink': (visitor) => Colors.pink,
      'purple': (visitor) => Colors.purple,
      'deepPurple': (visitor) => Colors.deepPurple,
      'indigo': (visitor) => Colors.indigo,
      'blue': (visitor) => Colors.blue,
      'lightBlue': (visitor) => Colors.lightBlue,
      'cyan': (visitor) => Colors.cyan,
      'teal': (visitor) => Colors.teal,
      'green': (visitor) => Colors.green,
      'lightGreen': (visitor) => Colors.lightGreen,
      'lime': (visitor) => Colors.lime,
      'yellow': (visitor) => Colors.yellow,
      'amber': (visitor) => Colors.amber,
      'orange': (visitor) => Colors.orange,
      'deepOrange': (visitor) => Colors.deepOrange,
      'brown': (visitor) => Colors.brown,
      'grey': (visitor) => Colors.grey,
      'blueGrey': (visitor) => Colors.blueGrey,

      // Accent colors
      'redAccent': (visitor) => Colors.redAccent,
      'pinkAccent': (visitor) => Colors.pinkAccent,
      'purpleAccent': (visitor) => Colors.purpleAccent,
      'deepPurpleAccent': (visitor) => Colors.deepPurpleAccent,
      'indigoAccent': (visitor) => Colors.indigoAccent,
      'blueAccent': (visitor) => Colors.blueAccent,
      'lightBlueAccent': (visitor) => Colors.lightBlueAccent,
      'cyanAccent': (visitor) => Colors.cyanAccent,
      'tealAccent': (visitor) => Colors.tealAccent,
      'greenAccent': (visitor) => Colors.greenAccent,
      'lightGreenAccent': (visitor) => Colors.lightGreenAccent,
      'limeAccent': (visitor) => Colors.limeAccent,
      'yellowAccent': (visitor) => Colors.yellowAccent,
      'amberAccent': (visitor) => Colors.amberAccent,
      'orangeAccent': (visitor) => Colors.orangeAccent,
      'deepOrangeAccent': (visitor) => Colors.deepOrangeAccent,
      'primaries': (visitor) => Colors.primaries,
      'accents': (visitor) => Colors.accents,
    },
    staticMethods: {
      'primaries': (visitor, positionalArgs, namedArgs) => Colors.primaries,
      'accents': (visitor, positionalArgs, namedArgs) => Colors.accents,
    },
  );
}
