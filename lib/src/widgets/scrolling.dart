// ignore_for_file: deprecated_member_use

import 'package:d4rt/d4rt.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart' show Scrollbar;
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
          children: visitor.toWidgetList(namedArgs['children']),
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
          children: visitor.toWidgetList(namedArgs['children']),
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
          children: visitor.toWidgetList(namedArgs['children']),
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
          children: visitor.toWidgetList(namedArgs['children']),
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
          children: visitor.toWidgetList(namedArgs['children']),
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

/// Returns the BridgedClass for ScrollPhysics
BridgedClass getScrollPhysicsBridgingDefinition() {
  return BridgedClass(
    nativeType: ScrollPhysics,
    name: 'ScrollPhysics',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final parent = namedArgs.get<ScrollPhysics?>('parent');
        return ScrollPhysics(parent: parent);
      },
    },
    isSubtypeOfFunc: (value) => value is ScrollPhysics,
  );
}

/// Returns the BridgedClass for NeverScrollableScrollPhysics
BridgedClass getNeverScrollableScrollPhysicsBridgingDefinition() {
  return BridgedClass(
    nativeType: NeverScrollableScrollPhysics,
    name: 'NeverScrollableScrollPhysics',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final parent = namedArgs.get<ScrollPhysics?>('parent');
        return NeverScrollableScrollPhysics(parent: parent);
      },
    },
    isSubtypeOfFunc: (value) => value is NeverScrollableScrollPhysics,
  );
}

/// Returns the BridgedClass for AlwaysScrollableScrollPhysics
BridgedClass getAlwaysScrollableScrollPhysicsBridgingDefinition() {
  return BridgedClass(
    nativeType: AlwaysScrollableScrollPhysics,
    name: 'AlwaysScrollableScrollPhysics',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final parent = namedArgs.get<ScrollPhysics?>('parent');
        return AlwaysScrollableScrollPhysics(parent: parent);
      },
    },
    isSubtypeOfFunc: (value) => value is AlwaysScrollableScrollPhysics,
  );
}

/// Returns the BridgedClass for BouncingScrollPhysics
BridgedClass getBouncingScrollPhysicsBridgingDefinition() {
  return BridgedClass(
    nativeType: BouncingScrollPhysics,
    name: 'BouncingScrollPhysics',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final parent = namedArgs.get<ScrollPhysics?>('parent');
        return BouncingScrollPhysics(parent: parent);
      },
    },
    isSubtypeOfFunc: (value) => value is BouncingScrollPhysics,
  );
}

/// Returns the BridgedClass for ClampingScrollPhysics
BridgedClass getClampingScrollPhysicsBridgingDefinition() {
  return BridgedClass(
    nativeType: ClampingScrollPhysics,
    name: 'ClampingScrollPhysics',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final parent = namedArgs.get<ScrollPhysics?>('parent');
        return ClampingScrollPhysics(parent: parent);
      },
    },
    isSubtypeOfFunc: (value) => value is ClampingScrollPhysics,
  );
}

/// Returns the BridgedClass for ScrollController
BridgedClass getScrollControllerBridgingDefinition() {
  return BridgedClass(
    nativeType: ScrollController,
    name: 'ScrollController',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final initialScrollOffset =
            namedArgs.getToDouble('initialScrollOffset') ?? 0.0;
        final keepScrollOffset =
            namedArgs.get<bool?>('keepScrollOffset') ?? true;
        final debugLabel = namedArgs.get<String?>('debugLabel');
        return ScrollController(
          initialScrollOffset: initialScrollOffset,
          keepScrollOffset: keepScrollOffset,
          debugLabel: debugLabel,
        );
      },
    },
    getters: {
      'offset': (visitor, target) => (target as ScrollController).offset,
      'hasClients': (visitor, target) =>
          (target as ScrollController).hasClients,
      'initialScrollOffset': (visitor, target) =>
          (target as ScrollController).initialScrollOffset,
      'keepScrollOffset': (visitor, target) =>
          (target as ScrollController).keepScrollOffset,
      'debugLabel': (visitor, target) =>
          (target as ScrollController).debugLabel,
    },
    methods: {
      'animateTo': (visitor, target, positionalArgs, namedArgs) {
        final offset =
            toDouble(positionalArgs.isNotEmpty ? positionalArgs[0] : null) ??
                toDouble(namedArgs['offset']) ??
                0.0;
        final duration = namedArgs.get<Duration?>('duration') ??
            (positionalArgs.length > 1
                ? positionalArgs[1] as Duration
                : const Duration(milliseconds: 300));
        final curve = namedArgs.get<Curve?>('curve') ??
            (positionalArgs.length > 2
                ? positionalArgs[2] as Curve
                : Curves.ease);
        return (target as ScrollController).animateTo(
          offset,
          duration: duration,
          curve: curve,
        );
      },
      'jumpTo': (visitor, target, positionalArgs, namedArgs) {
        final value =
            toDouble(positionalArgs.isNotEmpty ? positionalArgs[0] : null) ??
                toDouble(namedArgs['value']) ??
                0.0;
        (target as ScrollController).jumpTo(value);
        return null;
      },
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        (target as ScrollController).dispose();
        return null;
      },
    },
    isSubtypeOfFunc: (value) => value is ScrollController,
  );
}

