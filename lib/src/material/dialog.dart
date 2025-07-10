import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import '../../utils/extensions/widget.dart';

/// Returns the BridgedClassDefinition for the Flutter AlertDialog widget.
BridgedClassDefinition getAlertDialogBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: AlertDialog,
    name: 'AlertDialog',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final insetPadding = namedArgs.get<EdgeInsets?>('insetPadding');
        final clipBehavior = namedArgs.get<Clip?>('clipBehavior') ?? Clip.none;
        final shape = namedArgs.get<ShapeBorder?>('shape');
        final alignment = namedArgs.get<AlignmentGeometry?>('alignment');
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final elevation = namedArgs.getToDouble('elevation');
        final shadowColor = namedArgs.get<Color?>('shadowColor');
        final surfaceTintColor = namedArgs.get<Color?>('surfaceTintColor');
        final scrollable = namedArgs.get<bool?>('scrollable') ?? false;
        final title = visitor.toWidgets(namedArgs['title']);
        final content = visitor.toWidgets(namedArgs['content']);
        final actions = visitor.toWidgets(namedArgs['actions']);

        return AlertDialog(
          key: key,
          title: title,
          content: content,
          actions: actions,
          insetPadding: insetPadding,
          clipBehavior: clipBehavior,
          shape: shape,
          alignment: alignment,
          backgroundColor: backgroundColor,
          elevation: elevation,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          scrollable: scrollable,
        );
      },
    },
    getters: {
      'title': (visitor, target) => (target as AlertDialog).title,
      'content': (visitor, target) => (target as AlertDialog).content,
      'actions': (visitor, target) => (target as AlertDialog).actions,
      'backgroundColor': (visitor, target) =>
          (target as AlertDialog).backgroundColor,
      'elevation': (visitor, target) => (target as AlertDialog).elevation,
      'scrollable': (visitor, target) => (target as AlertDialog).scrollable,
    },
  );
}

/// Returns the BridgedClassDefinition for the Flutter SimpleDialog widget.
BridgedClassDefinition getSimpleDialogBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: SimpleDialog,
    name: 'SimpleDialog',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final insetPadding = namedArgs.get<EdgeInsets?>('insetPadding');
        final clipBehavior = namedArgs.get<Clip?>('clipBehavior') ?? Clip.none;
        final shape = namedArgs.get<ShapeBorder?>('shape');
        final alignment = namedArgs.get<AlignmentGeometry?>('alignment');
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final elevation = namedArgs.getToDouble('elevation');
        final shadowColor = namedArgs.get<Color?>('shadowColor');
        final surfaceTintColor = namedArgs.get<Color?>('surfaceTintColor');
        final titlePadding = namedArgs.get<EdgeInsetsGeometry?>('titlePadding');
        final contentPadding = namedArgs.get<EdgeInsetsGeometry?>(
          'contentPadding',
        );
        final title = visitor.toWidgets(namedArgs['title']);
        final children = visitor.toWidgets(namedArgs['children']);

        return SimpleDialog(
          key: key,
          title: title,
          insetPadding: insetPadding,
          clipBehavior: clipBehavior,
          shape: shape,
          alignment: alignment,
          backgroundColor: backgroundColor,
          elevation: elevation,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          titlePadding:
              titlePadding ?? const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
          contentPadding:
              contentPadding ??
              const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 16.0),
          children: children,
        );
      },
    },
    getters: {
      'title': (visitor, target) => (target as SimpleDialog).title,
      'children': (visitor, target) => (target as SimpleDialog).children,
      'backgroundColor': (visitor, target) =>
          (target as SimpleDialog).backgroundColor,
      'elevation': (visitor, target) => (target as SimpleDialog).elevation,
    },
  );
}
