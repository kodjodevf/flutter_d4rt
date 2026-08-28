// ignore_for_file: deprecated_member_use

import 'package:d4rt/d4rt.dart';
import 'package:flutter/cupertino.dart';

/// Returns the BridgedClass for Flutter CupertinoCheckbox.
BridgedClass getCupertinoCheckboxBridgingDefinition() {
  return BridgedClass(
    nativeType: CupertinoCheckbox,
    name: 'CupertinoCheckbox',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final value = namedArgs.get<bool?>('value');
        final tristate = namedArgs.get<bool?>('tristate') ?? false;
        final rawOnChanged = namedArgs['onChanged'];
        ValueChanged<bool?>? onChanged;
        if (rawOnChanged is InterpretedFunction) {
          onChanged = (bool? val) {
            rawOnChanged.call(visitor, [val], {});
          };
        }
        final activeColor = namedArgs.get<Color?>('activeColor');
        final inactiveColor = namedArgs.get<Color?>('inactiveColor');
        final checkColor = namedArgs.get<Color?>('checkColor');
        final focusColor = namedArgs.get<Color?>('focusColor');
        final focusNode = namedArgs.get<FocusNode?>('focusNode');
        final autofocus = namedArgs.get<bool?>('autofocus') ?? false;
        final side = namedArgs.get<BorderSide?>('side');
        final shape = namedArgs.get<OutlinedBorder?>('shape');

        return CupertinoCheckbox(
          key: key,
          value: value,
          tristate: tristate,
          onChanged: onChanged,
          activeColor: activeColor,
          inactiveColor: inactiveColor,
          checkColor: checkColor,
          focusColor: focusColor,
          focusNode: focusNode,
          autofocus: autofocus,
          side: side,
          shape: shape,
        );
      },
    },
    getters: {
      'value': (visitor, target) => (target as CupertinoCheckbox).value,
      'tristate': (visitor, target) => (target as CupertinoCheckbox).tristate,
      'activeColor': (visitor, target) =>
          (target as CupertinoCheckbox).activeColor,
      'inactiveColor': (visitor, target) =>
          (target as CupertinoCheckbox).inactiveColor,
      'checkColor': (visitor, target) =>
          (target as CupertinoCheckbox).checkColor,
      'focusColor': (visitor, target) =>
          (target as CupertinoCheckbox).focusColor,
      'autofocus': (visitor, target) =>
          (target as CupertinoCheckbox).autofocus,
      'side': (visitor, target) => (target as CupertinoCheckbox).side,
      'shape': (visitor, target) => (target as CupertinoCheckbox).shape,
    },
  );
}

/// Returns the BridgedClass for Flutter CupertinoRadio.
BridgedClass getCupertinoRadioBridgingDefinition() {
  return BridgedClass(
    nativeType: CupertinoRadio,
    name: 'CupertinoRadio',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final value = namedArgs['value'];
        final groupValue = namedArgs['groupValue'];
        final rawOnChanged = namedArgs['onChanged'];
        ValueChanged<dynamic>? onChanged;
        if (rawOnChanged is InterpretedFunction) {
          onChanged = (dynamic val) {
            rawOnChanged.call(visitor, [val], {});
          };
        }
        final activeColor = namedArgs.get<Color?>('activeColor');
        final inactiveColor = namedArgs.get<Color?>('inactiveColor');
        final fillColor = namedArgs.get<Color?>('fillColor');
        final focusColor = namedArgs.get<Color?>('focusColor');
        final focusNode = namedArgs.get<FocusNode?>('focusNode');
        final autofocus = namedArgs.get<bool?>('autofocus') ?? false;
        final useCheckmarkStyle =
            namedArgs.get<bool?>('useCheckmarkStyle') ?? false;

        return CupertinoRadio<dynamic>(
          key: key,
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: activeColor,
          inactiveColor: inactiveColor,
          fillColor: fillColor,
          focusColor: focusColor,
          focusNode: focusNode,
          autofocus: autofocus,
          useCheckmarkStyle: useCheckmarkStyle,
        );
      },
    },
    getters: {
      'value': (visitor, target) => (target as CupertinoRadio).value,
      'groupValue': (visitor, target) => (target as CupertinoRadio).groupValue,
      'activeColor': (visitor, target) =>
          (target as CupertinoRadio).activeColor,
      'inactiveColor': (visitor, target) =>
          (target as CupertinoRadio).inactiveColor,
      'fillColor': (visitor, target) => (target as CupertinoRadio).fillColor,
      'focusColor': (visitor, target) => (target as CupertinoRadio).focusColor,
      'autofocus': (visitor, target) => (target as CupertinoRadio).autofocus,
      'useCheckmarkStyle': (visitor, target) =>
          (target as CupertinoRadio).useCheckmarkStyle,
    },
  );
}
