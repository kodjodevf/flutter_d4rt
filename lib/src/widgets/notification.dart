// ignore_for_file: deprecated_member_use

import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/double.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

// AlertDialog bridging
BridgedClass getAlertDialogBridgingDefinition() {
  return BridgedClass(
    nativeType: AlertDialog,
    name: 'AlertDialog',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final title = visitor.toWidgets(namedArgs['title']);
        final content = visitor.toWidgets(namedArgs['content']);
        final actions = visitor.toWidgets(namedArgs['actions']);
        return AlertDialog(
          key: namedArgs.get<Key?>('key'),
          title: title,
          titlePadding: namedArgs['titlePadding'] as EdgeInsetsGeometry?,
          titleTextStyle: namedArgs['titleTextStyle'] as TextStyle?,
          content: content,
          contentPadding: namedArgs['contentPadding'] as EdgeInsetsGeometry?,
          contentTextStyle: namedArgs['contentTextStyle'] as TextStyle?,
          actions: actions,
          actionsPadding: namedArgs['actionsPadding'] as EdgeInsetsGeometry?,
          actionsAlignment: namedArgs['actionsAlignment'] as MainAxisAlignment?,
          actionsOverflowAlignment:
              namedArgs['actionsOverflowAlignment'] as OverflowBarAlignment?,
          actionsOverflowDirection:
              namedArgs['actionsOverflowDirection'] as VerticalDirection?,
          actionsOverflowButtonSpacing: toDouble(
            namedArgs['actionsOverflowButtonSpacing'],
          ),
          buttonPadding: namedArgs['buttonPadding'] as EdgeInsetsGeometry?,
          backgroundColor: namedArgs['backgroundColor'] as Color?,
          elevation: toDouble(namedArgs['elevation']),
          shadowColor: namedArgs['shadowColor'] as Color?,
          surfaceTintColor: namedArgs['surfaceTintColor'] as Color?,
          semanticLabel: namedArgs['semanticLabel'] as String?,
          insetPadding:
              namedArgs['insetPadding'] as EdgeInsets? ??
              const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
          clipBehavior: namedArgs['clipBehavior'] as Clip? ?? Clip.none,
          shape: namedArgs['shape'] as ShapeBorder?,
          alignment: namedArgs['alignment'] as AlignmentGeometry?,
          scrollable: namedArgs['scrollable'] as bool? ?? false,
        );
      },
    },
    getters: {
      'title': (visitor, target) => (target as AlertDialog).title,
      'titlePadding': (visitor, target) => (target as AlertDialog).titlePadding,
      'titleTextStyle': (visitor, target) =>
          (target as AlertDialog).titleTextStyle,
      'content': (visitor, target) => (target as AlertDialog).content,
      'contentPadding': (visitor, target) =>
          (target as AlertDialog).contentPadding,
      'contentTextStyle': (visitor, target) =>
          (target as AlertDialog).contentTextStyle,
      'actions': (visitor, target) => (target as AlertDialog).actions,
      'backgroundColor': (visitor, target) =>
          (target as AlertDialog).backgroundColor,
      'elevation': (visitor, target) => (target as AlertDialog).elevation,
      'shadowColor': (visitor, target) => (target as AlertDialog).shadowColor,
      'surfaceTintColor': (visitor, target) =>
          (target as AlertDialog).surfaceTintColor,
      'semanticLabel': (visitor, target) =>
          (target as AlertDialog).semanticLabel,
      'insetPadding': (visitor, target) => (target as AlertDialog).insetPadding,
      'clipBehavior': (visitor, target) => (target as AlertDialog).clipBehavior,
      'shape': (visitor, target) => (target as AlertDialog).shape,
      'scrollable': (visitor, target) => (target as AlertDialog).scrollable,
      'key': (visitor, target) => (target as AlertDialog).key,
    },
  );
}

