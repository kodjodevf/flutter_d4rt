// ignore_for_file: deprecated_member_use

import 'package:d4rt/d4rt.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_d4rt/utils/double.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for MediaQuery
BridgedClass getMediaQueryBridgingDefinition() {
  return BridgedClass(
    nativeType: MediaQuery,
    name: 'MediaQuery',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final data = namedArgs.get<MediaQueryData>('data');
        final child = visitor.toWidgets(namedArgs['child']);

        return MediaQuery(key: key, data: data!, child: child!);
      },
      'removePadding': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final context = namedArgs.get<BuildContext>('context')!;
        final removeLeft = namedArgs.get<bool?>('removeLeft') ?? false;
        final removeTop = namedArgs.get<bool?>('removeTop') ?? false;
        final removeRight = namedArgs.get<bool?>('removeRight') ?? false;
        final removeBottom = namedArgs.get<bool?>('removeBottom') ?? false;
        final child = visitor.toWidgets(namedArgs['child']);

        return MediaQuery.removePadding(
          key: key,
          context: context,
          removeLeft: removeLeft,
          removeTop: removeTop,
          removeRight: removeRight,
          removeBottom: removeBottom,
          child: child!,
        );
      },
    },
    methods: {
      'of': (visitor, target, positionalArgs, namedArgs) {
        final context = positionalArgs.get<BuildContext>(0)!;
        return MediaQuery.of(context);
      },
      'maybeOf': (visitor, target, positionalArgs, namedArgs) {
        final context = positionalArgs.get<BuildContext>(0)!;
        return MediaQuery.maybeOf(context);
      },
    },
    getters: {
      'data': (visitor, target) => (target as MediaQuery).data,
      'child': (visitor, target) => (target as MediaQuery).child,
      'key': (visitor, target) => (target as MediaQuery).key,
    },
  );
}

