// ignore_for_file: deprecated_member_use

import 'package:d4rt/d4rt.dart';
import 'package:flutter/services.dart';

/// Returns the BridgedClass for TextInputType
BridgedClass getTextInputTypeBridgingDefinition() {
  return BridgedClass(
    nativeType: TextInputType,
    name: 'TextInputType',
    constructors: {
      'numberWithOptions': (visitor, positionalArgs, namedArgs) {
        final signed = namedArgs.get<bool?>('signed') ?? false;
        final decimal = namedArgs.get<bool?>('decimal') ?? false;
        return TextInputType.numberWithOptions(
          signed: signed,
          decimal: decimal,
        );
      },
    },
    staticGetters: {
      'text': (visitor) => TextInputType.text,
      'multiline': (visitor) => TextInputType.multiline,
      'number': (visitor) => TextInputType.number,
      'phone': (visitor) => TextInputType.phone,
      'datetime': (visitor) => TextInputType.datetime,
      'emailAddress': (visitor) => TextInputType.emailAddress,
      'url': (visitor) => TextInputType.url,
      'visiblePassword': (visitor) => TextInputType.visiblePassword,
      'name': (visitor) => TextInputType.name,
      'streetAddress': (visitor) => TextInputType.streetAddress,
      'none': (visitor) => TextInputType.none,
    },
    getters: {
      'signed': (visitor, target) => (target as TextInputType).signed,
      'decimal': (visitor, target) => (target as TextInputType).decimal,
    },
    isSubtypeOfFunc: (value) => value is TextInputType,
  );
}

/// Returns the BridgedEnumDefinition for TextInputAction
BridgedEnumDefinition<TextInputAction> getTextInputActionBridgingDefinition() {
  return BridgedEnumDefinition<TextInputAction>(
    name: 'TextInputAction',
    values: TextInputAction.values,
  );
}

/// Returns the BridgedEnumDefinition for TextCapitalization
BridgedEnumDefinition<TextCapitalization>
getTextCapitalizationBridgingDefinition() {
  return BridgedEnumDefinition<TextCapitalization>(
    name: 'TextCapitalization',
    values: TextCapitalization.values,
  );
}

/// Returns the BridgedEnumDefinition for SmartDashesType
BridgedEnumDefinition<SmartDashesType> getSmartDashesTypeBridgingDefinition() {
  return BridgedEnumDefinition<SmartDashesType>(
    name: 'SmartDashesType',
    values: SmartDashesType.values,
  );
}

/// Returns the BridgedEnumDefinition for SmartQuotesType
BridgedEnumDefinition<SmartQuotesType> getSmartQuotesTypeBridgingDefinition() {
  return BridgedEnumDefinition<SmartQuotesType>(
    name: 'SmartQuotesType',
    values: SmartQuotesType.values,
  );
}

/// Returns the BridgedClass for TextEditingValue
BridgedClass getTextEditingValueBridgingDefinition() {
  return BridgedClass(
    nativeType: TextEditingValue,
    name: 'TextEditingValue',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final text = namedArgs.get<String?>('text') ?? '';
        final selection =
            namedArgs.get<TextSelection?>('selection') ??
            const TextSelection.collapsed(offset: -1);
        final composing =
            namedArgs.get<TextRange?>('composing') ?? TextRange.empty;
        return TextEditingValue(
          text: text,
          selection: selection,
          composing: composing,
        );
      },
      'fromValue': (visitor, positionalArgs, namedArgs) {
        final source = positionalArgs[0] as TextEditingValue;
        return TextEditingValue(
          text: source.text,
          selection: source.selection,
          composing: source.composing,
        );
      },
    },
    staticGetters: {
      'empty': (visitor) => TextEditingValue.empty,
    },
    getters: {
      'text': (visitor, target) => (target as TextEditingValue).text,
      'selection': (visitor, target) => (target as TextEditingValue).selection,
      'composing': (visitor, target) => (target as TextEditingValue).composing,
      'isComposingRangeValid': (visitor, target) =>
          (target as TextEditingValue).isComposingRangeValid,
    },
    methods: {
      'copyWith': (visitor, target, positionalArgs, namedArgs) {
        final text = namedArgs.get<String?>('text');
        final selection = namedArgs.get<TextSelection?>('selection');
        final composing = namedArgs.get<TextRange?>('composing');
        return (target as TextEditingValue).copyWith(
          text: text,
          selection: selection,
          composing: composing,
        );
      },
    },
    isSubtypeOfFunc: (value) => value is TextEditingValue,
  );
}