/// Returns the BridgedClass for PageController
BridgedClass getPageControllerBridgingDefinition() {
  return BridgedClass(
    nativeType: PageController,
    name: 'PageController',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final initialPage = namedArgs.get<int?>('initialPage') ?? 0;
        final keepPage = namedArgs.get<bool?>('keepPage') ?? true;
        final viewportFraction =
            namedArgs.getToDouble('viewportFraction') ?? 1.0;
        return PageController(
          initialPage: initialPage,
          keepPage: keepPage,
          viewportFraction: viewportFraction,
        );
      },
    },
    getters: {
      'page': (visitor, target) => (target as PageController).page,
      'initialPage': (visitor, target) =>
          (target as PageController).initialPage,
      'keepPage': (visitor, target) => (target as PageController).keepPage,
      'viewportFraction': (visitor, target) =>
          (target as PageController).viewportFraction,
      'hasClients': (visitor, target) =>
          (target as PageController).hasClients,
    },
    methods: {
      'animateToPage': (visitor, target, positionalArgs, namedArgs) {
        final page = positionalArgs.isNotEmpty
            ? positionalArgs[0] as int
            : namedArgs['page'] as int? ?? 0;
        final duration = namedArgs.get<Duration?>('duration') ??
            (positionalArgs.length > 1
                ? positionalArgs[1] as Duration
                : const Duration(milliseconds: 300));
        final curve = namedArgs.get<Curve?>('curve') ??
            (positionalArgs.length > 2
                ? positionalArgs[2] as Curve
                : Curves.ease);
        return (target as PageController).animateToPage(
          page,
          duration: duration,
          curve: curve,
        );
      },
      'jumpToPage': (visitor, target, positionalArgs, namedArgs) {
        final page = positionalArgs.isNotEmpty
            ? positionalArgs[0] as int
            : namedArgs['page'] as int? ?? 0;
        (target as PageController).jumpToPage(page);
        return null;
      },
      'nextPage': (visitor, target, positionalArgs, namedArgs) {
        final duration = namedArgs.get<Duration?>('duration') ??
            (positionalArgs.isNotEmpty
                ? positionalArgs[0] as Duration
                : const Duration(milliseconds: 300));
        final curve = namedArgs.get<Curve?>('curve') ??
            (positionalArgs.length > 1
                ? positionalArgs[1] as Curve
                : Curves.ease);
        return (target as PageController).nextPage(
          duration: duration,
          curve: curve,
        );
      },
      'previousPage': (visitor, target, positionalArgs, namedArgs) {
        final duration = namedArgs.get<Duration?>('duration') ??
            (positionalArgs.isNotEmpty
                ? positionalArgs[0] as Duration
                : const Duration(milliseconds: 300));
        final curve = namedArgs.get<Curve?>('curve') ??
            (positionalArgs.length > 1
                ? positionalArgs[1] as Curve
                : Curves.ease);
        return (target as PageController).previousPage(
          duration: duration,
          curve: curve,
        );
      },
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        (target as PageController).dispose();
        return null;
      },
    },
    isSubtypeOfFunc: (value) => value is PageController,
  );
}

