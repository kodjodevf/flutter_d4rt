import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for the Flutter ExpansionTile widget.
BridgedClass getExpansionTileBridgingDefinition() {
  return BridgedClass(
    nativeType: ExpansionTile,
    name: 'ExpansionTile',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final onExpansionChanged = namedArgs.handleValueCallback<bool>(
          'onExpansionChanged',
          visitor,
        );
        final initiallyExpanded =
            namedArgs.get<bool?>('initiallyExpanded') ?? false;
        final maintainState = namedArgs.get<bool?>('maintainState') ?? false;
        final tilePadding = namedArgs.get<EdgeInsetsGeometry?>('tilePadding');
        final expandedCrossAxisAlignment = namedArgs.get<CrossAxisAlignment?>(
          'expandedCrossAxisAlignment',
        );
        final expandedAlignment = namedArgs.get<Alignment?>(
          'expandedAlignment',
        );
        final childrenPadding = namedArgs.get<EdgeInsetsGeometry?>(
          'childrenPadding',
        );
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final collapsedBackgroundColor = namedArgs.get<Color?>(
          'collapsedBackgroundColor',
        );
        final textColor = namedArgs.get<Color?>('textColor');
        final collapsedTextColor = namedArgs.get<Color?>('collapsedTextColor');
        final iconColor = namedArgs.get<Color?>('iconColor');
        final collapsedIconColor = namedArgs.get<Color?>('collapsedIconColor');
        final title = visitor.toWidgets(namedArgs['title']);
        final subtitle = visitor.toWidgets(namedArgs['subtitle']);
        final leading = visitor.toWidgets(namedArgs['leading']);
        final trailing = visitor.toWidgets(namedArgs['trailing']);
        final children = visitor.toWidgets(namedArgs['children']);

        return ExpansionTile(
          key: key,
          title: title!,
          subtitle: subtitle,
          leading: leading,
          trailing: trailing,
          onExpansionChanged: onExpansionChanged,
          initiallyExpanded: initiallyExpanded,
          maintainState: maintainState,
          tilePadding: tilePadding,
          expandedCrossAxisAlignment: expandedCrossAxisAlignment,
          expandedAlignment: expandedAlignment,
          childrenPadding: childrenPadding,
          backgroundColor: backgroundColor,
          collapsedBackgroundColor: collapsedBackgroundColor,
          textColor: textColor,
          collapsedTextColor: collapsedTextColor,
          iconColor: iconColor,
          collapsedIconColor: collapsedIconColor,
          children: children,
        );
      },
    },
    getters: {
      'title': (visitor, target) => (target as ExpansionTile).title,
      'subtitle': (visitor, target) => (target as ExpansionTile).subtitle,
      'leading': (visitor, target) => (target as ExpansionTile).leading,
      'trailing': (visitor, target) => (target as ExpansionTile).trailing,
      'children': (visitor, target) => (target as ExpansionTile).children,
      'initiallyExpanded': (visitor, target) =>
          (target as ExpansionTile).initiallyExpanded,
      'maintainState': (visitor, target) =>
          (target as ExpansionTile).maintainState,
      'key': (visitor, target) => (target as ExpansionTile).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter BottomSheet widget.
BridgedClass getBottomSheetBridgingDefinition() {
  return BridgedClass(
    nativeType: BottomSheet,
    name: 'BottomSheet',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final onClosing = namedArgs.get<InterpretedFunction>('onClosing');
        final enableDrag = namedArgs.get<bool?>('enableDrag') ?? true;
        final elevation = namedArgs.getToDouble('elevation');
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final shadowColor = namedArgs.get<Color?>('shadowColor');
        final dragHandleColor = namedArgs.get<Color?>('dragHandleColor');
        final dragHandleSize = namedArgs.get<Size?>('dragHandleSize');

        // Handle builder function
        Widget Function(BuildContext) builder = (context) => Container();
        final builderValue = namedArgs['builder'];
        if (builderValue is InterpretedFunction) {
          builder = (context) {
            final result = builderValue.call(visitor, [context]);
            return visitor.toWidgets(result);
          };
        }

        return BottomSheet(
          key: key,
          onClosing: () => onClosing!.call(visitor, [], {}),
          builder: builder,
          enableDrag: enableDrag,
          elevation: elevation,
          backgroundColor: backgroundColor,
          shadowColor: shadowColor,
          dragHandleColor: dragHandleColor,
          dragHandleSize: dragHandleSize,
        );
      },
    },
    getters: {
      'onClosing': (visitor, target) => (target as BottomSheet).onClosing,
      'enableDrag': (visitor, target) => (target as BottomSheet).enableDrag,
      'elevation': (visitor, target) => (target as BottomSheet).elevation,
      'backgroundColor': (visitor, target) =>
          (target as BottomSheet).backgroundColor,
      'key': (visitor, target) => (target as BottomSheet).key,
    },
  );
}
