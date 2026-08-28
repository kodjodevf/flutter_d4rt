import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for the Flutter TabBar widget.
BridgedClass getTabBarBridgingDefinition() {
  return BridgedClass(
    nativeType: TabBar,
    name: 'TabBar',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final controller = namedArgs.get<TabController?>('controller');
        final isScrollable = namedArgs.get<bool?>('isScrollable') ?? false;
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding');
        final indicatorColor = namedArgs.get<Color?>('indicatorColor');
        final indicatorWeight = namedArgs.getToDouble('indicatorWeight') ?? 2.0;
        final indicatorPadding =
            namedArgs.get<EdgeInsetsGeometry?>('indicatorPadding') ??
            EdgeInsets.zero;
        final labelColor = namedArgs.get<Color?>('labelColor');
        final unselectedLabelColor = namedArgs.get<Color?>(
          'unselectedLabelColor',
        );
        final labelStyle = namedArgs.get<TextStyle?>('labelStyle');
        final unselectedLabelStyle = namedArgs.get<TextStyle?>(
          'unselectedLabelStyle',
        );
        final tabAlignment = namedArgs.get<TabAlignment?>('tabAlignment');
        final tabs = visitor.toWidgets(namedArgs['tabs']);

        return TabBar(
          key: key,
          tabs: tabs,
          controller: controller,
          isScrollable: isScrollable,
          padding: padding,
          indicatorColor: indicatorColor,
          indicatorWeight: indicatorWeight,
          indicatorPadding: indicatorPadding,
          labelColor: labelColor,
          unselectedLabelColor: unselectedLabelColor,
          labelStyle: labelStyle,
          unselectedLabelStyle: unselectedLabelStyle,
          tabAlignment: tabAlignment,
        );
      },
    },
    getters: {
      'tabs': (visitor, target) => (target as TabBar).tabs,
      'controller': (visitor, target) => (target as TabBar).controller,
      'isScrollable': (visitor, target) => (target as TabBar).isScrollable,
      'indicatorColor': (visitor, target) => (target as TabBar).indicatorColor,
      'indicatorWeight': (visitor, target) =>
          (target as TabBar).indicatorWeight,
      'key': (visitor, target) => (target as TabBar).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter Tab widget.
BridgedClass getTabBridgingDefinition() {
  return BridgedClass(
    nativeType: Tab,
    name: 'Tab',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final text = namedArgs.get<String?>('text');
        final height = namedArgs.getToDouble('height');

        final icon = visitor.toWidgets(namedArgs['icon']);
        final child = visitor.toWidgets(namedArgs['child']);

        return Tab(
          key: key,
          text: text,
          icon: icon,
          height: height,
          child: child,
        );
      },
    },
    getters: {
      'text': (visitor, target) => (target as Tab).text,
      'icon': (visitor, target) => (target as Tab).icon,
      'child': (visitor, target) => (target as Tab).child,
      'height': (visitor, target) => (target as Tab).height,
      'key': (visitor, target) => (target as Tab).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter TabBarView widget.
BridgedClass getTabBarViewBridgingDefinition() {
  return BridgedClass(
    nativeType: TabBarView,
    name: 'TabBarView',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final controller = namedArgs.get<TabController?>('controller');
        final physics = namedArgs.get<ScrollPhysics?>('physics');
        final dragStartBehavior =
            namedArgs.get<DragStartBehavior?>('dragStartBehavior') ??
            DragStartBehavior.start;

        final children = visitor.toWidgets(namedArgs['children']);

        return TabBarView(
          key: key,
          controller: controller,
          physics: physics,
          dragStartBehavior: dragStartBehavior,
          children: children,
        );
      },
    },
    getters: {
      'children': (visitor, target) => (target as TabBarView).children,
      'controller': (visitor, target) => (target as TabBarView).controller,
      'physics': (visitor, target) => (target as TabBarView).physics,
      'key': (visitor, target) => (target as TabBarView).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter DefaultTabController widget.
BridgedClass getDefaultTabControllerBridgingDefinition() {
  return BridgedClass(
    nativeType: DefaultTabController,
    name: 'DefaultTabController',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final length = namedArgs.get<int?>('length') ?? 0;
        final initialIndex = namedArgs.get<int?>('initialIndex') ?? 0;
        final animationDuration = namedArgs.get<Duration?>('animationDuration');
        final child = visitor.toWidgets(namedArgs['child']);

        return DefaultTabController(
          key: key,
          length: length,
          initialIndex: initialIndex,
          animationDuration: animationDuration,
          child: child!,
        );
      },
    },
    getters: {
      'length': (visitor, target) => (target as DefaultTabController).length,
      'initialIndex': (visitor, target) =>
          (target as DefaultTabController).initialIndex,
      'child': (visitor, target) => (target as DefaultTabController).child,
      'key': (visitor, target) => (target as DefaultTabController).key,
    },
  );
}

class _FallbackTickerProvider implements TickerProvider {
  const _FallbackTickerProvider();
  @override
  Ticker createTicker(TickerCallback onTick) => Ticker(onTick);
}

/// Returns the BridgedClass for the Flutter TabController.
BridgedClass getTabControllerBridgingDefinition() {
  return BridgedClass(
    nativeType: TabController,
    name: 'TabController',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final length = namedArgs.get<int?>('length') ??
            (positionalArgs.isNotEmpty ? positionalArgs[0] as int : 0);
        final initialIndex = namedArgs.get<int?>('initialIndex') ?? 0;
        final animationDuration = namedArgs.get<Duration?>('animationDuration');
        final rawVsync = namedArgs['vsync'];
        final TickerProvider vsync = rawVsync is TickerProvider
            ? rawVsync
            : (rawVsync is BridgedInstance &&
                    rawVsync.nativeObject is TickerProvider
                ? rawVsync.nativeObject as TickerProvider
                : const _FallbackTickerProvider());

        return TabController(
          length: length,
          initialIndex: initialIndex,
          animationDuration: animationDuration,
          vsync: vsync,
        );
      },
    },
    getters: {
      'index': (visitor, target) => (target as TabController).index,
      'previousIndex': (visitor, target) =>
          (target as TabController).previousIndex,
      'length': (visitor, target) => (target as TabController).length,
      'indexIsChanging': (visitor, target) =>
          (target as TabController).indexIsChanging,
      'offset': (visitor, target) => (target as TabController).offset,
    },
    setters: {
      'index': (visitor, target, value) =>
          (target as TabController).index = value as int,
      'offset': (visitor, target, value) =>
          (target as TabController).offset = (value as num).toDouble(),
    },
    methods: {
      'animateTo': (visitor, target, positionalArgs, namedArgs) {
        final value = positionalArgs.isNotEmpty
            ? positionalArgs[0] as int
            : namedArgs['value'] as int? ?? 0;
        final duration = namedArgs.get<Duration?>('duration');
        final curve = namedArgs.get<Curve?>('curve') ?? Curves.ease;
        (target as TabController).animateTo(
          value,
          duration: duration,
          curve: curve,
        );
        return null;
      },
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        (target as TabController).dispose();
        return null;
      },
    },
    isSubtypeOfFunc: (value) => value is TabController,
  );
}
