import 'package:d4rt/d4rt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for Flutter CupertinoTabBar.
BridgedClass getCupertinoTabBarBridgingDefinition() {
  return BridgedClass(
    nativeType: CupertinoTabBar,
    name: 'CupertinoTabBar',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final itemsRaw = namedArgs['items'];
        final List<BottomNavigationBarItem> items = [];
        if (itemsRaw is List) {
          items.addAll(
            itemsRaw
                .map((e) => e is BridgedInstance ? e.nativeObject : e)
                .whereType<BottomNavigationBarItem>(),
          );
        }
        final onTap = namedArgs.handleValueCallback<int>('onTap', visitor);
        final currentIndex = namedArgs.get<int?>('currentIndex') ?? 0;
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final activeColor = namedArgs.get<Color?>('activeColor');
        final inactiveColor = namedArgs.get<Color?>('inactiveColor') ??
            CupertinoColors.inactiveGray;
        final iconSize = (namedArgs['iconSize'] as num?)?.toDouble() ?? 30.0;
        final height = (namedArgs['height'] as num?)?.toDouble() ?? 50.0;

        return CupertinoTabBar(
          key: key,
          items: items,
          onTap: onTap,
          currentIndex: currentIndex,
          backgroundColor: backgroundColor,
          activeColor: activeColor,
          inactiveColor: inactiveColor,
          iconSize: iconSize,
          height: height,
        );
      },
    },
    getters: {
      'items': (visitor, target) => (target as CupertinoTabBar).items,
      'currentIndex': (visitor, target) => (target as CupertinoTabBar).currentIndex,
      'backgroundColor': (visitor, target) => (target as CupertinoTabBar).backgroundColor,
      'activeColor': (visitor, target) => (target as CupertinoTabBar).activeColor,
      'inactiveColor': (visitor, target) => (target as CupertinoTabBar).inactiveColor,
      'iconSize': (visitor, target) => (target as CupertinoTabBar).iconSize,
      'height': (visitor, target) => (target as CupertinoTabBar).height,
    },
  );
}

/// Returns the BridgedClass for Flutter CupertinoTabScaffold.
BridgedClass getCupertinoTabScaffoldBridgingDefinition() {
  return BridgedClass(
    nativeType: CupertinoTabScaffold,
    name: 'CupertinoTabScaffold',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final tabBar = namedArgs.get<CupertinoTabBar>('tabBar')!;
        final controller = namedArgs.get<CupertinoTabController?>('controller');
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final resizeToAvoidBottomInset =
            namedArgs.get<bool?>('resizeToAvoidBottomInset') ?? true;
        final tabBuilderRaw = namedArgs['tabBuilder'];

        return CupertinoTabScaffold(
          key: key,
          tabBar: tabBar,
          controller: controller,
          backgroundColor: backgroundColor,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          tabBuilder: (BuildContext context, int index) {
            if (tabBuilderRaw is InterpretedFunction) {
              final result = tabBuilderRaw.call(visitor, [context, index], {});
              final widget = visitor.toWidget(result);
              return widget ?? const SizedBox();
            }
            return const SizedBox();
          },
        );
      },
    },
    getters: {
      'tabBar': (visitor, target) => (target as CupertinoTabScaffold).tabBar,
      'controller': (visitor, target) => (target as CupertinoTabScaffold).controller,
      'backgroundColor': (visitor, target) => (target as CupertinoTabScaffold).backgroundColor,
      'resizeToAvoidBottomInset': (visitor, target) =>
          (target as CupertinoTabScaffold).resizeToAvoidBottomInset,
    },
  );
}

/// Returns the BridgedClass for Flutter CupertinoTabController.
BridgedClass getCupertinoTabControllerBridgingDefinition() {
  return BridgedClass(
    nativeType: CupertinoTabController,
    name: 'CupertinoTabController',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final initialIndex = namedArgs.get<int?>('initialIndex') ?? 0;
        return CupertinoTabController(initialIndex: initialIndex);
      },
    },
    getters: {
      'index': (visitor, target) => (target as CupertinoTabController).index,
    },
    setters: {
      'index': (visitor, target, value) =>
          (target as CupertinoTabController).index = value as int,
    },
  );
}

/// Returns the BridgedClass for Flutter CupertinoTabView.
BridgedClass getCupertinoTabViewBridgingDefinition() {
  return BridgedClass(
    nativeType: CupertinoTabView,
    name: 'CupertinoTabView',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final builderRaw = namedArgs['builder'];
        final defaultTitle = namedArgs.get<String?>('defaultTitle');

        return CupertinoTabView(
          key: key,
          defaultTitle: defaultTitle,
          builder: (BuildContext context) {
            if (builderRaw is InterpretedFunction) {
              final result = builderRaw.call(visitor, [context], {});
              final widget = visitor.toWidget(result);
              return widget ?? const SizedBox();
            }
            return const SizedBox();
          },
        );
      },
    },
    getters: {
      'defaultTitle': (visitor, target) => (target as CupertinoTabView).defaultTitle,
    },
  );
}
