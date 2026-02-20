import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for the Flutter FilledButton widget.
BridgedClass getFilledButtonBridgingDefinition() {
  return BridgedClass(
    nativeType: FilledButton,
    name: 'FilledButton',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final onPressed = namedArgs.handleVoidCallback('onPressed', visitor);
        final onLongPress = namedArgs.handleVoidCallback(
          'onLongPress',
          visitor,
        );
        final style = namedArgs.get<ButtonStyle?>('style');
        final focusNode = namedArgs.get<FocusNode?>('focusNode');
        final autofocus = namedArgs.get<bool?>('autofocus') ?? false;
        final clipBehavior = namedArgs.get<Clip?>('clipBehavior') ?? Clip.none;
        final statesController = namedArgs.get<MaterialStatesController?>(
          'statesController',
        );
        final child = visitor.toWidgets(namedArgs['child']);

        return FilledButton(
          key: key,
          onPressed: onPressed,
          onLongPress: onLongPress,
          style: style,
          focusNode: focusNode,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          statesController: statesController,
          child: child,
        );
      },
      'icon': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final onPressed = namedArgs.handleVoidCallback('onPressed', visitor);
        final onLongPress = namedArgs.handleVoidCallback(
          'onLongPress',
          visitor,
        );
        final style = namedArgs.get<ButtonStyle?>('style');
        final focusNode = namedArgs.get<FocusNode?>('focusNode');
        final autofocus = namedArgs.get<bool?>('autofocus') ?? false;
        final clipBehavior = namedArgs.get<Clip?>('clipBehavior') ?? Clip.none;
        final statesController = namedArgs.get<MaterialStatesController?>(
          'statesController',
        );
        final icon = visitor.toWidgets(namedArgs['icon']);
        final label = visitor.toWidgets(namedArgs['label']);

        return FilledButton.icon(
          key: key,
          onPressed: onPressed,
          onLongPress: onLongPress,
          style: style,
          focusNode: focusNode,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          statesController: statesController,
          icon: icon,
          label: label,
        );
      },
      'tonal': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final onPressed = namedArgs.handleVoidCallback('onPressed', visitor);
        final onLongPress = namedArgs.handleVoidCallback(
          'onLongPress',
          visitor,
        );
        final style = namedArgs.get<ButtonStyle?>('style');
        final focusNode = namedArgs.get<FocusNode?>('focusNode');
        final autofocus = namedArgs.get<bool?>('autofocus') ?? false;
        final clipBehavior = namedArgs.get<Clip?>('clipBehavior') ?? Clip.none;
        final statesController = namedArgs.get<MaterialStatesController?>(
          'statesController',
        );
        final child = visitor.toWidgets(namedArgs['child']);

        return FilledButton.tonal(
          key: key,
          onPressed: onPressed,
          onLongPress: onLongPress,
          style: style,
          focusNode: focusNode,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          statesController: statesController,
          child: child,
        );
      },
      'tonalIcon': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final onPressed = namedArgs.handleVoidCallback('onPressed', visitor);
        final onLongPress = namedArgs.handleVoidCallback(
          'onLongPress',
          visitor,
        );
        final style = namedArgs.get<ButtonStyle?>('style');
        final focusNode = namedArgs.get<FocusNode?>('focusNode');
        final autofocus = namedArgs.get<bool?>('autofocus') ?? false;
        final clipBehavior = namedArgs.get<Clip?>('clipBehavior') ?? Clip.none;
        final statesController = namedArgs.get<MaterialStatesController?>(
          'statesController',
        );
        final icon = visitor.toWidgets(namedArgs['icon']);
        final label = visitor.toWidgets(namedArgs['label']);

        return FilledButton.tonalIcon(
          key: key,
          onPressed: onPressed,
          onLongPress: onLongPress,
          style: style,
          focusNode: focusNode,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          statesController: statesController,
          icon: icon,
          label: label,
        );
      },
    },
    getters: {
      'style': (visitor, target) => (target as FilledButton).style,
      'focusNode': (visitor, target) => (target as FilledButton).focusNode,
      'autofocus': (visitor, target) => (target as FilledButton).autofocus,
      'clipBehavior': (visitor, target) =>
          (target as FilledButton).clipBehavior,
      'statesController': (visitor, target) =>
          (target as FilledButton).statesController,
      'child': (visitor, target) => (target as FilledButton).child,
      'key': (visitor, target) => (target as FilledButton).key,
    },
  );
}
