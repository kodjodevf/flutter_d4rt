import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
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
        final onTap = namedArgs['onTap'];
        VoidCallback? onTapCallback;
        if (onTap != null) {
          if (onTap is InterpretedFunction) {
            onTapCallback = () => onTap.call(visitor, []);
          } else if (onTap is Function) {
            onTapCallback = onTap as VoidCallback?;
          }
        }

        // Handle onDoubleTap callback
        final onDoubleTap = namedArgs['onDoubleTap'];
        VoidCallback? onDoubleTapCallback;
        if (onDoubleTap != null) {
          if (onDoubleTap is InterpretedFunction) {
            onDoubleTapCallback = () => onDoubleTap.call(visitor, []);
          } else if (onDoubleTap is Function) {
            onDoubleTapCallback = onDoubleTap as VoidCallback?;
          }
        }

        // Handle onLongPress callback
        final onLongPress = namedArgs['onLongPress'];
        VoidCallback? onLongPressCallback;
        if (onLongPress != null) {
          if (onLongPress is InterpretedFunction) {
            onLongPressCallback = () => onLongPress.call(visitor, []);
          } else if (onLongPress is Function) {
            onLongPressCallback = onLongPress as VoidCallback?;
          }
        }

        // Handle onTapDown callback
        final onTapDown = namedArgs['onTapDown'];
        void Function(TapDownDetails)? onTapDownCallback;
        if (onTapDown != null) {
          if (onTapDown is InterpretedFunction) {
            onTapDownCallback = (TapDownDetails details) =>
                onTapDown.call(visitor, [details]);
          } else if (onTapDown is Function) {
            onTapDownCallback = onTapDown as void Function(TapDownDetails)?;
          }
        }

        // Handle onTapCancel callback
        final onTapCancel = namedArgs['onTapCancel'];
        VoidCallback? onTapCancelCallback;
        if (onTapCancel != null) {
          if (onTapCancel is InterpretedFunction) {
            onTapCancelCallback = () => onTapCancel.call(visitor, []);
          } else if (onTapCancel is Function) {
            onTapCancelCallback = onTapCancel as VoidCallback?;
          }
        }

        // Handle onHover callback
        final onHover = namedArgs['onHover'];
        void Function(bool)? onHoverCallback;
        if (onHover != null) {
          if (onHover is InterpretedFunction) {
            onHoverCallback = (bool value) => onHover.call(visitor, [value]);
          } else if (onHover is Function) {
            onHoverCallback = onHover as void Function(bool)?;
          }
        }

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
          onTap: onTapCallback,
          onDoubleTap: onDoubleTapCallback,
          onLongPress: onLongPressCallback,
          onTapDown: onTapDownCallback,
          onTapCancel: onTapCancelCallback,
          onHover: onHoverCallback,
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
