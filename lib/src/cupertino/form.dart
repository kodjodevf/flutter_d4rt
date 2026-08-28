import 'package:d4rt/d4rt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for Flutter CupertinoFormSection.
BridgedClass getCupertinoFormSectionBridgingDefinition() {
  return BridgedClass(
    nativeType: CupertinoFormSection,
    name: 'CupertinoFormSection',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final children = visitor.toWidgetList(namedArgs['children']);
        final header = visitor.toWidget(namedArgs['header']);
        final footer = visitor.toWidget(namedArgs['footer']);
        final margin = namedArgs.get<EdgeInsetsGeometry?>('margin') ??
            EdgeInsets.zero;
        final backgroundColor = namedArgs.get<Color?>('backgroundColor') ??
            CupertinoColors.systemGroupedBackground;
        final decoration = namedArgs.get<BoxDecoration?>('decoration');
        final clipBehavior =
            namedArgs.get<Clip?>('clipBehavior') ?? Clip.none;

        return CupertinoFormSection(
          key: key,
          header: header,
          footer: footer,
          margin: margin,
          backgroundColor: backgroundColor,
          decoration: decoration,
          clipBehavior: clipBehavior,
          children: children,
        );
      },
      'insetGrouped': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final children = visitor.toWidgetList(namedArgs['children']);
        final header = visitor.toWidget(namedArgs['header']);
        final footer = visitor.toWidget(namedArgs['footer']);
        final margin = namedArgs.get<EdgeInsetsGeometry?>('margin') ??
            const EdgeInsets.symmetric(horizontal: 20.0);
        final backgroundColor = namedArgs.get<Color?>('backgroundColor') ??
            CupertinoColors.systemGroupedBackground;
        final decoration = namedArgs.get<BoxDecoration?>('decoration');
        final clipBehavior =
            namedArgs.get<Clip?>('clipBehavior') ?? Clip.none;

        return CupertinoFormSection.insetGrouped(
          key: key,
          header: header,
          footer: footer,
          margin: margin,
          backgroundColor: backgroundColor,
          decoration: decoration,
          clipBehavior: clipBehavior,
          children: children,
        );
      },
    },
    getters: {
      'header': (visitor, target) => (target as CupertinoFormSection).header,
      'footer': (visitor, target) => (target as CupertinoFormSection).footer,
      'margin': (visitor, target) => (target as CupertinoFormSection).margin,
      'backgroundColor': (visitor, target) =>
          (target as CupertinoFormSection).backgroundColor,
      'clipBehavior': (visitor, target) =>
          (target as CupertinoFormSection).clipBehavior,
    },
  );
}

/// Returns the BridgedClass for Flutter CupertinoFormRow.
BridgedClass getCupertinoFormRowBridgingDefinition() {
  return BridgedClass(
    nativeType: CupertinoFormRow,
    name: 'CupertinoFormRow',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final child = visitor.toWidget(namedArgs['child']) ?? const SizedBox();
        final prefix = visitor.toWidget(namedArgs['prefix']);
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding');
        final helper = visitor.toWidget(namedArgs['helper']);
        final error = visitor.toWidget(namedArgs['error']);

        return CupertinoFormRow(
          key: key,
          prefix: prefix,
          padding: padding,
          helper: helper,
          error: error,
          child: child,
        );
      },
    },
    getters: {
      'child': (visitor, target) => (target as CupertinoFormRow).child,
      'prefix': (visitor, target) => (target as CupertinoFormRow).prefix,
      'padding': (visitor, target) => (target as CupertinoFormRow).padding,
      'helper': (visitor, target) => (target as CupertinoFormRow).helper,
      'error': (visitor, target) => (target as CupertinoFormRow).error,
    },
  );
}

/// Returns the BridgedClass for Flutter CupertinoTextFormFieldRow.
BridgedClass getCupertinoTextFormFieldRowBridgingDefinition() {
  return BridgedClass(
    nativeType: CupertinoTextFormFieldRow,
    name: 'CupertinoTextFormFieldRow',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final controller =
            namedArgs.get<TextEditingController?>('controller');
        final initialValue = namedArgs.get<String?>('initialValue');
        final prefix = visitor.toWidget(namedArgs['prefix']);
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding');
        final placeholder = namedArgs.get<String?>('placeholder');
        final placeholderStyle =
            namedArgs.get<TextStyle?>('placeholderStyle');
        final style = namedArgs.get<TextStyle?>('style');
        final obscureText = namedArgs.get<bool?>('obscureText') ?? false;
        final autocorrect = namedArgs.get<bool?>('autocorrect') ?? true;
        final maxLines = namedArgs.get<int?>('maxLines') ?? 1;
        final minLines = namedArgs.get<int?>('minLines');
        final maxLength = namedArgs.get<int?>('maxLength');
        final onChanged =
            namedArgs.handleValueCallback<String>('onChanged', visitor);
        final onEditingComplete =
            namedArgs.handleVoidCallback('onEditingComplete', visitor);
        final onFieldSubmitted =
            namedArgs.handleValueCallback<String>('onFieldSubmitted', visitor);
        final rawValidator = namedArgs['validator'];
        FormFieldValidator<String>? validator;
        if (rawValidator is InterpretedFunction) {
          validator = (String? val) {
            final res = rawValidator.call(visitor, [val], {});
            return res as String?;
          };
        }
        final rawOnSaved = namedArgs['onSaved'];
        FormFieldSetter<String>? onSaved;
        if (rawOnSaved is InterpretedFunction) {
          onSaved = (String? val) {
            rawOnSaved.call(visitor, [val], {});
          };
        }
        final enabled = namedArgs.get<bool?>('enabled');
        final rawFormatters = visitor.toElements(namedArgs['inputFormatters']);
        final List<TextInputFormatter>? inputFormatters = rawFormatters is List
            ? rawFormatters.whereType<TextInputFormatter>().toList()
            : null;

        return CupertinoTextFormFieldRow(
          key: key,
          controller: controller,
          initialValue: initialValue,
          prefix: prefix,
          padding: padding,
          placeholder: placeholder,
          placeholderStyle: placeholderStyle,
          style: style,
          obscureText: obscureText,
          autocorrect: autocorrect,
          maxLines: maxLines,
          minLines: minLines,
          maxLength: maxLength,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
          onFieldSubmitted: onFieldSubmitted,
          onSaved: onSaved,
          validator: validator,
          inputFormatters: inputFormatters,
          enabled: enabled,
        );
      },
    },
  );
}
