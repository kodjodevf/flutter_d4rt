// ignore_for_file: deprecated_member_use

import 'dart:ui' as ui show TextHeightBehavior;
import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

BridgedClass getTextBridgingDefinition() {
  return BridgedClass(
    nativeType: Text,
    name: 'Text',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final data = positionalArgs.isNotEmpty
            ? positionalArgs[0] as String
            : namedArgs['data'] as String? ?? '';
        final key = namedArgs.get<Key?>('key');
        final style = namedArgs.get<TextStyle?>('style');
        final strutStyle = namedArgs.get<StrutStyle?>('strutStyle');
        final textAlign = namedArgs.get<TextAlign?>('textAlign');
        final textDirection = namedArgs.get<TextDirection?>('textDirection');
        final locale = namedArgs.get<Locale?>('locale');
        final softWrap = namedArgs.get<bool?>('softWrap');
        final overflow = namedArgs.get<TextOverflow?>('overflow');
        final textScaler = namedArgs.get<TextScaler?>('textScaler');
        final maxLines = namedArgs.get<int?>('maxLines');
        final semanticsLabel = namedArgs.get<String?>('semanticsLabel');
        final textWidthBasis = namedArgs.get<TextWidthBasis?>('textWidthBasis');
        final textHeightBehavior =
            namedArgs.get<ui.TextHeightBehavior?>('textHeightBehavior');
        final selectionColor = namedArgs.get<Color?>('selectionColor');

        return Text(
          data,
          key: key,
          style: style,
          strutStyle: strutStyle,
          textAlign: textAlign,
          textDirection: textDirection,
          locale: locale,
          softWrap: softWrap,
          overflow: overflow,
          textScaler: textScaler,
          maxLines: maxLines,
          semanticsLabel: semanticsLabel,
          textWidthBasis: textWidthBasis,
          textHeightBehavior: textHeightBehavior,
          selectionColor: selectionColor,
        );
      },
      'rich': (visitor, positionalArgs, namedArgs) {
        final textSpan = (positionalArgs.isNotEmpty
            ? positionalArgs[0]
            : namedArgs['textSpan']) as InlineSpan;
        final key = namedArgs.get<Key?>('key');
        final style = namedArgs.get<TextStyle?>('style');
        final strutStyle = namedArgs.get<StrutStyle?>('strutStyle');
        final textAlign = namedArgs.get<TextAlign?>('textAlign');
        final textDirection = namedArgs.get<TextDirection?>('textDirection');
        final locale = namedArgs.get<Locale?>('locale');
        final softWrap = namedArgs.get<bool?>('softWrap');
        final overflow = namedArgs.get<TextOverflow?>('overflow');
        final textScaler = namedArgs.get<TextScaler?>('textScaler');
        final maxLines = namedArgs.get<int?>('maxLines');
        final semanticsLabel = namedArgs.get<String?>('semanticsLabel');
        final textWidthBasis = namedArgs.get<TextWidthBasis?>('textWidthBasis');
        final textHeightBehavior =
            namedArgs.get<ui.TextHeightBehavior?>('textHeightBehavior');
        final selectionColor = namedArgs.get<Color?>('selectionColor');

        return Text.rich(
          textSpan,
          key: key,
          style: style,
          strutStyle: strutStyle,
          textAlign: textAlign,
          textDirection: textDirection,
          locale: locale,
          softWrap: softWrap,
          overflow: overflow,
          textScaler: textScaler,
          maxLines: maxLines,
          semanticsLabel: semanticsLabel,
          textWidthBasis: textWidthBasis,
          textHeightBehavior: textHeightBehavior,
          selectionColor: selectionColor,
        );
      },
    },
    getters: {
      'data': (visitor, target) => (target as Text).data,
      'textSpan': (visitor, target) => (target as Text).textSpan,
      'style': (visitor, target) => (target as Text).style,
      'strutStyle': (visitor, target) => (target as Text).strutStyle,
      'textAlign': (visitor, target) => (target as Text).textAlign,
      'textDirection': (visitor, target) => (target as Text).textDirection,
      'locale': (visitor, target) => (target as Text).locale,
      'softWrap': (visitor, target) => (target as Text).softWrap,
      'overflow': (visitor, target) => (target as Text).overflow,
      'maxLines': (visitor, target) => (target as Text).maxLines,
      'semanticsLabel': (visitor, target) => (target as Text).semanticsLabel,
      'key': (visitor, target) => (target as Text).key,
    },
  );
}

