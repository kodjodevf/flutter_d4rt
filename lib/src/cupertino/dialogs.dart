import 'package:d4rt/d4rt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for Flutter CupertinoAlertDialog.
BridgedClass getCupertinoAlertDialogBridgingDefinition() {
  return BridgedClass(
    nativeType: CupertinoAlertDialog,
    name: 'CupertinoAlertDialog',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final title = visitor.toWidget(namedArgs['title']);
        final content = visitor.toWidget(namedArgs['content']);
        final actionsRaw = visitor.toWidgets(namedArgs['actions']);
        final List<Widget> actions = [];
        if (actionsRaw is List) {
          actions.addAll(actionsRaw.cast());
        }
        final scrollController =
            namedArgs.get<ScrollController?>('scrollController');
        final actionScrollController =
            namedArgs.get<ScrollController?>('actionScrollController');
        final insetAnimationDuration =
            namedArgs.get<Duration?>('insetAnimationDuration') ??
                const Duration(milliseconds: 100);
        final insetAnimationCurve =
            namedArgs.get<Curve?>('insetAnimationCurve') ?? Curves.decelerate;

        return CupertinoAlertDialog(
          key: key,
          title: title,
          content: content,
          actions: actions,
          scrollController: scrollController,
          actionScrollController: actionScrollController,
          insetAnimationDuration: insetAnimationDuration,
          insetAnimationCurve: insetAnimationCurve,
        );
      },
    },
    getters: {
      'title': (visitor, target) => (target as CupertinoAlertDialog).title,
      'content': (visitor, target) => (target as CupertinoAlertDialog).content,
      'actions': (visitor, target) => (target as CupertinoAlertDialog).actions,
    },
  );
}

/// Returns the BridgedClass for Flutter CupertinoDialogAction.
BridgedClass getCupertinoDialogActionBridgingDefinition() {
  return BridgedClass(
    nativeType: CupertinoDialogAction,
    name: 'CupertinoDialogAction',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final child = visitor.toWidget(namedArgs['child']) ?? const SizedBox();
        final isDefaultAction =
            namedArgs.get<bool?>('isDefaultAction') ?? false;
        final isDestructiveAction =
            namedArgs.get<bool?>('isDestructiveAction') ?? false;
        final textStyle = namedArgs.get<TextStyle?>('textStyle');
        final onPressed = namedArgs.handleVoidCallback('onPressed', visitor);

        return CupertinoDialogAction(
          key: key,
          onPressed: onPressed,
          isDefaultAction: isDefaultAction,
          isDestructiveAction: isDestructiveAction,
          textStyle: textStyle,
          child: child,
        );
      },
    },
    getters: {
      'child': (visitor, target) => (target as CupertinoDialogAction).child,
      'isDefaultAction': (visitor, target) =>
          (target as CupertinoDialogAction).isDefaultAction,
      'isDestructiveAction': (visitor, target) =>
          (target as CupertinoDialogAction).isDestructiveAction,
      'textStyle': (visitor, target) =>
          (target as CupertinoDialogAction).textStyle,
    },
  );
}

/// Returns the BridgedClass for Flutter CupertinoActionSheet.
BridgedClass getCupertinoActionSheetBridgingDefinition() {
  return BridgedClass(
    nativeType: CupertinoActionSheet,
    name: 'CupertinoActionSheet',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final title = visitor.toWidget(namedArgs['title']);
        final message = visitor.toWidget(namedArgs['message']);
        final actionsRaw = visitor.toWidgets(namedArgs['actions']);
        final List<Widget> actions = [];
        if (actionsRaw is List) {
          actions.addAll(actionsRaw.cast());
        }
        final messageScrollController =
            namedArgs.get<ScrollController?>('messageScrollController');
        final actionScrollController =
            namedArgs.get<ScrollController?>('actionScrollController');
        final cancelButton = visitor.toWidget(namedArgs['cancelButton']);

        return CupertinoActionSheet(
          key: key,
          title: title,
          message: message,
          actions: actions,
          messageScrollController: messageScrollController,
          actionScrollController: actionScrollController,
          cancelButton: cancelButton,
        );
      },
    },
    getters: {
      'title': (visitor, target) => (target as CupertinoActionSheet).title,
      'message': (visitor, target) => (target as CupertinoActionSheet).message,
      'actions': (visitor, target) => (target as CupertinoActionSheet).actions,
      'cancelButton': (visitor, target) =>
          (target as CupertinoActionSheet).cancelButton,
    },
  );
}

/// Returns the BridgedClass for Flutter CupertinoActionSheetAction.
BridgedClass getCupertinoActionSheetActionBridgingDefinition() {
  return BridgedClass(
    nativeType: CupertinoActionSheetAction,
    name: 'CupertinoActionSheetAction',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final child = visitor.toWidget(namedArgs['child']) ?? const SizedBox();
        final isDefaultAction =
            namedArgs.get<bool?>('isDefaultAction') ?? false;
        final isDestructiveAction =
            namedArgs.get<bool?>('isDestructiveAction') ?? false;
        final onPressed =
            namedArgs.handleVoidCallback('onPressed', visitor) ?? () {};

        return CupertinoActionSheetAction(
          key: key,
          onPressed: onPressed,
          isDefaultAction: isDefaultAction,
          isDestructiveAction: isDestructiveAction,
          child: child,
        );
      },
    },
    getters: {
      'child': (visitor, target) =>
          (target as CupertinoActionSheetAction).child,
      'isDefaultAction': (visitor, target) =>
          (target as CupertinoActionSheetAction).isDefaultAction,
      'isDestructiveAction': (visitor, target) =>
          (target as CupertinoActionSheetAction).isDestructiveAction,
    },
  );
}
