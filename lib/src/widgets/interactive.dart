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
          crossAxisEndOffset:
              toDouble(namedArgs['crossAxisEndOffset']) ?? 0.0,
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

/// Returns the BridgedEnumDefinition for DismissDirection
BridgedEnumDefinition<DismissDirection> getDismissDirectionBridgingDefinition() {
  return BridgedEnumDefinition<DismissDirection>(
    name: 'DismissDirection',
    values: DismissDirection.values,
  );
}

/// Returns the BridgedEnumDefinition for PanAxis
BridgedEnumDefinition<PanAxis> getPanAxisBridgingDefinition() {
  return BridgedEnumDefinition<PanAxis>(
    name: 'PanAxis',
    values: PanAxis.values,
  );
}

/// Returns the BridgedClass for InteractiveViewer
BridgedClass getInteractiveViewerBridgingDefinition() {
  return BridgedClass(
    nativeType: InteractiveViewer,
    name: 'InteractiveViewer',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final clipBehavior =
            namedArgs.get<Clip?>('clipBehavior') ?? Clip.hardEdge;
        final panAxis = namedArgs.get<PanAxis?>('panAxis') ?? PanAxis.free;
        final panEnabled = namedArgs.get<bool?>('panEnabled') ?? true;
        final scaleEnabled = namedArgs.get<bool?>('scaleEnabled') ?? true;
        final scaleFactor =
            (namedArgs['scaleFactor'] as num?)?.toDouble() ?? 200.0;
        final minScale = (namedArgs['minScale'] as num?)?.toDouble() ?? 0.8;
        final maxScale = (namedArgs['maxScale'] as num?)?.toDouble() ?? 2.5;
        final interactionEndFrictionCoefficient =
            (namedArgs['interactionEndFrictionCoefficient'] as num?)
                ?.toDouble() ??
            0.0000135;
        final onInteractionStart =
            namedArgs.handleValueCallback<ScaleStartDetails>(
              'onInteractionStart',
              visitor,
            );
        final onInteractionUpdate =
            namedArgs.handleValueCallback<ScaleUpdateDetails>(
              'onInteractionUpdate',
              visitor,
            );
        final onInteractionEnd = namedArgs.handleValueCallback<ScaleEndDetails>(
          'onInteractionEnd',
          visitor,
        );
        final child = visitor.toWidget(namedArgs['child']) ?? const SizedBox();

        return InteractiveViewer(
          key: key,
          clipBehavior: clipBehavior,
          panAxis: panAxis,
          panEnabled: panEnabled,
          scaleEnabled: scaleEnabled,
          scaleFactor: scaleFactor,
          minScale: minScale,
          maxScale: maxScale,
          interactionEndFrictionCoefficient: interactionEndFrictionCoefficient,
          onInteractionStart: onInteractionStart,
          onInteractionUpdate: onInteractionUpdate,
          onInteractionEnd: onInteractionEnd,
          child: child,
        );
      },
    },
    getters: {
      'child': (visitor, target) => (target as InteractiveViewer).child,
      'clipBehavior': (visitor, target) =>
          (target as InteractiveViewer).clipBehavior,
      'panEnabled': (visitor, target) =>
          (target as InteractiveViewer).panEnabled,
      'scaleEnabled': (visitor, target) =>
          (target as InteractiveViewer).scaleEnabled,
      'minScale': (visitor, target) => (target as InteractiveViewer).minScale,
      'maxScale': (visitor, target) => (target as InteractiveViewer).maxScale,
      'key': (visitor, target) => (target as InteractiveViewer).key,
    },
  );
}

/// Returns the BridgedClass for MouseRegion
BridgedClass getMouseRegionBridgingDefinition() {
  return BridgedClass(
    nativeType: MouseRegion,
    name: 'MouseRegion',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final onEnter = namedArgs.handleValueCallback<PointerEnterEvent>(
          'onEnter',
          visitor,
        );
        final onExit = namedArgs.handleValueCallback<PointerExitEvent>(
          'onExit',
          visitor,
        );
        final onHover = namedArgs.handleValueCallback<PointerHoverEvent>(
          'onHover',
          visitor,
        );
        final cursor =
            namedArgs.get<MouseCursor?>('cursor') ?? MouseCursor.defer;
        final opaque = namedArgs.get<bool?>('opaque') ?? true;
        final hitTestBehavior = namedArgs.get<HitTestBehavior?>(
          'hitTestBehavior',
        );
        final child = visitor.toWidget(namedArgs['child']);

        return MouseRegion(
          key: key,
          onEnter: onEnter,
          onExit: onExit,
          onHover: onHover,
          cursor: cursor,
          opaque: opaque,
          hitTestBehavior: hitTestBehavior,
          child: child,
        );
      },
    },
    getters: {
      'child': (visitor, target) => (target as MouseRegion).child,
      'cursor': (visitor, target) => (target as MouseRegion).cursor,
      'opaque': (visitor, target) => (target as MouseRegion).opaque,
      'key': (visitor, target) => (target as MouseRegion).key,
    },
  );
}

