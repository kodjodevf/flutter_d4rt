// ignore_for_file: deprecated_member_use

import 'package:d4rt/d4rt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for Flutter CupertinoButton.
BridgedClass getCupertinoButtonBridgingDefinition() {
  return BridgedClass(
    nativeType: CupertinoButton,
    name: 'CupertinoButton',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final child = visitor.toWidget(namedArgs['child']) ?? const SizedBox();
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding');
        final color = namedArgs.get<Color?>('color');
        final disabledColor = namedArgs.get<Color?>('disabledColor') ??
            CupertinoColors.quaternarySystemFill;
        final minSize = (namedArgs['minSize'] as num?)?.toDouble() ??
            kMinInteractiveDimensionCupertino;
        final pressedOpacity =
            (namedArgs['pressedOpacity'] as num?)?.toDouble() ?? 0.4;
        final borderRadius = namedArgs.get<BorderRadius?>('borderRadius') ??
            const BorderRadius.all(Radius.circular(8.0));
        final alignment = namedArgs.get<AlignmentGeometry?>('alignment') ??
            Alignment.center;
        final sizeStyle = namedArgs.get<CupertinoButtonSize?>('sizeStyle') ??
            CupertinoButtonSize.medium;
        final onPressed = namedArgs.handleVoidCallback('onPressed', visitor);

        return CupertinoButton(
          key: key,
          padding: padding,
          color: color,
          disabledColor: disabledColor,
          minSize: minSize,
          pressedOpacity: pressedOpacity,
          borderRadius: borderRadius,
          alignment: alignment,
          sizeStyle: sizeStyle,
          onPressed: onPressed,
          child: child,
        );
      },
      'filled': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final child = visitor.toWidget(namedArgs['child']) ?? const SizedBox();
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding');
        final disabledColor = namedArgs.get<Color?>('disabledColor') ??
            CupertinoColors.quaternarySystemFill;
        final minSize = (namedArgs['minSize'] as num?)?.toDouble() ??
            kMinInteractiveDimensionCupertino;
        final pressedOpacity =
            (namedArgs['pressedOpacity'] as num?)?.toDouble() ?? 0.4;
        final borderRadius = namedArgs.get<BorderRadius?>('borderRadius') ??
            const BorderRadius.all(Radius.circular(8.0));
        final alignment = namedArgs.get<AlignmentGeometry?>('alignment') ??
            Alignment.center;
        final sizeStyle = namedArgs.get<CupertinoButtonSize?>('sizeStyle') ??
            CupertinoButtonSize.medium;
        final onPressed = namedArgs.handleVoidCallback('onPressed', visitor);

        return CupertinoButton.filled(
          key: key,
          padding: padding,
          disabledColor: disabledColor,
          minSize: minSize,
          pressedOpacity: pressedOpacity,
          borderRadius: borderRadius,
          alignment: alignment,
          sizeStyle: sizeStyle,
          onPressed: onPressed,
          child: child,
        );
      },
    },
    getters: {
      'child': (visitor, target) => (target as CupertinoButton).child,
      'padding': (visitor, target) => (target as CupertinoButton).padding,
      'color': (visitor, target) => (target as CupertinoButton).color,
      'disabledColor': (visitor, target) =>
          (target as CupertinoButton).disabledColor,
      'minSize': (visitor, target) => (target as CupertinoButton).minSize,
      'pressedOpacity': (visitor, target) =>
          (target as CupertinoButton).pressedOpacity,
      'borderRadius': (visitor, target) =>
          (target as CupertinoButton).borderRadius,
      'alignment': (visitor, target) => (target as CupertinoButton).alignment,
      'enabled': (visitor, target) => (target as CupertinoButton).enabled,
    },
  );
}

/// Returns the BridgedEnumDefinition for Flutter CupertinoButtonSize enum.
BridgedEnumDefinition<CupertinoButtonSize>
    getCupertinoButtonSizeBridgingDefinition() {
  return BridgedEnumDefinition<CupertinoButtonSize>(
    name: 'CupertinoButtonSize',
    values: CupertinoButtonSize.values,
  );
}
