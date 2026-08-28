import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import '../../utils/extensions/widget.dart';

EdgeInsets? _extractEdgeInsets(dynamic raw) {
  if (raw == null) return null;
  final obj = raw is BridgedInstance ? raw.nativeObject : raw;
  if (obj is EdgeInsets) return obj;
  return null;
}

EdgeInsetsGeometry? _extractEdgeInsetsGeometry(dynamic raw) {
  if (raw == null) return null;
  final obj = raw is BridgedInstance ? raw.nativeObject : raw;
  if (obj is EdgeInsetsGeometry) return obj;
  return null;
}

/// Returns the BridgedClass for the Flutter AlertDialog widget.
BridgedClass getAlertDialogBridgingDefinition() {
  return BridgedClass(
    nativeType: AlertDialog,
    name: 'AlertDialog',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final insetPadding = _extractEdgeInsets(namedArgs['insetPadding']);
        final clipBehavior = namedArgs.get<Clip?>('clipBehavior') ?? Clip.none;
        final shape = namedArgs.get<ShapeBorder?>('shape');
        final alignment = namedArgs.get<AlignmentGeometry?>('alignment');
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final elevation = namedArgs.getToDouble('elevation');
        final shadowColor = namedArgs.get<Color?>('shadowColor');
        final surfaceTintColor = namedArgs.get<Color?>('surfaceTintColor');
        final scrollable = namedArgs.get<bool?>('scrollable') ?? false;
        final title = visitor.toWidget(namedArgs['title']);
        final content = visitor.toWidget(namedArgs['content']);
        final actions = visitor.toWidgetList(namedArgs['actions']);

        return AlertDialog(
          key: key,
          title: title,
          content: content,
          actions: actions,
          insetPadding: insetPadding ??
              const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
          clipBehavior: clipBehavior,
          shape: shape,
          alignment: alignment,
          backgroundColor: backgroundColor,
          elevation: elevation,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          scrollable: scrollable,
        );
      },
    },
    getters: {
      'title': (visitor, target) => (target as AlertDialog).title,
      'content': (visitor, target) => (target as AlertDialog).content,
      'actions': (visitor, target) => (target as AlertDialog).actions,
      'backgroundColor': (visitor, target) =>
          (target as AlertDialog).backgroundColor,
      'elevation': (visitor, target) => (target as AlertDialog).elevation,
      'scrollable': (visitor, target) => (target as AlertDialog).scrollable,
    },
  );
}

/// Returns the BridgedClass for the Flutter SimpleDialog widget.
BridgedClass getSimpleDialogBridgingDefinition() {
  return BridgedClass(
    nativeType: SimpleDialog,
    name: 'SimpleDialog',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final insetPadding = _extractEdgeInsets(namedArgs['insetPadding']);
        final clipBehavior = namedArgs.get<Clip?>('clipBehavior') ?? Clip.none;
        final shape = namedArgs.get<ShapeBorder?>('shape');
        final alignment = namedArgs.get<AlignmentGeometry?>('alignment');
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final elevation = namedArgs.getToDouble('elevation');
        final shadowColor = namedArgs.get<Color?>('shadowColor');
        final surfaceTintColor = namedArgs.get<Color?>('surfaceTintColor');
        final titlePadding =
            _extractEdgeInsetsGeometry(namedArgs['titlePadding']);
        final contentPadding =
            _extractEdgeInsetsGeometry(namedArgs['contentPadding']);
        final title = visitor.toWidget(namedArgs['title']);
        final children = visitor.toWidgetList(namedArgs['children']);

        return SimpleDialog(
          key: key,
          title: title,
          insetPadding: insetPadding ??
              const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
          clipBehavior: clipBehavior,
          shape: shape,
          alignment: alignment,
          backgroundColor: backgroundColor,
          elevation: elevation,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          titlePadding:
              titlePadding ?? const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
          contentPadding:
              contentPadding ??
              const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 16.0),
          children: children,
        );
      },
    },
    getters: {
      'title': (visitor, target) => (target as SimpleDialog).title,
      'children': (visitor, target) => (target as SimpleDialog).children,
      'backgroundColor': (visitor, target) =>
          (target as SimpleDialog).backgroundColor,
      'elevation': (visitor, target) => (target as SimpleDialog).elevation,
    },
  );
}

/// Returns the BridgedClass for the Flutter SimpleDialogOption widget.
BridgedClass getSimpleDialogOptionBridgingDefinition() {
  return BridgedClass(
    nativeType: SimpleDialogOption,
    name: 'SimpleDialogOption',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final onPressed = namedArgs.handleVoidCallback('onPressed', visitor);
        final padding = _extractEdgeInsets(namedArgs['padding']);
        final child = visitor.toWidget(namedArgs['child']);

        return SimpleDialogOption(
          key: key,
          onPressed: onPressed,
          padding: padding,
          child: child,
        );
      },
    },
    getters: {
      'child': (visitor, target) => (target as SimpleDialogOption).child,
      'padding': (visitor, target) => (target as SimpleDialogOption).padding,
    },
  );
}

