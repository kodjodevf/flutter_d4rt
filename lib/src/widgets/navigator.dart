// ignore_for_file: deprecated_member_use

import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Navigation and routing widgets bridging definitions

// Helper functions for callback handling
void Function(bool, Object?)? _handlePopInvokedCallback(
  InterpreterVisitor visitor,
  dynamic callback,
) {
  if (callback == null) return null;
  if (callback is InterpretedFunction) {
    return (bool didPop, Object? result) =>
        callback.call(visitor, [didPop, result]);
  }
  return callback as void Function(bool, Object?)?;
}

// Navigator bridging
BridgedClass getNavigatorBridgingDefinition() {
  return BridgedClass(
    nativeType: Navigator,
    name: 'Navigator',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return Navigator(
          key: namedArgs.get<Key?>('key'),
          pages: (namedArgs['pages'] as List? ?? []).cast(),
          onPopPage: (route, result) {
            return (namedArgs['onPopPage'] as InterpretedFunction).call(
                  visitor,
                  [route, result],
                )
                as bool;
          },
          initialRoute: namedArgs['initialRoute'] as String?,
          onGenerateInitialRoutes: (navigator, initialRoute) {
            return ((namedArgs['onGenerateInitialRoutes']
                            as InterpretedFunction)
                        .call(visitor, [navigator, initialRoute])
                    as List)
                .cast();
          },
          onGenerateRoute: (settings) {
            return (namedArgs['onGenerateRoute'] as InterpretedFunction).call(
                  visitor,
                  [settings],
                )
                as Route?;
          },
          onUnknownRoute: (settings) {
            return (namedArgs['onUnknownRoute'] as InterpretedFunction).call(
                  visitor,
                  [settings],
                )
                as Route<dynamic>?;
          },
          transitionDelegate:
              namedArgs['transitionDelegate'] as TransitionDelegate<dynamic>? ??
              const DefaultTransitionDelegate<dynamic>(),
          reportsRouteUpdateToEngine:
              namedArgs['reportsRouteUpdateToEngine'] as bool? ?? false,
          clipBehavior: namedArgs['clipBehavior'] as Clip? ?? Clip.hardEdge,
          observers: (namedArgs['observers'] as List? ?? []).cast(),
          requestFocus: namedArgs['requestFocus'] as bool? ?? true,
          routeDirectionalTraversalEdgeBehavior:
              namedArgs.get<TraversalEdgeBehavior?>(
                'routeDirectionalTraversalEdgeBehavior',
              ) ??
              kDefaultRouteDirectionalTraversalEdgeBehavior,
          routeTraversalEdgeBehavior:
              namedArgs.get<TraversalEdgeBehavior?>(
                'routeTraversalEdgeBehavior',
              ) ??
              kDefaultRouteTraversalEdgeBehavior,
          onDidRemovePage: namedArgs['onDidRemovePage'] == null
              ? null
              : (page) {
                  (namedArgs['onDidRemovePage'] as InterpretedFunction).call(
                    visitor,
                    [page],
                  );
                },
          restorationScopeId: namedArgs['restorationScopeId'] as String?,
        );
      },
    },
    staticMethods: {
      'of': (visitor, positionalArgs, namedArgs) {
        final context = positionalArgs[0] as BuildContext;
        final rootNavigator = namedArgs['rootNavigator'] as bool? ?? false;
        return Navigator.of(context, rootNavigator: rootNavigator);
      },
      'maybeOf': (visitor, positionalArgs, namedArgs) {
        final context = positionalArgs[0] as BuildContext;
        final rootNavigator = namedArgs['rootNavigator'] as bool? ?? false;
        return Navigator.maybeOf(context, rootNavigator: rootNavigator);
      },
      'push': (visitor, positionalArgs, namedArgs) {
        final context = positionalArgs[0] as BuildContext;
        final rawRoute = positionalArgs[1];
        final route = (rawRoute is BridgedInstance
            ? rawRoute.nativeObject
            : rawRoute) as Route<Object?>;
        return Navigator.push(context, route);
      },
      'pop': (visitor, positionalArgs, namedArgs) {
        final context = positionalArgs[0] as BuildContext;
        final result = positionalArgs.length > 1
            ? positionalArgs[1]
            : namedArgs['result'];
        return Navigator.pop(context, result);
      },
      'pushNamed': (visitor, positionalArgs, namedArgs) {
        final context = positionalArgs[0] as BuildContext;
        final routeName = positionalArgs[1] as String;
        final arguments = namedArgs['arguments'];
        return Navigator.pushNamed(context, routeName, arguments: arguments);
      },
      'pushReplacementNamed': (visitor, positionalArgs, namedArgs) {
        final context = positionalArgs[0] as BuildContext;
        final routeName = positionalArgs[1] as String;
        final result = namedArgs['result'];
        final arguments = namedArgs['arguments'];
        return Navigator.pushReplacementNamed(
          context,
          routeName,
          result: result,
          arguments: arguments,
        );
      },
      'popAndPushNamed': (visitor, positionalArgs, namedArgs) {
        final context = positionalArgs[0] as BuildContext;
        final routeName = positionalArgs[1] as String;
        final result = namedArgs['result'];
        final arguments = namedArgs['arguments'];
        return Navigator.popAndPushNamed(
          context,
          routeName,
          result: result,
          arguments: arguments,
        );
      },
      'canPop': (visitor, positionalArgs, namedArgs) {
        final context = positionalArgs[0] as BuildContext;
        return Navigator.canPop(context);
      },
    },
  );
}

