import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for the Flutter InkWell widget.
BridgedClass getInkWellBridgingDefinition() {
  return BridgedClass(
    nativeType: InkWell,
    name: 'InkWell',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final child = visitor.toWidgets(namedArgs['child']);

        // Handle onTap callback
        final onTap = namedArgs.handleVoidCallback('onTap', visitor);

        // Handle onDoubleTap callback
        final onDoubleTap = namedArgs.handleVoidCallback(
          'onDoubleTap',
          visitor,
        );

        // Handle onLongPress callback
        final onLongPress = namedArgs.handleVoidCallback(
          'onLongPress',
          visitor,
        );

        // Handle onTapDown callback
        final onTapDown = namedArgs.handleValueCallback<TapDownDetails>(
          'onTapDown',
          visitor,
        );

        // Handle onTapCancel callback
        final onTapCancel = namedArgs.handleVoidCallback(
          'onTapCancel',
          visitor,
        );

        // Handle onHover callback
        final onHover = namedArgs.handleValueCallback<bool>('onHover', visitor);

        final mouseCursor = namedArgs.get<MouseCursor?>('mouseCursor');
        final focusColor = namedArgs.get<Color?>('focusColor');
        final hoverColor = namedArgs.get<Color?>('hoverColor');
        final highlightColor = namedArgs.get<Color?>('highlightColor');
        final overlayColor = namedArgs.get<MaterialStateProperty<Color?>?>(
          'overlayColor',
        );
        final splashColor = namedArgs.get<Color?>('splashColor');
        final splashFactory = namedArgs.get<InteractiveInkFeatureFactory?>(
          'splashFactory',
        );
        final radius = namedArgs.get<double?>('radius');
        final borderRadius = namedArgs.get<BorderRadius?>('borderRadius');
        final customBorder = namedArgs.get<ShapeBorder?>('customBorder');
        final enableFeedback = namedArgs.get<bool?>('enableFeedback') ?? true;
        final excludeFromSemantics =
            namedArgs.get<bool?>('excludeFromSemantics') ?? false;
        final focusNode = namedArgs.get<FocusNode?>('focusNode');
        final canRequestFocus = namedArgs.get<bool?>('canRequestFocus') ?? true;
        final autofocus = namedArgs.get<bool?>('autofocus') ?? false;

        return InkWell(
          key: key,
          onTap: onTap,
          onDoubleTap: onDoubleTap,
          onLongPress: onLongPress,
          onTapDown: onTapDown,
          onTapCancel: onTapCancel,
          onHover: onHover,
          mouseCursor: mouseCursor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          highlightColor: highlightColor,
          overlayColor: overlayColor,
          splashColor: splashColor,
          splashFactory: splashFactory,
          radius: radius,
          borderRadius: borderRadius,
          customBorder: customBorder,
          enableFeedback: enableFeedback,
          excludeFromSemantics: excludeFromSemantics,
          focusNode: focusNode,
          canRequestFocus: canRequestFocus,
          autofocus: autofocus,
          child: child,
        );
      },
    },
    getters: {
      'mouseCursor': (visitor, target) => (target as InkWell).mouseCursor,
      'focusColor': (visitor, target) => (target as InkWell).focusColor,
      'hoverColor': (visitor, target) => (target as InkWell).hoverColor,
      'highlightColor': (visitor, target) => (target as InkWell).highlightColor,
      'overlayColor': (visitor, target) => (target as InkWell).overlayColor,
      'splashColor': (visitor, target) => (target as InkWell).splashColor,
      'splashFactory': (visitor, target) => (target as InkWell).splashFactory,
      'radius': (visitor, target) => (target as InkWell).radius,
      'borderRadius': (visitor, target) => (target as InkWell).borderRadius,
      'customBorder': (visitor, target) => (target as InkWell).customBorder,
      'enableFeedback': (visitor, target) => (target as InkWell).enableFeedback,
      'excludeFromSemantics': (visitor, target) =>
          (target as InkWell).excludeFromSemantics,
      'focusNode': (visitor, target) => (target as InkWell).focusNode,
      'canRequestFocus': (visitor, target) =>
          (target as InkWell).canRequestFocus,
      'autofocus': (visitor, target) => (target as InkWell).autofocus,
      'child': (visitor, target) => (target as InkWell).child,
      'key': (visitor, target) => (target as InkWell).key,
    },
  );
}
