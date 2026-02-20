import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/double.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';

// Helper function for ValueChanged<double> callback handling
ValueChanged<double>? _handleDoubleValueCallback(
  InterpreterVisitor visitor,
  dynamic callback,
) {
  if (callback == null) return null;
  if (callback is InterpretedFunction) {
    return (double value) => callback.call(visitor, [value]);
  }
  return callback as ValueChanged<double>?;
}

/// Returns the BridgedClass for the Flutter Slider widget.
BridgedClass getSliderBridgingDefinition() {
  return BridgedClass(
    nativeType: Slider,
    name: 'Slider',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final value = toDouble(namedArgs.get<dynamic>('value')!);
        final onChanged = _handleDoubleValueCallback(
          visitor,
          namedArgs['onChanged'],
        );
        final onChangeStart = _handleDoubleValueCallback(
          visitor,
          namedArgs['onChangeStart'],
        );
        final onChangeEnd = _handleDoubleValueCallback(
          visitor,
          namedArgs['onChangeEnd'],
        );
        final min = namedArgs.getToDouble('min') ?? 0.0;
        final max = namedArgs.getToDouble('max') ?? 1.0;
        final divisions = namedArgs.get<int?>('divisions');
        final label = namedArgs.get<String?>('label');
        final activeColor = namedArgs.get<Color?>('activeColor');
        final inactiveColor = namedArgs.get<Color?>('inactiveColor');
        final thumbColor = namedArgs.get<Color?>('thumbColor');
        final overlayColor = namedArgs.get<WidgetStateProperty<Color?>?>(
          'overlayColor',
        );
        final mouseCursor = namedArgs.get<MouseCursor?>('mouseCursor');
        final focusNode = namedArgs.get<FocusNode?>('focusNode');
        final autofocus = namedArgs.get<bool?>('autofocus') ?? false;

        return Slider(
          key: key,
          value: value,
          onChanged: onChanged,
          onChangeStart: onChangeStart,
          onChangeEnd: onChangeEnd,
          min: min,
          max: max,
          divisions: divisions,
          label: label,
          activeColor: activeColor,
          inactiveColor: inactiveColor,
          thumbColor: thumbColor,
          overlayColor: overlayColor,
          mouseCursor: mouseCursor,
          semanticFormatterCallback:
              namedArgs["semanticFormatterCallback"] == null
              ? null
              : (value) {
                  return (namedArgs["semanticFormatterCallback"]
                              as InterpretedFunction)
                          .call(visitor, [value])
                      as String;
                },
          focusNode: focusNode,
          autofocus: autofocus,
        );
      },
    },
    getters: {
      'value': (visitor, target) => (target as Slider).value,
      'min': (visitor, target) => (target as Slider).min,
      'max': (visitor, target) => (target as Slider).max,
      'divisions': (visitor, target) => (target as Slider).divisions,
      'label': (visitor, target) => (target as Slider).label,
      'activeColor': (visitor, target) => (target as Slider).activeColor,
      'inactiveColor': (visitor, target) => (target as Slider).inactiveColor,
      'autofocus': (visitor, target) => (target as Slider).autofocus,
      'key': (visitor, target) => (target as Slider).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter RangeSlider widget.
BridgedClass getRangeSliderBridgingDefinition() {
  return BridgedClass(
    nativeType: RangeSlider,
    name: 'RangeSlider',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final values = namedArgs.get<RangeValues>('values')!;

        // Handle onChanged callback
        final onChanged = namedArgs.handleValueCallback<RangeValues>(
          'onChanged',
          visitor,
        );

        // Handle onChangeStart callback
        final onChangeStart = namedArgs.handleValueCallback<RangeValues>(
          'onChangeStart',
          visitor,
        );

        // Handle onChangeEnd callback
        final onChangeEnd = namedArgs.handleValueCallback<RangeValues>(
          'onChangeEnd',
          visitor,
        );

        final min = namedArgs.getToDouble('min') ?? 0.0;
        final max = namedArgs.getToDouble('max') ?? 1.0;
        final divisions = namedArgs.get<int?>('divisions');
        final labels = namedArgs.get<RangeLabels?>('labels');
        final activeColor = namedArgs.get<Color?>('activeColor');
        final inactiveColor = namedArgs.get<Color?>('inactiveColor');
        final overlayColor = namedArgs.get<WidgetStateProperty<Color?>?>(
          'overlayColor',
        );
        final mouseCursor = namedArgs.get<WidgetStateProperty<MouseCursor?>?>(
          'mouseCursor',
        );
        final semanticFormatterCallback = namedArgs
            .get<String Function(double)?>('semanticFormatterCallback');

        return RangeSlider(
          key: key,
          values: values,
          onChanged: onChanged,
          onChangeStart: onChangeStart,
          onChangeEnd: onChangeEnd,
          min: min,
          max: max,
          divisions: divisions,
          labels: labels,
          activeColor: activeColor,
          inactiveColor: inactiveColor,
          overlayColor: overlayColor,
          mouseCursor: mouseCursor,
          semanticFormatterCallback: semanticFormatterCallback,
        );
      },
    },
    getters: {
      'values': (visitor, target) => (target as RangeSlider).values,
      'min': (visitor, target) => (target as RangeSlider).min,
      'max': (visitor, target) => (target as RangeSlider).max,
      'divisions': (visitor, target) => (target as RangeSlider).divisions,
      'labels': (visitor, target) => (target as RangeSlider).labels,
      'activeColor': (visitor, target) => (target as RangeSlider).activeColor,
      'inactiveColor': (visitor, target) =>
          (target as RangeSlider).inactiveColor,
      'key': (visitor, target) => (target as RangeSlider).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter RangeValues class.
BridgedClass getRangeValuesBridgingDefinition() {
  return BridgedClass(
    nativeType: RangeValues,
    name: 'RangeValues',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final start = (positionalArgs.get<num>(0) ?? 0.0).toDouble();
        final end = (positionalArgs.get<num>(1) ?? 1.0).toDouble();

        return RangeValues(start, end);
      },
    },
    getters: {
      'start': (visitor, target) => (target as RangeValues).start,
      'end': (visitor, target) => (target as RangeValues).end,
    },
    methods: {
      'toString': (visitor, target, positionalArgs, namedArgs) {
        return (target as RangeValues).toString();
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter RangeLabels class.
BridgedClass getRangeLabelsBridgingDefinition() {
  return BridgedClass(
    nativeType: RangeLabels,
    name: 'RangeLabels',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final start = positionalArgs.get<String?>(0) ?? '';
        final end = positionalArgs.get<String?>(1) ?? '';

        return RangeLabels(start, end);
      },
    },
    getters: {
      'start': (visitor, target) => (target as RangeLabels).start,
      'end': (visitor, target) => (target as RangeLabels).end,
    },
    methods: {
      'toString': (visitor, target, positionalArgs, namedArgs) {
        return (target as RangeLabels).toString();
      },
    },
  );
}
