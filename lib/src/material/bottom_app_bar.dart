import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for the Flutter BottomAppBar widget.
BridgedClass getBottomAppBarBridgingDefinition() {
  return BridgedClass(
    nativeType: BottomAppBar,
    name: 'BottomAppBar',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final color = namedArgs.get<Color?>('color');
        final elevation = namedArgs.get<double?>('elevation');
        final shape = namedArgs.get<NotchedShape?>('shape');
        final clipBehavior = namedArgs.get<Clip?>('clipBehavior') ?? Clip.none;
        final notchMargin = namedArgs.get<double?>('notchMargin') ?? 4.0;
        final child = visitor.toWidgets(namedArgs['child']);
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding');
        final surfaceTintColor = namedArgs.get<Color?>('surfaceTintColor');
        final shadowColor = namedArgs.get<Color?>('shadowColor');
        final height = namedArgs.get<double?>('height');

        return BottomAppBar(
          key: key,
          color: color,
          elevation: elevation,
          shape: shape,
          clipBehavior: clipBehavior,
          notchMargin: notchMargin,
          child: child,
          padding: padding,
          surfaceTintColor: surfaceTintColor,
          shadowColor: shadowColor,
          height: height,
        );
      },
    },
    getters: {
      'color': (visitor, target) => (target as BottomAppBar).color,
      'elevation': (visitor, target) => (target as BottomAppBar).elevation,
      'shape': (visitor, target) => (target as BottomAppBar).shape,
      'clipBehavior': (visitor, target) =>
          (target as BottomAppBar).clipBehavior,
      'notchMargin': (visitor, target) => (target as BottomAppBar).notchMargin,
      'child': (visitor, target) => (target as BottomAppBar).child,
      'padding': (visitor, target) => (target as BottomAppBar).padding,
      'surfaceTintColor': (visitor, target) =>
          (target as BottomAppBar).surfaceTintColor,
      'shadowColor': (visitor, target) => (target as BottomAppBar).shadowColor,
      'height': (visitor, target) => (target as BottomAppBar).height,
      'key': (visitor, target) => (target as BottomAppBar).key,
    },
  );
}
