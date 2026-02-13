import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

// Helper function for VoidCallback handling
VoidCallback? _handleVoidCallback(
  InterpreterVisitor visitor,
  dynamic callback,
) {
  if (callback == null) return null;
  if (callback is InterpretedFunction) {
    return () => callback.call(visitor, []);
  }
  return callback as VoidCallback?;
}

/// Returns the BridgedClass for the Flutter Chip widget.
BridgedClass getChipBridgingDefinition() {
  return BridgedClass(
    nativeType: Chip,
    name: 'Chip',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final avatar = visitor.toWidgets(namedArgs['avatar']);
        final deleteIcon = visitor.toWidgets(namedArgs['deleteIcon']);
        final onDeleted = _handleVoidCallback(visitor, namedArgs['onDeleted']);
        final deleteIconColor = namedArgs.get<Color?>('deleteIconColor');
        final deleteButtonTooltipMessage = namedArgs.get<String?>(
          'deleteButtonTooltipMessage',
        );
        final side = namedArgs.get<BorderSide?>('side');
        final shape = namedArgs.get<OutlinedBorder?>('shape');
        final clipBehavior = namedArgs.get<Clip?>('clipBehavior') ?? Clip.none;
        final focusNode = namedArgs.get<FocusNode?>('focusNode');
        final autofocus = namedArgs.get<bool?>('autofocus') ?? false;
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding');
        final visualDensity = namedArgs.get<VisualDensity?>('visualDensity');
        final materialTapTargetSize = namedArgs.get<MaterialTapTargetSize?>(
          'materialTapTargetSize',
        );
        final elevation = namedArgs.getToDouble('elevation');
        final shadowColor = namedArgs.get<Color?>('shadowColor');
        final surfaceTintColor = namedArgs.get<Color?>('surfaceTintColor');
        final iconTheme = namedArgs.get<IconThemeData?>('iconTheme');
        final label = visitor.toWidgets(namedArgs['label']);

        return Chip(
          key: key,
          avatar: avatar,
          label: label,
          labelStyle: namedArgs.get<TextStyle?>('labelStyle'),
          labelPadding: namedArgs.get<EdgeInsetsGeometry?>('labelPadding'),
          deleteIcon: deleteIcon,
          onDeleted: onDeleted,
          deleteIconColor: deleteIconColor,
          deleteButtonTooltipMessage: deleteButtonTooltipMessage,
          side: side,
          shape: shape,
          clipBehavior: clipBehavior,
          focusNode: focusNode,
          autofocus: autofocus,
          backgroundColor: backgroundColor,
          padding: padding,
          visualDensity: visualDensity,
          materialTapTargetSize: materialTapTargetSize,
          elevation: elevation,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          iconTheme: iconTheme,
        );
      },
    },
    getters: {
      'avatar': (visitor, target) => (target as Chip).avatar,
      'label': (visitor, target) => (target as Chip).label,
      'labelStyle': (visitor, target) => (target as Chip).labelStyle,
      'labelPadding': (visitor, target) => (target as Chip).labelPadding,
      'deleteIcon': (visitor, target) => (target as Chip).deleteIcon,
      'deleteIconColor': (visitor, target) => (target as Chip).deleteIconColor,
      'backgroundColor': (visitor, target) => (target as Chip).backgroundColor,
      'padding': (visitor, target) => (target as Chip).padding,
      'elevation': (visitor, target) => (target as Chip).elevation,
      'shadowColor': (visitor, target) => (target as Chip).shadowColor,
      'autofocus': (visitor, target) => (target as Chip).autofocus,
      'key': (visitor, target) => (target as Chip).key,
    },
  );
}
