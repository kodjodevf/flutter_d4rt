import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import '../../utils/extensions/widget.dart';

// Helper functions for callback handling
ValueChanged<dynamic>? _handleDynamicValueCallback(
  InterpreterVisitor visitor,
  dynamic callback,
) {
  if (callback == null) return null;
  if (callback is InterpretedFunction) {
    return (dynamic value) => callback.call(visitor, [value]);
  }
  return callback as ValueChanged<dynamic>?;
}

/// Returns the BridgedClass for the Flutter DropdownButton widget.
BridgedClass getDropdownButtonBridgingDefinition() {
  return BridgedClass(
    nativeType: DropdownButton,
    name: 'DropdownButton',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final items = visitor.toElements(namedArgs['items']) as List?;
        final selectedItemBuilder = namedArgs.get<DropdownButtonBuilder?>(
          'selectedItemBuilder',
        );
        final value = namedArgs['value'];
        final hint = visitor.toWidgets(namedArgs['hint']);
        final disabledHint = visitor.toWidgets(namedArgs['disabledHint']);
        final onChanged = _handleDynamicValueCallback(
          visitor,
          namedArgs['onChanged'],
        );
        final onTap = namedArgs.handleVoidCallback('onTap', visitor);
        final elevation = namedArgs.get<int?>('elevation') ?? 8;
        final style = namedArgs.get<TextStyle?>('style');
        final underline = visitor.toWidgets(namedArgs['underline']);
        final icon = visitor.toWidgets(namedArgs['icon']);
        final iconDisabledColor = namedArgs.get<Color?>('iconDisabledColor');
        final iconEnabledColor = namedArgs.get<Color?>('iconEnabledColor');
        final iconSize = namedArgs.getToDouble('iconSize') ?? 24.0;
        final isDense = namedArgs.get<bool?>('isDense') ?? false;
        final isExpanded = namedArgs.get<bool?>('isExpanded') ?? false;
        final itemHeight =
            namedArgs.getToDouble('itemHeight') ?? kMinInteractiveDimension;
        final focusColor = namedArgs.get<Color?>('focusColor');
        final focusNode = namedArgs.get<FocusNode?>('focusNode');
        final autofocus = namedArgs.get<bool?>('autofocus') ?? false;
        final dropdownColor = namedArgs.get<Color?>('dropdownColor');
        final menuMaxHeight = namedArgs.getToDouble('menuMaxHeight');
        final enableFeedback = namedArgs.get<bool?>('enableFeedback');
        final alignment =
            namedArgs.get<AlignmentGeometry?>('alignment') ??
            AlignmentDirectional.centerStart;
        final borderRadius = namedArgs.get<BorderRadius?>('borderRadius');

        return DropdownButton<dynamic>(
          key: key,
          items: items?.cast(),
          selectedItemBuilder: selectedItemBuilder,
          value: value,
          hint: hint,
          disabledHint: disabledHint,
          onChanged: onChanged,
          onTap: onTap,
          elevation: elevation,
          style: style,
          underline: underline,
          icon: icon,
          iconDisabledColor: iconDisabledColor,
          iconEnabledColor: iconEnabledColor,
          iconSize: iconSize,
          isDense: isDense,
          isExpanded: isExpanded,
          itemHeight: itemHeight,
          focusColor: focusColor,
          focusNode: focusNode,
          autofocus: autofocus,
          dropdownColor: dropdownColor,
          menuMaxHeight: menuMaxHeight,
          enableFeedback: enableFeedback,
          alignment: alignment,
          borderRadius: borderRadius,
        );
      },
    },
    getters: {
      'items': (visitor, target) => (target as DropdownButton).items,
      'value': (visitor, target) => (target as DropdownButton).value,
      'hint': (visitor, target) => (target as DropdownButton).hint,
      'onChanged': (visitor, target) => (target as DropdownButton).onChanged,
      'elevation': (visitor, target) => (target as DropdownButton).elevation,
      'style': (visitor, target) => (target as DropdownButton).style,
      'icon': (visitor, target) => (target as DropdownButton).icon,
      'iconSize': (visitor, target) => (target as DropdownButton).iconSize,
      'isDense': (visitor, target) => (target as DropdownButton).isDense,
      'isExpanded': (visitor, target) => (target as DropdownButton).isExpanded,
      'dropdownColor': (visitor, target) =>
          (target as DropdownButton).dropdownColor,
    },
  );
}

/// Returns the BridgedClass for the Flutter DropdownMenuItem widget.
BridgedClass getDropdownMenuItemBridgingDefinition() {
  return BridgedClass(
    nativeType: DropdownMenuItem,
    name: 'DropdownMenuItem',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final value = namedArgs['value'];
        final onTap = namedArgs.handleVoidCallback('onTap', visitor);
        final enabled = namedArgs.get<bool?>('enabled') ?? true;
        final alignment =
            namedArgs.get<AlignmentGeometry?>('alignment') ??
            AlignmentDirectional.centerStart;
        final child = visitor.toWidgets(namedArgs['child']);

        return DropdownMenuItem<dynamic>(
          key: key,
          value: value,
          onTap: onTap,
          enabled: enabled,
          alignment: alignment,
          child: child!,
        );
      },
    },
    getters: {
      'value': (visitor, target) => (target as DropdownMenuItem).value,
      'onTap': (visitor, target) => (target as DropdownMenuItem).onTap,
      'enabled': (visitor, target) => (target as DropdownMenuItem).enabled,
      'alignment': (visitor, target) => (target as DropdownMenuItem).alignment,
      'child': (visitor, target) => (target as DropdownMenuItem).child,
    },
  );
}
