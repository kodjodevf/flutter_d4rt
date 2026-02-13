import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for the Flutter SegmentedButton widget.
BridgedClass getSegmentedButtonBridgingDefinition() {
  return BridgedClass(
    nativeType: SegmentedButton,
    name: 'SegmentedButton',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final segments = namedArgs.get<List<ButtonSegment>>('segments') ?? [];
        final selected = namedArgs.get<Set>('selected') ?? {};

        // Handle onSelectionChanged callback
        final onSelectionChanged = namedArgs['onSelectionChanged'];
        void Function(Set<dynamic>)? onSelectionChangedCallback;
        if (onSelectionChanged != null) {
          if (onSelectionChanged is InterpretedFunction) {
            onSelectionChangedCallback = (Set<dynamic> value) {
              onSelectionChanged.call(visitor, [value]);
            };
          } else if (onSelectionChanged is Function) {
            onSelectionChangedCallback =
                onSelectionChanged as void Function(Set<dynamic>)?;
          }
        }

        final multiSelectionEnabled =
            namedArgs.get<bool?>('multiSelectionEnabled') ?? false;
        final emptySelectionAllowed =
            namedArgs.get<bool?>('emptySelectionAllowed') ?? false;
        final style = namedArgs.get<ButtonStyle?>('style');
        final showSelectedIcon =
            namedArgs.get<bool?>('showSelectedIcon') ?? true;
        final selectedIcon = visitor.toWidgets(namedArgs['selectedIcon']);

        return SegmentedButton(
          key: key,
          segments: segments,
          selected: selected,
          onSelectionChanged: onSelectionChangedCallback,
          multiSelectionEnabled: multiSelectionEnabled,
          emptySelectionAllowed: emptySelectionAllowed,
          style: style,
          showSelectedIcon: showSelectedIcon,
          selectedIcon: selectedIcon,
        );
      },
    },
    getters: {
      'segments': (visitor, target) => (target as SegmentedButton).segments,
      'selected': (visitor, target) => (target as SegmentedButton).selected,
      'multiSelectionEnabled': (visitor, target) =>
          (target as SegmentedButton).multiSelectionEnabled,
      'emptySelectionAllowed': (visitor, target) =>
          (target as SegmentedButton).emptySelectionAllowed,
      'style': (visitor, target) => (target as SegmentedButton).style,
      'showSelectedIcon': (visitor, target) =>
          (target as SegmentedButton).showSelectedIcon,
      'selectedIcon': (visitor, target) =>
          (target as SegmentedButton).selectedIcon,
      'key': (visitor, target) => (target as SegmentedButton).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter ButtonSegment class.
BridgedClass getButtonSegmentBridgingDefinition() {
  return BridgedClass(
    nativeType: ButtonSegment,
    name: 'ButtonSegment',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final value = namedArgs.get('value');
        final icon = visitor.toWidgets(namedArgs['icon']);
        final label = visitor.toWidgets(namedArgs['label']);
        final tooltip = namedArgs.get<String?>('tooltip');
        final enabled = namedArgs.get<bool?>('enabled') ?? true;

        return ButtonSegment(
          value: value,
          icon: icon,
          label: label,
          tooltip: tooltip,
          enabled: enabled,
        );
      },
    },
    getters: {
      'value': (visitor, target) => (target as ButtonSegment).value,
      'icon': (visitor, target) => (target as ButtonSegment).icon,
      'label': (visitor, target) => (target as ButtonSegment).label,
      'tooltip': (visitor, target) => (target as ButtonSegment).tooltip,
      'enabled': (visitor, target) => (target as ButtonSegment).enabled,
    },
  );
}
