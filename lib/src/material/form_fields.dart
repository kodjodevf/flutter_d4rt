import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

// Helper functions for callback handling
Future<bool> Function()? _handleWillPopCallback(
  InterpreterVisitor visitor,
  dynamic callback,
) {
  if (callback == null) return null;
  if (callback is InterpretedFunction) {
    return () async {
      final result = callback.call(visitor, []);
      if (result is Future<bool>) return result;
      if (result is bool) return result;
      return true;
    };
  }
  return callback as Future<bool> Function()?;
}

String? Function(String?)? _handleValidatorCallback(
  InterpreterVisitor visitor,
  dynamic callback,
) {
  if (callback == null) return null;
  if (callback is InterpretedFunction) {
    return (String? value) {
      final result = callback.call(visitor, [value]);
      return result as String?;
    };
  }
  return callback as String? Function(String?)?;
}

/// Returns the BridgedClass for the Flutter Form widget.
BridgedClass getFormBridgingDefinition() {
  return BridgedClass(
    nativeType: Form,
    name: 'Form',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final autovalidateMode =
            namedArgs.get<AutovalidateMode?>('autovalidateMode') ??
            AutovalidateMode.disabled;
        final onWillPop = _handleWillPopCallback(
          visitor,
          namedArgs['onWillPop'],
        );
        final onChanged = namedArgs.handleVoidCallback('onChanged', visitor);
        final child = visitor.toWidgets(namedArgs['child']);

        return Form(
          key: key,
          autovalidateMode: autovalidateMode,
          onWillPop: onWillPop,
          onChanged: onChanged,
          child: child!,
        );
      },
    },
    getters: {
      'autovalidateMode': (visitor, target) =>
          (target as Form).autovalidateMode,
      'child': (visitor, target) => (target as Form).child,
      'key': (visitor, target) => (target as Form).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter TextFormField widget.
BridgedClass getTextFormFieldBridgingDefinition() {
  return BridgedClass(
    nativeType: TextFormField,
    name: 'TextFormField',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final controller = namedArgs.get<TextEditingController?>('controller');
        final initialValue = namedArgs.get<String?>('initialValue');
        final focusNode = namedArgs.get<FocusNode?>('focusNode');
        final decoration = namedArgs.get<InputDecoration?>('decoration');
        final keyboardType = namedArgs.get<TextInputType?>('keyboardType');
        final textCapitalization =
            namedArgs.get<TextCapitalization?>('textCapitalization') ??
            TextCapitalization.none;
        final textInputAction = namedArgs.get<TextInputAction?>(
          'textInputAction',
        );
        final style = namedArgs.get<TextStyle?>('style');
        final textDirection = namedArgs.get<TextDirection?>('textDirection');
        final textAlign =
            namedArgs.get<TextAlign?>('textAlign') ?? TextAlign.start;
        final autofocus = namedArgs.get<bool?>('autofocus') ?? false;
        final readOnly = namedArgs.get<bool?>('readOnly') ?? false;
        final showCursor = namedArgs.get<bool?>('showCursor');
        final obscureText = namedArgs.get<bool?>('obscureText') ?? false;
        final autocorrect = namedArgs.get<bool?>('autocorrect') ?? true;
        final maxLines = namedArgs.get<int?>('maxLines') ?? 1;
        final minLines = namedArgs.get<int?>('minLines');
        final expands = namedArgs.get<bool?>('expands') ?? false;
        final maxLength = namedArgs.get<int?>('maxLength');
        final onChanged = namedArgs.handleValueCallback<String>(
          'onChanged',
          visitor,
        );
        final onTap = namedArgs.handleVoidCallback('onTap', visitor);
        final onEditingComplete = namedArgs.handleVoidCallback(
          'onEditingComplete',
          visitor,
        );
        final onFieldSubmitted = namedArgs.handleValueCallback<String>(
          'onFieldSubmitted',
          visitor,
        );
        final onSaved = namedArgs.handleValueCallback<String?>(
          'onSaved',
          visitor,
        );
        final validator = _handleValidatorCallback(
          visitor,
          namedArgs['validator'],
        );
        final inputFormatters =
            visitor.toElements(namedArgs['inputFormatters']) as List?;
        final enabled = namedArgs.get<bool?>('enabled');
        final cursorWidth = namedArgs.getToDouble('cursorWidth') ?? 2.0;
        final cursorHeight = namedArgs.getToDouble('cursorHeight');
        final cursorRadius = namedArgs.get<Radius?>('cursorRadius');
        final cursorColor = namedArgs.get<Color?>('cursorColor');
        final keyboardAppearance = namedArgs.get<Brightness?>(
          'keyboardAppearance',
        );
        final scrollPadding =
            namedArgs.get<EdgeInsets?>('scrollPadding') ??
            const EdgeInsets.all(20.0);
        final enableInteractiveSelection =
            namedArgs.get<bool?>('enableInteractiveSelection') ?? true;
        final autovalidateMode = namedArgs.get<AutovalidateMode?>(
          'autovalidateMode',
        );

        return TextFormField(
          key: key,
          controller: controller,
          initialValue: initialValue,
          focusNode: focusNode,
          decoration: decoration,
          keyboardType: keyboardType,
          textCapitalization: textCapitalization,
          textInputAction: textInputAction,
          style: style,
          textDirection: textDirection,
          textAlign: textAlign,
          autofocus: autofocus,
          readOnly: readOnly,
          showCursor: showCursor,
          obscureText: obscureText,
          autocorrect: autocorrect,
          maxLines: maxLines,
          minLines: minLines,
          expands: expands,
          maxLength: maxLength,
          onChanged: onChanged,
          onTap: onTap,
          onEditingComplete: onEditingComplete,
          onFieldSubmitted: onFieldSubmitted,
          onSaved: onSaved,
          validator: validator,
          inputFormatters: inputFormatters?.cast(),
          enabled: enabled,
          cursorWidth: cursorWidth,
          cursorHeight: cursorHeight,
          cursorRadius: cursorRadius,
          cursorColor: cursorColor,
          keyboardAppearance: keyboardAppearance,
          scrollPadding: scrollPadding,
          enableInteractiveSelection: enableInteractiveSelection,
          autovalidateMode: autovalidateMode,
        );
      },
    },
    getters: {'key': (visitor, target) => (target as TextFormField).key},
  );
}

