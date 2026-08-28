import 'package:d4rt/d4rt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for Flutter CupertinoApp.
BridgedClass getCupertinoAppBridgingDefinition() {
  return BridgedClass(
    nativeType: CupertinoApp,
    name: 'CupertinoApp',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final home = visitor.toWidget(namedArgs['home']);
        final theme = namedArgs.get<CupertinoThemeData?>('theme');
        final title = namedArgs.get<String?>('title') ?? '';
        final color = namedArgs.get<Color?>('color');
        final debugShowCheckedModeBanner =
            namedArgs.get<bool?>('debugShowCheckedModeBanner') ?? true;

        return CupertinoApp(
          key: key,
          home: home,
          theme: theme,
          title: title,
          color: color,
          debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        );
      },
    },
    getters: {
      'home': (visitor, target) => (target as CupertinoApp).home,
      'theme': (visitor, target) => (target as CupertinoApp).theme,
      'title': (visitor, target) => (target as CupertinoApp).title,
    },
  );
}

/// Returns the BridgedClass for Flutter CupertinoPageScaffold.
BridgedClass getCupertinoPageScaffoldBridgingDefinition() {
  return BridgedClass(
    nativeType: CupertinoPageScaffold,
    name: 'CupertinoPageScaffold',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final navigationBarRaw = namedArgs['navigationBar'];
        final ObstructingPreferredSizeWidget? navigationBar =
            navigationBarRaw is ObstructingPreferredSizeWidget
                ? navigationBarRaw
                : (navigationBarRaw is BridgedInstance
                    ? navigationBarRaw.nativeObject
                        as ObstructingPreferredSizeWidget?
                    : null);
        final child = visitor.toWidget(namedArgs['child']) ?? const SizedBox();
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final resizeToAvoidBottomInset =
            namedArgs.get<bool?>('resizeToAvoidBottomInset') ?? true;

        return CupertinoPageScaffold(
          key: key,
          navigationBar: navigationBar,
          backgroundColor: backgroundColor,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          child: child,
        );
      },
    },
    getters: {
      'navigationBar': (visitor, target) =>
          (target as CupertinoPageScaffold).navigationBar,
      'child': (visitor, target) => (target as CupertinoPageScaffold).child,
      'backgroundColor': (visitor, target) =>
          (target as CupertinoPageScaffold).backgroundColor,
    },
  );
}

/// Returns the BridgedClass for Flutter CupertinoNavigationBar.
BridgedClass getCupertinoNavigationBarBridgingDefinition() {
  return BridgedClass(
    nativeType: CupertinoNavigationBar,
    name: 'CupertinoNavigationBar',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final leading = visitor.toWidget(namedArgs['leading']);
        final automaticallyImplyLeading =
            namedArgs.get<bool?>('automaticallyImplyLeading') ?? true;
        final previousPageTitle = namedArgs.get<String?>('previousPageTitle');
        final middle = visitor.toWidget(namedArgs['middle']);
        final trailing = visitor.toWidget(namedArgs['trailing']);
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final padding = namedArgs.get<EdgeInsetsDirectional?>('padding');
        final transitionBetweenRoutes =
            namedArgs.get<bool?>('transitionBetweenRoutes') ?? true;

        return CupertinoNavigationBar(
          key: key,
          leading: leading,
          automaticallyImplyLeading: automaticallyImplyLeading,
          previousPageTitle: previousPageTitle,
          middle: middle,
          trailing: trailing,
          backgroundColor: backgroundColor,
          padding: padding,
          transitionBetweenRoutes: transitionBetweenRoutes,
        );
      },
    },
    getters: {
      'leading': (visitor, target) =>
          (target as CupertinoNavigationBar).leading,
      'middle': (visitor, target) => (target as CupertinoNavigationBar).middle,
      'trailing': (visitor, target) =>
          (target as CupertinoNavigationBar).trailing,
      'backgroundColor': (visitor, target) =>
          (target as CupertinoNavigationBar).backgroundColor,
    },
  );
}

/// Returns the BridgedClass for Flutter CupertinoPageRoute.
BridgedClass getCupertinoPageRouteBridgingDefinition() {
  return BridgedClass(
    nativeType: CupertinoPageRoute,
    name: 'CupertinoPageRoute',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final builderRaw = namedArgs['builder'];
        final title = namedArgs.get<String?>('title');
        final maintainState = namedArgs.get<bool?>('maintainState') ?? true;
        final fullscreenDialog =
            namedArgs.get<bool?>('fullscreenDialog') ?? false;

        return CupertinoPageRoute(
          title: title,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
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
      'title': (visitor, target) => (target as CupertinoPageRoute).title,
    },
  );
}

/// Returns the BridgedClass for Flutter CupertinoThemeData.
BridgedClass getCupertinoThemeDataBridgingDefinition() {
  return BridgedClass(
    nativeType: CupertinoThemeData,
    name: 'CupertinoThemeData',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final brightness = namedArgs.get<Brightness?>('brightness');
        final primaryColor = namedArgs.get<Color?>('primaryColor');
        final primaryContrastingColor =
            namedArgs.get<Color?>('primaryContrastingColor');
        final barBackgroundColor =
            namedArgs.get<Color?>('barBackgroundColor');
        final scaffoldBackgroundColor =
            namedArgs.get<Color?>('scaffoldBackgroundColor');

        return CupertinoThemeData(
          brightness: brightness,
          primaryColor: primaryColor,
          primaryContrastingColor: primaryContrastingColor,
          barBackgroundColor: barBackgroundColor,
          scaffoldBackgroundColor: scaffoldBackgroundColor,
        );
      },
    },
    getters: {
      'brightness': (visitor, target) =>
          (target as CupertinoThemeData).brightness,
      'primaryColor': (visitor, target) =>
          (target as CupertinoThemeData).primaryColor,
      'primaryContrastingColor': (visitor, target) =>
          (target as CupertinoThemeData).primaryContrastingColor,
      'barBackgroundColor': (visitor, target) =>
          (target as CupertinoThemeData).barBackgroundColor,
      'scaffoldBackgroundColor': (visitor, target) =>
          (target as CupertinoThemeData).scaffoldBackgroundColor,
    },
  );
}
