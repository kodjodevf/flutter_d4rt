import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_d4rt/utils/double.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

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
          behavior:
              namedArgs['behavior'] as HitTestBehavior? ??
              HitTestBehavior.deferToChild,
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

// InkResponse bridging
BridgedClass getInkResponseBridgingDefinition() {
  return BridgedClass(
    nativeType: InkResponse,
    name: 'InkResponse',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return InkResponse(
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
          onDoubleTap: namedArgs.handleVoidCallback('onDoubleTap', visitor),
          onLongPress: namedArgs.handleVoidCallback('onLongPress', visitor),
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
          containedInkWell: namedArgs['containedInkWell'] as bool? ?? false,
          highlightShape:
              namedArgs['highlightShape'] as BoxShape? ?? BoxShape.circle,
          radius: toDouble(namedArgs['radius']),
          borderRadius: namedArgs['borderRadius'] as BorderRadius?,
          customBorder: namedArgs['customBorder'] as ShapeBorder?,
          focusColor: namedArgs['focusColor'] as Color?,
          hoverColor: namedArgs['hoverColor'] as Color?,
          highlightColor: namedArgs['highlightColor'] as Color?,
          overlayColor:
              namedArgs['overlayColor'] as WidgetStateProperty<Color?>?,
          splashColor: namedArgs['splashColor'] as Color?,
          splashFactory:
              namedArgs['splashFactory'] as InteractiveInkFeatureFactory?,
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

// Draggable bridging
BridgedClass getDraggableBridgingDefinition() {
  return BridgedClass(
    nativeType: Draggable,
    name: 'Draggable',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return Draggable(
          key: namedArgs.get<Key?>('key'),
          feedback:
              visitor.toWidgets(namedArgs['feedback']) ??
              const SizedBox.shrink(),
          data: namedArgs['data'],
          axis: namedArgs['axis'] as Axis?,
          childWhenDragging: visitor.toWidgets(namedArgs['childWhenDragging']),
          feedbackOffset: namedArgs['feedbackOffset'] as Offset? ?? Offset.zero,
          dragAnchorStrategy:
              namedArgs['dragAnchorStrategy'] as DragAnchorStrategy? ??
              childDragAnchorStrategy,
          affinity: namedArgs['affinity'] as Axis?,
          maxSimultaneousDrags: namedArgs['maxSimultaneousDrags'] as int?,
          onDragStarted: namedArgs.handleVoidCallback('onDragStarted', visitor),
          onDragUpdate: namedArgs.handleValueCallback<DragUpdateDetails>(
            'onDragUpdate',
            visitor,
          ),
          onDraggableCanceled: namedArgs.handle2ValueCallback<Velocity, Offset>(
            'onDraggableCanceled',
            visitor,
          ),
          onDragEnd: namedArgs.handleValueCallback<DraggableDetails>(
            'onDragEnd',
            visitor,
          ),
          onDragCompleted: namedArgs.handleVoidCallback(
            'onDragCompleted',
            visitor,
          ),
          ignoringFeedbackSemantics:
              namedArgs['ignoringFeedbackSemantics'] as bool? ?? true,
          ignoringFeedbackPointer:
              namedArgs['ignoringFeedbackPointer'] as bool? ?? true,
          rootOverlay: namedArgs['rootOverlay'] as bool? ?? false,
          hitTestBehavior:
              namedArgs['hitTestBehavior'] as HitTestBehavior? ??
              HitTestBehavior.deferToChild,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}

// DragTarget bridging
BridgedClass getDragTargetBridgingDefinition() {
  return BridgedClass(
    nativeType: DragTarget,
    name: 'DragTarget',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return DragTarget(
          key: namedArgs.get<Key?>('key'),
          builder: (context, candidateData, rejectedData) {
            final builderFunction = namedArgs['builder'];
            if (builderFunction is InterpretedFunction) {
              final result = builderFunction.call(visitor, [
                context,
                candidateData,
                rejectedData,
              ]);
              return visitor.toWidgets(result)!;
            }
            return Container(); // Default fallback
          },
          onAccept: (data) {
            final func = namedArgs['onAccept'] as InterpretedFunction;
            func.call(visitor, [data]);
          },
          onAcceptWithDetails: namedArgs.handleValueCallback<DragTargetDetails>(
            'onAcceptWithDetails',
            visitor,
          ),
          onLeave: namedArgs.handleValueCallback<Object?>('onLeave', visitor),
          onMove: namedArgs.handleValueCallback<DragTargetDetails>(
            'onMove',
            visitor,
          ),
          hitTestBehavior:
              namedArgs['hitTestBehavior'] as HitTestBehavior? ??
              HitTestBehavior.translucent,
        );
      },
    },
  );
}

// LongPressDraggable bridging
BridgedClass getLongPressDraggableBridgingDefinition() {
  return BridgedClass(
    nativeType: LongPressDraggable,
    name: 'LongPressDraggable',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return LongPressDraggable(
          key: namedArgs.get<Key?>('key'),
          feedback:
              visitor.toWidgets(namedArgs['feedback']) ??
              const SizedBox.shrink(),
          data: namedArgs['data'],
          axis: namedArgs['axis'] as Axis?,
          childWhenDragging: visitor.toWidgets(namedArgs['childWhenDragging']),
          feedbackOffset: namedArgs['feedbackOffset'] as Offset? ?? Offset.zero,
          dragAnchorStrategy:
              namedArgs['dragAnchorStrategy'] as DragAnchorStrategy? ??
              childDragAnchorStrategy,
          maxSimultaneousDrags: namedArgs['maxSimultaneousDrags'] as int?,
          onDragStarted: namedArgs.handleVoidCallback('onDragStarted', visitor),
          onDragUpdate: namedArgs.handleValueCallback<DragUpdateDetails>(
            'onDragUpdate',
            visitor,
          ),
          onDraggableCanceled: namedArgs.handle2ValueCallback<Velocity, Offset>(
            'onDraggableCanceled',
            visitor,
          ),
          onDragEnd: namedArgs.handleValueCallback<DraggableDetails>(
            'onDragEnd',
            visitor,
          ),
          onDragCompleted: namedArgs.handleVoidCallback(
            'onDragCompleted',
            visitor,
          ),
          hapticFeedbackOnStart:
              namedArgs['hapticFeedbackOnStart'] as bool? ?? true,
          ignoringFeedbackSemantics:
              namedArgs['ignoringFeedbackSemantics'] as bool? ?? true,
          ignoringFeedbackPointer:
              namedArgs['ignoringFeedbackPointer'] as bool? ?? true,
          delay: namedArgs['delay'] as Duration? ?? kLongPressTimeout,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}
