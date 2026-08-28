// ignore_for_file: deprecated_member_use

import 'package:d4rt/d4rt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for Flutter CupertinoSwitch.
BridgedClass getCupertinoSwitchBridgingDefinition() {
  return BridgedClass(
    nativeType: CupertinoSwitch,
    name: 'CupertinoSwitch',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final value = namedArgs.get<bool?>('value') ?? false;
        final activeColor = namedArgs.get<Color?>('activeColor');
        final trackColor = namedArgs.get<Color?>('trackColor');
        final thumbColor = namedArgs.get<Color?>('thumbColor');
        final applyTheme = namedArgs.get<bool?>('applyTheme');
        final onChanged = namedArgs.handleValueCallback<bool>('onChanged', visitor);

        return CupertinoSwitch(
          key: key,
          value: value,
          onChanged: onChanged,
          activeColor: activeColor,
          trackColor: trackColor,
          thumbColor: thumbColor,
          applyTheme: applyTheme,
        );
      },
    },
    getters: {
      'value': (visitor, target) => (target as CupertinoSwitch).value,
      'activeColor': (visitor, target) => (target as CupertinoSwitch).activeColor,
      'trackColor': (visitor, target) => (target as CupertinoSwitch).trackColor,
      'thumbColor': (visitor, target) => (target as CupertinoSwitch).thumbColor,
    },
  );
}

/// Returns the BridgedClass for Flutter CupertinoSlider.
BridgedClass getCupertinoSliderBridgingDefinition() {
  return BridgedClass(
    nativeType: CupertinoSlider,
    name: 'CupertinoSlider',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final value = (namedArgs['value'] as num?)?.toDouble() ?? 0.0;
        final min = (namedArgs['min'] as num?)?.toDouble() ?? 0.0;
        final max = (namedArgs['max'] as num?)?.toDouble() ?? 1.0;
        final divisions = namedArgs.get<int?>('divisions');
        final activeColor = namedArgs.get<Color?>('activeColor');
        final thumbColor = namedArgs.get<Color?>('thumbColor') ?? CupertinoColors.white;
        final onChanged = namedArgs.handleValueCallback<double>('onChanged', visitor);
        final onChangeStart = namedArgs.handleValueCallback<double>('onChangeStart', visitor);
        final onChangeEnd = namedArgs.handleValueCallback<double>('onChangeEnd', visitor);

        return CupertinoSlider(
          key: key,
          value: value,
          min: min,
          max: max,
          divisions: divisions,
          activeColor: activeColor,
          thumbColor: thumbColor,
          onChanged: onChanged,
          onChangeStart: onChangeStart,
          onChangeEnd: onChangeEnd,
        );
      },
    },
    getters: {
      'value': (visitor, target) => (target as CupertinoSlider).value,
      'min': (visitor, target) => (target as CupertinoSlider).min,
      'max': (visitor, target) => (target as CupertinoSlider).max,
      'divisions': (visitor, target) => (target as CupertinoSlider).divisions,
      'activeColor': (visitor, target) => (target as CupertinoSlider).activeColor,
      'thumbColor': (visitor, target) => (target as CupertinoSlider).thumbColor,
    },
  );
}

/// Returns the BridgedClass for Flutter CupertinoTextField.
BridgedClass getCupertinoTextFieldBridgingDefinition() {
  return BridgedClass(
    nativeType: CupertinoTextField,
    name: 'CupertinoTextField',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final controller = namedArgs.get<TextEditingController?>('controller');
        final focusNode = namedArgs.get<FocusNode?>('focusNode');
        final placeholder = namedArgs.get<String?>('placeholder');
        final placeholderStyle = namedArgs.get<TextStyle?>('placeholderStyle') ??
            const TextStyle(
              fontWeight: FontWeight.w400,
              color: CupertinoColors.placeholderText,
            );
        final prefix = visitor.toWidget(namedArgs['prefix']);
        final suffix = visitor.toWidget(namedArgs['suffix']);
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding') ??
            const EdgeInsets.all(7.0);
        final clearButtonMode = namedArgs.get<OverlayVisibilityMode?>('clearButtonMode') ??
            OverlayVisibilityMode.never;
        final keyboardType = namedArgs.get<TextInputType?>('keyboardType');
        final textInputAction = namedArgs.get<TextInputAction?>('textInputAction');
        final textCapitalization = namedArgs.get<TextCapitalization?>('textCapitalization') ??
            TextCapitalization.none;
        final style = namedArgs.get<TextStyle?>('style');
        final textAlign = namedArgs.get<TextAlign?>('textAlign') ?? TextAlign.start;
        final autofocus = namedArgs.get<bool?>('autofocus') ?? false;
        final obscureText = namedArgs.get<bool?>('obscureText') ?? false;
        final autocorrect = namedArgs.get<bool?>('autocorrect') ?? true;
        final maxLines = namedArgs.get<int?>('maxLines') ?? 1;
        final minLines = namedArgs.get<int?>('minLines');
        final maxLength = namedArgs.get<int?>('maxLength');
        final onChanged = namedArgs.handleValueCallback<String>('onChanged', visitor);
        final onSubmitted = namedArgs.handleValueCallback<String>('onSubmitted', visitor);
        final inputFormattersRaw = namedArgs['inputFormatters'];
        List<TextInputFormatter>? inputFormatters;
        if (inputFormattersRaw is List) {
          inputFormatters = inputFormattersRaw
              .map((f) => f is BridgedInstance ? f.nativeObject : f)
              .whereType<TextInputFormatter>()
              .toList();
        }
        final enabled = namedArgs.get<bool?>('enabled');
        final cursorWidth = (namedArgs['cursorWidth'] as num?)?.toDouble() ?? 2.0;
        final cursorHeight = (namedArgs['cursorHeight'] as num?)?.toDouble();
        final cursorColor = namedArgs.get<Color?>('cursorColor');

        return CupertinoTextField(
          key: key,
          controller: controller,
          focusNode: focusNode,
          placeholder: placeholder,
          placeholderStyle: placeholderStyle,
          prefix: prefix,
          suffix: suffix,
          padding: padding,
          clearButtonMode: clearButtonMode,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          textCapitalization: textCapitalization,
          style: style,
          textAlign: textAlign,
          autofocus: autofocus,
          obscureText: obscureText,
          autocorrect: autocorrect,
          maxLines: maxLines,
          minLines: minLines,
          maxLength: maxLength,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          inputFormatters: inputFormatters,
          enabled: enabled ?? true,
          cursorWidth: cursorWidth,
          cursorHeight: cursorHeight,
          cursorColor: cursorColor,
        );
      },
    },
    getters: {
      'controller': (visitor, target) => (target as CupertinoTextField).controller,
      'placeholder': (visitor, target) => (target as CupertinoTextField).placeholder,
      'maxLines': (visitor, target) => (target as CupertinoTextField).maxLines,
      'obscureText': (visitor, target) => (target as CupertinoTextField).obscureText,
      'enabled': (visitor, target) => (target as CupertinoTextField).enabled,
    },
  );
}

/// Returns the BridgedEnumDefinition for OverlayVisibilityMode enum.
BridgedEnumDefinition<OverlayVisibilityMode>
    getOverlayVisibilityModeBridgingDefinition() {
  return BridgedEnumDefinition<OverlayVisibilityMode>(
    name: 'OverlayVisibilityMode',
    values: OverlayVisibilityMode.values,
  );
}
