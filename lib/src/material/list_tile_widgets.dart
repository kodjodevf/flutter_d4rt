import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/double.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for the Flutter CheckboxListTile widget.
BridgedClass getCheckboxListTileBridgingDefinition() {
  return BridgedClass(
    nativeType: CheckboxListTile,
    name: 'CheckboxListTile',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final value = namedArgs.get<bool?>('value');
        final onChanged = namedArgs.handleValueCallback<bool?>(
          'onChanged',
          visitor,
        );
        final activeColor = namedArgs.get<Color?>('activeColor');
        final fillColor = namedArgs.get<WidgetStateProperty<Color?>?>(
          'fillColor',
        );
        final checkColor = namedArgs.get<Color?>('checkColor');
        final tileColor = namedArgs.get<Color?>('tileColor');
        final title = namedArgs['title'] != null
            ? visitor.toWidgets(namedArgs['title'])
            : null;
        final subtitle = namedArgs['subtitle'] != null
            ? visitor.toWidgets(namedArgs['subtitle'])
            : null;
        final secondary = namedArgs['secondary'] != null
            ? visitor.toWidgets(namedArgs['secondary'])
            : null;
        final isThreeLine = namedArgs.get<bool?>('isThreeLine') ?? false;
        final dense = namedArgs.get<bool?>('dense');
        final selected = namedArgs.get<bool?>('selected') ?? false;
        final controlAffinity =
            namedArgs.get<ListTileControlAffinity?>('controlAffinity') ??
            ListTileControlAffinity.platform;
        final autofocus = namedArgs.get<bool?>('autofocus') ?? false;
        final contentPadding = namedArgs.get<EdgeInsetsGeometry?>(
          'contentPadding',
        );
        final tristate = namedArgs.get<bool?>('tristate') ?? false;
        final shape = namedArgs.get<ShapeBorder?>('shape');
        final selectedTileColor = namedArgs.get<Color?>('selectedTileColor');
        final visualDensity = namedArgs.get<VisualDensity?>('visualDensity');
        final focusNode = namedArgs.get<FocusNode?>('focusNode');
        final enableFeedback = namedArgs.get<bool?>('enableFeedback');

        return CheckboxListTile(
          key: key,
          value: value,
          onChanged: onChanged,
          activeColor: activeColor,
          fillColor: fillColor,
          checkColor: checkColor,
          tileColor: tileColor,
          title: title,
          subtitle: subtitle,
          secondary: secondary,
          isThreeLine: isThreeLine,
          dense: dense,
          selected: selected,
          controlAffinity: controlAffinity,
          autofocus: autofocus,
          contentPadding: contentPadding,
          tristate: tristate,
          shape: shape,
          selectedTileColor: selectedTileColor,
          visualDensity: visualDensity,
          focusNode: focusNode,
          enableFeedback: enableFeedback,
        );
      },
    },
    getters: {
      'value': (visitor, target) => (target as CheckboxListTile).value,
      'title': (visitor, target) => (target as CheckboxListTile).title,
      'subtitle': (visitor, target) => (target as CheckboxListTile).subtitle,
      'secondary': (visitor, target) => (target as CheckboxListTile).secondary,
      'isThreeLine': (visitor, target) =>
          (target as CheckboxListTile).isThreeLine,
      'dense': (visitor, target) => (target as CheckboxListTile).dense,
      'selected': (visitor, target) => (target as CheckboxListTile).selected,
      'controlAffinity': (visitor, target) =>
          (target as CheckboxListTile).controlAffinity,
      'autofocus': (visitor, target) => (target as CheckboxListTile).autofocus,
      'key': (visitor, target) => (target as CheckboxListTile).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter RadioListTile widget.
BridgedClass getRadioListTileBridgingDefinition() {
  return BridgedClass(
    nativeType: RadioListTile,
    name: 'RadioListTile',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final value = namedArgs['value']; // Generic type T
        final groupValue = namedArgs['groupValue']; // Generic type T
        final onChanged = namedArgs.handleValueCallback('onChanged', visitor);
        final toggleable = namedArgs.get<bool?>('toggleable') ?? false;
        final activeColor = namedArgs.get<Color?>('activeColor');
        final fillColor = namedArgs.get<WidgetStateProperty<Color?>?>(
          'fillColor',
        );
        final title = namedArgs['title'] != null
            ? visitor.toWidgets(namedArgs['title'])
            : null;
        final subtitle = namedArgs['subtitle'] != null
            ? visitor.toWidgets(namedArgs['subtitle'])
            : null;
        final secondary = namedArgs['secondary'] != null
            ? visitor.toWidgets(namedArgs['secondary'])
            : null;
        final isThreeLine = namedArgs.get<bool?>('isThreeLine') ?? false;
        final dense = namedArgs.get<bool?>('dense');
        final selected = namedArgs.get<bool?>('selected') ?? false;
        final controlAffinity =
            namedArgs.get<ListTileControlAffinity?>('controlAffinity') ??
            ListTileControlAffinity.platform;
        final autofocus = namedArgs.get<bool?>('autofocus') ?? false;
        final contentPadding = namedArgs.get<EdgeInsetsGeometry?>(
          'contentPadding',
        );
        final shape = namedArgs.get<ShapeBorder?>('shape');
        final tileColor = namedArgs.get<Color?>('tileColor');
        final selectedTileColor = namedArgs.get<Color?>('selectedTileColor');
        final visualDensity = namedArgs.get<VisualDensity?>('visualDensity');
        final focusNode = namedArgs.get<FocusNode?>('focusNode');
        final enableFeedback = namedArgs.get<bool?>('enableFeedback');

        return RadioListTile(
          key: key,
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          toggleable: toggleable,
          activeColor: activeColor,
          fillColor: fillColor,
          title: title,
          subtitle: subtitle,
          secondary: secondary,
          isThreeLine: isThreeLine,
          dense: dense,
          selected: selected,
          controlAffinity: controlAffinity,
          autofocus: autofocus,
          contentPadding: contentPadding,
          shape: shape,
          tileColor: tileColor,
          selectedTileColor: selectedTileColor,
          visualDensity: visualDensity,
          focusNode: focusNode,
          enableFeedback: enableFeedback,
        );
      },
    },
    getters: {
      'value': (visitor, target) => (target as RadioListTile).value,
      'groupValue': (visitor, target) => (target as RadioListTile).groupValue,
      'title': (visitor, target) => (target as RadioListTile).title,
      'subtitle': (visitor, target) => (target as RadioListTile).subtitle,
      'secondary': (visitor, target) => (target as RadioListTile).secondary,
      'isThreeLine': (visitor, target) => (target as RadioListTile).isThreeLine,
      'dense': (visitor, target) => (target as RadioListTile).dense,
      'selected': (visitor, target) => (target as RadioListTile).selected,
      'controlAffinity': (visitor, target) =>
          (target as RadioListTile).controlAffinity,
      'autofocus': (visitor, target) => (target as RadioListTile).autofocus,
      'key': (visitor, target) => (target as RadioListTile).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter SwitchListTile widget.
BridgedClass getSwitchListTileBridgingDefinition() {
  return BridgedClass(
    nativeType: SwitchListTile,
    name: 'SwitchListTile',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final value = namedArgs.get<bool?>('value') ?? false;
        final onChanged = namedArgs.handleValueCallback<bool?>(
          'onChanged',
          visitor,
        );
        final activeColor = namedArgs.get<Color?>('activeColor');
        final activeTrackColor = namedArgs.get<Color?>('activeTrackColor');
        final inactiveThumbColor = namedArgs.get<Color?>('inactiveThumbColor');
        final inactiveTrackColor = namedArgs.get<Color?>('inactiveTrackColor');
        final thumbColor = namedArgs.get<WidgetStateProperty<Color?>?>(
          'thumbColor',
        );
        final trackColor = namedArgs.get<WidgetStateProperty<Color?>?>(
          'trackColor',
        );
        final materialTapTargetSize = namedArgs.get<MaterialTapTargetSize?>(
          'materialTapTargetSize',
        );
        final mouseCursor = namedArgs.get<MouseCursor?>('mouseCursor');
        final overlayColor = namedArgs.get<WidgetStateProperty<Color?>?>(
          'overlayColor',
        );
        final splashRadius = toDouble(namedArgs.get<dynamic>('splashRadius'));
        final title = namedArgs['title'] != null
            ? visitor.toWidgets(namedArgs['title'])
            : null;
        final subtitle = namedArgs['subtitle'] != null
            ? visitor.toWidgets(namedArgs['subtitle'])
            : null;
        final secondary = namedArgs['secondary'] != null
            ? visitor.toWidgets(namedArgs['secondary'])
            : null;
        final isThreeLine = namedArgs.get<bool?>('isThreeLine') ?? false;
        final dense = namedArgs.get<bool?>('dense');
        final contentPadding = namedArgs.get<EdgeInsetsGeometry?>(
          'contentPadding',
        );
        final selected = namedArgs.get<bool?>('selected') ?? false;
        final autofocus = namedArgs.get<bool?>('autofocus') ?? false;
        final controlAffinity =
            namedArgs.get<ListTileControlAffinity?>('controlAffinity') ??
            ListTileControlAffinity.platform;
        final shape = namedArgs.get<ShapeBorder?>('shape');
        final tileColor = namedArgs.get<Color?>('tileColor');
        final selectedTileColor = namedArgs.get<Color?>('selectedTileColor');
        final visualDensity = namedArgs.get<VisualDensity?>('visualDensity');
        final focusNode = namedArgs.get<FocusNode?>('focusNode');
        final enableFeedback = namedArgs.get<bool?>('enableFeedback');

        return SwitchListTile(
          key: key,
          value: value,
          onChanged: onChanged,
          activeColor: activeColor,
          activeTrackColor: activeTrackColor,
          inactiveThumbColor: inactiveThumbColor,
          inactiveTrackColor: inactiveTrackColor,
          thumbColor: thumbColor,
          trackColor: trackColor,
          materialTapTargetSize: materialTapTargetSize,
          mouseCursor: mouseCursor,
          overlayColor: overlayColor,
          splashRadius: splashRadius,
          title: title,
          subtitle: subtitle,
          secondary: secondary,
          isThreeLine: isThreeLine,
          dense: dense,
          contentPadding: contentPadding,
          selected: selected,
          autofocus: autofocus,
          controlAffinity: controlAffinity,
          shape: shape,
          tileColor: tileColor,
          selectedTileColor: selectedTileColor,
          visualDensity: visualDensity,
          focusNode: focusNode,
          enableFeedback: enableFeedback,
        );
      },
    },
    getters: {
      'value': (visitor, target) => (target as SwitchListTile).value,
      'title': (visitor, target) => (target as SwitchListTile).title,
      'subtitle': (visitor, target) => (target as SwitchListTile).subtitle,
      'secondary': (visitor, target) => (target as SwitchListTile).secondary,
      'isThreeLine': (visitor, target) =>
          (target as SwitchListTile).isThreeLine,
      'dense': (visitor, target) => (target as SwitchListTile).dense,
      'selected': (visitor, target) => (target as SwitchListTile).selected,
      'controlAffinity': (visitor, target) =>
          (target as SwitchListTile).controlAffinity,
      'autofocus': (visitor, target) => (target as SwitchListTile).autofocus,
      'key': (visitor, target) => (target as SwitchListTile).key,
    },
  );
}

/// Returns the BridgedEnumDefinition for the Flutter ListTileControlAffinity enum.
BridgedEnumDefinition getListTileControlAffinityBridgingDefinition() {
  return BridgedEnumDefinition<ListTileControlAffinity>(
    name: 'ListTileControlAffinity',
    values: ListTileControlAffinity.values,
    getters: {
      'name': (visitor, target) => (target as ListTileControlAffinity).name,
      'index': (visitor, target) => (target as ListTileControlAffinity).index,
    },
  );
}