/// Returns the BridgedClass for Scrollbar
BridgedClass getScrollbarBridgingDefinition() {
  return BridgedClass(
    nativeType: Scrollbar,
    name: 'Scrollbar',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final child = visitor.toWidgets(namedArgs['child']) ??
            (positionalArgs.isNotEmpty
                ? visitor.toWidgets(positionalArgs[0])
                : const SizedBox.shrink());
        final controller = namedArgs.get<ScrollController?>('controller');
        final thumbVisibility = namedArgs.get<bool?>('thumbVisibility');
        final trackVisibility = namedArgs.get<bool?>('trackVisibility');
        final thickness = namedArgs.getToDouble('thickness');
        final radius = namedArgs.get<Radius?>('radius');
        final interactive = namedArgs.get<bool?>('interactive');

        return Scrollbar(
          key: key,
          controller: controller,
          thumbVisibility: thumbVisibility,
          trackVisibility: trackVisibility,
          thickness: thickness,
          radius: radius,
          interactive: interactive,
          child: child!,
        );
      },
    },
    getters: {
      'child': (visitor, target) => (target as Scrollbar).child,
      'controller': (visitor, target) => (target as Scrollbar).controller,
      'thumbVisibility': (visitor, target) =>
          (target as Scrollbar).thumbVisibility,
      'trackVisibility': (visitor, target) =>
          (target as Scrollbar).trackVisibility,
      'thickness': (visitor, target) => (target as Scrollbar).thickness,
      'radius': (visitor, target) => (target as Scrollbar).radius,
      'key': (visitor, target) => (target as Scrollbar).key,
    },
    isSubtypeOfFunc: (value) => value is Scrollbar,
  );
}

/// Returns the BridgedClass for NestedScrollView
BridgedClass getNestedScrollViewBridgingDefinition() {
  return BridgedClass(
    nativeType: NestedScrollView,
    name: 'NestedScrollView',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final controller = namedArgs.get<ScrollController?>('controller');
        final scrollDirection =
            namedArgs.get<Axis?>('scrollDirection') ?? Axis.vertical;
        final reverse = namedArgs.get<bool?>('reverse') ?? false;
        final physics = namedArgs.get<ScrollPhysics?>('physics');
        final rawHeaderSliverBuilder = namedArgs['headerSliverBuilder'];
        final body =
            visitor.toWidgets(namedArgs['body']) ?? const SizedBox.shrink();
        final floatHeaderSlivers =
            namedArgs.get<bool?>('floatHeaderSlivers') ?? false;
        final clipBehavior =
            namedArgs.get<Clip?>('clipBehavior') ?? Clip.hardEdge;

        NestedScrollViewHeaderSliversBuilder headerSliverBuilder =
            (context, innerBoxIsScrolled) => <Widget>[];

        if (rawHeaderSliverBuilder is InterpretedFunction) {
          headerSliverBuilder =
              (BuildContext context, bool innerBoxIsScrolled) {
            final res = rawHeaderSliverBuilder.call(
              visitor,
              [context, innerBoxIsScrolled],
              {},
            );
            if (res is List) {
              return res
                  .map((e) => visitor.toWidget(e) ?? const SizedBox.shrink())
                  .toList();
            }
            final widget = visitor.toWidget(res);
            if (widget != null) return [widget];
            return <Widget>[];
          };
        }

        return NestedScrollView(
          key: key,
          controller: controller,
          scrollDirection: scrollDirection,
          reverse: reverse,
          physics: physics,
          headerSliverBuilder: headerSliverBuilder,
          body: body!,
          floatHeaderSlivers: floatHeaderSlivers,
          clipBehavior: clipBehavior,
        );
      },
    },
    getters: {
      'controller': (visitor, target) =>
          (target as NestedScrollView).controller,
      'scrollDirection': (visitor, target) =>
          (target as NestedScrollView).scrollDirection,
      'body': (visitor, target) => (target as NestedScrollView).body,
      'key': (visitor, target) => (target as NestedScrollView).key,
    },
    isSubtypeOfFunc: (value) => value is NestedScrollView,
  );
}