/// Returns the BridgedClass for RichText widget.
BridgedClass getRichTextBridgingDefinition() {
  return BridgedClass(
    nativeType: RichText,
    name: 'RichText',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final text = (positionalArgs.isNotEmpty
            ? positionalArgs[0]
            : namedArgs['text']) as InlineSpan;
        final key = namedArgs.get<Key?>('key');
        final textAlign =
            namedArgs.get<TextAlign?>('textAlign') ?? TextAlign.start;
        final textDirection = namedArgs.get<TextDirection?>('textDirection');
        final softWrap = namedArgs.get<bool?>('softWrap') ?? true;
        final overflow =
            namedArgs.get<TextOverflow?>('overflow') ?? TextOverflow.clip;
        final textScaler =
            namedArgs.get<TextScaler?>('textScaler') ?? TextScaler.noScaling;
        final maxLines = namedArgs.get<int?>('maxLines');
        final locale = namedArgs.get<Locale?>('locale');
        final strutStyle = namedArgs.get<StrutStyle?>('strutStyle');
        final textWidthBasis =
            namedArgs.get<TextWidthBasis?>('textWidthBasis') ??
            TextWidthBasis.parent;
        final textHeightBehavior =
            namedArgs.get<ui.TextHeightBehavior?>('textHeightBehavior');
        final selectionColor = namedArgs.get<Color?>('selectionColor');

        return RichText(
          key: key,
          text: text,
          textAlign: textAlign,
          textDirection: textDirection,
          softWrap: softWrap,
          overflow: overflow,
          textScaler: textScaler,
          maxLines: maxLines,
          locale: locale,
          strutStyle: strutStyle,
          textWidthBasis: textWidthBasis,
          textHeightBehavior: textHeightBehavior,
          selectionColor: selectionColor,
        );
      },
    },
    getters: {
      'text': (visitor, target) => (target as RichText).text,
      'textAlign': (visitor, target) => (target as RichText).textAlign,
      'overflow': (visitor, target) => (target as RichText).overflow,
      'maxLines': (visitor, target) => (target as RichText).maxLines,
      'key': (visitor, target) => (target as RichText).key,
    },
  );
}

/// Returns the BridgedClass for InlineSpan abstract class.
BridgedClass getInlineSpanBridgingDefinition() {
  return BridgedClass(
    nativeType: InlineSpan,
    name: 'InlineSpan',
    constructors: {},
    getters: {
      'style': (visitor, target) => (target as InlineSpan).style,
    },
    isSubtypeOfFunc: (value) => value is InlineSpan,
  );
}

/// Returns the BridgedClass for TextSpan.
BridgedClass getTextSpanBridgingDefinition() {
  return BridgedClass(
    nativeType: TextSpan,
    name: 'TextSpan',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final text = namedArgs.get<String?>('text');
        final style = namedArgs.get<TextStyle?>('style');
        final childrenRaw = namedArgs['children'];
        List<InlineSpan>? children;
        if (childrenRaw is List) {
          children = childrenRaw.map((child) {
            if (child is BridgedInstance && child.nativeObject is InlineSpan) {
              return child.nativeObject as InlineSpan;
            }
            return child as InlineSpan;
          }).toList();
        }
        final semanticsLabel = namedArgs.get<String?>('semanticsLabel');
        final locale = namedArgs.get<Locale?>('locale');
        final spellOut = namedArgs.get<bool?>('spellOut');

        return TextSpan(
          text: text,
          children: children,
          style: style,
          semanticsLabel: semanticsLabel,
          locale: locale,
          spellOut: spellOut,
        );
      },
    },
    getters: {
      'text': (visitor, target) => (target as TextSpan).text,
      'children': (visitor, target) => (target as TextSpan).children,
      'style': (visitor, target) => (target as TextSpan).style,
      'semanticsLabel': (visitor, target) => (target as TextSpan).semanticsLabel,
    },
    isSubtypeOfFunc: (value) => value is TextSpan,
  );
}

