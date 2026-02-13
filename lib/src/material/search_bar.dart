import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for the Flutter SearchBar widget.
BridgedClass getSearchBarBridgingDefinition() {
  return BridgedClass(
    nativeType: SearchBar,
    name: 'SearchBar',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final controller = namedArgs.get<TextEditingController?>('controller');
        final focusNode = namedArgs.get<FocusNode?>('focusNode');
        final hintText = namedArgs.get<String?>('hintText');
        final hintStyle = namedArgs.get<MaterialStateProperty<TextStyle?>?>(
          'hintStyle',
        );
        final textStyle = namedArgs.get<MaterialStateProperty<TextStyle?>?>(
          'textStyle',
        );
        final leading = visitor.toWidgets(namedArgs['leading']);
        final trailing = namedArgs['trailing'];

        List<Widget>? trailingWidgets;
        if (trailing != null) {
          final interpretedTrailing = visitor.toWidgets(trailing);
          if (interpretedTrailing is List) {
            trailingWidgets = interpretedTrailing.cast<Widget>();
          } else if (interpretedTrailing is Widget) {
            trailingWidgets = [interpretedTrailing];
          }
        }

        // Handle onTap callback
        final onTap = namedArgs['onTap'];
        VoidCallback? onTapCallback;
        if (onTap != null) {
          if (onTap is InterpretedFunction) {
            onTapCallback = () => onTap.call(visitor, []);
          } else if (onTap is Function) {
            onTapCallback = onTap as VoidCallback?;
          }
        }

        // Handle onChanged callback
        final onChanged = namedArgs['onChanged'];
        void Function(String)? onChangedCallback;
        if (onChanged != null) {
          if (onChanged is InterpretedFunction) {
            onChangedCallback = (String value) =>
                onChanged.call(visitor, [value]);
          } else if (onChanged is Function) {
            onChangedCallback = onChanged as void Function(String)?;
          }
        }

        // Handle onSubmitted callback
        final onSubmitted = namedArgs['onSubmitted'];
        void Function(String)? onSubmittedCallback;
        if (onSubmitted != null) {
          if (onSubmitted is InterpretedFunction) {
            onSubmittedCallback = (String value) =>
                onSubmitted.call(visitor, [value]);
          } else if (onSubmitted is Function) {
            onSubmittedCallback = onSubmitted as void Function(String)?;
          }
        }

        final constraints = namedArgs.get<BoxConstraints?>('constraints');
        final elevation = namedArgs.get<MaterialStateProperty<double?>?>(
          'elevation',
        );
        final backgroundColor = namedArgs.get<MaterialStateProperty<Color?>?>(
          'backgroundColor',
        );
        final shadowColor = namedArgs.get<MaterialStateProperty<Color?>?>(
          'shadowColor',
        );
        final surfaceTintColor = namedArgs.get<MaterialStateProperty<Color?>?>(
          'surfaceTintColor',
        );
        final overlayColor = namedArgs.get<MaterialStateProperty<Color?>?>(
          'overlayColor',
        );
        final side = namedArgs.get<MaterialStateProperty<BorderSide?>?>('side');
        final shape = namedArgs.get<MaterialStateProperty<OutlinedBorder?>?>(
          'shape',
        );
        final padding = namedArgs
            .get<MaterialStateProperty<EdgeInsetsGeometry?>?>('padding');
        final textCapitalization =
            namedArgs.get<TextCapitalization?>('textCapitalization') ??
            TextCapitalization.none;
        final enabled = namedArgs.get<bool?>('enabled') ?? true;
        final autoFocus = namedArgs.get<bool?>('autoFocus') ?? false;
        final keyboardType = namedArgs.get<TextInputType?>('keyboardType');

        return SearchBar(
          key: key,
          controller: controller,
          focusNode: focusNode,
          hintText: hintText,
          hintStyle: hintStyle,
          textStyle: textStyle,
          leading: leading,
          trailing: trailingWidgets,
          onTap: onTapCallback,
          onChanged: onChangedCallback,
          onSubmitted: onSubmittedCallback,
          constraints: constraints,
          elevation: elevation,
          backgroundColor: backgroundColor,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          overlayColor: overlayColor,
          side: side,
          shape: shape,
          padding: padding,
          textCapitalization: textCapitalization,
          enabled: enabled,
          autoFocus: autoFocus,
          keyboardType: keyboardType,
        );
      },
    },
    getters: {
      'controller': (visitor, target) => (target as SearchBar).controller,
      'focusNode': (visitor, target) => (target as SearchBar).focusNode,
      'hintText': (visitor, target) => (target as SearchBar).hintText,
      'leading': (visitor, target) => (target as SearchBar).leading,
      'trailing': (visitor, target) => (target as SearchBar).trailing,
      'constraints': (visitor, target) => (target as SearchBar).constraints,
      'textCapitalization': (visitor, target) =>
          (target as SearchBar).textCapitalization,
      'enabled': (visitor, target) => (target as SearchBar).enabled,
      'autoFocus': (visitor, target) => (target as SearchBar).autoFocus,
      'keyboardType': (visitor, target) => (target as SearchBar).keyboardType,
      'key': (visitor, target) => (target as SearchBar).key,
    },
  );
}
