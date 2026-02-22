import 'package:d4rt/d4rt.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_d4rt/utils/double.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// ScrollView widgets bridging definitions

// Helper functions for callback handling
Widget Function(BuildContext, int)? _handleItemBuilder(
  InterpreterVisitor visitor,
  dynamic callback,
) {
  if (callback == null) return null;
  if (callback is InterpretedFunction) {
    return (BuildContext context, int index) {
      final result = callback.call(visitor, [context, index]);
      return visitor.toWidgets(result);
    };
  }
  return callback as Widget Function(BuildContext, int)?;
}

// SingleChildScrollView bridging
BridgedClass getSingleChildScrollViewBridgingDefinition() {
  return BridgedClass(
    nativeType: SingleChildScrollView,
    name: 'SingleChildScrollView',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return SingleChildScrollView(
          key: namedArgs.get<Key?>('key'),
          scrollDirection:
              namedArgs['scrollDirection'] as Axis? ?? Axis.vertical,
          reverse: namedArgs['reverse'] as bool? ?? false,
          padding: namedArgs['padding'] as EdgeInsetsGeometry?,
          primary: namedArgs['primary'] as bool?,
          physics: namedArgs['physics'] as ScrollPhysics?,
          controller: namedArgs['controller'] as ScrollController?,
          dragStartBehavior:
              namedArgs['dragStartBehavior'] as DragStartBehavior? ??
              DragStartBehavior.start,
          clipBehavior: namedArgs['clipBehavior'] as Clip? ?? Clip.hardEdge,
          restorationId: namedArgs['restorationId'] as String?,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}

// ListView bridging
BridgedClass getListViewBridgingDefinition() {
  return BridgedClass(
    nativeType: ListView,
    name: 'ListView',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return ListView(
          key: namedArgs.get<Key?>('key'),
          scrollDirection:
              namedArgs['scrollDirection'] as Axis? ?? Axis.vertical,
          reverse: namedArgs['reverse'] as bool? ?? false,
          controller: namedArgs['controller'] as ScrollController?,
          primary: namedArgs['primary'] as bool?,
          physics: namedArgs['physics'] as ScrollPhysics?,
          shrinkWrap: namedArgs['shrinkWrap'] as bool? ?? false,
          padding: namedArgs['padding'] as EdgeInsetsGeometry?,
          itemExtent: toDouble(namedArgs['itemExtent']),
          addAutomaticKeepAlives:
              namedArgs['addAutomaticKeepAlives'] as bool? ?? true,
          addRepaintBoundaries:
              namedArgs['addRepaintBoundaries'] as bool? ?? true,
          addSemanticIndexes: namedArgs['addSemanticIndexes'] as bool? ?? true,
          cacheExtent: toDouble(namedArgs['cacheExtent']),
          semanticChildCount: namedArgs['semanticChildCount'] as int?,
          dragStartBehavior:
              namedArgs['dragStartBehavior'] as DragStartBehavior? ??
              DragStartBehavior.start,
          clipBehavior: namedArgs['clipBehavior'] as Clip? ?? Clip.hardEdge,
          restorationId: namedArgs['restorationId'] as String?,
          children: (namedArgs['children'] as List? ?? []).cast(),
        );
      },
      'builder': (visitor, positionalArgs, namedArgs) {
        return ListView.builder(
          key: namedArgs.get<Key?>('key'),
          scrollDirection:
              namedArgs['scrollDirection'] as Axis? ?? Axis.vertical,
          reverse: namedArgs['reverse'] as bool? ?? false,
          controller: namedArgs['controller'] as ScrollController?,
          primary: namedArgs['primary'] as bool?,
          physics: namedArgs['physics'] as ScrollPhysics?,
          shrinkWrap: namedArgs['shrinkWrap'] as bool? ?? false,
          padding: namedArgs['padding'] as EdgeInsetsGeometry?,
          itemExtent: toDouble(namedArgs['itemExtent']),
          itemCount: namedArgs['itemCount'] as int?,
          itemBuilder: _handleItemBuilder(visitor, namedArgs['itemBuilder'])!,
          addAutomaticKeepAlives:
              namedArgs['addAutomaticKeepAlives'] as bool? ?? true,
          addRepaintBoundaries:
              namedArgs['addRepaintBoundaries'] as bool? ?? true,
          addSemanticIndexes: namedArgs['addSemanticIndexes'] as bool? ?? true,
          cacheExtent: toDouble(namedArgs['cacheExtent']),
          semanticChildCount: namedArgs['semanticChildCount'] as int?,
          dragStartBehavior:
              namedArgs['dragStartBehavior'] as DragStartBehavior? ??
              DragStartBehavior.start,
          clipBehavior: namedArgs['clipBehavior'] as Clip? ?? Clip.hardEdge,
          restorationId: namedArgs['restorationId'] as String?,
        );
      },
      'separated': (visitor, positionalArgs, namedArgs) {
        return ListView.separated(
          key: namedArgs.get<Key?>('key'),
          scrollDirection:
              namedArgs['scrollDirection'] as Axis? ?? Axis.vertical,
          reverse: namedArgs['reverse'] as bool? ?? false,
          controller: namedArgs['controller'] as ScrollController?,
          primary: namedArgs['primary'] as bool?,
          physics: namedArgs['physics'] as ScrollPhysics?,
          shrinkWrap: namedArgs['shrinkWrap'] as bool? ?? false,
          padding: namedArgs['padding'] as EdgeInsetsGeometry?,
          itemCount: namedArgs['itemCount'] as int,
          itemBuilder: _handleItemBuilder(visitor, namedArgs['itemBuilder'])!,
          separatorBuilder: _handleItemBuilder(
            visitor,
            namedArgs['separatorBuilder'],
          )!,
          addAutomaticKeepAlives:
              namedArgs['addAutomaticKeepAlives'] as bool? ?? true,
          addRepaintBoundaries:
              namedArgs['addRepaintBoundaries'] as bool? ?? true,
          addSemanticIndexes: namedArgs['addSemanticIndexes'] as bool? ?? true,
          cacheExtent: toDouble(namedArgs['cacheExtent']),
          dragStartBehavior:
              namedArgs['dragStartBehavior'] as DragStartBehavior? ??
              DragStartBehavior.start,
          clipBehavior: namedArgs['clipBehavior'] as Clip? ?? Clip.hardEdge,
          restorationId: namedArgs['restorationId'] as String?,
        );
      },
    },
  );
}

