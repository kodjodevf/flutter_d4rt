import 'package:d4rt/d4rt.dart';
import 'package:flutter_d4rt/src/cupertino/app.dart';
import 'package:flutter_d4rt/src/cupertino/buttons.dart';
import 'package:flutter_d4rt/src/cupertino/colors.dart';
import 'package:flutter_d4rt/src/cupertino/controls.dart';
import 'package:flutter_d4rt/src/cupertino/dialogs.dart';
import 'package:flutter_d4rt/src/cupertino/icons.dart';
import 'package:flutter_d4rt/src/cupertino/indicators.dart';
import 'package:flutter_d4rt/src/cupertino/tabs.dart';

/// Registers all Cupertino bridging definitions with the interpreter.
void registerCupertinoBridges(D4rt interpreter) {
  interpreter.registerBridgedClass(
    getCupertinoColorsBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );
  interpreter.registerBridgedClass(
    getCupertinoIconsBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );
  interpreter.registerBridgedClass(
    getCupertinoThemeDataBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );
  interpreter.registerBridgedClass(
    getCupertinoAppBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );
  interpreter.registerBridgedClass(
    getCupertinoPageScaffoldBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );
  interpreter.registerBridgedClass(
    getCupertinoNavigationBarBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );
  interpreter.registerBridgedClass(
    getCupertinoPageRouteBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );
  interpreter.registerBridgedClass(
    getCupertinoButtonBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );
  interpreter.registerBridgedEnum(
    getCupertinoButtonSizeBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );
  interpreter.registerBridgedClass(
    getCupertinoActivityIndicatorBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );
  interpreter.registerBridgedClass(
    getCupertinoAlertDialogBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );
  interpreter.registerBridgedClass(
    getCupertinoDialogActionBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );
  interpreter.registerBridgedClass(
    getCupertinoActionSheetBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );
  interpreter.registerBridgedClass(
    getCupertinoActionSheetActionBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );
  interpreter.registerBridgedClass(
    getCupertinoSwitchBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );
  interpreter.registerBridgedClass(
    getCupertinoSliderBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );
  interpreter.registerBridgedClass(
    getCupertinoTextFieldBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );
  interpreter.registerBridgedEnum(
    getOverlayVisibilityModeBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );
  interpreter.registerBridgedClass(
    getCupertinoTabBarBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );
  interpreter.registerBridgedClass(
    getCupertinoTabScaffoldBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );
  interpreter.registerBridgedClass(
    getCupertinoTabControllerBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );
  interpreter.registerBridgedClass(
    getCupertinoTabViewBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );
}