/// Returns the BridgedClass for the Flutter DropdownButtonFormField widget.
BridgedClass getDropdownButtonFormFieldBridgingDefinition() {
  return BridgedClass(
    nativeType: DropdownButtonFormField,
    name: 'DropdownButtonFormField',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final value = namedArgs['value'];
        final decoration = namedArgs.get<InputDecoration?>('decoration');
        final onChanged = namedArgs.handleValueCallback('onChanged', visitor);
        final onSaved = namedArgs.handleValueCallback('onSaved', visitor);
        final validator = namedArgs
            .handleValueCallbackWithReturnType<String?, dynamic>(
              'validator',
              visitor,
            );
        final autovalidateMode = namedArgs.get<AutovalidateMode?>(
          'autovalidateMode',
        );
        final isExpanded = namedArgs.get<bool?>('isExpanded') ?? false;
        final isDense = namedArgs.get<bool?>('isDense') ?? false;
        final icon = visitor.toWidgets(namedArgs['icon']);
        final iconSize = namedArgs.getToDouble('iconSize') ?? 24.0;
        final hint = visitor.toWidgets(namedArgs['hint']);
        final disabledHint = visitor.toWidgets(namedArgs['disabledHint']);
        final elevation = namedArgs.get<int?>('elevation') ?? 8;
        final style = namedArgs.get<TextStyle?>('style');
        final iconEnabledColor = namedArgs.get<Color?>('iconEnabledColor');
        final iconDisabledColor = namedArgs.get<Color?>('iconDisabledColor');
        final dropdownColor = namedArgs.get<Color?>('dropdownColor');
        final focusColor = namedArgs.get<Color?>('focusColor');
        final focusNode = namedArgs.get<FocusNode?>('focusNode');
        final autofocus = namedArgs.get<bool?>('autofocus') ?? false;
        final borderRadius = namedArgs.get<BorderRadius?>('borderRadius');
        final enableFeedback = namedArgs.get<bool?>('enableFeedback');
        final alignment =
            namedArgs.get<AlignmentGeometry?>('alignment') ??
            AlignmentDirectional.centerStart;

        // Gestion des items
        List<DropdownMenuItem> items = [];
        final itemsValue = namedArgs['items'];
        if (itemsValue is List) {
          for (final itemValue in itemsValue) {
            if (itemValue is DropdownMenuItem) {
              items.add(itemValue);
            }
          }
        }

        return DropdownButtonFormField(
          key: key,
          value: value,
          items: items,
          onChanged: onChanged,
          onSaved: onSaved,
          validator: validator,
          autovalidateMode: autovalidateMode,
          decoration: decoration,
          isExpanded: isExpanded,
          isDense: isDense,
          icon: icon,
          iconSize: iconSize,
          hint: hint,
          disabledHint: disabledHint,
          elevation: elevation,
          style: style,
          iconEnabledColor: iconEnabledColor,
          iconDisabledColor: iconDisabledColor,
          dropdownColor: dropdownColor,
          focusColor: focusColor,
          focusNode: focusNode,
          autofocus: autofocus,
          borderRadius: borderRadius,
          enableFeedback: enableFeedback,
          alignment: alignment,
        );
      },
    },
    getters: {
      'key': (visitor, target) => (target as DropdownButtonFormField).key,
    },
  );
}
