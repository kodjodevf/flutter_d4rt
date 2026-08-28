import 'package:d4rt/d4rt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for Flutter CupertinoListSection.
BridgedClass getCupertinoListSectionBridgingDefinition() {
  return BridgedClass(
    nativeType: CupertinoListSection,
    name: 'CupertinoListSection',
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
            namedArgs.get<Clip?>('clipBehavior') ?? Clip.hardEdge;
        final separatorColor = namedArgs.get<Color?>('separatorColor');
        final hasLeading = namedArgs.get<bool?>('hasLeading') ?? true;
        final topMargin = (namedArgs['topMargin'] as num?)?.toDouble() ?? 22.0;

        return CupertinoListSection(
          key: key,
          header: header,
          footer: footer,
          margin: margin,
          backgroundColor: backgroundColor,
          decoration: decoration,
          clipBehavior: clipBehavior,
          separatorColor: separatorColor,
          hasLeading: hasLeading,
          topMargin: topMargin,
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
            namedArgs.get<Clip?>('clipBehavior') ?? Clip.hardEdge;
        final separatorColor = namedArgs.get<Color?>('separatorColor');
        final hasLeading = namedArgs.get<bool?>('hasLeading') ?? true;
        final topMargin = (namedArgs['topMargin'] as num?)?.toDouble() ?? 22.0;

        return CupertinoListSection.insetGrouped(
          key: key,
          header: header,
          footer: footer,
          margin: margin,
          backgroundColor: backgroundColor,
          decoration: decoration,
          clipBehavior: clipBehavior,
          separatorColor: separatorColor,
          hasLeading: hasLeading,
          topMargin: topMargin,
          children: children,
        );
      },
    },
    getters: {
      'header': (visitor, target) => (target as CupertinoListSection).header,
      'footer': (visitor, target) => (target as CupertinoListSection).footer,
      'margin': (visitor, target) => (target as CupertinoListSection).margin,
      'backgroundColor': (visitor, target) =>
          (target as CupertinoListSection).backgroundColor,
      'clipBehavior': (visitor, target) =>
          (target as CupertinoListSection).clipBehavior,
      'topMargin': (visitor, target) =>
          (target as CupertinoListSection).topMargin,
    },
  );
}

/// Returns the BridgedClass for Flutter CupertinoListTile.
BridgedClass getCupertinoListTileBridgingDefinition() {
  return BridgedClass(
    nativeType: CupertinoListTile,
    name: 'CupertinoListTile',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final title = visitor.toWidget(namedArgs['title']) ?? const SizedBox();
        final subtitle = visitor.toWidget(namedArgs['subtitle']);
        final additionalInfo = visitor.toWidget(namedArgs['additionalInfo']);
        final leading = visitor.toWidget(namedArgs['leading']);
        final trailing = visitor.toWidget(namedArgs['trailing']);
        final onTap = namedArgs.handleVoidCallback('onTap', visitor);
        final leadingSize =
            (namedArgs['leadingSize'] as num?)?.toDouble() ?? 28.0;
        final leadingToTitle =
            (namedArgs['leadingToTitle'] as num?)?.toDouble() ?? 16.0;
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding');
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final backgroundColorActivated =
            namedArgs.get<Color?>('backgroundColorActivated');

        return CupertinoListTile(
          key: key,
          title: title,
          subtitle: subtitle,
          additionalInfo: additionalInfo,
          leading: leading,
          trailing: trailing,
          onTap: onTap,
          leadingSize: leadingSize,
          leadingToTitle: leadingToTitle,
          padding: padding,
          backgroundColor: backgroundColor,
          backgroundColorActivated: backgroundColorActivated,
        );
      },
      'notched': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final title = visitor.toWidget(namedArgs['title']) ?? const SizedBox();
        final subtitle = visitor.toWidget(namedArgs['subtitle']);
        final additionalInfo = visitor.toWidget(namedArgs['additionalInfo']);
        final leading = visitor.toWidget(namedArgs['leading']);
        final trailing = visitor.toWidget(namedArgs['trailing']);
        final onTap = namedArgs.handleVoidCallback('onTap', visitor);
        final leadingSize =
            (namedArgs['leadingSize'] as num?)?.toDouble() ?? 30.0;
        final leadingToTitle =
            (namedArgs['leadingToTitle'] as num?)?.toDouble() ?? 14.0;
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding');
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final backgroundColorActivated =
            namedArgs.get<Color?>('backgroundColorActivated');

        return CupertinoListTile.notched(
          key: key,
          title: title,
          subtitle: subtitle,
          additionalInfo: additionalInfo,
          leading: leading,
          trailing: trailing,
          onTap: onTap,
          leadingSize: leadingSize,
          leadingToTitle: leadingToTitle,
          padding: padding,
          backgroundColor: backgroundColor,
          backgroundColorActivated: backgroundColorActivated,
        );
      },
    },
    getters: {
      'title': (visitor, target) => (target as CupertinoListTile).title,
      'subtitle': (visitor, target) => (target as CupertinoListTile).subtitle,
      'additionalInfo': (visitor, target) =>
          (target as CupertinoListTile).additionalInfo,
      'leading': (visitor, target) => (target as CupertinoListTile).leading,
      'trailing': (visitor, target) => (target as CupertinoListTile).trailing,
      'leadingSize': (visitor, target) =>
          (target as CupertinoListTile).leadingSize,
      'leadingToTitle': (visitor, target) =>
          (target as CupertinoListTile).leadingToTitle,
    },
  );
}

/// Returns the BridgedClass for Flutter CupertinoListTileChevron.
BridgedClass getCupertinoListTileChevronBridgingDefinition() {
  return BridgedClass(
    nativeType: CupertinoListTileChevron,
    name: 'CupertinoListTileChevron',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        return CupertinoListTileChevron(key: key);
      },
    },
  );
}
