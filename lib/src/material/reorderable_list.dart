// ignore_for_file: deprecated_member_use, sort_child_properties_last, prefer_function_declarations_over_variables

import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/double.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

EdgeInsets? _extractEdgeInsets(dynamic raw) {
  if (raw == null) return null;
  final obj = raw is BridgedInstance ? raw.nativeObject : raw;
  if (obj is EdgeInsets) return obj;
  return null;
}

/// Returns the BridgedClass for Flutter ReorderableListView widget.
BridgedClass getReorderableListViewBridgingDefinition() {
  return BridgedClass(
    nativeType: ReorderableListView,
    name: 'ReorderableListView',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final children = visitor.toWidgetList(namedArgs['children']);
        final onReorder = namedArgs.handle2ValueCallback<int, int>(
          'onReorder',
          visitor,
        );
        if (onReorder == null) {
          throw ArgumentError('onReorder is required for ReorderableListView');
        }
        final itemExtent = toDouble(namedArgs['itemExtent']);
        final prototypeItem = visitor.toWidget(namedArgs['prototypeItem']);
        final buildDefaultDragHandles =
            namedArgs.get<bool?>('buildDefaultDragHandles') ?? true;
        final padding = _extractEdgeInsets(namedArgs['padding']);
        final header = visitor.toWidget(namedArgs['header']);
        final footer = visitor.toWidget(namedArgs['footer']);
        final scrollDirection =
            namedArgs.get<Axis?>('scrollDirection') ?? Axis.vertical;
        final reverse = namedArgs.get<bool?>('reverse') ?? false;
        final scrollController = namedArgs.get<ScrollController?>(
          'scrollController',
        );
        final primary = namedArgs.get<bool?>('primary');
        final physics = namedArgs.get<ScrollPhysics?>('physics');
        final shrinkWrap = namedArgs.get<bool?>('shrinkWrap') ?? false;
        final anchor = toDouble(namedArgs['anchor']) ?? 0.0;
        final clipBehavior =
            namedArgs.get<Clip?>('clipBehavior') ?? Clip.hardEdge;
        final onReorderStart = namedArgs.handleValueCallback<int>(
          'onReorderStart',
          visitor,
        );
        final onReorderEnd = namedArgs.handleValueCallback<int>(
          'onReorderEnd',
          visitor,
        );

        return ReorderableListView(
          key: key,
          children: children,
          onReorder: onReorder,
          itemExtent: itemExtent,
          prototypeItem: prototypeItem,
          buildDefaultDragHandles: buildDefaultDragHandles,
          padding: padding,
          header: header,
          footer: footer,
          scrollDirection: scrollDirection,
          reverse: reverse,
          scrollController: scrollController,
          primary: primary,
          physics: physics,
          shrinkWrap: shrinkWrap,
          anchor: anchor,
          clipBehavior: clipBehavior,
          onReorderStart: onReorderStart,
          onReorderEnd: onReorderEnd,
        );
      },
      'builder': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final onReorder = namedArgs.handle2ValueCallback<int, int>(
          'onReorder',
          visitor,
        );
        if (onReorder == null) {
          throw ArgumentError(
            'onReorder is required for ReorderableListView.builder',
          );
        }
        final itemCount = namedArgs.get<int>('itemCount') ?? 0;
        final itemBuilderRaw = namedArgs['itemBuilder'];
        final itemExtent = toDouble(namedArgs['itemExtent']);
        final prototypeItem = visitor.toWidget(namedArgs['prototypeItem']);
        final buildDefaultDragHandles =
            namedArgs.get<bool?>('buildDefaultDragHandles') ?? true;
        final padding = _extractEdgeInsets(namedArgs['padding']);
        final header = visitor.toWidget(namedArgs['header']);
        final footer = visitor.toWidget(namedArgs['footer']);
        final scrollDirection =
            namedArgs.get<Axis?>('scrollDirection') ?? Axis.vertical;
        final reverse = namedArgs.get<bool?>('reverse') ?? false;
        final scrollController = namedArgs.get<ScrollController?>(
          'scrollController',
        );
        final primary = namedArgs.get<bool?>('primary');
        final physics = namedArgs.get<ScrollPhysics?>('physics');
        final shrinkWrap = namedArgs.get<bool?>('shrinkWrap') ?? false;
        final anchor = toDouble(namedArgs['anchor']) ?? 0.0;
        final clipBehavior =
            namedArgs.get<Clip?>('clipBehavior') ?? Clip.hardEdge;
        final onReorderStart = namedArgs.handleValueCallback<int>(
          'onReorderStart',
          visitor,
        );
        final onReorderEnd = namedArgs.handleValueCallback<int>(
          'onReorderEnd',
          visitor,
        );

        IndexedWidgetBuilder itemBuilder = (context, index) {
          if (itemBuilderRaw is InterpretedFunction) {
            final result = itemBuilderRaw.call(visitor, [context, index], {});
            return visitor.toWidget(result) ?? const SizedBox();
          }
          return const SizedBox();
        };

        return ReorderableListView.builder(
          key: key,
          itemCount: itemCount,
          itemBuilder: itemBuilder,
          onReorder: onReorder,
          itemExtent: itemExtent,
          prototypeItem: prototypeItem,
          buildDefaultDragHandles: buildDefaultDragHandles,
          padding: padding,
          header: header,
          footer: footer,
          scrollDirection: scrollDirection,
          reverse: reverse,
          scrollController: scrollController,
          primary: primary,
          physics: physics,
          shrinkWrap: shrinkWrap,
          anchor: anchor,
          clipBehavior: clipBehavior,
          onReorderStart: onReorderStart,
          onReorderEnd: onReorderEnd,
        );
      },
    },
    getters: {
      'scrollDirection': (visitor, target) =>
          (target as ReorderableListView).scrollDirection,
      'reverse': (visitor, target) => (target as ReorderableListView).reverse,
      'key': (visitor, target) => (target as ReorderableListView).key,
    },
  );
}
