import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import '../../utils/extensions/widget.dart';

/// Returns the BridgedClass for the Flutter IconButton widget.
BridgedClass getIconButtonBridgingDefinition() {
  return BridgedClass(
    nativeType: IconButton,
    name: 'IconButton',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final onPressed = namedArgs.get<InterpretedFunction?>('onPressed');
        final key = namedArgs.get<Key?>('key');
        final icon = visitor.toWidgets(namedArgs['icon']);
        final iconSize = namedArgs.getToDouble('iconSize');
        final visualDensity = namedArgs.get<VisualDensity?>('visualDensity');
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding');
        final alignment = namedArgs.get<AlignmentGeometry?>('alignment');
        final splashRadius = namedArgs.getToDouble('splashRadius');
        final color = namedArgs.get<Color?>('color');
        final focusColor = namedArgs.get<Color?>('focusColor');
        final hoverColor = namedArgs.get<Color?>('hoverColor');
        final highlightColor = namedArgs.get<Color?>('highlightColor');
        final splashColor = namedArgs.get<Color?>('splashColor');
        final disabledColor = namedArgs.get<Color?>('disabledColor');
        final mouseCursor = namedArgs.get<MouseCursor?>('mouseCursor');
        final focusNode = namedArgs.get<FocusNode?>('focusNode');
        final autofocus = namedArgs.get<bool?>('autofocus') ?? false;
        final tooltip = namedArgs.get<String?>('tooltip');
        final enableFeedback = namedArgs.get<bool?>('enableFeedback');
        final constraints = namedArgs.get<BoxConstraints?>('constraints');
        final style = namedArgs.get<ButtonStyle?>('style');
        final isSelected = namedArgs.get<bool?>('isSelected');
        final selectedIcon = visitor.toWidgets(namedArgs['selectedIcon']);

        return IconButton(
          key: key,
          iconSize: iconSize,
          visualDensity: visualDensity,
          padding: padding,
          alignment: alignment ?? Alignment.center,
          splashRadius: splashRadius,
          color: color,
          focusColor: focusColor,
          hoverColor: hoverColor,
          highlightColor: highlightColor,
          splashColor: splashColor,
          disabledColor: disabledColor,
          onPressed: onPressed != null
              ? () {
                  onPressed.call(visitor, [], {});
                }
              : null,
          mouseCursor: mouseCursor,
          focusNode: focusNode,
          autofocus: autofocus,
          tooltip: tooltip,
          enableFeedback: enableFeedback,
          constraints: constraints,
          style: style,
          isSelected: isSelected,
          selectedIcon: selectedIcon,
          icon: icon!,
        );
      },
    },
    staticMethods: {
      'styleFrom': (visitor, positionalArgs, namedArgs) {
        final foregroundColor = namedArgs.get<Color?>('foregroundColor');
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final disabledForegroundColor = namedArgs.get<Color?>(
          'disabledForegroundColor',
        );
        final disabledBackgroundColor = namedArgs.get<Color?>(
          'disabledBackgroundColor',
        );
        final focusColor = namedArgs.get<Color?>('focusColor');
        final hoverColor = namedArgs.get<Color?>('hoverColor');
        final highlightColor = namedArgs.get<Color?>('highlightColor');
        final shadowColor = namedArgs.get<Color?>('shadowColor');
        final surfaceTintColor = namedArgs.get<Color?>('surfaceTintColor');
        final elevation = namedArgs.getToDouble('elevation');
        final minimumSize = namedArgs.get<Size?>('minimumSize');
        final fixedSize = namedArgs.get<Size?>('fixedSize');
        final maximumSize = namedArgs.get<Size?>('maximumSize');
        final iconSize = namedArgs.getToDouble('iconSize');
        final side = namedArgs.get<BorderSide?>('side');
        final shape = namedArgs.get<OutlinedBorder?>('shape');
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding');
        final visualDensity = namedArgs.get<VisualDensity?>('visualDensity');
        final tapTargetSize = namedArgs.get<MaterialTapTargetSize?>(
          'tapTargetSize',
        );
        final animationDuration = namedArgs.get<Duration?>('animationDuration');
        final enableFeedback = namedArgs.get<bool?>('enableFeedback');
        final alignment = namedArgs.get<AlignmentGeometry?>('alignment');
        final splashFactory = namedArgs.get<InteractiveInkFeatureFactory?>(
          'splashFactory',
        );

        return IconButton.styleFrom(
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
          disabledForegroundColor: disabledForegroundColor,
          disabledBackgroundColor: disabledBackgroundColor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          highlightColor: highlightColor,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          elevation: elevation,
          minimumSize: minimumSize,
          fixedSize: fixedSize,
          maximumSize: maximumSize,
          iconSize: iconSize,
          side: side,
          shape: shape,
          padding: padding,
          visualDensity: visualDensity,
          tapTargetSize: tapTargetSize,
          animationDuration: animationDuration,
          enableFeedback: enableFeedback,
          alignment: alignment,
          splashFactory: splashFactory,
        );
      },
    },
    getters: {
      'icon': (visitor, target) => (target as IconButton).icon,
      'iconSize': (visitor, target) => (target as IconButton).iconSize,
      'visualDensity': (visitor, target) =>
          (target as IconButton).visualDensity,
      'padding': (visitor, target) => (target as IconButton).padding,
      'alignment': (visitor, target) => (target as IconButton).alignment,
      'splashRadius': (visitor, target) => (target as IconButton).splashRadius,
      'color': (visitor, target) => (target as IconButton).color,
      'focusColor': (visitor, target) => (target as IconButton).focusColor,
      'hoverColor': (visitor, target) => (target as IconButton).hoverColor,
      'highlightColor': (visitor, target) =>
          (target as IconButton).highlightColor,
      'splashColor': (visitor, target) => (target as IconButton).splashColor,
      'disabledColor': (visitor, target) =>
          (target as IconButton).disabledColor,
      'mouseCursor': (visitor, target) => (target as IconButton).mouseCursor,
      'focusNode': (visitor, target) => (target as IconButton).focusNode,
      'autofocus': (visitor, target) => (target as IconButton).autofocus,
      'tooltip': (visitor, target) => (target as IconButton).tooltip,
      'enableFeedback': (visitor, target) =>
          (target as IconButton).enableFeedback,
      'constraints': (visitor, target) => (target as IconButton).constraints,
      'style': (visitor, target) => (target as IconButton).style,
      'isSelected': (visitor, target) => (target as IconButton).isSelected,
      'selectedIcon': (visitor, target) => (target as IconButton).selectedIcon,
      'key': (visitor, target) => (target as IconButton).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter IconButton.filled widget.
BridgedClass getIconButtonFilledBridgingDefinition() {
  return BridgedClass(
    nativeType: IconButton,
    name: 'IconButton.filled',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final icon = visitor.toWidgets(namedArgs['icon']);
        final onPressed = namedArgs.get<InterpretedFunction?>('onPressed');
        final iconSize = namedArgs.getToDouble('iconSize');
        final visualDensity = namedArgs.get<VisualDensity?>('visualDensity');
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding');
        final alignment = namedArgs.get<AlignmentGeometry?>('alignment');
        final splashRadius = namedArgs.getToDouble('splashRadius');
        final color = namedArgs.get<Color?>('color');
        final focusColor = namedArgs.get<Color?>('focusColor');
        final hoverColor = namedArgs.get<Color?>('hoverColor');
        final highlightColor = namedArgs.get<Color?>('highlightColor');
        final splashColor = namedArgs.get<Color?>('splashColor');
        final disabledColor = namedArgs.get<Color?>('disabledColor');
        final mouseCursor = namedArgs.get<MouseCursor?>('mouseCursor');
        final focusNode = namedArgs.get<FocusNode?>('focusNode');
        final autofocus = namedArgs.get<bool?>('autofocus') ?? false;
        final tooltip = namedArgs.get<String?>('tooltip');
        final enableFeedback = namedArgs.get<bool?>('enableFeedback');
        final constraints = namedArgs.get<BoxConstraints?>('constraints');
        final style = namedArgs.get<ButtonStyle?>('style');
        final isSelected = namedArgs.get<bool?>('isSelected');
        final selectedIcon = visitor.toWidgets(namedArgs['selectedIcon']);

        return IconButton.filled(
          key: key,
          iconSize: iconSize,
          visualDensity: visualDensity,
          padding: padding,
          alignment: alignment ?? Alignment.center,
          splashRadius: splashRadius,
          color: color,
          focusColor: focusColor,
          hoverColor: hoverColor,
          highlightColor: highlightColor,
          splashColor: splashColor,
          disabledColor: disabledColor,
          onPressed: onPressed != null
              ? () {
                  onPressed.call(visitor, [], {});
                }
              : null,
          mouseCursor: mouseCursor,
          focusNode: focusNode,
          autofocus: autofocus,
          tooltip: tooltip,
          enableFeedback: enableFeedback,
          constraints: constraints,
          style: style,
          isSelected: isSelected,
          selectedIcon: selectedIcon,
          icon: icon!,
        );
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter IconButton.filledTonal widget.
BridgedClass getIconButtonFilledTonalBridgingDefinition() {
  return BridgedClass(
    nativeType: IconButton,
    name: 'IconButton.filledTonal',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final onPressed = namedArgs.get<InterpretedFunction?>('onPressed');
        final key = namedArgs.get<Key?>('key');
        final icon = visitor.toWidgets(namedArgs['icon']);
        final iconSize = namedArgs.getToDouble('iconSize');
        final visualDensity = namedArgs.get<VisualDensity?>('visualDensity');
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding');
        final alignment = namedArgs.get<AlignmentGeometry?>('alignment');
        final splashRadius = namedArgs.getToDouble('splashRadius');
        final color = namedArgs.get<Color?>('color');
        final focusColor = namedArgs.get<Color?>('focusColor');
        final hoverColor = namedArgs.get<Color?>('hoverColor');
        final highlightColor = namedArgs.get<Color?>('highlightColor');
        final splashColor = namedArgs.get<Color?>('splashColor');
        final disabledColor = namedArgs.get<Color?>('disabledColor');
        final mouseCursor = namedArgs.get<MouseCursor?>('mouseCursor');
        final focusNode = namedArgs.get<FocusNode?>('focusNode');
        final autofocus = namedArgs.get<bool?>('autofocus') ?? false;
        final tooltip = namedArgs.get<String?>('tooltip');
        final enableFeedback = namedArgs.get<bool?>('enableFeedback');
        final constraints = namedArgs.get<BoxConstraints?>('constraints');
        final style = namedArgs.get<ButtonStyle?>('style');
        final isSelected = namedArgs.get<bool?>('isSelected');
        final selectedIcon = visitor.toWidgets(namedArgs['selectedIcon']);
        return IconButton.filledTonal(
          key: key,
          iconSize: iconSize,
          visualDensity: visualDensity,
          padding: padding,
          alignment: alignment ?? Alignment.center,
          splashRadius: splashRadius,
          color: color,
          focusColor: focusColor,
          hoverColor: hoverColor,
          highlightColor: highlightColor,
          splashColor: splashColor,
          disabledColor: disabledColor,
          onPressed: onPressed != null
              ? () {
                  onPressed.call(visitor, [], {});
                }
              : null,
          mouseCursor: mouseCursor,
          focusNode: focusNode,
          autofocus: autofocus,
          tooltip: tooltip,
          enableFeedback: enableFeedback,
          constraints: constraints,
          style: style,
          isSelected: isSelected,
          selectedIcon: selectedIcon,
          icon: icon!,
        );
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter IconButton.outlined widget.
BridgedClass getIconButtonOutlinedBridgingDefinition() {
  return BridgedClass(
    nativeType: IconButton,
    name: 'IconButton.outlined',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final icon = visitor.toWidgets(namedArgs['icon']);
        final onPressed = namedArgs.get<InterpretedFunction?>('onPressed');
        final iconSize = namedArgs.getToDouble('iconSize');
        final visualDensity = namedArgs.get<VisualDensity?>('visualDensity');
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding');
        final alignment = namedArgs.get<AlignmentGeometry?>('alignment');
        final splashRadius = namedArgs.getToDouble('splashRadius');
        final color = namedArgs.get<Color?>('color');
        final focusColor = namedArgs.get<Color?>('focusColor');
        final hoverColor = namedArgs.get<Color?>('hoverColor');
        final highlightColor = namedArgs.get<Color?>('highlightColor');
        final splashColor = namedArgs.get<Color?>('splashColor');
        final disabledColor = namedArgs.get<Color?>('disabledColor');
        final mouseCursor = namedArgs.get<MouseCursor?>('mouseCursor');
        final focusNode = namedArgs.get<FocusNode?>('focusNode');
        final autofocus = namedArgs.get<bool?>('autofocus') ?? false;
        final tooltip = namedArgs.get<String?>('tooltip');
        final enableFeedback = namedArgs.get<bool?>('enableFeedback');
        final constraints = namedArgs.get<BoxConstraints?>('constraints');
        final style = namedArgs.get<ButtonStyle?>('style');
        final isSelected = namedArgs.get<bool?>('isSelected');
        final selectedIcon = visitor.toWidgets(namedArgs['selectedIcon']);

        return IconButton.outlined(
          key: key,
          iconSize: iconSize,
          visualDensity: visualDensity,
          padding: padding,
          alignment: alignment ?? Alignment.center,
          splashRadius: splashRadius,
          color: color,
          focusColor: focusColor,
          hoverColor: hoverColor,
          highlightColor: highlightColor,
          splashColor: splashColor,
          disabledColor: disabledColor,
          onPressed: onPressed != null
              ? () {
                  onPressed.call(visitor, [], {});
                }
              : null,
          mouseCursor: mouseCursor,
          focusNode: focusNode,
          autofocus: autofocus,
          tooltip: tooltip,
          enableFeedback: enableFeedback,
          constraints: constraints,
          style: style,
          isSelected: isSelected,
          selectedIcon: selectedIcon,
          icon: icon!,
        );
      },
    },
  );
}
