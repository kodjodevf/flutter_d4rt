import 'package:d4rt/d4rt.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for the Flutter Draggable widget.
BridgedClass getDraggableBridgingDefinition() {
  return BridgedClass(
    nativeType: Draggable,
    name: 'Draggable',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final child =
            visitor.toWidgets(namedArgs['child']) ?? const SizedBox.shrink();
        final feedback = visitor.toWidgets(namedArgs['feedback']) ?? child;

        final data = namedArgs.get('data');
        final axis = namedArgs.get<Axis?>('axis');
        final childWhenDragging = visitor.toWidgets(
          namedArgs['childWhenDragging'],
        );
        final feedbackOffset =
            namedArgs.get<Offset?>('feedbackOffset') ?? Offset.zero;
        final dragAnchorStrategy = namedArgs.get<DragAnchorStrategy?>(
          'dragAnchorStrategy',
        );
        final affinity = namedArgs.get<Axis?>('affinity');
        final maxSimultaneousDrags = namedArgs.get<int?>(
          'maxSimultaneousDrags',
        );
        final rootOverlay = namedArgs.get<bool?>('rootOverlay') ?? false;
        final hitTestBehavior =
            namedArgs.get<HitTestBehavior?>('hitTestBehavior') ??
            HitTestBehavior.deferToChild;
        final ignoringFeedbackSemantics =
            namedArgs.get<bool?>('ignoringFeedbackSemantics') ?? true;
        final ignoringFeedbackPointer =
            namedArgs.get<bool?>('ignoringFeedbackPointer') ?? true;

        // Handle onDragStarted callback
        final onDragStarted = namedArgs.handleVoidCallback(
          'onDragStarted',
          visitor,
        );

        // Handle onDragUpdate callback
        final onDragUpdate = namedArgs.handleValueCallback<DragUpdateDetails>(
          'onDragUpdate',
          visitor,
        );

        // Handle onDraggableCanceled callback
        final onDraggableCanceled = namedArgs
            .handle2ValueCallback<Velocity, Offset>(
              'onDraggableCanceled',
              visitor,
            );

        // Handle onDragEnd callback
        final onDragEnd = namedArgs.handleValueCallback<DraggableDetails>(
          'onDragEnd',
          visitor,
        );

        // Handle onDragCompleted callback
        final onDragCompleted = namedArgs.handleVoidCallback(
          'onDragCompleted',
          visitor,
        );

        return Draggable(
          key: key,
          data: data,
          axis: axis,
          feedback: feedback,
          childWhenDragging: childWhenDragging,
          feedbackOffset: feedbackOffset,
          dragAnchorStrategy: dragAnchorStrategy!,
          affinity: affinity,
          maxSimultaneousDrags: maxSimultaneousDrags,
          onDragStarted: onDragStarted,
          onDragUpdate: onDragUpdate,
          onDraggableCanceled: onDraggableCanceled,
          onDragEnd: onDragEnd,
          onDragCompleted: onDragCompleted,
          rootOverlay: rootOverlay,
          hitTestBehavior: hitTestBehavior,
          ignoringFeedbackSemantics: ignoringFeedbackSemantics,
          ignoringFeedbackPointer: ignoringFeedbackPointer,
          child: child,
        );
      },
    },
    getters: {
      'child': (visitor, target) => (target as Draggable).child,
      'feedback': (visitor, target) => (target as Draggable).feedback,
      'data': (visitor, target) => (target as Draggable).data,
      'axis': (visitor, target) => (target as Draggable).axis,
      'childWhenDragging': (visitor, target) =>
          (target as Draggable).childWhenDragging,
      'feedbackOffset': (visitor, target) =>
          (target as Draggable).feedbackOffset,
      'maxSimultaneousDrags': (visitor, target) =>
          (target as Draggable).maxSimultaneousDrags,
      'rootOverlay': (visitor, target) => (target as Draggable).rootOverlay,
      'hitTestBehavior': (visitor, target) =>
          (target as Draggable).hitTestBehavior,
      'ignoringFeedbackSemantics': (visitor, target) =>
          (target as Draggable).ignoringFeedbackSemantics,
      'ignoringFeedbackPointer': (visitor, target) =>
          (target as Draggable).ignoringFeedbackPointer,
      'key': (visitor, target) => (target as Draggable).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter DragTarget widget.
BridgedClass getDragTargetBridgingDefinition() {
  return BridgedClass(
    nativeType: DragTarget,
    name: 'DragTarget',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final hitTestBehavior =
            namedArgs.get<HitTestBehavior?>('hitTestBehavior') ??
            HitTestBehavior.translucent;

        // Handle builder callback
        final builder = namedArgs['builder'];
        Widget Function(BuildContext, List<Object?>, List<dynamic>)?
        builderCallback;
        if (builder is InterpretedFunction) {
          builderCallback =
              (
                BuildContext context,
                List<Object?> candidateData,
                List<dynamic> rejectedData,
              ) {
                final result = builder.call(visitor, [
                  context,
                  candidateData,
                  rejectedData,
                ]);
                return visitor.toWidgets(result) ?? const SizedBox.shrink();
              };
        }

        // Handle onWillAccept callback
        final onWillAccept = namedArgs['onWillAccept'];
        bool Function(Object?)? onWillAcceptCallback;
        if (onWillAccept != null) {
          if (onWillAccept is InterpretedFunction) {
            onWillAcceptCallback = (Object? data) {
              final result = onWillAccept.call(visitor, [data]);
              return result as bool? ?? false;
            };
          } else {
            onWillAcceptCallback = onWillAccept as bool Function(Object?)?;
          }
        }

        // Handle onAccept callback
        final onAccept = namedArgs.handleValueCallback<Object>(
          'onAccept',
          visitor,
        );

        // Handle onAcceptWithDetails callback
        final onAcceptWithDetails = namedArgs
            .handleValueCallback<DragTargetDetails<Object>>(
              'onAcceptWithDetails',
              visitor,
            );

        // Handle onLeave callback
        final onLeave = namedArgs.handleValueCallback<Object?>(
          'onLeave',
          visitor,
        );

        // Handle onMove callback
        final onMove = namedArgs.handleValueCallback<DragTargetDetails<Object>>(
          'onMove',
          visitor,
        );

        return DragTarget(
          key: key,
          builder:
              builderCallback ??
              (context, candidateData, rejectedData) => const SizedBox.shrink(),
          onWillAccept: onWillAcceptCallback,
          onAccept: onAccept,
          onAcceptWithDetails: onAcceptWithDetails,
          onLeave: onLeave,
          onMove: onMove,
          hitTestBehavior: hitTestBehavior,
        );
      },
    },
    getters: {
      'hitTestBehavior': (visitor, target) =>
          (target as DragTarget).hitTestBehavior,
      'key': (visitor, target) => (target as DragTarget).key,
    },
  );
}
