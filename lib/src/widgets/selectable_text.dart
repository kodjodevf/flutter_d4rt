import 'dart:ui' show BoxHeightStyle, BoxWidthStyle;

import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';

/// Returns the BridgedClass for the Flutter SelectableText widget.
BridgedClass getSelectableTextBridgingDefinition() {
  return BridgedClass(
    nativeType: SelectableText,
    name: 'SelectableText',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final data = positionalArgs.isNotEmpty
            ? positionalArgs[0] as String
            : namedArgs.get<String>('data') ?? '';
        final focusNode = namedArgs.get<FocusNode?>('focusNode');
        final style = namedArgs.get<TextStyle?>('style');
        final strutStyle = namedArgs.get<StrutStyle?>('strutStyle');
        final textAlign = namedArgs.get<TextAlign?>('textAlign');
        final textDirection = namedArgs.get<TextDirection?>('textDirection');
        final textScaleFactor = namedArgs.get<double?>('textScaleFactor');
        final showCursor = namedArgs.get<bool?>('showCursor') ?? false;
        final autofocus = namedArgs.get<bool?>('autofocus') ?? false;
        final minLines = namedArgs.get<int?>('minLines');
        final maxLines = namedArgs.get<int?>('maxLines');
        final cursorWidth = namedArgs.get<double?>('cursorWidth') ?? 2.0;
        final cursorHeight = namedArgs.get<double?>('cursorHeight');
        final cursorRadius = namedArgs.get<Radius?>('cursorRadius');
        final cursorColor = namedArgs.get<Color?>('cursorColor');
        final selectionHeightStyle =
            namedArgs.get<BoxHeightStyle?>('selectionHeightStyle') ??
            BoxHeightStyle.tight;
        final selectionWidthStyle =
            namedArgs.get<BoxWidthStyle?>('selectionWidthStyle') ??
            BoxWidthStyle.tight;
        final enableInteractiveSelection =
            namedArgs.get<bool?>('enableInteractiveSelection') ?? true;
        final selectionControls = namedArgs.get<TextSelectionControls?>(
          'selectionControls',
        );
        final scrollPhysics = namedArgs.get<ScrollPhysics?>('scrollPhysics');
        final textWidthBasis =
            namedArgs.get<TextWidthBasis?>('textWidthBasis') ??
            TextWidthBasis.parent;

        // Handle onTap callback
        final onTap = namedArgs.handleVoidCallback('onTap', visitor);

        return SelectableText(
          data,
          key: key,
          focusNode: focusNode,
          style: style,
          strutStyle: strutStyle,
          textAlign: textAlign,
          textDirection: textDirection,
          textScaleFactor: textScaleFactor,
          showCursor: showCursor,
          autofocus: autofocus,
          minLines: minLines,
          maxLines: maxLines,
          cursorWidth: cursorWidth,
          cursorHeight: cursorHeight,
          cursorRadius: cursorRadius,
          cursorColor: cursorColor,
          selectionHeightStyle: selectionHeightStyle,
          selectionWidthStyle: selectionWidthStyle,
          enableInteractiveSelection: enableInteractiveSelection,
          selectionControls: selectionControls,
          onTap: onTap,
          scrollPhysics: scrollPhysics,
          textWidthBasis: textWidthBasis,
        );
      },
      'rich': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final textSpan = positionalArgs.isNotEmpty
            ? positionalArgs[0] as TextSpan
            : namedArgs.get<TextSpan>('textSpan');

        if (textSpan == null) {
          throw ArgumentError('textSpan is required for SelectableText.rich');
        }

        final focusNode = namedArgs.get<FocusNode?>('focusNode');
        final style = namedArgs.get<TextStyle?>('style');
        final strutStyle = namedArgs.get<StrutStyle?>('strutStyle');
        final textAlign = namedArgs.get<TextAlign?>('textAlign');
        final textDirection = namedArgs.get<TextDirection?>('textDirection');
        final textScaleFactor = namedArgs.get<double?>('textScaleFactor');
        final showCursor = namedArgs.get<bool?>('showCursor') ?? false;
        final autofocus = namedArgs.get<bool?>('autofocus') ?? false;
        final minLines = namedArgs.get<int?>('minLines');
        final maxLines = namedArgs.get<int?>('maxLines');
        final cursorWidth = namedArgs.get<double?>('cursorWidth') ?? 2.0;
        final cursorHeight = namedArgs.get<double?>('cursorHeight');
        final cursorRadius = namedArgs.get<Radius?>('cursorRadius');
        final cursorColor = namedArgs.get<Color?>('cursorColor');
        final selectionHeightStyle =
            namedArgs.get<BoxHeightStyle?>('selectionHeightStyle') ??
            BoxHeightStyle.tight;
        final selectionWidthStyle =
            namedArgs.get<BoxWidthStyle?>('selectionWidthStyle') ??
            BoxWidthStyle.tight;
        final enableInteractiveSelection =
            namedArgs.get<bool?>('enableInteractiveSelection') ?? true;
        final selectionControls = namedArgs.get<TextSelectionControls?>(
          'selectionControls',
        );
        final scrollPhysics = namedArgs.get<ScrollPhysics?>('scrollPhysics');
        final textWidthBasis =
            namedArgs.get<TextWidthBasis?>('textWidthBasis') ??
            TextWidthBasis.parent;

        // Handle onTap callback
        final onTap = namedArgs.handleVoidCallback('onTap', visitor);

        return SelectableText.rich(
          textSpan,
          key: key,
          focusNode: focusNode,
          style: style,
          strutStyle: strutStyle,
          textAlign: textAlign,
          textDirection: textDirection,
          textScaleFactor: textScaleFactor,
          showCursor: showCursor,
          autofocus: autofocus,
          minLines: minLines,
          maxLines: maxLines,
          cursorWidth: cursorWidth,
          cursorHeight: cursorHeight,
          cursorRadius: cursorRadius,
          cursorColor: cursorColor,
          selectionHeightStyle: selectionHeightStyle,
          selectionWidthStyle: selectionWidthStyle,
          enableInteractiveSelection: enableInteractiveSelection,
          selectionControls: selectionControls,
          onTap: onTap,
          scrollPhysics: scrollPhysics,
          textWidthBasis: textWidthBasis,
        );
      },
    },
    getters: {
      'data': (visitor, target) => (target as SelectableText).data,
      'focusNode': (visitor, target) => (target as SelectableText).focusNode,
      'style': (visitor, target) => (target as SelectableText).style,
      'strutStyle': (visitor, target) => (target as SelectableText).strutStyle,
      'textAlign': (visitor, target) => (target as SelectableText).textAlign,
      'textDirection': (visitor, target) =>
          (target as SelectableText).textDirection,
      'textScaleFactor': (visitor, target) =>
          (target as SelectableText).textScaleFactor,
      'showCursor': (visitor, target) => (target as SelectableText).showCursor,
      'autofocus': (visitor, target) => (target as SelectableText).autofocus,
      'minLines': (visitor, target) => (target as SelectableText).minLines,
      'maxLines': (visitor, target) => (target as SelectableText).maxLines,
      'cursorWidth': (visitor, target) =>
          (target as SelectableText).cursorWidth,
      'cursorHeight': (visitor, target) =>
          (target as SelectableText).cursorHeight,
      'cursorRadius': (visitor, target) =>
          (target as SelectableText).cursorRadius,
      'cursorColor': (visitor, target) =>
          (target as SelectableText).cursorColor,
      'selectionHeightStyle': (visitor, target) =>
          (target as SelectableText).selectionHeightStyle,
      'selectionWidthStyle': (visitor, target) =>
          (target as SelectableText).selectionWidthStyle,
      'enableInteractiveSelection': (visitor, target) =>
          (target as SelectableText).enableInteractiveSelection,
      'selectionControls': (visitor, target) =>
          (target as SelectableText).selectionControls,
      'scrollPhysics': (visitor, target) =>
          (target as SelectableText).scrollPhysics,
      'textWidthBasis': (visitor, target) =>
          (target as SelectableText).textWidthBasis,
      'key': (visitor, target) => (target as SelectableText).key,
    },
  );
}
