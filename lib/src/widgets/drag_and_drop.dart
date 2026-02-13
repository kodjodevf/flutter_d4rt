import 'package:d4rt/d4rt.dart';
import 'package:flutter/widgets.dart';
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
        final onDragStarted = namedArgs['onDragStarted'];
        VoidCallback? onDragStartedCallback;
        if (onDragStarted != null) {
          if (onDragStarted is InterpretedFunction) {
            onDragStartedCallback = () => onDragStarted.call(visitor, []);
          } else {
            onDragStartedCallback = onDragStarted as VoidCallback?;
          }
        }

        // Handle onDragUpdate callback
        final onDragUpdate = namedArgs['onDragUpdate'];
        void Function(DragUpdateDetails)? onDragUpdateCallback;
        if (onDragUpdate != null) {
          if (onDragUpdate is InterpretedFunction) {
            onDragUpdateCallback = (DragUpdateDetails details) =>
                onDragUpdate.call(visitor, [details]);
          } else {
            onDragUpdateCallback =
                onDragUpdate as void Function(DragUpdateDetails)?;
          }
        }

        // Handle onDraggableCanceled callback
        final onDraggableCanceled = namedArgs['onDraggableCanceled'];
        void Function(Velocity, Offset)? onDraggableCanceledCallback;
        if (onDraggableCanceled != null) {
          if (onDraggableCanceled is InterpretedFunction) {
            onDraggableCanceledCallback = (Velocity velocity, Offset offset) =>
                onDraggableCanceled.call(visitor, [velocity, offset]);
          } else {
            onDraggableCanceledCallback =
                onDraggableCanceled as void Function(Velocity, Offset)?;
          }
        }

        // Handle onDragEnd callback
        final onDragEnd = namedArgs['onDragEnd'];
        void Function(DraggableDetails)? onDragEndCallback;
        if (onDragEnd != null) {
          if (onDragEnd is InterpretedFunction) {
            onDragEndCallback = (DraggableDetails details) =>
                onDragEnd.call(visitor, [details]);
          } else {
            onDragEndCallback = onDragEnd as void Function(DraggableDetails)?;
          }
        }

        // Handle onDragCompleted callback
        final onDragCompleted = namedArgs['onDragCompleted'];
        VoidCallback? onDragCompletedCallback;
        if (onDragCompleted != null) {
          if (onDragCompleted is InterpretedFunction) {
            onDragCompletedCallback = () => onDragCompleted.call(visitor, []);
          } else {
            onDragCompletedCallback = onDragCompleted as VoidCallback?;
          }
        }

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
          onDragStarted: onDragStartedCallback,
          onDragUpdate: onDragUpdateCallback,
          onDraggableCanceled: onDraggableCanceledCallback,
          onDragEnd: onDragEndCallback,
          onDragCompleted: onDragCompletedCallback,
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
        final onAccept = namedArgs['onAccept'];
        void Function(Object)? onAcceptCallback;
        if (onAccept != null) {
          if (onAccept is InterpretedFunction) {
            onAcceptCallback = (Object data) => onAccept.call(visitor, [data]);
          } else {
            onAcceptCallback = onAccept as void Function(Object)?;
          }
        }

        // Handle onAcceptWithDetails callback
        final onAcceptWithDetails = namedArgs['onAcceptWithDetails'];
        void Function(DragTargetDetails<Object>)? onAcceptWithDetailsCallback;
        if (onAcceptWithDetails != null) {
          if (onAcceptWithDetails is InterpretedFunction) {
            onAcceptWithDetailsCallback = (DragTargetDetails<Object> details) =>
                onAcceptWithDetails.call(visitor, [details]);
          } else {
            onAcceptWithDetailsCallback =
                onAcceptWithDetails
                    as void Function(DragTargetDetails<Object>)?;
          }
        }

        // Handle onLeave callback
        final onLeave = namedArgs['onLeave'];
        void Function(Object?)? onLeaveCallback;
        if (onLeave != null) {
          if (onLeave is InterpretedFunction) {
            onLeaveCallback = (Object? data) => onLeave.call(visitor, [data]);
          } else {
            onLeaveCallback = onLeave as void Function(Object?)?;
          }
        }

        // Handle onMove callback
        final onMove = namedArgs['onMove'];
        void Function(DragTargetDetails<Object>)? onMoveCallback;
        if (onMove != null) {
          if (onMove is InterpretedFunction) {
            onMoveCallback = (DragTargetDetails<Object> details) =>
                onMove.call(visitor, [details]);
          } else {
            onMoveCallback =
                onMove as void Function(DragTargetDetails<Object>)?;
          }
        }

        return DragTarget(
          key: key,
          builder:
              builderCallback ??
              (context, candidateData, rejectedData) => const SizedBox.shrink(),
          onWillAccept: onWillAcceptCallback,
          onAccept: onAcceptCallback,
          onAcceptWithDetails: onAcceptWithDetailsCallback,
          onLeave: onLeaveCallback,
          onMove: onMoveCallback,
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