// GridView bridging
BridgedClass getGridViewBridgingDefinition() {
  return BridgedClass(
    nativeType: GridView,
    name: 'GridView',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return GridView(
          key: namedArgs.get<Key?>('key'),
          scrollDirection:
              namedArgs['scrollDirection'] as Axis? ?? Axis.vertical,
          reverse: namedArgs['reverse'] as bool? ?? false,
          controller: namedArgs['controller'] as ScrollController?,
          primary: namedArgs['primary'] as bool?,
          physics: namedArgs['physics'] as ScrollPhysics?,
          shrinkWrap: namedArgs['shrinkWrap'] as bool? ?? false,
          padding: namedArgs['padding'] as EdgeInsetsGeometry?,
          gridDelegate: namedArgs['gridDelegate'] as SliverGridDelegate,
          addAutomaticKeepAlives:
              namedArgs['addAutomaticKeepAlives'] as bool? ?? true,
          addRepaintBoundaries:
              namedArgs['addRepaintBoundaries'] as bool? ?? true,
          addSemanticIndexes: namedArgs['addSemanticIndexes'] as bool? ?? true,
          cacheExtent: toDouble(namedArgs['cacheExtent']),
          semanticChildCount: namedArgs['semanticChildCount'] as int?,
          dragStartBehavior:
              namedArgs['dragStartBehavior'] as DragStartBehavior? ??
              DragStartBehavior.start,
          clipBehavior: namedArgs['clipBehavior'] as Clip? ?? Clip.hardEdge,
          restorationId: namedArgs['restorationId'] as String?,
          children: (namedArgs['children'] as List? ?? []).cast(),
        );
      },
      'builder': (visitor, positionalArgs, namedArgs) {
        return GridView.builder(
          key: namedArgs.get<Key?>('key'),
          scrollDirection:
              namedArgs['scrollDirection'] as Axis? ?? Axis.vertical,
          reverse: namedArgs['reverse'] as bool? ?? false,
          controller: namedArgs['controller'] as ScrollController?,
          primary: namedArgs['primary'] as bool?,
          physics: namedArgs['physics'] as ScrollPhysics?,
          shrinkWrap: namedArgs['shrinkWrap'] as bool? ?? false,
          padding: namedArgs['padding'] as EdgeInsetsGeometry?,
          gridDelegate: namedArgs['gridDelegate'] as SliverGridDelegate,
          itemBuilder: _handleItemBuilder(visitor, namedArgs['itemBuilder'])!,
          itemCount: namedArgs['itemCount'] as int?,
          addAutomaticKeepAlives:
              namedArgs['addAutomaticKeepAlives'] as bool? ?? true,
          addRepaintBoundaries:
              namedArgs['addRepaintBoundaries'] as bool? ?? true,
          addSemanticIndexes: namedArgs['addSemanticIndexes'] as bool? ?? true,
          cacheExtent: toDouble(namedArgs['cacheExtent']),
          semanticChildCount: namedArgs['semanticChildCount'] as int?,
          dragStartBehavior:
              namedArgs['dragStartBehavior'] as DragStartBehavior? ??
              DragStartBehavior.start,
          clipBehavior: namedArgs['clipBehavior'] as Clip? ?? Clip.hardEdge,
          restorationId: namedArgs['restorationId'] as String?,
        );
      },
      'count': (visitor, positionalArgs, namedArgs) {
        return GridView.count(
          key: namedArgs.get<Key?>('key'),
          scrollDirection:
              namedArgs['scrollDirection'] as Axis? ?? Axis.vertical,
          reverse: namedArgs['reverse'] as bool? ?? false,
          controller: namedArgs['controller'] as ScrollController?,
          primary: namedArgs['primary'] as bool?,
          physics: namedArgs['physics'] as ScrollPhysics?,
          shrinkWrap: namedArgs['shrinkWrap'] as bool? ?? false,
          padding: namedArgs['padding'] as EdgeInsetsGeometry?,
          crossAxisCount: namedArgs['crossAxisCount'] as int,
          mainAxisSpacing: toDouble(namedArgs['mainAxisSpacing']) ?? 0.0,
          crossAxisSpacing: toDouble(namedArgs['crossAxisSpacing']) ?? 0.0,
          childAspectRatio: toDouble(namedArgs['childAspectRatio']) ?? 1.0,
          addAutomaticKeepAlives:
              namedArgs['addAutomaticKeepAlives'] as bool? ?? true,
          addRepaintBoundaries:
              namedArgs['addRepaintBoundaries'] as bool? ?? true,
          addSemanticIndexes: namedArgs['addSemanticIndexes'] as bool? ?? true,
          cacheExtent: toDouble(namedArgs['cacheExtent']),
          semanticChildCount: namedArgs['semanticChildCount'] as int?,
          dragStartBehavior:
              namedArgs['dragStartBehavior'] as DragStartBehavior? ??
              DragStartBehavior.start,
          clipBehavior: namedArgs['clipBehavior'] as Clip? ?? Clip.hardEdge,
          restorationId: namedArgs['restorationId'] as String?,
          children: (namedArgs['children'] as List? ?? []).cast(),
        );
      },
      'extent': (visitor, positionalArgs, namedArgs) {
        return GridView.extent(
          key: namedArgs.get<Key?>('key'),
          scrollDirection:
              namedArgs['scrollDirection'] as Axis? ?? Axis.vertical,
          reverse: namedArgs['reverse'] as bool? ?? false,
          controller: namedArgs['controller'] as ScrollController?,
          primary: namedArgs['primary'] as bool?,
          physics: namedArgs['physics'] as ScrollPhysics?,
          shrinkWrap: namedArgs['shrinkWrap'] as bool? ?? false,
          padding: namedArgs['padding'] as EdgeInsetsGeometry?,
          maxCrossAxisExtent: toDouble(namedArgs['maxCrossAxisExtent']),
          mainAxisSpacing: toDouble(namedArgs['mainAxisSpacing']) ?? 0.0,
          crossAxisSpacing: toDouble(namedArgs['crossAxisSpacing']) ?? 0.0,
          childAspectRatio: toDouble(namedArgs['childAspectRatio']) ?? 1.0,
          addAutomaticKeepAlives:
              namedArgs['addAutomaticKeepAlives'] as bool? ?? true,
          addRepaintBoundaries:
              namedArgs['addRepaintBoundaries'] as bool? ?? true,
          addSemanticIndexes: namedArgs['addSemanticIndexes'] as bool? ?? true,
          cacheExtent: toDouble(namedArgs['cacheExtent']),
          semanticChildCount: namedArgs['semanticChildCount'] as int?,
          dragStartBehavior:
              namedArgs['dragStartBehavior'] as DragStartBehavior? ??
              DragStartBehavior.start,
          clipBehavior: namedArgs['clipBehavior'] as Clip? ?? Clip.hardEdge,
          restorationId: namedArgs['restorationId'] as String?,
          children: (namedArgs['children'] as List? ?? []).cast(),
        );
      },
    },
  );
}

