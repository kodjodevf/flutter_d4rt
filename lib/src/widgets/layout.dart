// ignore_for_file: deprecated_member_use

import 'package:d4rt/d4rt.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_d4rt/utils/double.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for the Flutter GridView widget.
BridgedClass getGridViewBridgingDefinition() {
  return BridgedClass(
    nativeType: GridView,
    name: 'GridView',
    constructors: {
      'count': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final crossAxisCount = namedArgs.get<int?>('crossAxisCount') ?? 2;
        final mainAxisSpacing = namedArgs.getToDouble('mainAxisSpacing') ?? 0.0;
        final crossAxisSpacing =
            namedArgs.getToDouble('crossAxisSpacing') ?? 0.0;
        final childAspectRatio =
            namedArgs.getToDouble('childAspectRatio') ?? 1.0;
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding');
        final scrollDirection =
            namedArgs.get<Axis?>('scrollDirection') ?? Axis.vertical;
        final reverse = namedArgs.get<bool?>('reverse') ?? false;
        final physics = namedArgs.get<ScrollPhysics?>('physics');
        final shrinkWrap = namedArgs.get<bool?>('shrinkWrap') ?? false;
        final primary = namedArgs.get<bool?>('primary');

        final children = visitor.toWidgets(namedArgs['children']);

        return GridView.count(
          key: key,
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
          childAspectRatio: childAspectRatio,
          padding: padding,
          scrollDirection: scrollDirection,
          reverse: reverse,
          physics: physics,
          shrinkWrap: shrinkWrap,
          primary: primary,
          children: children,
        );
      },
      'extent': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final maxCrossAxisExtent = toDouble(
          namedArgs.get<dynamic>('maxCrossAxisExtent'),
        )!;
        final mainAxisSpacing =
            toDouble(namedArgs.get<dynamic>('mainAxisSpacing')) ?? 0.0;
        final crossAxisSpacing =
            toDouble(namedArgs.get<dynamic>('crossAxisSpacing')) ?? 0.0;
        final childAspectRatio =
            toDouble(namedArgs.get<dynamic>('childAspectRatio')) ?? 1.0;
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding');
        final scrollDirection =
            namedArgs.get<Axis?>('scrollDirection') ?? Axis.vertical;
        final reverse = namedArgs.get<bool?>('reverse') ?? false;
        final physics = namedArgs.get<ScrollPhysics?>('physics');
        final shrinkWrap = namedArgs.get<bool?>('shrinkWrap') ?? false;
        final primary = namedArgs.get<bool?>('primary');
        final children = visitor.toWidgets(namedArgs['children']);

        return GridView.extent(
          key: key,
          maxCrossAxisExtent: maxCrossAxisExtent,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
          childAspectRatio: childAspectRatio,
          padding: padding,
          scrollDirection: scrollDirection,
          reverse: reverse,
          physics: physics,
          shrinkWrap: shrinkWrap,
          primary: primary,
          children: children,
        );
      },
    },
    getters: {
      'scrollDirection': (visitor, target) =>
          (target as GridView).scrollDirection,
      'reverse': (visitor, target) => (target as GridView).reverse,
      'physics': (visitor, target) => (target as GridView).physics,
      'shrinkWrap': (visitor, target) => (target as GridView).shrinkWrap,
      'padding': (visitor, target) => (target as GridView).padding,
      'key': (visitor, target) => (target as GridView).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter ListView widget.
BridgedClass getListViewBridgingDefinition() {
  return BridgedClass(
    nativeType: ListView,
    name: 'ListView',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final scrollDirection =
            namedArgs.get<Axis?>('scrollDirection') ?? Axis.vertical;
        final reverse = namedArgs.get<bool?>('reverse') ?? false;
        final physics = namedArgs.get<ScrollPhysics?>('physics');
        final shrinkWrap = namedArgs.get<bool?>('shrinkWrap') ?? false;
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding');
        final itemExtent = namedArgs.getToDouble('itemExtent');
        final prototypeItem = visitor.toWidgets(namedArgs['prototypeItem']);
        final addAutomaticKeepAlives =
            namedArgs.get<bool?>('addAutomaticKeepAlives') ?? true;
        final addRepaintBoundaries =
            namedArgs.get<bool?>('addRepaintBoundaries') ?? true;
        final addSemanticIndexes =
            namedArgs.get<bool?>('addSemanticIndexes') ?? true;
        final cacheExtent = namedArgs.getToDouble('cacheExtent');
        final semanticChildCount = namedArgs.get<int?>('semanticChildCount');
        final dragStartBehavior =
            namedArgs.get<DragStartBehavior?>('dragStartBehavior') ??
            DragStartBehavior.start;
        final keyboardDismissBehavior =
            namedArgs.get<ScrollViewKeyboardDismissBehavior?>(
              'keyboardDismissBehavior',
            ) ??
            ScrollViewKeyboardDismissBehavior.manual;
        final restorationId = namedArgs.get<String?>('restorationId');
        final clipBehavior =
            namedArgs.get<Clip?>('clipBehavior') ?? Clip.hardEdge;
        final children = visitor.toWidgets(namedArgs['children']);

        return ListView(
          key: key,
          scrollDirection: scrollDirection,
          reverse: reverse,
          physics: physics,
          shrinkWrap: shrinkWrap,
          padding: padding,
          itemExtent: itemExtent,
          prototypeItem: prototypeItem,
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
          addSemanticIndexes: addSemanticIndexes,
          cacheExtent: cacheExtent,
          semanticChildCount: semanticChildCount,
          dragStartBehavior: dragStartBehavior,
          keyboardDismissBehavior: keyboardDismissBehavior,
          restorationId: restorationId,
          clipBehavior: clipBehavior,
          children: children,
        );
      },
    },
    getters: {
      'scrollDirection': (visitor, target) =>
          (target as ListView).scrollDirection,
      'reverse': (visitor, target) => (target as ListView).reverse,
      'physics': (visitor, target) => (target as ListView).physics,
      'shrinkWrap': (visitor, target) => (target as ListView).shrinkWrap,
      'padding': (visitor, target) => (target as ListView).padding,
      'itemExtent': (visitor, target) => (target as ListView).itemExtent,
      'key': (visitor, target) => (target as ListView).key,
    },
  );
}

