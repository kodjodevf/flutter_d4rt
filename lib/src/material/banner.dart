import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for the Flutter MaterialBanner widget.
BridgedClass getMaterialBannerBridgingDefinition() {
  return BridgedClass(
    nativeType: MaterialBanner,
    name: 'MaterialBanner',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final surfaceTintColor = namedArgs.get<Color?>('surfaceTintColor');
        final shadowColor = namedArgs.get<Color?>('shadowColor');
        final dividerColor = namedArgs.get<Color?>('dividerColor');
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding');
        final leadingPadding = namedArgs.get<EdgeInsetsGeometry?>(
          'leadingPadding',
        );
        final forceActionsBelow =
            namedArgs.get<bool?>('forceActionsBelow') ?? false;
        final overflowAlignment =
            namedArgs.get<OverflowBarAlignment?>('overflowAlignment') ??
            OverflowBarAlignment.end;
        final animation = namedArgs.get<Animation<double>?>('animation');
        final onVisible = namedArgs.handleVoidCallback('onVisible', visitor);
        // Improved widget conversion with null safety
        Widget? content;
        final contentValue = namedArgs['content'];
        if (contentValue != null) {
          final converted = visitor.toWidgets(contentValue);
          if (converted is Widget) {
            content = converted;
          }
        }

        Widget? leading;
        final leadingValue = namedArgs['leading'];
        if (leadingValue != null) {
          final converted = visitor.toWidgets(leadingValue);
          if (converted is Widget) {
            leading = converted;
          }
        }

        List<Widget> actions = [];
        final actionsValue = namedArgs['actions'];
        if (actionsValue != null) {
          final converted = visitor.toWidgets(actionsValue);
          if (converted is List<Widget>) {
            actions = converted;
          } else if (converted is Widget) {
            actions = [converted];
          }
        }

        return MaterialBanner(
          key: key,
          content: content!,
          actions: actions,
          leading: leading,
          backgroundColor: backgroundColor,
          surfaceTintColor: surfaceTintColor,
          shadowColor: shadowColor,
          dividerColor: dividerColor,
          padding: padding,
          leadingPadding: leadingPadding,
          forceActionsBelow: forceActionsBelow,
          overflowAlignment: overflowAlignment,
          animation: animation,
          onVisible: onVisible,
        );
      },
    },
    getters: {
      'content': (visitor, target) => (target as MaterialBanner).content,
      'actions': (visitor, target) => (target as MaterialBanner).actions,
      'leading': (visitor, target) => (target as MaterialBanner).leading,
      'backgroundColor': (visitor, target) =>
          (target as MaterialBanner).backgroundColor,
      'forceActionsBelow': (visitor, target) =>
          (target as MaterialBanner).forceActionsBelow,
      'key': (visitor, target) => (target as MaterialBanner).key,
    },
  );
}
