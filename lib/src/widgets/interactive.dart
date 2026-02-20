import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_d4rt/utils/double.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Interactive widgets bridging definitions

Future<bool?> Function(T)? _handleAsyncCallback<T>(
  InterpreterVisitor visitor,
  dynamic callback,
) {
  if (callback == null) return null;
  if (callback is InterpretedFunction) {
    return (T details) async {
      final result = callback.call(visitor, [details]);
      return result is Future ? await result : result;
    };
  }
  return callback as Future<bool?> Function(T)?;
}

// GestureDetector bridging
BridgedClass getGestureDetectorBridgingDefinition() {
  return BridgedClass(
    nativeType: GestureDetector,
    name: 'GestureDetector',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return GestureDetector(
          key: namedArgs.get<Key?>('key'),
          onTap: namedArgs.handleVoidCallback('onTap', visitor),
          onTapDown: namedArgs.handleValueCallback<TapDownDetails>(
            'onTapDown',
            visitor,
          ),
          onTapUp: namedArgs.handleValueCallback<TapUpDetails>(
            'onTapUp',
            visitor,
          ),
          onTapCancel: namedArgs.handleVoidCallback('onTapCancel', visitor),
          onSecondaryTap: namedArgs.handleVoidCallback(
            'onSecondaryTap',
            visitor,
          ),
          onSecondaryTapDown: namedArgs.handleValueCallback<TapDownDetails>(
            'onSecondaryTapDown',
            visitor,
          ),
          onSecondaryTapUp: namedArgs.handleValueCallback<TapUpDetails>(
            'onSecondaryTapUp',
            visitor,
          ),
          onSecondaryTapCancel: namedArgs.handleVoidCallback(
            'onSecondaryTapCancel',
            visitor,
          ),
          onTertiaryTapDown: namedArgs.handleValueCallback<TapDownDetails>(
            'onTertiaryTapDown',
            visitor,
          ),
          onTertiaryTapUp: namedArgs.handleValueCallback<TapUpDetails>(
            'onTertiaryTapUp',
            visitor,
          ),
          onTertiaryTapCancel: namedArgs.handleVoidCallback(
            'onTertiaryTapCancel',
            visitor,
          ),
          onDoubleTapDown: namedArgs.handleValueCallback<TapDownDetails>(
            'onDoubleTapDown',
            visitor,
          ),
          onDoubleTap: namedArgs.handleVoidCallback('onDoubleTap', visitor),
          onDoubleTapCancel: namedArgs.handleVoidCallback(
            'onDoubleTapCancel',
            visitor,
          ),
          onLongPress: namedArgs.handleVoidCallback('onLongPress', visitor),
          onLongPressStart: namedArgs
              .handleValueCallback<LongPressStartDetails>(
                'onLongPressStart',
                visitor,
              ),
          onLongPressMoveUpdate: namedArgs
              .handleValueCallback<LongPressMoveUpdateDetails>(
                'onLongPressMoveUpdate',
                visitor,
              ),
          onLongPressUp: namedArgs.handleVoidCallback('onLongPressUp', visitor),
          onLongPressEnd: namedArgs.handleValueCallback<LongPressEndDetails>(
            'onLongPressEnd',
            visitor,
          ),
          onVerticalDragDown: namedArgs.handleValueCallback<DragDownDetails>(
            'onVerticalDragDown',
            visitor,
          ),
          onVerticalDragStart: namedArgs.handleValueCallback<DragStartDetails>(
            'onVerticalDragStart',
            visitor,
          ),
          onVerticalDragUpdate: namedArgs
              .handleValueCallback<DragUpdateDetails>(
                'onVerticalDragUpdate',
                visitor,
              ),
          onVerticalDragEnd: namedArgs.handleValueCallback<DragEndDetails>(
            'onVerticalDragEnd',
            visitor,
          ),
          onVerticalDragCancel: namedArgs.handleVoidCallback(
            'onVerticalDragCancel',
            visitor,
          ),
          onHorizontalDragDown: namedArgs.handleValueCallback<DragDownDetails>(
            'onHorizontalDragDown',
            visitor,
          ),
          onHorizontalDragStart: namedArgs
              .handleValueCallback<DragStartDetails>(
                'onHorizontalDragStart',
                visitor,
              ),
          onHorizontalDragUpdate: namedArgs
              .handleValueCallback<DragUpdateDetails>(
                'onHorizontalDragUpdate',
                visitor,
              ),
          onHorizontalDragEnd: namedArgs.handleValueCallback<DragEndDetails>(
            'onHorizontalDragEnd',
            visitor,
          ),
          onHorizontalDragCancel: namedArgs.handleVoidCallback(
            'onHorizontalDragCancel',
            visitor,
          ),
          onPanDown: namedArgs.handleValueCallback<DragDownDetails>(
            'onPanDown',
            visitor,
          ),
          onPanStart: namedArgs.handleValueCallback<DragStartDetails>(
            'onPanStart',
            visitor,
          ),
          onPanUpdate: namedArgs.handleValueCallback<DragUpdateDetails>(
            'onPanUpdate',
            visitor,
          ),
          onPanEnd: namedArgs.handleValueCallback<DragEndDetails>(
            'onPanEnd',
            visitor,
          ),
          onPanCancel: namedArgs.handleVoidCallback('onPanCancel', visitor),
          onScaleStart: namedArgs.handleValueCallback<ScaleStartDetails>(
            'onScaleStart',
            visitor,
          ),
          onScaleUpdate: namedArgs.handleValueCallback<ScaleUpdateDetails>(
            'onScaleUpdate',
            visitor,
          ),
          onScaleEnd: namedArgs.handleValueCallback<ScaleEndDetails>(
            'onScaleEnd',
            visitor,
          ),
          behavior: namedArgs['behavior'] as HitTestBehavior?,
          excludeFromSemantics:
              namedArgs['excludeFromSemantics'] as bool? ?? false,
          dragStartBehavior:
              namedArgs['dragStartBehavior'] as DragStartBehavior? ??
              DragStartBehavior.start,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}

// InkWell bridging
BridgedClass getInkWellBridgingDefinition() {
  return BridgedClass(
    nativeType: InkWell,
    name: 'InkWell',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return InkWell(
          key: namedArgs.get<Key?>('key'),
          onTap: namedArgs.handleVoidCallback('onTap', visitor),
          onDoubleTap: namedArgs.handleVoidCallback('onDoubleTap', visitor),
          onLongPress: namedArgs.handleVoidCallback('onLongPress', visitor),
          onTapDown: namedArgs.handleValueCallback<TapDownDetails>(
            'onTapDown',
            visitor,
          ),
          onTapUp: namedArgs.handleValueCallback<TapUpDetails>(
            'onTapUp',
            visitor,
          ),
          onTapCancel: namedArgs.handleVoidCallback('onTapCancel', visitor),
          onHighlightChanged: namedArgs.handleValueCallback<bool>(
            'onHighlightChanged',
            visitor,
          ),
          onHover: namedArgs.handleValueCallback<bool>('onHover', visitor),
          onFocusChange: namedArgs.handleValueCallback<bool>(
            'onFocusChange',
            visitor,
          ),
          mouseCursor: namedArgs['mouseCursor'] as MouseCursor?,
          focusColor: namedArgs['focusColor'] as Color?,
          hoverColor: namedArgs['hoverColor'] as Color?,
          highlightColor: namedArgs['highlightColor'] as Color?,
          overlayColor:
              namedArgs['overlayColor'] as WidgetStateProperty<Color?>?,
          splashColor: namedArgs['splashColor'] as Color?,
          splashFactory:
              namedArgs['splashFactory'] as InteractiveInkFeatureFactory?,
          radius: toDouble(namedArgs['radius']),
          borderRadius: namedArgs['borderRadius'] as BorderRadius?,
          customBorder: namedArgs['customBorder'] as ShapeBorder?,
          enableFeedback: namedArgs['enableFeedback'] as bool? ?? true,
          excludeFromSemantics:
              namedArgs['excludeFromSemantics'] as bool? ?? false,
          focusNode: namedArgs['focusNode'] as FocusNode?,
          canRequestFocus: namedArgs['canRequestFocus'] as bool? ?? true,
          autofocus: namedArgs['autofocus'] as bool? ?? false,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}

// Dismissible bridging
BridgedClass getDismissibleBridgingDefinition() {
  return BridgedClass(
    nativeType: Dismissible,
    name: 'Dismissible',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return Dismissible(
          key: namedArgs.get<Key?>('key') as Key,
          background: visitor.toWidgets(namedArgs['background']),
          secondaryBackground: visitor.toWidgets(
            namedArgs['secondaryBackground'],
          ),
          onResize: namedArgs.handleVoidCallback('onResize', visitor),
          onUpdate: namedArgs.handleValueCallback<DismissUpdateDetails>(
            'onUpdate',
            visitor,
          ),
          onDismissed: namedArgs.handleValueCallback<DismissDirection>(
            'onDismissed',
            visitor,
          ),
          confirmDismiss: _handleAsyncCallback<DismissDirection>(
            visitor,
            namedArgs['confirmDismiss'],
          ),
          direction:
              namedArgs['direction'] as DismissDirection? ??
              DismissDirection.horizontal,
          resizeDuration:
              namedArgs['resizeDuration'] as Duration? ??
              const Duration(milliseconds: 300),
          dismissThresholds:
              (namedArgs['dismissThresholds'] as Map?)?.cast() ??
              const <DismissDirection, double>{},
          movementDuration:
              namedArgs['movementDuration'] as Duration? ??
              const Duration(milliseconds: 200),
          crossAxisEndOffset: toDouble(namedArgs['crossAxisEndOffset']),
          dragStartBehavior:
              namedArgs['dragStartBehavior'] as DragStartBehavior? ??
              DragStartBehavior.start,
          behavior:
              namedArgs['behavior'] as HitTestBehavior? ??
              HitTestBehavior.opaque,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}