/// Returns the BridgedClass for MediaQueryData
BridgedClass getMediaQueryDataBridgingDefinition() {
  return BridgedClass(
    nativeType: MediaQueryData,
    name: 'MediaQueryData',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final size = namedArgs.get<Size>('size') ?? Size.zero;
        final devicePixelRatio =
            toDouble(namedArgs.get<dynamic>('devicePixelRatio')) ?? 1.0;
        final textScaleFactor =
            toDouble(namedArgs.get<dynamic>('textScaleFactor')) ?? 1.0;
        final padding = namedArgs.get<EdgeInsets>('padding') ?? EdgeInsets.zero;
        final viewInsets =
            namedArgs.get<EdgeInsets>('viewInsets') ?? EdgeInsets.zero;
        final systemGestureInsets =
            namedArgs.get<EdgeInsets>('systemGestureInsets') ?? EdgeInsets.zero;
        final viewPadding =
            namedArgs.get<EdgeInsets>('viewPadding') ?? EdgeInsets.zero;
        final alwaysUse24HourFormat =
            namedArgs.get<bool?>('alwaysUse24HourFormat') ?? false;
        final accessibleNavigation =
            namedArgs.get<bool?>('accessibleNavigation') ?? false;
        final invertColors = namedArgs.get<bool?>('invertColors') ?? false;
        final highContrast = namedArgs.get<bool?>('highContrast') ?? false;
        final disableAnimations =
            namedArgs.get<bool?>('disableAnimations') ?? false;
        final boldText = namedArgs.get<bool?>('boldText') ?? false;
        final navigationMode =
            namedArgs.get<NavigationMode>('navigationMode') ??
            NavigationMode.traditional;
        final platformBrightness =
            namedArgs.get<dynamic>('platformBrightness') ?? Brightness.light;

        return MediaQueryData(
          size: size,
          devicePixelRatio: devicePixelRatio,
          textScaleFactor: textScaleFactor,
          padding: padding,
          viewInsets: viewInsets,
          systemGestureInsets: systemGestureInsets,
          viewPadding: viewPadding,
          alwaysUse24HourFormat: alwaysUse24HourFormat,
          accessibleNavigation: accessibleNavigation,
          invertColors: invertColors,
          highContrast: highContrast,
          disableAnimations: disableAnimations,
          boldText: boldText,
          navigationMode: navigationMode,
          platformBrightness: platformBrightness,
        );
      },
      'fromWindow': (visitor, positionalArgs, namedArgs) {
        return MediaQueryData.fromView(
          namedArgs.get<dynamic>('view') ??
              WidgetsBinding.instance.platformDispatcher.views.first,
        );
      },
    },
    getters: {
      'size': (visitor, target) => (target as MediaQueryData).size,
      'devicePixelRatio': (visitor, target) =>
          (target as MediaQueryData).devicePixelRatio,
      'textScaleFactor': (visitor, target) =>
          (target as MediaQueryData).textScaleFactor,
      'padding': (visitor, target) => (target as MediaQueryData).padding,
      'viewInsets': (visitor, target) => (target as MediaQueryData).viewInsets,
      'systemGestureInsets': (visitor, target) =>
          (target as MediaQueryData).systemGestureInsets,
      'viewPadding': (visitor, target) =>
          (target as MediaQueryData).viewPadding,
      'alwaysUse24HourFormat': (visitor, target) =>
          (target as MediaQueryData).alwaysUse24HourFormat,
      'accessibleNavigation': (visitor, target) =>
          (target as MediaQueryData).accessibleNavigation,
      'invertColors': (visitor, target) =>
          (target as MediaQueryData).invertColors,
      'highContrast': (visitor, target) =>
          (target as MediaQueryData).highContrast,
      'disableAnimations': (visitor, target) =>
          (target as MediaQueryData).disableAnimations,
      'boldText': (visitor, target) => (target as MediaQueryData).boldText,
      'navigationMode': (visitor, target) =>
          (target as MediaQueryData).navigationMode,
      'platformBrightness': (visitor, target) =>
          (target as MediaQueryData).platformBrightness,
      'orientation': (visitor, target) =>
          (target as MediaQueryData).orientation,
    },
    methods: {
      'copyWith': (visitor, target, positionalArgs, namedArgs) {
        final data = target as MediaQueryData;
        return data.copyWith(
          size: namedArgs.get<Size?>('size'),
          devicePixelRatio: toDouble(
            namedArgs.get<dynamic>('devicePixelRatio'),
          ),
          textScaleFactor: toDouble(namedArgs.get<dynamic>('textScaleFactor')),
          padding: namedArgs.get<EdgeInsets?>('padding'),
          viewInsets: namedArgs.get<EdgeInsets?>('viewInsets'),
          systemGestureInsets: namedArgs.get<EdgeInsets?>(
            'systemGestureInsets',
          ),
          viewPadding: namedArgs.get<EdgeInsets?>('viewPadding'),
          alwaysUse24HourFormat: namedArgs.get<bool?>('alwaysUse24HourFormat'),
          accessibleNavigation: namedArgs.get<bool?>('accessibleNavigation'),
          invertColors: namedArgs.get<bool?>('invertColors'),
          highContrast: namedArgs.get<bool?>('highContrast'),
          disableAnimations: namedArgs.get<bool?>('disableAnimations'),
          boldText: namedArgs.get<bool?>('boldText'),
          navigationMode: namedArgs.get<NavigationMode?>('navigationMode'),
          platformBrightness: namedArgs.get<dynamic>('platformBrightness'),
        );
      },
      'removePadding': (visitor, target, positionalArgs, namedArgs) {
        final data = target as MediaQueryData;
        return data.removePadding(
          removeLeft: namedArgs.get<bool?>('removeLeft') ?? false,
          removeTop: namedArgs.get<bool?>('removeTop') ?? false,
          removeRight: namedArgs.get<bool?>('removeRight') ?? false,
          removeBottom: namedArgs.get<bool?>('removeBottom') ?? false,
        );
      },
      'removeViewInsets': (visitor, target, positionalArgs, namedArgs) {
        final data = target as MediaQueryData;
        return data.removeViewInsets(
          removeLeft: namedArgs.get<bool?>('removeLeft') ?? false,
          removeTop: namedArgs.get<bool?>('removeTop') ?? false,
          removeRight: namedArgs.get<bool?>('removeRight') ?? false,
          removeBottom: namedArgs.get<bool?>('removeBottom') ?? false,
        );
      },
      'removeViewPadding': (visitor, target, positionalArgs, namedArgs) {
        final data = target as MediaQueryData;
        return data.removeViewPadding(
          removeLeft: namedArgs.get<bool?>('removeLeft') ?? false,
          removeTop: namedArgs.get<bool?>('removeTop') ?? false,
          removeRight: namedArgs.get<bool?>('removeRight') ?? false,
          removeBottom: namedArgs.get<bool?>('removeBottom') ?? false,
        );
      },
    },
  );
}

/// Returns the BridgedEnumDefinition for NavigationMode
BridgedEnumDefinition getNavigationModeBridgingDefinition() {
  return BridgedEnumDefinition<NavigationMode>(
    name: 'NavigationMode',
    values: NavigationMode.values,
    getters: {
      'name': (visitor, target) => (target as NavigationMode).name,
      'index': (visitor, target) => (target as NavigationMode).index,
    },
  );
}

/// Returns the BridgedEnumDefinition for Orientation
BridgedEnumDefinition getOrientationBridgingDefinition() {
  return BridgedEnumDefinition<Orientation>(
    name: 'Orientation',
    values: Orientation.values,
    getters: {
      'name': (visitor, target) => (target as Orientation).name,
      'index': (visitor, target) => (target as Orientation).index,
    },
  );
}
