import 'package:d4rt/d4rt.dart';
import 'package:flutter_d4rt/src/cupertino/app.dart';
import 'package:flutter_d4rt/src/cupertino/buttons.dart';
import 'package:flutter_d4rt/src/cupertino/colors.dart';
import 'package:flutter_d4rt/src/cupertino/context_menu.dart';
import 'package:flutter_d4rt/src/cupertino/controls.dart';
import 'package:flutter_d4rt/src/cupertino/dialogs.dart';
import 'package:flutter_d4rt/src/cupertino/form.dart';
import 'package:flutter_d4rt/src/cupertino/icons.dart';
import 'package:flutter_d4rt/src/cupertino/indicators.dart';
import 'package:flutter_d4rt/src/cupertino/list_section.dart';
import 'package:flutter_d4rt/src/cupertino/pickers.dart';
import 'package:flutter_d4rt/src/cupertino/refresh.dart';
import 'package:flutter_d4rt/src/cupertino/search.dart';
import 'package:flutter_d4rt/src/cupertino/segmented_control.dart';
import 'package:flutter_d4rt/src/cupertino/selection.dart';
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
    getCupertinoSliverNavigationBarBridgingDefinition(),
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
  interpreter.registerBridgedClass(
    getCupertinoSearchTextFieldBridgingDefinition(),
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
  interpreter.registerBridgedClass(
    getShowCupertinoDialogBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );
  interpreter.registerBridgedClass(
    getShowCupertinoModalPopupBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );

  // List Sections & Tiles
  interpreter.registerBridgedClass(
    getCupertinoListSectionBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );
  interpreter.registerBridgedClass(
    getCupertinoListTileBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );
  interpreter.registerBridgedClass(
    getCupertinoListTileChevronBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );

  // Segmented Controls
  interpreter.registerBridgedClass(
    getCupertinoSegmentedControlBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );
  interpreter.registerBridgedClass(
    getCupertinoSlidingSegmentedControlBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );

  // Pickers
  interpreter.registerBridgedClass(
    getCupertinoDatePickerBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );
  interpreter.registerBridgedEnum(
    getCupertinoDatePickerModeBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );
  interpreter.registerBridgedEnum(
    getDatePickerDateOrderBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );
  interpreter.registerBridgedClass(
    getCupertinoTimerPickerBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );
  interpreter.registerBridgedEnum(
    getCupertinoTimerPickerModeBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );

  // Forms
  interpreter.registerBridgedClass(
    getCupertinoFormSectionBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );
  interpreter.registerBridgedClass(
    getCupertinoFormRowBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );
  interpreter.registerBridgedClass(
    getCupertinoTextFormFieldRowBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );

  // Context Menus
  interpreter.registerBridgedClass(
    getCupertinoContextMenuBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );
  interpreter.registerBridgedClass(
    getCupertinoContextMenuActionBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );
  interpreter.registerBridgedClass(
    getCupertinoPopupSurfaceBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );

  // Refresh & Scrollbars
  interpreter.registerBridgedClass(
    getCupertinoSliverRefreshControlBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );
  interpreter.registerBridgedEnum(
    getRefreshIndicatorModeBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );
  interpreter.registerBridgedClass(
    getCupertinoScrollbarBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );

  // Selection Controls
  interpreter.registerBridgedClass(
    getCupertinoCheckboxBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );
  interpreter.registerBridgedClass(
    getCupertinoRadioBridgingDefinition(),
    'package:flutter/cupertino_.dart',
  );
}
