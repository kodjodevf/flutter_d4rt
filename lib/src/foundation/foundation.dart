import 'package:d4rt/d4rt.dart';
import 'package:flutter_d4rt/src/foundation/change_notifier.dart';
import 'package:flutter_d4rt/src/foundation/key.dart';
import 'package:flutter_d4rt/src/foundation/platform.dart';

/// Registers all foundation-related bridge classes with the D4rt interpreter.
///
/// This function sets up the necessary bridge definitions for Flutter's
/// foundation classes, enabling them to work within the interpreted environment.
///
/// The registered bridges include:
/// - [Listenable]: Base interface for objects that notify listeners
/// - [ValueListenable]: Interface for objects with a value that notify listeners
/// - [ChangeNotifier]: For state management and notification patterns
/// - [ValueNotifier]: For managing single values with change notifications
/// - [ValueListenableBuilder]: For building widgets that listen to ValueNotifier
/// - [ListenableBuilder]: For building widgets that listen to any Listenable
/// - [TargetPlatform]: Enum for platform identification
///
/// These bridges allow interpreted Dart code to use Flutter's reactive
/// programming patterns and platform detection seamlessly.
///
/// Parameters:
/// - [interpreter]: The D4rt interpreter instance to register bridges with
void registerFoundationBridges(D4rt interpreter) {
  // Register Listenable and ValueListenable interfaces
  interpreter.registerBridgedClass(
    getListenableBridgingDefinition(),
    'package:flutter/foundation_.dart',
  );
  interpreter.registerBridgedClass(
    getValueListenableBridgingDefinition(),
    'package:flutter/foundation_.dart',
  );

  // Register ChangeNotifier bridges
  interpreter.registerBridgedClass(
    getChangeNotifierBridgingDefinition(),
    'package:flutter/foundation_.dart',
  );
  interpreter.registerBridgedClass(
    getValueNotifierBridgingDefinition(),
    'package:flutter/foundation_.dart',
  );
  interpreter.registerBridgedClass(
    getValueListenableBuilderBridgingDefinition(),
    'package:flutter/foundation_.dart',
  );
  interpreter.registerBridgedClass(
    getListenableBuilderBridgingDefinition(),
    'package:flutter/foundation_.dart',
  );

  interpreter.registerBridgedClass(
    getKeyBridgingDefinition(),
    'package:flutter/foundation_.dart',
  );
  interpreter.registerBridgedClass(
    getLocalKeyBridgingDefinition(),
    'package:flutter/foundation_.dart',
  );
  interpreter.registerBridgedClass(
    getValueKeyBridgingDefinition(),
    'package:flutter/foundation_.dart',
  );
  interpreter.registerBridgedClass(
    getUniqueKeyBridgingDefinition(),
    'package:flutter/foundation_.dart',
  );
  interpreter.registerBridgedClass(
    getObjectKeyBridgingDefinition(),
    'package:flutter/foundation_.dart',
  );

  // Register Platform bridges
  interpreter.registerBridgedEnum(
    getTargetPlatformBridgingDefinition(),
    'package:flutter/foundation_.dart',
  );
}
