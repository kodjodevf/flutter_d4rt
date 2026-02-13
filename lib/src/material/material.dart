import 'package:d4rt/d4rt.dart';
import 'package:flutter_d4rt/src/material/app.dart';
import 'package:flutter_d4rt/src/material/app_bar.dart';
import 'package:flutter_d4rt/src/material/banner.dart';
import 'package:flutter_d4rt/src/material/bottom_navigation_bar.dart';
import 'package:flutter_d4rt/src/material/bottom_navigation_bar_theme.dart';
import 'package:flutter_d4rt/src/material/bottom_navigation_bar_item.dart';
import 'package:flutter_d4rt/src/material/card.dart';
import 'package:flutter_d4rt/src/material/card_theme.dart';
import 'package:flutter_d4rt/src/material/checkbox.dart';
import 'package:flutter_d4rt/src/material/chip.dart';
import 'package:flutter_d4rt/src/material/circle_avatar.dart';
import 'package:flutter_d4rt/src/material/colors.dart';
import 'package:flutter_d4rt/src/material/dialog.dart';
import 'package:flutter_d4rt/src/material/divider.dart';
import 'package:flutter_d4rt/src/material/drawer.dart';
import 'package:flutter_d4rt/src/material/dropdown.dart';
import 'package:flutter_d4rt/src/material/editable_text.dart';
import 'package:flutter_d4rt/src/material/elevated_button.dart';
import 'package:flutter_d4rt/src/material/elevated_button_theme.dart';
import 'package:flutter_d4rt/src/material/floating_action_button.dart';
import 'package:flutter_d4rt/src/material/floating_action_button_theme.dart';
import 'package:flutter_d4rt/src/material/icon.dart';
import 'package:flutter_d4rt/src/material/icon_button.dart';
import 'package:flutter_d4rt/src/material/icons.dart';
import 'package:flutter_d4rt/src/material/input_decorator.dart';
import 'package:flutter_d4rt/src/material/list_tile.dart';
import 'package:flutter_d4rt/src/material/list_tile_widgets.dart';
import 'package:flutter_d4rt/src/material/navigation_rail.dart';
import 'package:flutter_d4rt/src/material/outlined_button.dart';
import 'package:flutter_d4rt/src/material/progress_indicator.dart';
import 'package:flutter_d4rt/src/material/radio.dart';
import 'package:flutter_d4rt/src/material/scaffold.dart';
import 'package:flutter_d4rt/src/material/selection_area.dart';
import 'package:flutter_d4rt/src/material/slider.dart';
import 'package:flutter_d4rt/src/material/snack_bar.dart';
import 'package:flutter_d4rt/src/material/switch.dart';
import 'package:flutter_d4rt/src/material/text_button.dart';
import 'package:flutter_d4rt/src/material/text_field.dart';
import 'package:flutter_d4rt/src/material/text_theme.dart';
import 'package:flutter_d4rt/src/material/popup_menu.dart';
import 'package:flutter_d4rt/src/material/tabs.dart';
import 'package:flutter_d4rt/src/material/expansion.dart';
import 'package:flutter_d4rt/src/material/image.dart';
import 'package:flutter_d4rt/src/material/form_fields.dart';
import 'package:flutter_d4rt/src/material/theme.dart';
import 'package:flutter_d4rt/src/material/theme_data.dart';
import 'package:flutter_d4rt/src/material/about.dart';
import 'package:flutter_d4rt/src/material/data_table.dart';
import 'package:flutter_d4rt/src/material/stepper_dismissible.dart';
import 'package:flutter_d4rt/src/material/badge.dart';
import 'package:flutter_d4rt/src/material/segmented_button.dart';
import 'package:flutter_d4rt/src/material/menu_anchor.dart';
import 'package:flutter_d4rt/src/material/filled_button.dart';
import 'package:flutter_d4rt/src/material/navigation_bar.dart';
import 'package:flutter_d4rt/src/material/navigation_drawer.dart';
import 'package:flutter_d4rt/src/material/search_bar.dart';
import 'package:flutter_d4rt/src/material/time_picker.dart';
import 'package:flutter_d4rt/src/material/toggle_buttons.dart';
import 'package:flutter_d4rt/src/material/bottom_app_bar.dart';
import 'package:flutter_d4rt/src/material/grid_tile.dart';
import 'package:flutter_d4rt/src/material/back_button.dart';

// dart format off

