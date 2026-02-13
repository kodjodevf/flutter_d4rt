import 'package:d4rt/d4rt.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for the Flutter SafeArea widget.
BridgedClass getSafeAreaBridgingDefinition() {
  return BridgedClass(
    nativeType: SafeArea,
    name: 'SafeArea',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final left = namedArgs.get<bool?>('left') ?? true;
        final top = namedArgs.get<bool?>('top') ?? true;
        final right = namedArgs.get<bool?>('right') ?? true;
        final bottom = namedArgs.get<bool?>('bottom') ?? true;
        final minimum =
            namedArgs.get<EdgeInsets?>('minimum') ?? EdgeInsets.zero;
        final maintainBottomViewPadding =
            namedArgs.get<bool?>('maintainBottomViewPadding') ?? false;
        final child =
            visitor.toWidgets(namedArgs['child']) ?? const SizedBox.shrink();

        return SafeArea(
          key: key,
          left: left,
          top: top,
          right: right,
          bottom: bottom,
          minimum: minimum,
          maintainBottomViewPadding: maintainBottomViewPadding,
          child: child,
        );
      },
    },
    getters: {
      'left': (visitor, target) => (target as SafeArea).left,
      'top': (visitor, target) => (target as SafeArea).top,
      'right': (visitor, target) => (target as SafeArea).right,
      'bottom': (visitor, target) => (target as SafeArea).bottom,
      'minimum': (visitor, target) => (target as SafeArea).minimum,
      'maintainBottomViewPadding': (visitor, target) =>
          (target as SafeArea).maintainBottomViewPadding,
      'child': (visitor, target) => (target as SafeArea).child,
      'key': (visitor, target) => (target as SafeArea).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter SliverSafeArea widget.
BridgedClass getSliverSafeAreaBridgingDefinition() {
  return BridgedClass(
    nativeType: SliverSafeArea,
    name: 'SliverSafeArea',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final left = namedArgs.get<bool?>('left') ?? true;
        final top = namedArgs.get<bool?>('top') ?? true;
        final right = namedArgs.get<bool?>('right') ?? true;
        final bottom = namedArgs.get<bool?>('bottom') ?? true;
        final minimum =
            namedArgs.get<EdgeInsets?>('minimum') ?? EdgeInsets.zero;
        final sliver =
            visitor.toWidgets(namedArgs['sliver']) ??
            const SliverToBoxAdapter(child: SizedBox.shrink());

        return SliverSafeArea(
          key: key,
          left: left,
          top: top,
          right: right,
          bottom: bottom,
          minimum: minimum,
          sliver: sliver,
        );
      },
    },
    getters: {
      'left': (visitor, target) => (target as SliverSafeArea).left,
      'top': (visitor, target) => (target as SliverSafeArea).top,
      'right': (visitor, target) => (target as SliverSafeArea).right,
      'bottom': (visitor, target) => (target as SliverSafeArea).bottom,
      'minimum': (visitor, target) => (target as SliverSafeArea).minimum,
      'sliver': (visitor, target) => (target as SliverSafeArea).sliver,
      'key': (visitor, target) => (target as SliverSafeArea).key,
    },
  );
}
