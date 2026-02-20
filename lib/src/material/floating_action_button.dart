import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import '../../utils/extensions/widget.dart';

/// Returns the BridgedClass for the Flutter FloatingActionButton widget.
BridgedClass getFloatingActionButtonBridgingDefinition() {
  return BridgedClass(
    nativeType: FloatingActionButton,
    name: 'FloatingActionButton',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final onPressed = namedArgs.handleVoidCallback('onPressed', visitor);
        final tooltip = namedArgs.get<String?>('tooltip');
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final foregroundColor = namedArgs.get<Color?>('foregroundColor');
        final elevation = namedArgs.getToDouble('elevation');
        final heroTag = namedArgs.get<Object?>('heroTag');
        final child = visitor.toWidgets(namedArgs['child']);

        return FloatingActionButton(
          key: key,
          onPressed: onPressed,
          tooltip: tooltip,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          elevation: elevation,
          heroTag: heroTag,
          child: child,
        );
      },
      'small': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final onPressed = namedArgs.handleVoidCallback('onPressed', visitor);
        final tooltip = namedArgs.get<String?>('tooltip');
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final foregroundColor = namedArgs.get<Color?>('foregroundColor');
        final elevation = namedArgs.getToDouble('elevation');
        final heroTag = namedArgs.get<Object?>('heroTag');
        final child = visitor.toWidgets(namedArgs['child']);

        return FloatingActionButton.small(
          key: key,
          onPressed: onPressed,
          tooltip: tooltip,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          elevation: elevation,
          heroTag: heroTag,
          child: child,
        );
      },
    },
    getters: {
      'onPressed': (visitor, target) =>
          (target as FloatingActionButton).onPressed,
      'tooltip': (visitor, target) => (target as FloatingActionButton).tooltip,
      'backgroundColor': (visitor, target) =>
          (target as FloatingActionButton).backgroundColor,
      'foregroundColor': (visitor, target) =>
          (target as FloatingActionButton).foregroundColor,
      'elevation': (visitor, target) =>
          (target as FloatingActionButton).elevation,
      'heroTag': (visitor, target) => (target as FloatingActionButton).heroTag,
      'child': (visitor, target) => (target as FloatingActionButton).child,
      'key': (visitor, target) => (target as FloatingActionButton).key,
    },
  );
}