// PageView bridging
BridgedClass getPageViewBridgingDefinition() {
  return BridgedClass(
    nativeType: PageView,
    name: 'PageView',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return PageView(
          key: namedArgs.get<Key?>('key'),
          scrollDirection:
              namedArgs['scrollDirection'] as Axis? ?? Axis.horizontal,
          reverse: namedArgs['reverse'] as bool? ?? false,
          controller: namedArgs['controller'] as PageController?,
          physics: namedArgs['physics'] as ScrollPhysics?,
          pageSnapping: namedArgs['pageSnapping'] as bool? ?? true,
          onPageChanged: namedArgs.handleValueCallback<int>(
            'onPageChanged',
            visitor,
          ),
          dragStartBehavior:
              namedArgs['dragStartBehavior'] as DragStartBehavior? ??
              DragStartBehavior.start,
          allowImplicitScrolling:
              namedArgs['allowImplicitScrolling'] as bool? ?? false,
          restorationId: namedArgs['restorationId'] as String?,
          clipBehavior: namedArgs['clipBehavior'] as Clip? ?? Clip.hardEdge,
          children: (namedArgs['children'] as List? ?? []).cast(),
        );
      },
      'builder': (visitor, positionalArgs, namedArgs) {
        return PageView.builder(
          key: namedArgs.get<Key?>('key'),
          scrollDirection:
              namedArgs['scrollDirection'] as Axis? ?? Axis.horizontal,
          reverse: namedArgs['reverse'] as bool? ?? false,
          controller: namedArgs['controller'] as PageController?,
          physics: namedArgs['physics'] as ScrollPhysics?,
          pageSnapping: namedArgs['pageSnapping'] as bool? ?? true,
          onPageChanged: namedArgs.handleValueCallback<int>(
            'onPageChanged',
            visitor,
          ),
          itemBuilder: _handleItemBuilder(visitor, namedArgs['itemBuilder'])!,
          itemCount: namedArgs['itemCount'] as int?,
          dragStartBehavior:
              namedArgs['dragStartBehavior'] as DragStartBehavior? ??
              DragStartBehavior.start,
          allowImplicitScrolling:
              namedArgs['allowImplicitScrolling'] as bool? ?? false,
          restorationId: namedArgs['restorationId'] as String?,
          clipBehavior: namedArgs['clipBehavior'] as Clip? ?? Clip.hardEdge,
        );
      },
    },
  );
}

