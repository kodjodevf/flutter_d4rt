import 'package:d4rt/d4rt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for Flutter CupertinoSearchTextField.
BridgedClass getCupertinoSearchTextFieldBridgingDefinition() {
  return BridgedClass(
    nativeType: CupertinoSearchTextField,
    name: 'CupertinoSearchTextField',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final controller =
            namedArgs.get<TextEditingController?>('controller');
        final onChanged =
            namedArgs.handleValueCallback<String>('onChanged', visitor);
        final onSubmitted =
            namedArgs.handleValueCallback<String>('onSubmitted', visitor);
        final style = namedArgs.get<TextStyle?>('style');
        final placeholder = namedArgs.get<String?>('placeholder');
        final placeholderStyle =
            namedArgs.get<TextStyle?>('placeholderStyle');
        final decoration = namedArgs.get<BoxDecoration?>('decoration');
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final borderRadius = namedArgs.get<BorderRadius?>('borderRadius');
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding') ??
            const EdgeInsetsDirectional.fromSTEB(5.5, 8, 5.5, 8);
        final itemColor = namedArgs.get<Color?>('itemColor') ??
            CupertinoColors.secondaryLabel;
        final itemSize = (namedArgs['itemSize'] as num?)?.toDouble() ?? 20.0;
        final prefixInsets =
            namedArgs.get<EdgeInsetsGeometry?>('prefixInsets') ??
                const EdgeInsetsDirectional.fromSTEB(6, 0, 0, 3);
        final prefixIcon = visitor.toWidget(namedArgs['prefixIcon']) ??
            const Icon(CupertinoIcons.search);
        final rawSuffixIcon = namedArgs['suffixIcon'];
        final suffixObj = rawSuffixIcon is BridgedInstance
            ? rawSuffixIcon.nativeObject
            : rawSuffixIcon;
        final suffixIcon = suffixObj is Icon
            ? suffixObj
            : const Icon(CupertinoIcons.xmark_circle_fill);
        final suffixInsets =
            namedArgs.get<EdgeInsetsGeometry?>('suffixInsets') ??
                const EdgeInsetsDirectional.fromSTEB(0, 0, 5, 2);
        final suffixMode = namedArgs.get<OverlayVisibilityMode?>('suffixMode') ??
            OverlayVisibilityMode.editing;
        final onSuffixTap =
            namedArgs.handleVoidCallback('onSuffixTap', visitor);
        final autofocus = namedArgs.get<bool?>('autofocus') ?? false;
        final autocorrect = namedArgs.get<bool?>('autocorrect') ?? true;
        final enabled = namedArgs.get<bool?>('enabled');

        return CupertinoSearchTextField(
          key: key,
          controller: controller,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          style: style,
          placeholder: placeholder,
          placeholderStyle: placeholderStyle,
          decoration: decoration,
          backgroundColor: backgroundColor,
          borderRadius: borderRadius,
          padding: padding,
          itemColor: itemColor,
          itemSize: itemSize,
          prefixInsets: prefixInsets,
          prefixIcon: prefixIcon,
          suffixInsets: suffixInsets,
          suffixIcon: suffixIcon,
          suffixMode: suffixMode,
          onSuffixTap: onSuffixTap,
          autofocus: autofocus,
          autocorrect: autocorrect,
          enabled: enabled,
        );
      },
    },
    getters: {
      'placeholder': (visitor, target) =>
          (target as CupertinoSearchTextField).placeholder,
      'style': (visitor, target) =>
          (target as CupertinoSearchTextField).style,
      'placeholderStyle': (visitor, target) =>
          (target as CupertinoSearchTextField).placeholderStyle,
      'backgroundColor': (visitor, target) =>
          (target as CupertinoSearchTextField).backgroundColor,
      'borderRadius': (visitor, target) =>
          (target as CupertinoSearchTextField).borderRadius,
      'padding': (visitor, target) =>
          (target as CupertinoSearchTextField).padding,
      'itemColor': (visitor, target) =>
          (target as CupertinoSearchTextField).itemColor,
      'itemSize': (visitor, target) =>
          (target as CupertinoSearchTextField).itemSize,
      'autofocus': (visitor, target) =>
          (target as CupertinoSearchTextField).autofocus,
      'autocorrect': (visitor, target) =>
          (target as CupertinoSearchTextField).autocorrect,
      'enabled': (visitor, target) =>
          (target as CupertinoSearchTextField).enabled,
    },
  );
}
