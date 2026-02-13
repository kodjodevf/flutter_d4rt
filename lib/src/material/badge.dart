import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for the Flutter Badge widget.
BridgedClass getBadgeBridgingDefinition() {
  return BridgedClass(
    nativeType: Badge,
    name: 'Badge',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final textColor = namedArgs.get<Color?>('textColor');
        final smallSize = namedArgs.getToDouble('smallSize');
        final largeSize = namedArgs.getToDouble('largeSize');
        final textStyle = namedArgs.get<TextStyle?>('textStyle');
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding');
        final alignment = namedArgs.get<AlignmentGeometry?>('alignment');
        final offset = namedArgs.get<Offset?>('offset');
        final label = visitor.toWidgets(namedArgs['label']);
        final isLabelVisible = namedArgs.get<bool?>('isLabelVisible') ?? true;
        final child = visitor.toWidgets(namedArgs['child']);

        return Badge(
          key: key,
          backgroundColor: backgroundColor,
          textColor: textColor,
          smallSize: smallSize,
          largeSize: largeSize,
          textStyle: textStyle,
          padding: padding,
          alignment: alignment,
          offset: offset,
          label: label,
          isLabelVisible: isLabelVisible,
          child: child,
        );
      },
      'count': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final textColor = namedArgs.get<Color?>('textColor');
        final smallSize = namedArgs.getToDouble('smallSize');
        final largeSize = namedArgs.getToDouble('largeSize');
        final textStyle = namedArgs.get<TextStyle?>('textStyle');
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding');
        final alignment = namedArgs.get<AlignmentGeometry?>('alignment');
        final offset = namedArgs.get<Offset?>('offset');
        final count = namedArgs.get<int>('count') ?? 0;
        final isLabelVisible = namedArgs.get<bool?>('isLabelVisible') ?? true;
        final child = visitor.toWidgets(namedArgs['child']);

        return Badge.count(
          key: key,
          backgroundColor: backgroundColor,
          textColor: textColor,
          smallSize: smallSize,
          largeSize: largeSize,
          textStyle: textStyle,
          padding: padding,
          alignment: alignment,
          offset: offset,
          count: count,
          isLabelVisible: isLabelVisible,
          child: child,
        );
      },
    },
    getters: {
      'backgroundColor': (visitor, target) => (target as Badge).backgroundColor,
      'textColor': (visitor, target) => (target as Badge).textColor,
      'smallSize': (visitor, target) => (target as Badge).smallSize,
      'largeSize': (visitor, target) => (target as Badge).largeSize,
      'textStyle': (visitor, target) => (target as Badge).textStyle,
      'padding': (visitor, target) => (target as Badge).padding,
      'alignment': (visitor, target) => (target as Badge).alignment,
      'offset': (visitor, target) => (target as Badge).offset,
      'label': (visitor, target) => (target as Badge).label,
      'isLabelVisible': (visitor, target) => (target as Badge).isLabelVisible,
      'child': (visitor, target) => (target as Badge).child,
      'key': (visitor, target) => (target as Badge).key,
    },
  );
}