BridgedClass getSliverGridDelegateWithFixedCrossAxisCountBridgingDefinition() {
  return BridgedClass(
    nativeType: SliverGridDelegateWithFixedCrossAxisCount,
    name: 'SliverGridDelegateWithFixedCrossAxisCount',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: namedArgs.get<int>('crossAxisCount')!,
          mainAxisSpacing:
              toDouble(namedArgs.get<dynamic>('mainAxisSpacing')) ?? 0.0,
          crossAxisSpacing:
              toDouble(namedArgs.get<dynamic>('crossAxisSpacing')) ?? 0.0,
          childAspectRatio:
              toDouble(namedArgs.get<dynamic>('childAspectRatio')) ?? 1.0,
        );
      },
    },
  );
}

BridgedClass getSliverGridDelegateWithMaxCrossAxisExtentBridgingDefinition() {
  return BridgedClass(
    nativeType: SliverGridDelegateWithMaxCrossAxisExtent,
    name: 'SliverGridDelegateWithMaxCrossAxisExtent',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: namedArgs.getToDouble('maxCrossAxisExtent')!,
          mainAxisExtent: namedArgs.getToDouble('mainAxisExtent'),
          mainAxisSpacing:
              toDouble(namedArgs.get<dynamic>('mainAxisSpacing')) ?? 0.0,
          crossAxisSpacing:
              toDouble(namedArgs.get<dynamic>('crossAxisSpacing')) ?? 0.0,
          childAspectRatio:
              toDouble(namedArgs.get<dynamic>('childAspectRatio')) ?? 1.0,
        );
      },
    },
  );
}