// SimpleDialog bridging
BridgedClass getSimpleDialogBridgingDefinition() {
  return BridgedClass(
    nativeType: SimpleDialog,
    name: 'SimpleDialog',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final title = visitor.toWidgets(namedArgs['title']);
        final children = visitor.toWidgets(namedArgs['children']);

        return SimpleDialog(
          key: namedArgs.get<Key?>('key'),
          title: title,
          titlePadding: namedArgs['titlePadding'] as EdgeInsetsGeometry,
          titleTextStyle: namedArgs['titleTextStyle'] as TextStyle?,
          contentPadding: namedArgs['contentPadding'] as EdgeInsetsGeometry,
          backgroundColor: namedArgs['backgroundColor'] as Color?,
          elevation: toDouble(namedArgs['elevation']),
          shadowColor: namedArgs['shadowColor'] as Color?,
          surfaceTintColor: namedArgs['surfaceTintColor'] as Color?,
          semanticLabel: namedArgs['semanticLabel'] as String?,
          insetPadding:
              namedArgs['insetPadding'] as EdgeInsets? ??
              const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
          clipBehavior: namedArgs['clipBehavior'] as Clip? ?? Clip.none,
          shape: namedArgs['shape'] as ShapeBorder?,
          alignment: namedArgs['alignment'] as AlignmentGeometry?,
          children: children,
        );
      },
    },
    getters: {
      'title': (visitor, target) => (target as SimpleDialog).title,
      'titlePadding': (visitor, target) =>
          (target as SimpleDialog).titlePadding,
      'titleTextStyle': (visitor, target) =>
          (target as SimpleDialog).titleTextStyle,
      'children': (visitor, target) => (target as SimpleDialog).children,
      'contentPadding': (visitor, target) =>
          (target as SimpleDialog).contentPadding,
      'backgroundColor': (visitor, target) =>
          (target as SimpleDialog).backgroundColor,
      'elevation': (visitor, target) => (target as SimpleDialog).elevation,
      'shadowColor': (visitor, target) => (target as SimpleDialog).shadowColor,
      'surfaceTintColor': (visitor, target) =>
          (target as SimpleDialog).surfaceTintColor,
      'semanticLabel': (visitor, target) =>
          (target as SimpleDialog).semanticLabel,
      'insetPadding': (visitor, target) =>
          (target as SimpleDialog).insetPadding,
      'clipBehavior': (visitor, target) =>
          (target as SimpleDialog).clipBehavior,
      'shape': (visitor, target) => (target as SimpleDialog).shape,
      'key': (visitor, target) => (target as SimpleDialog).key,
    },
  );
}

// SimpleDialogOption bridging
BridgedClass getSimpleDialogOptionBridgingDefinition() {
  return BridgedClass(
    nativeType: SimpleDialogOption,
    name: 'SimpleDialogOption',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final child = visitor.toWidgets(namedArgs['child']);

        return SimpleDialogOption(
          key: key,
          onPressed: namedArgs.handleVoidCallback('onPressed', visitor),
          padding: namedArgs['padding'] as EdgeInsets?,
          child: child,
        );
      },
    },
    getters: {
      'padding': (visitor, target) => (target as SimpleDialogOption).padding,
      'child': (visitor, target) => (target as SimpleDialogOption).child,
      'key': (visitor, target) => (target as SimpleDialogOption).key,
    },
  );
}

// BottomSheet bridging (already exists, but enhanced)
BridgedClass getBottomSheetBridgingDefinition() {
  return BridgedClass(
    nativeType: BottomSheet,
    name: 'BottomSheet',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        // Handle builder function
        Widget Function(BuildContext) builder = (context) => Container();
        final builderValue = namedArgs['builder'];
        if (builderValue is InterpretedFunction) {
          builder = (context) {
            final result = builderValue.call(visitor, [context]);
            return visitor.toWidgets(result);
          };
        }

        return BottomSheet(
          key: namedArgs.get<Key?>('key'),
          onClosing: namedArgs.handleVoidCallback('onClosing', visitor)!,
          builder: builder,
          enableDrag: namedArgs['enableDrag'] as bool? ?? true,
          onDragStart: namedArgs.handleValueCallback<DragStartDetails>(
            'onDragStart',
            visitor,
          ),
          onDragEnd: (details, {required isClosing}) {
            final callback = namedArgs['onDragEnd'];
            if (callback is InterpretedFunction) {
              callback.call(visitor, [details], {'isClosing': isClosing});
            }
          },
          backgroundColor: namedArgs['backgroundColor'] as Color?,
          shadowColor: namedArgs['shadowColor'] as Color?,
          elevation: toDouble(namedArgs['elevation']),
          shape: namedArgs['shape'] as ShapeBorder?,
          clipBehavior: namedArgs['clipBehavior'] as Clip?,
          constraints: namedArgs['constraints'] as BoxConstraints?,
          animationController:
              namedArgs['animationController'] as AnimationController?,
        );
      },
    },
    getters: {
      'enableDrag': (visitor, target) => (target as BottomSheet).enableDrag,
      'backgroundColor': (visitor, target) =>
          (target as BottomSheet).backgroundColor,
      'shadowColor': (visitor, target) => (target as BottomSheet).shadowColor,
      'elevation': (visitor, target) => (target as BottomSheet).elevation,
      'shape': (visitor, target) => (target as BottomSheet).shape,
      'clipBehavior': (visitor, target) => (target as BottomSheet).clipBehavior,
      'constraints': (visitor, target) => (target as BottomSheet).constraints,
      'key': (visitor, target) => (target as BottomSheet).key,
    },
  );
}

