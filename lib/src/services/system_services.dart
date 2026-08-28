// ignore_for_file: deprecated_member_use

import 'package:d4rt/d4rt.dart';
import 'package:flutter/services.dart';

/// System services bridging definitions for Flutter

/// Returns the BridgedClass for the Flutter SystemChrome class.
BridgedClass getSystemChromeBridgingDefinition() {
  return BridgedClass(
    nativeType: SystemChrome,
    name: 'SystemChrome',
    staticMethods: {
      'setPreferredOrientations': (visitor, positionalArgs, namedArgs) {
        final orientations = positionalArgs[0] as List;
        return SystemChrome.setPreferredOrientations(orientations.cast());
      },
      'setApplicationSwitcherDescription':
          (visitor, positionalArgs, namedArgs) {
            final description =
                positionalArgs[0] as ApplicationSwitcherDescription;
            return SystemChrome.setApplicationSwitcherDescription(description);
          },
      'setEnabledSystemUIMode': (visitor, positionalArgs, namedArgs) {
        final mode = positionalArgs[0] as SystemUiMode;
        final overlays = namedArgs['overlays'] as List?;
        return SystemChrome.setEnabledSystemUIMode(
          mode,
          overlays: overlays?.cast(),
        );
      },
      'setSystemUIOverlayStyle': (visitor, positionalArgs, namedArgs) {
        final style = positionalArgs[0] as SystemUiOverlayStyle;
        return SystemChrome.setSystemUIOverlayStyle(style);
      },
      'restoreSystemUIOverlays': (visitor, positionalArgs, namedArgs) {
        return SystemChrome.restoreSystemUIOverlays();
      },
      'setSystemUIChangeCallback': (visitor, positionalArgs, namedArgs) {
        final callback = positionalArgs[0] as SystemUiChangeCallback?;
        return SystemChrome.setSystemUIChangeCallback(callback);
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter SystemNavigator class.
BridgedClass getSystemNavigatorBridgingDefinition() {
  return BridgedClass(
    nativeType: SystemNavigator,
    name: 'SystemNavigator',
    constructors: {},
    getters: {},

    staticMethods: {
      'pop': (visitor, positionalArgs, namedArgs) {
        final animated = namedArgs['animated'] as bool? ?? true;
        return SystemNavigator.pop(animated: animated);
      },
      'routeInformationUpdated': (visitor, positionalArgs, namedArgs) {
        final location = positionalArgs[0] as String;
        final state = namedArgs['state'];
        return SystemNavigator.routeInformationUpdated(
          location: location,
          state: state,
        );
      },
      'selectMultiEntryHistory': (visitor, positionalArgs, namedArgs) {
        return SystemNavigator.selectMultiEntryHistory();
      },
      'selectSingleEntryHistory': (visitor, positionalArgs, namedArgs) {
        return SystemNavigator.selectSingleEntryHistory();
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter HapticFeedback class.
BridgedClass getHapticFeedbackBridgingDefinition() {
  return BridgedClass(
    nativeType: HapticFeedback,
    name: 'HapticFeedback',
    constructors: {},
    getters: {},

    staticMethods: {
      'vibrate': (visitor, positionalArgs, namedArgs) {
        return HapticFeedback.vibrate();
      },
      'lightImpact': (visitor, positionalArgs, namedArgs) {
        return HapticFeedback.lightImpact();
      },
      'mediumImpact': (visitor, positionalArgs, namedArgs) {
        return HapticFeedback.mediumImpact();
      },
      'heavyImpact': (visitor, positionalArgs, namedArgs) {
        return HapticFeedback.heavyImpact();
      },
      'selectionClick': (visitor, positionalArgs, namedArgs) {
        return HapticFeedback.selectionClick();
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter Clipboard class.
BridgedClass getClipboardBridgingDefinition() {
  return BridgedClass(
    nativeType: Clipboard,
    name: 'Clipboard',
    constructors: {},
    getters: {},

    staticMethods: {
      'setData': (visitor, positionalArgs, namedArgs) {
        final data = positionalArgs[0] as ClipboardData;
        return Clipboard.setData(data);
      },
      'getData': (visitor, positionalArgs, namedArgs) {
        final format = positionalArgs[0] as String;
        return Clipboard.getData(format);
      },
      'hasStrings': (visitor, positionalArgs, namedArgs) {
        return Clipboard.hasStrings();
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter ClipboardData class.
BridgedClass getClipboardDataBridgingDefinition() {
  return BridgedClass(
    nativeType: ClipboardData,
    name: 'ClipboardData',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final text = namedArgs['text'] as String?;
        return ClipboardData(text: text ?? '');
      },
    },
    getters: {'text': (visitor, target) => (target as ClipboardData).text},
  );
}

/// Returns the BridgedEnumDefinition for the Flutter DeviceOrientation enum.
BridgedEnumDefinition<DeviceOrientation>
getDeviceOrientationBridgingDefinition() {
  return BridgedEnumDefinition(
    name: 'DeviceOrientation',
    values: DeviceOrientation.values,
  );
}

/// Returns the BridgedEnumDefinition for the Flutter SystemUiMode enum.
BridgedEnumDefinition<SystemUiMode> getSystemUiModeBridgingDefinition() {
  return BridgedEnumDefinition(
    name: 'SystemUiMode',
    values: SystemUiMode.values,
  );
}

/// Returns the BridgedEnumDefinition for the Flutter SystemUiOverlay enum.
BridgedEnumDefinition<SystemUiOverlay> getSystemUiOverlayBridgingDefinition() {
  return BridgedEnumDefinition(
    name: 'SystemUiOverlay',
    values: SystemUiOverlay.values,
  );
}

/// Returns the BridgedClass for the Flutter SystemUiOverlayStyle class.
BridgedClass getSystemUiOverlayStyleBridgingDefinition() {
  return BridgedClass(
    nativeType: SystemUiOverlayStyle,
    name: 'SystemUiOverlayStyle',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return SystemUiOverlayStyle(
          systemNavigationBarColor:
              namedArgs['systemNavigationBarColor'] as Color?,
          systemNavigationBarDividerColor:
              namedArgs['systemNavigationBarDividerColor'] as Color?,
          systemNavigationBarIconBrightness:
              namedArgs['systemNavigationBarIconBrightness'] as Brightness?,
          systemNavigationBarContrastEnforced:
              namedArgs['systemNavigationBarContrastEnforced'] as bool?,
          statusBarColor: namedArgs['statusBarColor'] as Color?,
          statusBarBrightness: namedArgs['statusBarBrightness'] as Brightness?,
          statusBarIconBrightness:
              namedArgs['statusBarIconBrightness'] as Brightness?,
          systemStatusBarContrastEnforced:
              namedArgs['systemStatusBarContrastEnforced'] as bool?,
        );
      },
    },
    getters: {
      'systemNavigationBarColor': (visitor, target) =>
          (target as SystemUiOverlayStyle).systemNavigationBarColor,
      'systemNavigationBarDividerColor': (visitor, target) =>
          (target as SystemUiOverlayStyle).systemNavigationBarDividerColor,
      'systemNavigationBarIconBrightness': (visitor, target) =>
          (target as SystemUiOverlayStyle).systemNavigationBarIconBrightness,
      'systemNavigationBarContrastEnforced': (visitor, target) =>
          (target as SystemUiOverlayStyle).systemNavigationBarContrastEnforced,
      'statusBarColor': (visitor, target) =>
          (target as SystemUiOverlayStyle).statusBarColor,
      'statusBarBrightness': (visitor, target) =>
          (target as SystemUiOverlayStyle).statusBarBrightness,
      'statusBarIconBrightness': (visitor, target) =>
          (target as SystemUiOverlayStyle).statusBarIconBrightness,
      'systemStatusBarContrastEnforced': (visitor, target) =>
          (target as SystemUiOverlayStyle).systemStatusBarContrastEnforced,
    },
    methods: {
      'copyWith': (visitor, target, positionalArgs, namedArgs) {
        return (target as SystemUiOverlayStyle).copyWith(
          systemNavigationBarColor:
              namedArgs['systemNavigationBarColor'] as Color?,
          systemNavigationBarDividerColor:
              namedArgs['systemNavigationBarDividerColor'] as Color?,
          systemNavigationBarIconBrightness:
              namedArgs['systemNavigationBarIconBrightness'] as Brightness?,
          systemNavigationBarContrastEnforced:
              namedArgs['systemNavigationBarContrastEnforced'] as bool?,
          statusBarColor: namedArgs['statusBarColor'] as Color?,
          statusBarBrightness: namedArgs['statusBarBrightness'] as Brightness?,
          statusBarIconBrightness:
              namedArgs['statusBarIconBrightness'] as Brightness?,
          systemStatusBarContrastEnforced:
              namedArgs['systemStatusBarContrastEnforced'] as bool?,
        );
      },
    },
    staticMethods: {
      'light': (visitor, positionalArgs, namedArgs) =>
          SystemUiOverlayStyle.light,
      'dark': (visitor, positionalArgs, namedArgs) => SystemUiOverlayStyle.dark,
    },
  );
}

/// Returns the BridgedClass for the Flutter ApplicationSwitcherDescription class.
BridgedClass getApplicationSwitcherDescriptionBridgingDefinition() {
  return BridgedClass(
    nativeType: ApplicationSwitcherDescription,
    name: 'ApplicationSwitcherDescription',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return ApplicationSwitcherDescription(
          label: namedArgs['label'] as String?,
          primaryColor: namedArgs['primaryColor'] as int?,
        );
      },
    },
    getters: {
      'label': (visitor, target) =>
          (target as ApplicationSwitcherDescription).label,
      'primaryColor': (visitor, target) =>
          (target as ApplicationSwitcherDescription).primaryColor,
    },
  );
}
