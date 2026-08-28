import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

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
        final onDeleted = namedArgs.handleVoidCallback('onDeleted', visitor);
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

/// Returns the BridgedClass for Flutter ActionChip.
BridgedClass getActionChipBridgingDefinition() {
  return BridgedClass(
    nativeType: ActionChip,
    name: 'ActionChip',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final avatar = visitor.toWidget(namedArgs['avatar']);
        final label = visitor.toWidget(namedArgs['label']) ?? const SizedBox();
        final labelStyle = namedArgs.get<TextStyle?>('labelStyle');
        final labelPadding = namedArgs.get<EdgeInsetsGeometry?>('labelPadding');
        final onPressed = namedArgs.handleVoidCallback('onPressed', visitor);
        final tooltip = namedArgs.get<String?>('tooltip');
        final side = namedArgs.get<BorderSide?>('side');
        final shape = namedArgs.get<OutlinedBorder?>('shape');
        final clipBehavior = namedArgs.get<Clip?>('clipBehavior') ?? Clip.none;
        final focusNode = namedArgs.get<FocusNode?>('focusNode');
        final autofocus = namedArgs.get<bool?>('autofocus') ?? false;
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding');
        final visualDensity = namedArgs.get<VisualDensity?>('visualDensity');
        final elevation = (namedArgs['elevation'] as num?)?.toDouble();
        final shadowColor = namedArgs.get<Color?>('shadowColor');
        final surfaceTintColor = namedArgs.get<Color?>('surfaceTintColor');
        final iconTheme = namedArgs.get<IconThemeData?>('iconTheme');

        return ActionChip(
          key: key,
          avatar: avatar,
          label: label,
          labelStyle: labelStyle,
          labelPadding: labelPadding,
          onPressed: onPressed,
          tooltip: tooltip,
          side: side,
          shape: shape,
          clipBehavior: clipBehavior,
          focusNode: focusNode,
          autofocus: autofocus,
          backgroundColor: backgroundColor,
          padding: padding,
          visualDensity: visualDensity,
          elevation: elevation,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          iconTheme: iconTheme,
        );
      },
    },
  );
}

/// Returns the BridgedClass for Flutter ChoiceChip.
BridgedClass getChoiceChipBridgingDefinition() {
  return BridgedClass(
    nativeType: ChoiceChip,
    name: 'ChoiceChip',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final avatar = visitor.toWidget(namedArgs['avatar']);
        final label = visitor.toWidget(namedArgs['label']) ?? const SizedBox();
        final labelStyle = namedArgs.get<TextStyle?>('labelStyle');
        final labelPadding = namedArgs.get<EdgeInsetsGeometry?>('labelPadding');
        final selected = namedArgs.get<bool?>('selected') ?? false;
        final onSelected =
            namedArgs.handleValueCallback<bool>('onSelected', visitor);
        final selectedColor = namedArgs.get<Color?>('selectedColor');
        final disabledColor = namedArgs.get<Color?>('disabledColor');
        final tooltip = namedArgs.get<String?>('tooltip');
        final side = namedArgs.get<BorderSide?>('side');
        final shape = namedArgs.get<OutlinedBorder?>('shape');
        final clipBehavior = namedArgs.get<Clip?>('clipBehavior') ?? Clip.none;
        final focusNode = namedArgs.get<FocusNode?>('focusNode');
        final autofocus = namedArgs.get<bool?>('autofocus') ?? false;
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding');
        final visualDensity = namedArgs.get<VisualDensity?>('visualDensity');
        final elevation = (namedArgs['elevation'] as num?)?.toDouble();
        final shadowColor = namedArgs.get<Color?>('shadowColor');
        final surfaceTintColor = namedArgs.get<Color?>('surfaceTintColor');
        final iconTheme = namedArgs.get<IconThemeData?>('iconTheme');

        return ChoiceChip(
          key: key,
          avatar: avatar,
          label: label,
          labelStyle: labelStyle,
          labelPadding: labelPadding,
          selected: selected,
          onSelected: onSelected,
          selectedColor: selectedColor,
          disabledColor: disabledColor,
          tooltip: tooltip,
          side: side,
          shape: shape,
          clipBehavior: clipBehavior,
          focusNode: focusNode,
          autofocus: autofocus,
          backgroundColor: backgroundColor,
          padding: padding,
          visualDensity: visualDensity,
          elevation: elevation,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          iconTheme: iconTheme,
        );
      },
    },
  );
}