// Tooltip bridging
BridgedClass getTooltipBridgingDefinition() {
  return BridgedClass(
    nativeType: Tooltip,
    name: 'Tooltip',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final child = visitor.toWidgets(namedArgs['child']);

        return Tooltip(
          key: key,
          message: namedArgs['message'] as String? ?? '',
          richMessage: namedArgs['richMessage'] as InlineSpan?,
          height: toDouble(namedArgs['height']),
          padding: namedArgs['padding'] as EdgeInsetsGeometry?,
          margin: namedArgs['margin'] as EdgeInsetsGeometry?,
          verticalOffset: toDouble(namedArgs['verticalOffset']),
          preferBelow: namedArgs['preferBelow'] as bool?,
          excludeFromSemantics: namedArgs['excludeFromSemantics'] as bool?,
          decoration: namedArgs['decoration'] as Decoration?,
          textStyle: namedArgs['textStyle'] as TextStyle?,
          textAlign: namedArgs['textAlign'] as TextAlign?,
          waitDuration: namedArgs['waitDuration'] as Duration?,
          showDuration: namedArgs['showDuration'] as Duration?,
          exitDuration: namedArgs['exitDuration'] as Duration?,
          enableTapToDismiss: namedArgs['enableTapToDismiss'] as bool? ?? true,
          triggerMode: namedArgs['triggerMode'] as TooltipTriggerMode?,
          enableFeedback: namedArgs['enableFeedback'] as bool?,
          onTriggered: namedArgs.handleVoidCallback('onTriggered', visitor),
          child: child,
        );
      },
    },
    getters: {
      'message': (visitor, target) => (target as Tooltip).message,
      'richMessage': (visitor, target) => (target as Tooltip).richMessage,
      'height': (visitor, target) => (target as Tooltip).height,
      'padding': (visitor, target) => (target as Tooltip).padding,
      'margin': (visitor, target) => (target as Tooltip).margin,
      'verticalOffset': (visitor, target) => (target as Tooltip).verticalOffset,
      'preferBelow': (visitor, target) => (target as Tooltip).preferBelow,
      'excludeFromSemantics': (visitor, target) =>
          (target as Tooltip).excludeFromSemantics,
      'decoration': (visitor, target) => (target as Tooltip).decoration,
      'textStyle': (visitor, target) => (target as Tooltip).textStyle,
      'textAlign': (visitor, target) => (target as Tooltip).textAlign,
      'waitDuration': (visitor, target) => (target as Tooltip).waitDuration,
      'showDuration': (visitor, target) => (target as Tooltip).showDuration,
      'exitDuration': (visitor, target) => (target as Tooltip).exitDuration,
      'enableTapToDismiss': (visitor, target) =>
          (target as Tooltip).enableTapToDismiss,
      'triggerMode': (visitor, target) => (target as Tooltip).triggerMode,
      'enableFeedback': (visitor, target) => (target as Tooltip).enableFeedback,
      'child': (visitor, target) => (target as Tooltip).child,
      'key': (visitor, target) => (target as Tooltip).key,
    },
  );
}

