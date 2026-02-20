import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for the Flutter Tooltip widget.
BridgedClass getTooltipWidgetBridgingDefinition() {
  return BridgedClass(
    nativeType: Tooltip,
    name: 'Tooltip',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final message = namedArgs.get<String?>('message');
        final richMessage = namedArgs.get<InlineSpan?>('richMessage');
        final height = namedArgs.get<double?>('height');
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding');
        final margin = namedArgs.get<EdgeInsetsGeometry?>('margin');
        final verticalOffset = namedArgs.get<double?>('verticalOffset');
        final preferBelow = namedArgs.get<bool?>('preferBelow');
        final excludeFromSemantics =
            namedArgs.get<bool?>('excludeFromSemantics') ?? false;
        final decoration = namedArgs.get<Decoration?>('decoration');
        final textStyle = namedArgs.get<TextStyle?>('textStyle');
        final textAlign = namedArgs.get<TextAlign?>('textAlign');
        final waitDuration = namedArgs.get<Duration?>('waitDuration');
        final showDuration = namedArgs.get<Duration?>('showDuration');
        final exitDuration = namedArgs.get<Duration?>('exitDuration');
        final enableTapToDismiss =
            namedArgs.get<bool?>('enableTapToDismiss') ?? true;
        final triggerMode = namedArgs.get<TooltipTriggerMode?>('triggerMode');
        final enableFeedback = namedArgs.get<bool?>('enableFeedback');
        final child = visitor.toWidgets(namedArgs['child']);

        // Handle onTriggered callback
        final onTriggered = namedArgs.handleVoidCallback(
          'onTriggered',
          visitor,
        );

        return Tooltip(
          key: key,
          message: message,
          richMessage: richMessage,
          height: height,
          padding: padding,
          margin: margin,
          verticalOffset: verticalOffset,
          preferBelow: preferBelow,
          excludeFromSemantics: excludeFromSemantics,
          decoration: decoration,
          textStyle: textStyle,
          textAlign: textAlign,
          waitDuration: waitDuration,
          showDuration: showDuration,
          exitDuration: exitDuration,
          enableTapToDismiss: enableTapToDismiss,
          triggerMode: triggerMode,
          enableFeedback: enableFeedback,
          onTriggered: onTriggered,
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