/// Returns the BridgedClass for Flutter FilterChip.
BridgedClass getFilterChipBridgingDefinition() {
  return BridgedClass(
    nativeType: FilterChip,
    name: 'FilterChip',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final avatar = visitor.toWidget(namedArgs['avatar']);
        final label = visitor.toWidget(namedArgs['label']) ?? const SizedBox();
        final labelStyle = namedArgs.get<TextStyle?>('labelStyle');
        final labelPadding = namedArgs.get<EdgeInsetsGeometry?>('labelPadding');
        final selected = namedArgs.get<bool?>('selected') ?? false;
        final onSelected =
            namedArgs.handleValueCallback<bool>('onSelected', visitor);
        final selectedColor = namedArgs.get<Color?>('selectedColor');
        final disabledColor = namedArgs.get<Color?>('disabledColor');
        final checkmarkColor = namedArgs.get<Color?>('checkmarkColor');
        final showCheckmark = namedArgs.get<bool?>('showCheckmark');
        final tooltip = namedArgs.get<String?>('tooltip');
        final side = namedArgs.get<BorderSide?>('side');
        final shape = namedArgs.get<OutlinedBorder?>('shape');
        final clipBehavior = namedArgs.get<Clip?>('clipBehavior') ?? Clip.none;
        final focusNode = namedArgs.get<FocusNode?>('focusNode');
        final autofocus = namedArgs.get<bool?>('autofocus') ?? false;
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding');
        final visualDensity = namedArgs.get<VisualDensity?>('visualDensity');
        final elevation = (namedArgs['elevation'] as num?)?.toDouble();
        final shadowColor = namedArgs.get<Color?>('shadowColor');
        final surfaceTintColor = namedArgs.get<Color?>('surfaceTintColor');
        final iconTheme = namedArgs.get<IconThemeData?>('iconTheme');

        return FilterChip(
          key: key,
          avatar: avatar,
          label: label,
          labelStyle: labelStyle,
          labelPadding: labelPadding,
          selected: selected,
          onSelected: onSelected,
          selectedColor: selectedColor,
          disabledColor: disabledColor,
          checkmarkColor: checkmarkColor,
          showCheckmark: showCheckmark,
          tooltip: tooltip,
          side: side,
          shape: shape,
          clipBehavior: clipBehavior,
          focusNode: focusNode,
          autofocus: autofocus,
          backgroundColor: backgroundColor,
          padding: padding,
          visualDensity: visualDensity,
          elevation: elevation,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          iconTheme: iconTheme,
        );
      },
    },
  );
}

/// Returns the BridgedClass for Flutter InputChip.
BridgedClass getInputChipBridgingDefinition() {
  return BridgedClass(
    nativeType: InputChip,
    name: 'InputChip',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final avatar = visitor.toWidget(namedArgs['avatar']);
        final label = visitor.toWidget(namedArgs['label']) ?? const SizedBox();
        final labelStyle = namedArgs.get<TextStyle?>('labelStyle');
        final labelPadding = namedArgs.get<EdgeInsetsGeometry?>('labelPadding');
        final selected = namedArgs.get<bool?>('selected') ?? false;
        final isEnabled = namedArgs.get<bool?>('isEnabled') ?? true;
        final onSelected =
            namedArgs.handleValueCallback<bool>('onSelected', visitor);
        final deleteIcon = visitor.toWidget(namedArgs['deleteIcon']);
        final onDeleted = namedArgs.handleVoidCallback('onDeleted', visitor);
        final deleteIconColor = namedArgs.get<Color?>('deleteIconColor');
        final deleteButtonTooltipMessage =
            namedArgs.get<String?>('deleteButtonTooltipMessage');
        final onPressed = namedArgs.handleVoidCallback('onPressed', visitor);
        final selectedColor = namedArgs.get<Color?>('selectedColor');
        final disabledColor = namedArgs.get<Color?>('disabledColor');
        final tooltip = namedArgs.get<String?>('tooltip');
        final side = namedArgs.get<BorderSide?>('side');
        final shape = namedArgs.get<OutlinedBorder?>('shape');
        final clipBehavior = namedArgs.get<Clip?>('clipBehavior') ?? Clip.none;
        final focusNode = namedArgs.get<FocusNode?>('focusNode');
        final autofocus = namedArgs.get<bool?>('autofocus') ?? false;
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding');
        final visualDensity = namedArgs.get<VisualDensity?>('visualDensity');
        final elevation = (namedArgs['elevation'] as num?)?.toDouble();
        final shadowColor = namedArgs.get<Color?>('shadowColor');
        final surfaceTintColor = namedArgs.get<Color?>('surfaceTintColor');
        final iconTheme = namedArgs.get<IconThemeData?>('iconTheme');

        return InputChip(
          key: key,
          avatar: avatar,
          label: label,
          labelStyle: labelStyle,
          labelPadding: labelPadding,
          selected: selected,
          isEnabled: isEnabled,
          onSelected: onSelected,
          deleteIcon: deleteIcon,
          onDeleted: onDeleted,
          deleteIconColor: deleteIconColor,
          deleteButtonTooltipMessage: deleteButtonTooltipMessage,
          onPressed: onPressed,
          selectedColor: selectedColor,
          disabledColor: disabledColor,
          tooltip: tooltip,
          side: side,
          shape: shape,
          clipBehavior: clipBehavior,
          focusNode: focusNode,
          autofocus: autofocus,
          backgroundColor: backgroundColor,
          padding: padding,
          visualDensity: visualDensity,
          elevation: elevation,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          iconTheme: iconTheme,
        );
      },
    },
  );
}