/// Returns the BridgedClass for LayoutBuilder.
BridgedClass getLayoutBuilderBridgingDefinition() {
  return BridgedClass(
    nativeType: LayoutBuilder,
    name: 'LayoutBuilder',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final builderValue = namedArgs['builder'];

        Widget builder(BuildContext context, BoxConstraints constraints) {
          if (builderValue is InterpretedFunction) {
            final result = builderValue.call(visitor, [context, constraints]);
            return visitor.toWidgets(result) ?? const SizedBox.shrink();
          } else if (builderValue is Function) {
            final result = (builderValue as dynamic)(context, constraints);
            return visitor.toWidgets(result) ?? const SizedBox.shrink();
          }
          return const SizedBox.shrink();
        }

        return LayoutBuilder(key: key, builder: builder);
      },
    },
    getters: {
      'key': (visitor, target) => (target as LayoutBuilder).key,
    },
  );
}

/// Returns the BridgedClass for OrientationBuilder.
BridgedClass getOrientationBuilderBridgingDefinition() {
  return BridgedClass(
    nativeType: OrientationBuilder,
    name: 'OrientationBuilder',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final builderValue = namedArgs['builder'];

        Widget builder(BuildContext context, Orientation orientation) {
          if (builderValue is InterpretedFunction) {
            final result = builderValue.call(visitor, [context, orientation]);
            return visitor.toWidgets(result) ?? const SizedBox.shrink();
          } else if (builderValue is Function) {
            final result = (builderValue as dynamic)(context, orientation);
            return visitor.toWidgets(result) ?? const SizedBox.shrink();
          }
          return const SizedBox.shrink();
        }

        return OrientationBuilder(key: key, builder: builder);
      },
    },
    getters: {
      'key': (visitor, target) => (target as OrientationBuilder).key,
    },
  );
}

/// Returns the BridgedClass for InteractiveViewer.
BridgedClass getInteractiveViewerBridgingDefinition() {
  return BridgedClass(
    nativeType: InteractiveViewer,
    name: 'InteractiveViewer',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final clipBehavior =
            namedArgs.get<Clip?>('clipBehavior') ?? Clip.hardEdge;
        final panAxis = namedArgs.get<PanAxis?>('panAxis') ?? PanAxis.free;
        final boundaryMargin =
            namedArgs.get<EdgeInsets?>('boundaryMargin') ?? EdgeInsets.zero;
        final maxScale = namedArgs.getToDouble('maxScale') ?? 2.5;
        final minScale = namedArgs.getToDouble('minScale') ?? 0.8;
        final panEnabled = namedArgs.get<bool?>('panEnabled') ?? true;
        final scaleEnabled = namedArgs.get<bool?>('scaleEnabled') ?? true;
        final child = visitor.toWidgets(namedArgs['child']) ?? const SizedBox.shrink();

        return InteractiveViewer(
          key: key,
          clipBehavior: clipBehavior,
          panAxis: panAxis,
          boundaryMargin: boundaryMargin,
          maxScale: maxScale,
          minScale: minScale,
          panEnabled: panEnabled,
          scaleEnabled: scaleEnabled,
          child: child,
        );
      },
    },
    getters: {
      'child': (visitor, target) => (target as InteractiveViewer).child,
      'key': (visitor, target) => (target as InteractiveViewer).key,
    },
  );
}