// Hero bridging
BridgedClass getHeroBridgingDefinition() {
  return BridgedClass(
    nativeType: Hero,
    name: 'Hero',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return Hero(
          key: namedArgs.get<Key?>('key'),
          tag: namedArgs['tag'] as Object,
          createRectTween: namedArgs['createRectTween'] as CreateRectTween?,
          flightShuttleBuilder:
              namedArgs['flightShuttleBuilder'] as HeroFlightShuttleBuilder?,
          placeholderBuilder:
              namedArgs['placeholderBuilder'] as HeroPlaceholderBuilder?,
          transitionOnUserGestures:
              namedArgs['transitionOnUserGestures'] as bool? ?? false,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}

BridgedClass getPageBridgingDefinition() {
  return BridgedClass(
    nativeType: Page,
    name: 'Page',
    getters: {
      'arguments': (visitor, target) => (target as Page).arguments,
      'canPop': (visitor, target) => (target as Page).canPop,
      'key': (visitor, target) => (target as Page).key,
      'onPopInvoked': (visitor, target) => (target as Page).onPopInvoked,
      'restorationId': (visitor, target) => (target as Page).restorationId,
      'name': (visitor, target) => (target as Page).name,
      'hashCode': (visitor, target) => (target as Page).hashCode,
      'runtimeType': (visitor, target) => (target as Page).runtimeType,
    },
  );
}

// WillPopScope bridging (deprecated but still widely used)
BridgedClass getWillPopScopeBridgingDefinition() {
  return BridgedClass(
    nativeType: WillPopScope,
    name: 'WillPopScope',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return WillPopScope(
          key: namedArgs.get<Key?>('key'),
          onWillPop: () {
            final func = namedArgs['onWillPop'] as InterpretedFunction;
            return func.call(visitor, []) as Future<bool>;
          },
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}

// PopScope bridging (newer replacement for WillPopScope)
BridgedClass getPopScopeBridgingDefinition() {
  return BridgedClass(
    nativeType: PopScope,
    name: 'PopScope',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return PopScope(
          key: namedArgs.get<Key?>('key'),
          canPop: namedArgs['canPop'] as bool? ?? true,
          onPopInvokedWithResult: _handlePopInvokedCallback(
            visitor,
            namedArgs['onPopInvokedWithResult'],
          ),
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}

// MaterialPageRoute bridging
BridgedClass getMaterialPageRouteBridgingDefinition() {
  return BridgedClass(
    nativeType: MaterialPageRoute,
    name: 'MaterialPageRoute',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        // Handle builder function
        Widget Function(BuildContext) builder = (context) =>
            const SizedBox.shrink();
        final builderValue = namedArgs['builder'];
        if (builderValue is InterpretedFunction) {
          builder = (context) {
            final result = builderValue.call(visitor, [context]);
            return visitor.toWidgets(result)!;
          };
        } else if (builderValue is Widget Function(BuildContext)) {
          builder = builderValue;
        }

        return MaterialPageRoute(
          builder: builder,
          settings: namedArgs.get<RouteSettings?>('settings'),
          requestFocus: namedArgs.get<bool?>('requestFocus'),
          maintainState: namedArgs.get<bool?>('maintainState') ?? true,
          fullscreenDialog: namedArgs.get<bool?>('fullscreenDialog') ?? false,
          allowSnapshotting: namedArgs.get<bool?>('allowSnapshotting') ?? true,
          barrierDismissible:
              namedArgs.get<bool?>('barrierDismissible') ?? false,
          traversalEdgeBehavior: namedArgs.get<TraversalEdgeBehavior?>(
            'traversalEdgeBehavior',
          ),
          directionalTraversalEdgeBehavior: namedArgs
              .get<TraversalEdgeBehavior?>('directionalTraversalEdgeBehavior'),
        );
      },
    },
    getters: {
      'settings': (visitor, target) => (target as MaterialPageRoute).settings,
      'maintainState': (visitor, target) =>
          (target as MaterialPageRoute).maintainState,
      'fullscreenDialog': (visitor, target) =>
          (target as MaterialPageRoute).fullscreenDialog,
      'allowSnapshotting': (visitor, target) =>
          (target as MaterialPageRoute).allowSnapshotting,
      'barrierDismissible': (visitor, target) =>
          (target as MaterialPageRoute).barrierDismissible,
      'barrierColor': (visitor, target) =>
          (target as MaterialPageRoute).barrierColor,
      'barrierLabel': (visitor, target) =>
          (target as MaterialPageRoute).barrierLabel,
      'transitionDuration': (visitor, target) =>
          (target as MaterialPageRoute).transitionDuration,
      'reverseTransitionDuration': (visitor, target) =>
          (target as MaterialPageRoute).reverseTransitionDuration,
    },
  );
}

// NavigatorState bridging
BridgedClass getNavigatorStateBridgingDefinition() {
  return BridgedClass(
    nativeType: NavigatorState,
    name: 'NavigatorState',
    methods: {
      'push': (visitor, target, positionalArgs, namedArgs) {
        final rawRoute = positionalArgs[0];
        final route = (rawRoute is BridgedInstance
            ? rawRoute.nativeObject
            : rawRoute) as Route<Object?>;
        return (target as NavigatorState).push(route);
      },
      'pushReplacement': (visitor, target, positionalArgs, namedArgs) {
        final rawRoute = positionalArgs[0];
        final newRoute = (rawRoute is BridgedInstance
            ? rawRoute.nativeObject
            : rawRoute) as Route<Object?>;
        final result = namedArgs['result'];
        return (target as NavigatorState).pushReplacement(
          newRoute,
          result: result,
        );
      },
      'pushNamed': (visitor, target, positionalArgs, namedArgs) {
        final routeName = positionalArgs[0] as String;
        final arguments = namedArgs['arguments'];
        return (target as NavigatorState).pushNamed(
          routeName,
          arguments: arguments,
        );
      },
      'pop': (visitor, target, positionalArgs, namedArgs) {
        final result = positionalArgs.isNotEmpty ? positionalArgs[0] : null;
        (target as NavigatorState).pop(result);
        return null;
      },
      'canPop': (visitor, target, positionalArgs, namedArgs) {
        return (target as NavigatorState).canPop();
      },
      'maybePop': (visitor, target, positionalArgs, namedArgs) {
        final result = positionalArgs.isNotEmpty ? positionalArgs[0] : null;
        return (target as NavigatorState).maybePop(result);
      },
    },
    staticMethods: {
      'of': (visitor, positionalArgs, namedArgs) {
        final context = positionalArgs[0] as BuildContext;
        final rootNavigator = namedArgs.get<bool?>('rootNavigator') ?? false;
        return Navigator.of(context, rootNavigator: rootNavigator);
      },
    },
    getters: {'widget': (visitor, target) => (target as NavigatorState).widget},
  );
}

/// Returns the BridgedClass for RouteSettings
BridgedClass getRouteSettingsBridgingDefinition() {
  return BridgedClass(
    nativeType: RouteSettings,
    name: 'RouteSettings',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final name = namedArgs.get<String?>('name');
        final arguments = namedArgs.get<dynamic>('arguments');

        return RouteSettings(name: name, arguments: arguments);
      },
    },
    getters: {
      'name': (visitor, target) => (target as RouteSettings).name,
      'arguments': (visitor, target) => (target as RouteSettings).arguments,
    },
  );
}

/// Returns the BridgedClass for the Flutter Route abstract class.
BridgedClass getRouteBridgingDefinition() {
  return BridgedClass(
    nativeType: Route,
    name: 'Route',
    constructors: {},
    isSubtypeOfFunc: (value) => value is Route,
  );
}

/// Returns the BridgedClass for the Flutter PageRoute abstract class.
BridgedClass getPageRouteBridgingDefinition() {
  return BridgedClass(
    nativeType: PageRoute,
    name: 'PageRoute',
    constructors: {},
    isSubtypeOfFunc: (value) => value is PageRoute,
  );
}

