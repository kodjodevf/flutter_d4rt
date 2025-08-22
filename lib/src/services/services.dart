import 'package:d4rt/d4rt.dart';
import 'package:flutter_d4rt/src/services/asset_bundle.dart';
import 'package:flutter_d4rt/src/services/system_services.dart' as system;

/// Registers all service bridges with the D4rt interpreter
void registerServicesBridges(D4rt interpreter) {
  // Register AssetBundle interface
  interpreter.registerBridgedClass(
    getAssetBundleBridgingDefinition(),
    'package:flutter/services_.dart',
  );

  // Register NetworkAssetBundle
  interpreter.registerBridgedClass(
    getNetworkAssetBundleBridgingDefinition(),
    'package:flutter/services_.dart',
  );

  // Register CachingAssetBundle
  interpreter.registerBridgedClass(
    getCachingAssetBundleBridgingDefinition(),
    'package:flutter/services_.dart',
  );

  interpreter.registerBridgedClass(
    system.getSystemChromeBridgingDefinition(),
    'package:flutter/services_.dart',
  );
  interpreter.registerBridgedClass(
    system.getSystemNavigatorBridgingDefinition(),
    'package:flutter/services_.dart',
  );
  interpreter.registerBridgedClass(
    system.getHapticFeedbackBridgingDefinition(),
    'package:flutter/services_.dart',
  );
  interpreter.registerBridgedClass(
    system.getClipboardBridgingDefinition(),
    'package:flutter/services_.dart',
  );
  interpreter.registerBridgedClass(
    system.getClipboardDataBridgingDefinition(),
    'package:flutter/services_.dart',
  );
  interpreter.registerBridgedEnum(
    system.getDeviceOrientationBridgingDefinition(),
    'package:flutter/services_.dart',
  );
  interpreter.registerBridgedEnum(
    system.getSystemUiModeBridgingDefinition(),
    'package:flutter/services_.dart',
  );
  interpreter.registerBridgedEnum(
    system.getSystemUiOverlayBridgingDefinition(),
    'package:flutter/services_.dart',
  );
  interpreter.registerBridgedClass(
    system.getSystemUiOverlayStyleBridgingDefinition(),
    'package:flutter/services_.dart',
  );
  interpreter.registerBridgedClass(
    system.getApplicationSwitcherDescriptionBridgingDefinition(),
    'package:flutter/services_.dart',
  );
}