/// Returns the BridgedClass for the Flutter showDialog function.
BridgedClass getShowDialogBridgingDefinition() {
  return BridgedClass(
    nativeType: Object,
    name: 'showDialog',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final context = namedArgs.get<BuildContext>('context') ??
            (positionalArgs.isNotEmpty
                ? positionalArgs[0] as BuildContext
                : null);
        if (context == null) {
          throw ArgumentError('BuildContext is required for showDialog');
        }
        final builderRaw = namedArgs['builder'];
        final barrierDismissible =
            namedArgs.get<bool?>('barrierDismissible') ?? true;
        final barrierColor = namedArgs.get<Color?>('barrierColor');
        final barrierLabel = namedArgs.get<String?>('barrierLabel');
        final useSafeArea = namedArgs.get<bool?>('useSafeArea') ?? true;
        final useRootNavigator =
            namedArgs.get<bool?>('useRootNavigator') ?? true;

        return showDialog(
          context: context,
          barrierDismissible: barrierDismissible,
          barrierColor: barrierColor,
          barrierLabel: barrierLabel,
          useSafeArea: useSafeArea,
          useRootNavigator: useRootNavigator,
          builder: (BuildContext ctx) {
            if (builderRaw is InterpretedFunction) {
              final result = builderRaw.call(visitor, [ctx], {});
              return visitor.toWidget(result) ?? const SizedBox();
            }
            return const SizedBox();
          },
        );
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter Dialog widget.
BridgedClass getDialogBridgingDefinition() {
  return BridgedClass(
    nativeType: Dialog,
    name: 'Dialog',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final elevation = namedArgs.getToDouble('elevation');
        final shadowColor = namedArgs.get<Color?>('shadowColor');
        final surfaceTintColor = namedArgs.get<Color?>('surfaceTintColor');
        final insetAnimationDuration =
            namedArgs.get<Duration?>('insetAnimationDuration') ??
                const Duration(milliseconds: 100);
        final insetAnimationCurve =
            namedArgs.get<Curve?>('insetAnimationCurve') ?? Curves.decelerate;
        final insetPadding = _extractEdgeInsets(namedArgs['insetPadding']);
        final clipBehavior = namedArgs.get<Clip?>('clipBehavior') ?? Clip.none;
        final shape = namedArgs.get<ShapeBorder?>('shape');
        final alignment = namedArgs.get<AlignmentGeometry?>('alignment');
        final child = visitor.toWidget(namedArgs['child']);

        return Dialog(
          key: key,
          backgroundColor: backgroundColor,
          elevation: elevation,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          insetAnimationDuration: insetAnimationDuration,
          insetAnimationCurve: insetAnimationCurve,
          insetPadding: insetPadding,
          clipBehavior: clipBehavior,
          shape: shape,
          alignment: alignment,
          child: child,
        );
      },
      'fullscreen': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final insetAnimationDuration =
            namedArgs.get<Duration?>('insetAnimationDuration') ??
                const Duration(milliseconds: 100);
        final insetAnimationCurve =
            namedArgs.get<Curve?>('insetAnimationCurve') ?? Curves.decelerate;
        final child = visitor.toWidget(namedArgs['child']);

        return Dialog.fullscreen(
          key: key,
          backgroundColor: backgroundColor,
          insetAnimationDuration: insetAnimationDuration,
          insetAnimationCurve: insetAnimationCurve,
          child: child,
        );
      },
    },
    getters: {
      'child': (visitor, target) => (target as Dialog).child,
      'backgroundColor': (visitor, target) =>
          (target as Dialog).backgroundColor,
      'elevation': (visitor, target) => (target as Dialog).elevation,
      'shape': (visitor, target) => (target as Dialog).shape,
      'alignment': (visitor, target) => (target as Dialog).alignment,
      'key': (visitor, target) => (target as Dialog).key,
    },
    isSubtypeOfFunc: (value) => value is Dialog,
  );
}

/// Returns the BridgedClass for Flutter showGeneralDialog function.
BridgedClass getShowGeneralDialogBridgingDefinition() {
  return BridgedClass(
    nativeType: Object,
    name: 'showGeneralDialog',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final context = namedArgs.get<BuildContext>('context') ??
            (positionalArgs.isNotEmpty
                ? positionalArgs[0] as BuildContext
                : null);
        if (context == null) {
          throw ArgumentError('BuildContext is required for showGeneralDialog');
        }
        final pageBuilderRaw = namedArgs['pageBuilder'];
        final barrierDismissible =
            namedArgs.get<bool?>('barrierDismissible') ?? false;
        final barrierLabel = namedArgs.get<String?>('barrierLabel') ?? '';
        final barrierColor =
            namedArgs.get<Color?>('barrierColor') ?? const Color(0x80000000);
        final transitionDuration =
            namedArgs.get<Duration?>('transitionDuration') ??
                const Duration(milliseconds: 200);
        final useRootNavigator =
            namedArgs.get<bool?>('useRootNavigator') ?? true;

        return showGeneralDialog(
          context: context,
          barrierDismissible: barrierDismissible,
          barrierLabel: barrierLabel,
          barrierColor: barrierColor,
          transitionDuration: transitionDuration,
          useRootNavigator: useRootNavigator,
          pageBuilder: (BuildContext ctx, Animation<double> anim1,
              Animation<double> anim2) {
            if (pageBuilderRaw is InterpretedFunction) {
              final result =
                  pageBuilderRaw.call(visitor, [ctx, anim1, anim2], {});
              return visitor.toWidget(result) ?? const SizedBox();
            }
            return const SizedBox();
          },
        );
      },
    },
  );
}