/// Returns the BridgedClass for WidgetSpan.
BridgedClass getWidgetSpanBridgingDefinition() {
  return BridgedClass(
    nativeType: WidgetSpan,
    name: 'WidgetSpan',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final child = visitor.toWidgets(namedArgs['child']) ?? const SizedBox.shrink();
        final alignment =
            namedArgs.get<PlaceholderAlignment?>('alignment') ??
            PlaceholderAlignment.bottom;
        final baseline = namedArgs.get<TextBaseline?>('baseline');
        final style = namedArgs.get<TextStyle?>('style');

        return WidgetSpan(
          child: child,
          alignment: alignment,
          baseline: baseline,
          style: style,
        );
      },
    },
    getters: {
      'child': (visitor, target) => (target as WidgetSpan).child,
      'alignment': (visitor, target) => (target as WidgetSpan).alignment,
      'style': (visitor, target) => (target as WidgetSpan).style,
    },
    isSubtypeOfFunc: (value) => value is WidgetSpan,
  );
}

/// Returns the BridgedClass for DefaultTextStyle.
BridgedClass getDefaultTextStyleBridgingDefinition() {
  return BridgedClass(
    nativeType: DefaultTextStyle,
    name: 'DefaultTextStyle',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final style = namedArgs.get<TextStyle>('style') ?? const TextStyle();
        final textAlign = namedArgs.get<TextAlign?>('textAlign');
        final softWrap = namedArgs.get<bool?>('softWrap') ?? true;
        final overflow =
            namedArgs.get<TextOverflow?>('overflow') ?? TextOverflow.clip;
        final maxLines = namedArgs.get<int?>('maxLines');
        final textWidthBasis =
            namedArgs.get<TextWidthBasis?>('textWidthBasis') ??
            TextWidthBasis.parent;
        final textHeightBehavior =
            namedArgs.get<ui.TextHeightBehavior?>('textHeightBehavior');
        final child = visitor.toWidgets(namedArgs['child']) ?? const SizedBox.shrink();

        return DefaultTextStyle(
          key: key,
          style: style,
          textAlign: textAlign,
          softWrap: softWrap,
          overflow: overflow,
          maxLines: maxLines,
          textWidthBasis: textWidthBasis,
          textHeightBehavior: textHeightBehavior,
          child: child,
        );
      },
      'fallback': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        return DefaultTextStyle.fallback(key: key);
      },
    },
    staticMethods: {
      'of': (visitor, positionalArgs, namedArgs) {
        final context = positionalArgs.get<BuildContext>(0)!;
        return DefaultTextStyle.of(context);
      },
    },
    getters: {
      'style': (visitor, target) => (target as DefaultTextStyle).style,
      'textAlign': (visitor, target) => (target as DefaultTextStyle).textAlign,
      'softWrap': (visitor, target) => (target as DefaultTextStyle).softWrap,
      'overflow': (visitor, target) => (target as DefaultTextStyle).overflow,
      'maxLines': (visitor, target) => (target as DefaultTextStyle).maxLines,
      'key': (visitor, target) => (target as DefaultTextStyle).key,
    },
  );
}

/// Returns the BridgedEnum for PlaceholderAlignment.
BridgedEnumDefinition<PlaceholderAlignment> getPlaceholderAlignmentBridgingDefinition() {
  return BridgedEnumDefinition(
    name: 'PlaceholderAlignment',
    values: PlaceholderAlignment.values,
  );
}
