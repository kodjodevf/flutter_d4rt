import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for the Flutter GridTile widget.
BridgedClass getGridTileBridgingDefinition() {
  return BridgedClass(
    nativeType: GridTile,
    name: 'GridTile',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final header = visitor.toWidgets(namedArgs['header']);
        final footer = visitor.toWidgets(namedArgs['footer']);
        final child =
            visitor.toWidgets(namedArgs['child']) ?? const SizedBox.shrink();

        return GridTile(key: key, header: header, footer: footer, child: child);
      },
    },
    getters: {
      'header': (visitor, target) => (target as GridTile).header,
      'footer': (visitor, target) => (target as GridTile).footer,
      'child': (visitor, target) => (target as GridTile).child,
      'key': (visitor, target) => (target as GridTile).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter GridTileBar widget.
BridgedClass getGridTileBarBridgingDefinition() {
  return BridgedClass(
    nativeType: GridTileBar,
    name: 'GridTileBar',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final leading = visitor.toWidgets(namedArgs['leading']);
        final title = visitor.toWidgets(namedArgs['title']);
        final subtitle = visitor.toWidgets(namedArgs['subtitle']);
        final trailing = visitor.toWidgets(namedArgs['trailing']);

        return GridTileBar(
          key: key,
          backgroundColor: backgroundColor,
          leading: leading,
          title: title,
          subtitle: subtitle,
          trailing: trailing,
        );
      },
    },
    getters: {
      'backgroundColor': (visitor, target) =>
          (target as GridTileBar).backgroundColor,
      'leading': (visitor, target) => (target as GridTileBar).leading,
      'title': (visitor, target) => (target as GridTileBar).title,
      'subtitle': (visitor, target) => (target as GridTileBar).subtitle,
      'trailing': (visitor, target) => (target as GridTileBar).trailing,
      'key': (visitor, target) => (target as GridTileBar).key,
    },
  );
}
