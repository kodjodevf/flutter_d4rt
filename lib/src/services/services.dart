import 'package:d4rt/d4rt.dart';
import 'package:flutter_d4rt/src/services/asset_bundle.dart';
import 'package:flutter_d4rt/src/services/system_services.dart' as system;
import 'package:flutter_d4rt/src/services/platform_channels.dart';
import 'package:flutter_d4rt/src/services/text_input.dart';

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

  // Register Platform Channels
  interpreter.registerBridgedClass(
    getMethodChannelBridgingDefinition(),
    'package:flutter/services_.dart',
  );
  interpreter.registerBridgedClass(
    getEventChannelBridgingDefinition(),
    'package:flutter/services_.dart',
  );
  interpreter.registerBridgedClass(
    getBasicMessageChannelBridgingDefinition(),
    'package:flutter/services_.dart',
  );
  interpreter.registerBridgedClass(
    getMethodCallBridgingDefinition(),
    'package:flutter/services_.dart',
  );

  // Register Codecs
  interpreter.registerBridgedClass(
    getStandardMethodCodecBridgingDefinition(),
    'package:flutter/services_.dart',
  );
  interpreter.registerBridgedClass(
    getJSONMethodCodecBridgingDefinition(),
    'package:flutter/services_.dart',
  );
  interpreter.registerBridgedClass(
    getStringCodecBridgingDefinition(),
    'package:flutter/services_.dart',
  );
  interpreter.registerBridgedClass(
    getBinaryCodecBridgingDefinition(),
    'package:flutter/services_.dart',
  );
  interpreter.registerBridgedClass(
    getJSONMessageCodecBridgingDefinition(),
    'package:flutter/services_.dart',
  );

  // Register SystemSound
  interpreter.registerBridgedEnum(
    system.getSystemSoundTypeBridgingDefinition(),
    'package:flutter/services_.dart',
  );
  interpreter.registerBridgedClass(
    system.getSystemSoundBridgingDefinition(),
    'package:flutter/services_.dart',
  );

  // Register TextInput & Formatters
  interpreter.registerBridgedClass(
    getTextInputTypeBridgingDefinition(),
    'package:flutter/services_.dart',
  );
  interpreter.registerBridgedEnum(
    getTextInputActionBridgingDefinition(),
    'package:flutter/services_.dart',
  );
  interpreter.registerBridgedEnum(
    getTextCapitalizationBridgingDefinition(),
    'package:flutter/services_.dart',
  );
  interpreter.registerBridgedEnum(
    getSmartDashesTypeBridgingDefinition(),
    'package:flutter/services_.dart',
  );
  interpreter.registerBridgedEnum(
    getSmartQuotesTypeBridgingDefinition(),
    'package:flutter/services_.dart',
  );
  interpreter.registerBridgedClass(
    getTextEditingValueBridgingDefinition(),
    'package:flutter/services_.dart',
  );
  interpreter.registerBridgedClass(
    getTextSelectionBridgingDefinition(),
    'package:flutter/services_.dart',
  );
  interpreter.registerBridgedClass(
    getTextInputFormatterBridgingDefinition(),
    'package:flutter/services_.dart',
  );
  interpreter.registerBridgedClass(
    getFilteringTextInputFormatterBridgingDefinition(),
    'package:flutter/services_.dart',
  );
  interpreter.registerBridgedClass(
    getLengthLimitingTextInputFormatterBridgingDefinition(),
    'package:flutter/services_.dart',
  );
}