// AlertDialog bridging
BridgedClass getShowBottomSheetBridgingDefinition() {
  return BridgedClass(
    nativeType: Object,
    name: 'showBottomSheet',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final context = namedArgs['context'] as BuildContext;

        // Handle builder function
        Widget Function(BuildContext) builder = (context) => Container();
        final builderValue = namedArgs['builder'];
        if (builderValue is InterpretedFunction) {
          builder = (context) {
            final result = builderValue.call(visitor, [context]);
            return visitor.toWidgets(result);
          };
        }

        return showBottomSheet(
          context: context,
          builder: builder,
          backgroundColor: namedArgs['backgroundColor'] as Color?,
          elevation: toDouble(namedArgs['elevation']),
          shape: namedArgs['shape'] as ShapeBorder?,
          clipBehavior: namedArgs['clipBehavior'] as Clip?,
          constraints: namedArgs['constraints'] as BoxConstraints?,
          enableDrag: namedArgs['enableDrag'] as bool? ?? true,
          showDragHandle: namedArgs['showDragHandle'] as bool?,
          transitionAnimationController:
              namedArgs['transitionAnimationController']
                  as AnimationController?,
        );
      },
    },
  );
}

BridgedClass getShowDialogBridgingDefinition() {
  return BridgedClass(
    nativeType: Object,
    name: 'showDialog',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final context = namedArgs['context'] as BuildContext;

        // Handle builder function
        Widget Function(BuildContext) builder = (context) => Container();
        final builderValue = namedArgs['builder'];
        if (builderValue is InterpretedFunction) {
          builder = (context) {
            final result = builderValue.call(visitor, [context]);
            return visitor.toWidgets(result);
          };
        }

        return showDialog(
          context: context,
          builder: builder,
          barrierDismissible: namedArgs['barrierDismissible'] as bool? ?? true,
          barrierColor: namedArgs['barrierColor'] as Color?,
          barrierLabel: namedArgs['barrierLabel'] as String?,
          useSafeArea: namedArgs['useSafeArea'] as bool? ?? true,
          useRootNavigator: namedArgs['useRootNavigator'] as bool? ?? true,
          routeSettings: namedArgs['routeSettings'] as RouteSettings?,
          anchorPoint: namedArgs['anchorPoint'] as Offset?,
          traversalEdgeBehavior:
              namedArgs['traversalEdgeBehavior'] as TraversalEdgeBehavior? ??
              TraversalEdgeBehavior.closedLoop,
        );
      },
    },
  );
}

BridgedClass getShowModalBottomSheetBridgingDefinition() {
  return BridgedClass(
    nativeType: Object,
    name: 'showModalBottomSheet',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final context = namedArgs['context'] as BuildContext;

        // Handle builder function
        Widget Function(BuildContext) builder = (context) => Container();
        final builderValue = namedArgs['builder'];
        if (builderValue is InterpretedFunction) {
          builder = (context) {
            final result = builderValue.call(visitor, [context]);
            return visitor.toWidgets(result);
          };
        }

        return showModalBottomSheet(
          context: context,
          builder: builder,
          backgroundColor: namedArgs['backgroundColor'] as Color?,
          barrierColor: namedArgs['barrierColor'] as Color?,
          elevation: toDouble(namedArgs['elevation']),
          shape: namedArgs['shape'] as ShapeBorder?,
          clipBehavior: namedArgs['clipBehavior'] as Clip?,
          constraints: namedArgs['constraints'] as BoxConstraints?,
          barrierLabel: namedArgs['barrierLabel'] as String?,
          isScrollControlled: namedArgs['isScrollControlled'] as bool? ?? false,
          scrollControlDisabledMaxHeightRatio:
              toDouble(namedArgs['scrollControlDisabledMaxHeightRatio']) ??
              9.0 / 16.0,
          useRootNavigator: namedArgs['useRootNavigator'] as bool? ?? false,
          isDismissible: namedArgs['isDismissible'] as bool? ?? true,
          enableDrag: namedArgs['enableDrag'] as bool? ?? true,
          showDragHandle: namedArgs['showDragHandle'] as bool?,
          useSafeArea: namedArgs['useSafeArea'] as bool? ?? false,
          routeSettings: namedArgs['routeSettings'] as RouteSettings?,
          transitionAnimationController:
              namedArgs['transitionAnimationController']
                  as AnimationController?,
          anchorPoint: namedArgs['anchorPoint'] as Offset?,
        );
      },
    },
  );
}