/// Returns the BridgedClass for TextSelection
BridgedClass getTextSelectionBridgingDefinition() {
  return BridgedClass(
    nativeType: TextSelection,
    name: 'TextSelection',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final baseOffset = namedArgs.get<int?>('baseOffset') ?? 0;
        final extentOffset = namedArgs.get<int?>('extentOffset') ?? 0;
        final affinity =
            namedArgs.get<TextAffinity?>('affinity') ?? TextAffinity.downstream;
        final isDirectional = namedArgs.get<bool?>('isDirectional') ?? false;
        return TextSelection(
          baseOffset: baseOffset,
          extentOffset: extentOffset,
          affinity: affinity,
          isDirectional: isDirectional,
        );
      },
      'collapsed': (visitor, positionalArgs, namedArgs) {
        final offset = namedArgs.get<int?>('offset') ?? positionalArgs[0] as int;
        final affinity =
            namedArgs.get<TextAffinity?>('affinity') ?? TextAffinity.downstream;
        return TextSelection.collapsed(
          offset: offset,
          affinity: affinity,
        );
      },
      'fromPosition': (visitor, positionalArgs, namedArgs) {
        final position = positionalArgs[0] as TextPosition;
        return TextSelection.fromPosition(position);
      },
    },
    getters: {
      'baseOffset': (visitor, target) => (target as TextSelection).baseOffset,
      'extentOffset': (visitor, target) =>
          (target as TextSelection).extentOffset,
      'affinity': (visitor, target) => (target as TextSelection).affinity,
      'isDirectional': (visitor, target) =>
          (target as TextSelection).isDirectional,
      'isCollapsed': (visitor, target) =>
          (target as TextSelection).isCollapsed,
      'start': (visitor, target) => (target as TextSelection).start,
      'end': (visitor, target) => (target as TextSelection).end,
    },
    methods: {
      'copyWith': (visitor, target, positionalArgs, namedArgs) {
        final baseOffset = namedArgs.get<int?>('baseOffset');
        final extentOffset = namedArgs.get<int?>('extentOffset');
        final affinity = namedArgs.get<TextAffinity?>('affinity');
        final isDirectional = namedArgs.get<bool?>('isDirectional');
        return (target as TextSelection).copyWith(
          baseOffset: baseOffset,
          extentOffset: extentOffset,
          affinity: affinity,
          isDirectional: isDirectional,
        );
      },
    },
    isSubtypeOfFunc: (value) => value is TextSelection,
  );
}

/// Returns the BridgedClass for TextInputFormatter
BridgedClass getTextInputFormatterBridgingDefinition() {
  return BridgedClass(
    nativeType: TextInputFormatter,
    name: 'TextInputFormatter',
    constructors: {},
    methods: {
      'formatEditUpdate': (visitor, target, positionalArgs, namedArgs) {
        final oldValue = positionalArgs[0] as TextEditingValue;
        final newValue = positionalArgs[1] as TextEditingValue;
        return (target as TextInputFormatter).formatEditUpdate(
          oldValue,
          newValue,
        );
      },
    },
    isSubtypeOfFunc: (value) => value is TextInputFormatter,
  );
}

/// Returns the BridgedClass for FilteringTextInputFormatter
BridgedClass getFilteringTextInputFormatterBridgingDefinition() {
  return BridgedClass(
    nativeType: FilteringTextInputFormatter,
    name: 'FilteringTextInputFormatter',
    constructors: {
      'allow': (visitor, positionalArgs, namedArgs) {
        final filterPattern = positionalArgs[0] as Pattern;
        final replacementString =
            namedArgs.get<String?>('replacementString') ?? '';
        return FilteringTextInputFormatter.allow(
          filterPattern,
          replacementString: replacementString,
        );
      },
      'deny': (visitor, positionalArgs, namedArgs) {
        final filterPattern = positionalArgs[0] as Pattern;
        final replacementString =
            namedArgs.get<String?>('replacementString') ?? '';
        return FilteringTextInputFormatter.deny(
          filterPattern,
          replacementString: replacementString,
        );
      },
    },
    staticGetters: {
      'digitsOnly': (visitor) => FilteringTextInputFormatter.digitsOnly,
      'singleLineFormatter': (visitor) =>
          FilteringTextInputFormatter.singleLineFormatter,
    },
    isSubtypeOfFunc: (value) => value is FilteringTextInputFormatter,
  );
}

/// Returns the BridgedClass for LengthLimitingTextInputFormatter
BridgedClass getLengthLimitingTextInputFormatterBridgingDefinition() {
  return BridgedClass(
    nativeType: LengthLimitingTextInputFormatter,
    name: 'LengthLimitingTextInputFormatter',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final maxLength = positionalArgs.isNotEmpty
            ? positionalArgs[0] as int
            : namedArgs.get<int?>('maxLength') ?? -1;
        final maxLengthEnforcement =
            namedArgs.get<MaxLengthEnforcement?>('maxLengthEnforcement');
        return LengthLimitingTextInputFormatter(
          maxLength,
          maxLengthEnforcement: maxLengthEnforcement,
        );
      },
    },
    getters: {
      'maxLength': (visitor, target) =>
          (target as LengthLimitingTextInputFormatter).maxLength,
    },
    isSubtypeOfFunc: (value) => value is LengthLimitingTextInputFormatter,
  );
}
