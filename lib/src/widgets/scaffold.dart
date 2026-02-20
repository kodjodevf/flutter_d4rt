import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// ScaffoldMessenger bridging definition for flutter_d4rt

/// Returns the BridgedClass for the Flutter ScaffoldMessenger widget.
BridgedClass getScaffoldMessengerBridgingDefinition() {
  return BridgedClass(
    nativeType: ScaffoldMessenger,
    name: 'ScaffoldMessenger',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final child = visitor.toWidgets(namedArgs['child']);

        return ScaffoldMessenger(key: key, child: child);
      },
    },
    getters: {
      'child': (visitor, target) => (target as ScaffoldMessenger).child,
      'key': (visitor, target) => (target as ScaffoldMessenger).key,
    },
    staticMethods: {
      'of': (visitor, positionalArgs, namedArgs) {
        final context = positionalArgs[0] as BuildContext;
        return ScaffoldMessenger.of(context);
      },
      'maybeOf': (visitor, positionalArgs, namedArgs) {
        final context = positionalArgs[0] as BuildContext;
        return ScaffoldMessenger.maybeOf(context);
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter ScaffoldMessengerState.
BridgedClass getScaffoldMessengerStateBridgingDefinition() {
  return BridgedClass(
    nativeType: ScaffoldMessengerState,
    name: 'ScaffoldMessengerState',
    constructors: {},
    methods: {
      'showSnackBar': (visitor, target, positionalArgs, namedArgs) {
        final state = target as ScaffoldMessengerState;
        final snackBar = positionalArgs[0] as SnackBar;
        return state.showSnackBar(snackBar);
      },
      'hideCurrentSnackBar': (visitor, target, positionalArgs, namedArgs) {
        final state = target as ScaffoldMessengerState;
        final reason =
            namedArgs.get<SnackBarClosedReason?>('reason') ??
            SnackBarClosedReason.hide;
        state.hideCurrentSnackBar(reason: reason);
        return null;
      },
      'removeCurrentSnackBar': (visitor, target, positionalArgs, namedArgs) {
        final state = target as ScaffoldMessengerState;
        final reason =
            namedArgs.get<SnackBarClosedReason?>('reason') ??
            SnackBarClosedReason.remove;
        state.removeCurrentSnackBar(reason: reason);
        return null;
      },
      'clearSnackBars': (visitor, target, positionalArgs, namedArgs) {
        final state = target as ScaffoldMessengerState;
        state.clearSnackBars();
        return null;
      },
      'showMaterialBanner': (visitor, target, positionalArgs, namedArgs) {
        final state = target as ScaffoldMessengerState;
        final materialBanner = positionalArgs[0] as MaterialBanner;
        return state.showMaterialBanner(materialBanner);
      },
      'hideCurrentMaterialBanner':
          (visitor, target, positionalArgs, namedArgs) {
            final state = target as ScaffoldMessengerState;
            final reason =
                namedArgs.get<MaterialBannerClosedReason?>('reason') ??
                MaterialBannerClosedReason.hide;
            state.hideCurrentMaterialBanner(reason: reason);
            return null;
          },
      'removeCurrentMaterialBanner':
          (visitor, target, positionalArgs, namedArgs) {
            final state = target as ScaffoldMessengerState;
            final reason =
                namedArgs.get<MaterialBannerClosedReason?>('reason') ??
                MaterialBannerClosedReason.remove;
            state.removeCurrentMaterialBanner(reason: reason);
            return null;
          },
      'clearMaterialBanners': (visitor, target, positionalArgs, namedArgs) {
        final state = target as ScaffoldMessengerState;
        state.clearMaterialBanners();
        return null;
      },
    },
    getters: {
      'widget': (visitor, target) => (target as ScaffoldMessengerState).widget,
      'context': (visitor, target) =>
          (target as ScaffoldMessengerState).context,
      'mounted': (visitor, target) =>
          (target as ScaffoldMessengerState).mounted,
    },
  );
}

/// Returns the BridgedClass for the ScaffoldFeatureController.
BridgedClass getScaffoldFeatureControllerBridgingDefinition() {
  return BridgedClass(
    nativeType: ScaffoldFeatureController,
    name: 'ScaffoldFeatureController',
    constructors: {},
    methods: {
      'close': (visitor, target, positionalArgs, namedArgs) {
        final controller = target as ScaffoldFeatureController;
        controller.close();
        return null;
      },
    },
    getters: {
      'closed': (visitor, target) =>
          (target as ScaffoldFeatureController).closed,
    },
  );
}

/// Returns the BridgedEnumDefinition for SnackBarClosedReason.
BridgedEnumDefinition getSnackBarClosedReasonBridgingDefinition() {
  return BridgedEnumDefinition<SnackBarClosedReason>(
    name: 'SnackBarClosedReason',
    values: SnackBarClosedReason.values,
    getters: {
      'name': (visitor, target) => (target as SnackBarClosedReason).name,
      'index': (visitor, target) => (target as SnackBarClosedReason).index,
    },
  );
}

/// Returns the BridgedEnumDefinition for MaterialBannerClosedReason.
BridgedEnumDefinition getMaterialBannerClosedReasonBridgingDefinition() {
  return BridgedEnumDefinition<MaterialBannerClosedReason>(
    name: 'MaterialBannerClosedReason',
    values: MaterialBannerClosedReason.values,
    getters: {
      'name': (visitor, target) => (target as MaterialBannerClosedReason).name,
      'index': (visitor, target) =>
          (target as MaterialBannerClosedReason).index,
    },
  );
}

/// Returns the BridgedClass for MaterialBanner widget.
BridgedClass getMaterialBannerBridgingDefinition() {
  return BridgedClass(
    nativeType: MaterialBanner,
    name: 'MaterialBanner',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final content = visitor.toWidgets(namedArgs['content']);
        final contentTextStyle = namedArgs.get<TextStyle?>('contentTextStyle');
        final actions = visitor.toWidgets(namedArgs['actions']) ?? [];
        final elevation = namedArgs.getToDouble('elevation');
        final leading = visitor.toWidgets(namedArgs['leading']);
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final surfaceTintColor = namedArgs.get<Color?>('surfaceTintColor');
        final shadowColor = namedArgs.get<Color?>('shadowColor');
        final dividerColor = namedArgs.get<Color?>('dividerColor');
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding');
        final leadingPadding = namedArgs.get<EdgeInsetsGeometry?>(
          'leadingPadding',
        );
        final forceActionsBelow =
            namedArgs.get<bool?>('forceActionsBelow') ?? false;
        final overflowAlignment =
            namedArgs.get<OverflowBarAlignment?>('overflowAlignment') ??
            OverflowBarAlignment.end;
        final animation = namedArgs.get<Animation<double>?>('animation');
        final onVisible = namedArgs.handleVoidCallback('onVisible', visitor);

        return MaterialBanner(
          key: key,
          content: content,
          contentTextStyle: contentTextStyle,
          actions: actions,
          elevation: elevation,
          leading: leading,
          backgroundColor: backgroundColor,
          surfaceTintColor: surfaceTintColor,
          shadowColor: shadowColor,
          dividerColor: dividerColor,
          padding: padding,
          leadingPadding: leadingPadding,
          forceActionsBelow: forceActionsBelow,
          overflowAlignment: overflowAlignment,
          animation: animation,
          onVisible: onVisible,
        );
      },
    },
    getters: {
      'content': (visitor, target) => (target as MaterialBanner).content,
      'contentTextStyle': (visitor, target) =>
          (target as MaterialBanner).contentTextStyle,
      'actions': (visitor, target) => (target as MaterialBanner).actions,
      'elevation': (visitor, target) => (target as MaterialBanner).elevation,
      'leading': (visitor, target) => (target as MaterialBanner).leading,
      'backgroundColor': (visitor, target) =>
          (target as MaterialBanner).backgroundColor,
      'surfaceTintColor': (visitor, target) =>
          (target as MaterialBanner).surfaceTintColor,
      'shadowColor': (visitor, target) =>
          (target as MaterialBanner).shadowColor,
      'dividerColor': (visitor, target) =>
          (target as MaterialBanner).dividerColor,
      'padding': (visitor, target) => (target as MaterialBanner).padding,
      'leadingPadding': (visitor, target) =>
          (target as MaterialBanner).leadingPadding,
      'forceActionsBelow': (visitor, target) =>
          (target as MaterialBanner).forceActionsBelow,
      'overflowAlignment': (visitor, target) =>
          (target as MaterialBanner).overflowAlignment,
      'animation': (visitor, target) => (target as MaterialBanner).animation,
      'onVisible': (visitor, target) => (target as MaterialBanner).onVisible,
      'key': (visitor, target) => (target as MaterialBanner).key,
    },
  );
}

/// Returns the BridgedEnumDefinition for OverflowBarAlignment.
BridgedEnumDefinition getOverflowBarAlignmentBridgingDefinition() {
  return BridgedEnumDefinition<OverflowBarAlignment>(
    name: 'OverflowBarAlignment',
    values: OverflowBarAlignment.values,
    getters: {
      'name': (visitor, target) => (target as OverflowBarAlignment).name,
      'index': (visitor, target) => (target as OverflowBarAlignment).index,
    },
  );
}
