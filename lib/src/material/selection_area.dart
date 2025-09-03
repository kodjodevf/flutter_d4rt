import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for the Flutter SelectionArea widget.
BridgedClass getSelectionAreaBridgingDefinition() {
  return BridgedClass(
    nativeType: SelectionArea,
    name: 'SelectionArea',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final child = visitor.toWidgets(namedArgs['child']);
        final focusNode = namedArgs.get<FocusNode?>('focusNode');
        final selectionControls = namedArgs.get<TextSelectionControls?>('selectionControls');
        final contextMenuBuilder = namedArgs.get<SelectableRegionContextMenuBuilder?>('contextMenuBuilder');
        final magnifierConfiguration = namedArgs.get<TextMagnifierConfiguration?>('magnifierConfiguration');
        final onSelectionChanged = namedArgs.get<ValueChanged<SelectedContent?>?>('onSelectionChanged');
        return SelectionArea(
          key: key,
          child: child,
          focusNode: focusNode,
          selectionControls: selectionControls,
          contextMenuBuilder: contextMenuBuilder,
          magnifierConfiguration: magnifierConfiguration,
          onSelectionChanged: onSelectionChanged,
        );
      },
    },
    getters: {
      'child': (visitor, target) => (target as SelectionArea).child,
      'focusNode': (visitor, target) => (target as SelectionArea).focusNode,
      'selectionControls': (visitor, target) => (target as SelectionArea).selectionControls,
      'contextMenuBuilder': (visitor, target) => (target as SelectionArea).contextMenuBuilder,
      'magnifierConfiguration': (visitor, target) => (target as SelectionArea).magnifierConfiguration,
      'onSelectionChanged': (visitor, target) => (target as SelectionArea).onSelectionChanged,
      'key': (visitor, target) => (target as SelectionArea).key,
    },
  );
}