void registerMaterialBridges(D4rt interpreter) {
  interpreter.registerBridgedClass(
    getThemeDataBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getColorSchemeBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getAppBarBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getAppBarThemeBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getMaterialAppBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getMaterialBannerBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getBottomNavigationBarItemBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getBottomNavigationBarBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getBottomNavigationBarThemeDataBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getCardBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getCardThemeBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getCardThemeDataBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getCheckboxBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getChipBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getCircleAvatarBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getAlertDialogBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getSimpleDialogBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getDividerBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getDrawerBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getDropdownButtonBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getDropdownMenuItemBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getTextEditingControllerBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getElevatedButtonBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getElevatedButtonThemeDataBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getFloatingActionButtonBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getFloatingActionButtonThemeDataBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getIconBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getIconButtonBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getIconButtonFilledBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getIconButtonFilledTonalBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getIconButtonOutlinedBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getIconsBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getInputDecorationBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getListTileBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getNavigationRailBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getNavigationRailDestinationBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getOutlinedButtonBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getCircularProgressIndicatorBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getLinearProgressIndicatorBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getRadioBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getScaffoldBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getSliderBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getSnackBarBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getSnackBarActionBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getSwitchBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getTextButtonBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getTextFieldBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getTextThemeBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getPopupMenuButtonBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getPopupMenuItemBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getPopupMenuDividerBridgingDefinition(),
    'package:flutter/material_.dart',
  );

  interpreter.registerBridgedClass(
    getTabBarBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getTabBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getTabBarViewBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getDefaultTabControllerBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getExpansionTileBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getBottomSheetBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getImageBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  // Register form widgets
  interpreter.registerBridgedClass(
    getFormBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getTextFormFieldBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getDropdownButtonFormFieldBridgingDefinition(),
    'package:flutter/material_.dart',
  );

  // Register new widgets we created
  interpreter.registerBridgedClass(
    getDrawerHeaderBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getOutlineInputBorderBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getUnderlineInputBorderBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getCheckboxListTileBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getRadioListTileBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getSwitchListTileBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getRangeValuesBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getRangeLabelsBridgingDefinition(),
    'package:flutter/material_.dart',
  );

  // Register enums
  interpreter.registerBridgedEnum(
    getBottomNavigationBarTypeBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedEnum(
    getBottomNavigationBarLandscapeLayoutBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedEnum(
    getFloatingLabelBehaviorBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedEnum(
    getListTileControlAffinityBridgingDefinition(),
    'package:flutter/material_.dart',
  );

  // Register About widgets
  interpreter.registerBridgedClass(
    getAboutDialogBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getAboutListTileBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getLicensePageBridgingDefinition(),
    'package:flutter/material_.dart',
  );

  // Register color classes
  interpreter.registerBridgedClass(
    getMaterialColorBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getMaterialAccentColorBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getColorsBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedEnum(
    getThemeModeBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getThemeBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getThemeExtensionBridgingDefinition(),
    'package:flutter/material_.dart',
  );

  // Register SelectionArea
  interpreter.registerBridgedClass(
    getSelectionAreaBridgingDefinition(),
    'package:flutter/material_.dart',
  );

  // Register About widgets
  interpreter.registerBridgedClass(
    getAboutDialogBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getAboutListTileBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getLicensePageBridgingDefinition(),
    'package:flutter/material_.dart',
  );

  // Register DataTable widgets
  interpreter.registerBridgedClass(
    getTooltipBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getRefreshIndicatorBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getDataTableBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getDataColumnBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getDataRowBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getDataCellBridgingDefinition(),
    'package:flutter/material_.dart',
  );

  // Register Stepper and Dismissible widgets
  interpreter.registerBridgedClass(
    getStepperBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getStepBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getDismissibleBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getDraggableScrollableSheetBridgingDefinition(),
    'package:flutter/material_.dart',
  );

  // Register additional Material widgets
  interpreter.registerBridgedClass(
    getCardBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getDividerBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getChipBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getFloatingActionButtonBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getIconButtonBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getListTileBridgingDefinition(),
    'package:flutter/material_.dart',
  );

  // Register more Material widgets
  interpreter.registerBridgedClass(
    getTextButtonBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getTextFieldBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getCircularProgressIndicatorBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getRadioBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getScaffoldBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getSliderBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getSnackBarBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getSwitchBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getTabBarBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getTabBridgingDefinition(),
    'package:flutter/material_.dart',
  );  
  // Register new Material Design bridges
  interpreter.registerBridgedClass(
    getBadgeBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getSegmentedButtonBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getButtonSegmentBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getMenuAnchorBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getMenuItemButtonBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getBottomSheetBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getFilledButtonBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getNavigationBarBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getNavigationDestinationBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getNavigationDrawerBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getNavigationDrawerDestinationBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getSearchBarBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getTimeOfDayBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedEnum(
    getDayPeriodBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getToggleButtonsBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getBottomAppBarBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getDrawerHeaderBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getUserAccountsDrawerHeaderBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getGridTileBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getGridTileBarBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getBackButtonBridgingDefinition(),
    'package:flutter/material_.dart',
  );
  interpreter.registerBridgedClass(
    getCloseButtonBridgingDefinition(),
    'package:flutter/material_.dart',
  );
}