/// Returns the BridgedClass for NotificationListener.
BridgedClass getNotificationListenerBridgingDefinition() {
  return BridgedClass(
    nativeType: NotificationListener,
    name: 'NotificationListener',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final onNotificationValue = namedArgs['onNotification'];
        final child = visitor.toWidgets(namedArgs['child']) ?? const SizedBox.shrink();

        bool Function(Notification)? onNotification;
        if (onNotificationValue is InterpretedFunction) {
          onNotification = (notification) {
            final result = onNotificationValue.call(visitor, [notification]);
            return result is bool ? result : true;
          };
        } else if (onNotificationValue is Function) {
          onNotification = (notification) {
            final result = (onNotificationValue as dynamic)(notification);
            return result is bool ? result : true;
          };
        }

        return NotificationListener<Notification>(
          key: key,
          onNotification: onNotification,
          child: child,
        );
      },
    },
    getters: {
      'child': (visitor, target) => (target as NotificationListener).child,
      'key': (visitor, target) => (target as NotificationListener).key,
    },
  );
}

/// Returns the BridgedClass for Notification abstract class.
BridgedClass getNotificationBridgingDefinition() {
  return BridgedClass(
    nativeType: Notification,
    name: 'Notification',
    constructors: {},
    methods: {
      'dispatch': (visitor, target, positionalArgs, namedArgs) {
        final targetContext = positionalArgs[0] as BuildContext;
        (target as Notification).dispatch(targetContext);
        return null;
      },
    },
    isSubtypeOfFunc: (value) => value is Notification,
  );
}

/// Returns the BridgedClass for ScrollNotification.
BridgedClass getScrollNotificationBridgingDefinition() {
  return BridgedClass(
    nativeType: ScrollNotification,
    name: 'ScrollNotification',
    constructors: {},
    getters: {
      'metrics': (visitor, target) => (target as ScrollNotification).metrics,
      'context': (visitor, target) => (target as ScrollNotification).context,
      'depth': (visitor, target) => (target as ScrollNotification).depth,
    },
    isSubtypeOfFunc: (value) => value is ScrollNotification,
  );
}

/// Returns the BridgedClass for ScrollStartNotification.
BridgedClass getScrollStartNotificationBridgingDefinition() {
  return BridgedClass(
    nativeType: ScrollStartNotification,
    name: 'ScrollStartNotification',
    constructors: {},
    getters: {
      'dragDetails': (visitor, target) =>
          (target as ScrollStartNotification).dragDetails,
    },
    isSubtypeOfFunc: (value) => value is ScrollStartNotification,
  );
}

/// Returns the BridgedClass for ScrollUpdateNotification.
BridgedClass getScrollUpdateNotificationBridgingDefinition() {
  return BridgedClass(
    nativeType: ScrollUpdateNotification,
    name: 'ScrollUpdateNotification',
    constructors: {},
    getters: {
      'scrollDelta': (visitor, target) =>
          (target as ScrollUpdateNotification).scrollDelta,
      'dragDetails': (visitor, target) =>
          (target as ScrollUpdateNotification).dragDetails,
    },
    isSubtypeOfFunc: (value) => value is ScrollUpdateNotification,
  );
}

/// Returns the BridgedClass for ScrollEndNotification.
BridgedClass getScrollEndNotificationBridgingDefinition() {
  return BridgedClass(
    nativeType: ScrollEndNotification,
    name: 'ScrollEndNotification',
    constructors: {},
    getters: {
      'dragDetails': (visitor, target) =>
          (target as ScrollEndNotification).dragDetails,
    },
    isSubtypeOfFunc: (value) => value is ScrollEndNotification,
  );
}

/// Returns the BridgedClass for UserScrollNotification.
BridgedClass getUserScrollNotificationBridgingDefinition() {
  return BridgedClass(
    nativeType: UserScrollNotification,
    name: 'UserScrollNotification',
    constructors: {},
    getters: {
      'direction': (visitor, target) =>
          (target as UserScrollNotification).direction,
    },
    isSubtypeOfFunc: (value) => value is UserScrollNotification,
  );
}

