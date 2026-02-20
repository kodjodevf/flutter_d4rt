import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for the Flutter SnackBar widget.
BridgedClass getSnackBarBridgingDefinition() {
  return BridgedClass(
    nativeType: SnackBar,
    name: 'SnackBar',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final elevation = namedArgs.getToDouble('elevation');
        final margin = namedArgs.get<EdgeInsetsGeometry?>('margin');
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding');
        final width = namedArgs.getToDouble('width');
        final shape = namedArgs.get<ShapeBorder?>('shape');
        final behavior = namedArgs.get<SnackBarBehavior?>('behavior');
        final clipBehavior =
            namedArgs.get<Clip?>('clipBehavior') ?? Clip.hardEdge;
        final duration =
            namedArgs.get<Duration?>('duration') ??
            const Duration(milliseconds: 4000);

        final content = visitor.toWidgets(namedArgs['content']);

        // Gestion de l'action avec conversion
        SnackBarAction? action;
        final actionValue = namedArgs['action'];
        if (actionValue != null && actionValue is SnackBarAction) {
          action = actionValue;
        }

        return SnackBar(
          key: key,
          content: content,
          backgroundColor: backgroundColor,
          elevation: elevation,
          margin: margin,
          padding: padding,
          width: width,
          shape: shape,
          behavior: behavior,
          action: action,
          duration: duration,
          clipBehavior: clipBehavior,
        );
      },
    },
    getters: {
      'content': (visitor, target) => (target as SnackBar).content,
      'backgroundColor': (visitor, target) =>
          (target as SnackBar).backgroundColor,
      'elevation': (visitor, target) => (target as SnackBar).elevation,
      'action': (visitor, target) => (target as SnackBar).action,
      'duration': (visitor, target) => (target as SnackBar).duration,
    },
  );
}

/// Returns the BridgedClass for the Flutter SnackBarAction.
BridgedClass getSnackBarActionBridgingDefinition() {
  return BridgedClass(
    nativeType: SnackBarAction,
    name: 'SnackBarAction',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final label = namedArgs.get<String?>('label') ?? '';
        final onPressed = namedArgs.handleVoidCallback('onPressed', visitor);
        final textColor = namedArgs.get<Color?>('textColor');
        final disabledTextColor = namedArgs.get<Color?>('disabledTextColor');
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final disabledBackgroundColor = namedArgs.get<Color?>(
          'disabledBackgroundColor',
        );

        return SnackBarAction(
          label: label,
          onPressed: onPressed ?? () {},
          textColor: textColor,
          disabledTextColor: disabledTextColor,
          backgroundColor: backgroundColor,
          disabledBackgroundColor: disabledBackgroundColor,
        );
      },
    },
    getters: {
      'label': (visitor, target) => (target as SnackBarAction).label,
      'onPressed': (visitor, target) => (target as SnackBarAction).onPressed,
      'textColor': (visitor, target) => (target as SnackBarAction).textColor,
      'backgroundColor': (visitor, target) =>
          (target as SnackBarAction).backgroundColor,
    },
  );
}
