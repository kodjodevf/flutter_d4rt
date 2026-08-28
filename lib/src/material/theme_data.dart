// ignore_for_file: deprecated_member_use

import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';

/// Returns the BridgedClass for the Flutter ThemeData class.
BridgedClass getThemeDataBridgingDefinition() {
  return BridgedClass(
    nativeType: ThemeData,
    name: 'ThemeData',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return ThemeData(
          // Color scheme and brightness
          useMaterial3: namedArgs.get<bool?>('useMaterial3'),
          colorScheme: namedArgs.get<ColorScheme?>('colorScheme'),
          brightness: namedArgs.get<Brightness?>('brightness'),
          primaryColor: namedArgs.get<Color?>('primaryColor'),
          primaryColorLight: namedArgs.get<Color?>('primaryColorLight'),
          primaryColorDark: namedArgs.get<Color?>('primaryColorDark'),
          canvasColor: namedArgs.get<Color?>('canvasColor'),
          shadowColor: namedArgs.get<Color?>('shadowColor'),
          scaffoldBackgroundColor: namedArgs.get<Color?>(
            'scaffoldBackgroundColor',
          ),
          cardColor: namedArgs.get<Color?>('cardColor'),
          dividerColor: namedArgs.get<Color?>('dividerColor'),
          focusColor: namedArgs.get<Color?>('focusColor'),
          hoverColor: namedArgs.get<Color?>('hoverColor'),
          highlightColor: namedArgs.get<Color?>('highlightColor'),
          splashColor: namedArgs.get<Color?>('splashColor'),
          unselectedWidgetColor: namedArgs.get<Color?>('unselectedWidgetColor'),
          disabledColor: namedArgs.get<Color?>('disabledColor'),
          secondaryHeaderColor: namedArgs.get<Color?>('secondaryHeaderColor'),
          dialogBackgroundColor: namedArgs.get<Color?>('dialogBackgroundColor'),
          indicatorColor: namedArgs.get<Color?>('indicatorColor'),
          hintColor: namedArgs.get<Color?>('hintColor'),

          // Typography and text themes
          textTheme: namedArgs.get<TextTheme?>('textTheme'),
          primaryTextTheme: namedArgs.get<TextTheme?>('primaryTextTheme'),

          // Component themes
          appBarTheme: namedArgs.get<AppBarTheme?>('appBarTheme'),
          bottomAppBarTheme: namedArgs.get<BottomAppBarThemeData?>(
            'bottomAppBarTheme',
          ),
          bottomNavigationBarTheme: namedArgs
              .get<BottomNavigationBarThemeData?>('bottomNavigationBarTheme'),
          bottomSheetTheme: namedArgs.get<BottomSheetThemeData?>(
            'bottomSheetTheme',
          ),
          buttonTheme: namedArgs.get<ButtonThemeData?>('buttonTheme'),
          cardTheme: namedArgs.get<CardThemeData?>('cardTheme'),
          chipTheme: namedArgs.get<ChipThemeData?>('chipTheme'),
          dataTableTheme: namedArgs.get<DataTableThemeData?>('dataTableTheme'),
          dialogTheme: namedArgs.get<DialogThemeData?>('dialogTheme'),
          dividerTheme: namedArgs.get<DividerThemeData?>('dividerTheme'),
          drawerTheme: namedArgs.get<DrawerThemeData?>('drawerTheme'),
          elevatedButtonTheme: namedArgs.get<ElevatedButtonThemeData?>(
            'elevatedButtonTheme',
          ),
          floatingActionButtonTheme: namedArgs
              .get<FloatingActionButtonThemeData?>('floatingActionButtonTheme'),
          iconTheme: namedArgs.get<IconThemeData?>('iconTheme'),
          inputDecorationTheme: namedArgs.get<InputDecorationTheme?>(
            'inputDecorationTheme',
          ),
          listTileTheme: namedArgs.get<ListTileThemeData?>('listTileTheme'),
          outlinedButtonTheme: namedArgs.get<OutlinedButtonThemeData?>(
            'outlinedButtonTheme',
          ),
          popupMenuTheme: namedArgs.get<PopupMenuThemeData?>('popupMenuTheme'),
          progressIndicatorTheme: namedArgs.get<ProgressIndicatorThemeData?>(
            'progressIndicatorTheme',
          ),
          radioTheme: namedArgs.get<RadioThemeData?>('radioTheme'),
          sliderTheme: namedArgs.get<SliderThemeData?>('sliderTheme'),
          snackBarTheme: namedArgs.get<SnackBarThemeData?>('snackBarTheme'),
          switchTheme: namedArgs.get<SwitchThemeData?>('switchTheme'),
          tabBarTheme: namedArgs.get<TabBarThemeData?>('tabBarTheme'),
          textButtonTheme: namedArgs.get<TextButtonThemeData?>(
            'textButtonTheme',
          ),
          textSelectionTheme: namedArgs.get<TextSelectionThemeData?>(
            'textSelectionTheme',
          ),
          toggleButtonsTheme: namedArgs.get<ToggleButtonsThemeData?>(
            'toggleButtonsTheme',
          ),
          tooltipTheme: namedArgs.get<TooltipThemeData?>('tooltipTheme'),

          // Visual density and platform
          visualDensity: namedArgs.get<VisualDensity?>('visualDensity'),
          platform: namedArgs.get<TargetPlatform?>('platform'),

          // Interaction
          materialTapTargetSize: namedArgs.get<MaterialTapTargetSize?>(
            'materialTapTargetSize',
          ),
          pageTransitionsTheme: namedArgs.get<PageTransitionsTheme?>(
            'pageTransitionsTheme',
          ),
          splashFactory: namedArgs.get<InteractiveInkFeatureFactory?>(
            'splashFactory',
          ),
        );
      },
    },
    staticMethods: {
      'light': (visitor, positionalArgs, namedArgs) {
        return ThemeData.light(
          useMaterial3: namedArgs.get<bool?>('useMaterial3'),
        );
      },
      'dark': (visitor, positionalArgs, namedArgs) {
        return ThemeData.dark(
          useMaterial3: namedArgs.get<bool?>('useMaterial3'),
        );
      },
      'from': (visitor, positionalArgs, namedArgs) {
        final colorScheme = namedArgs.get<ColorScheme>('colorScheme');
        if (colorScheme == null) {
          throw ArgumentError('colorScheme is required for ThemeData.from');
        }
        return ThemeData.from(
          colorScheme: colorScheme,
          useMaterial3: namedArgs.get<bool?>('useMaterial3'),
          textTheme: namedArgs.get<TextTheme?>('textTheme'),
        );
      },
    },
    getters: {
      'useMaterial3': (visitor, target) => (target as ThemeData).useMaterial3,
      'colorScheme': (visitor, target) => (target as ThemeData).colorScheme,
      'brightness': (visitor, target) => (target as ThemeData).brightness,
      'primaryColor': (visitor, target) => (target as ThemeData).primaryColor,
      'primaryColorLight': (visitor, target) =>
          (target as ThemeData).primaryColorLight,
      'primaryColorDark': (visitor, target) =>
          (target as ThemeData).primaryColorDark,
      'canvasColor': (visitor, target) => (target as ThemeData).canvasColor,
      'shadowColor': (visitor, target) => (target as ThemeData).shadowColor,
      'scaffoldBackgroundColor': (visitor, target) =>
          (target as ThemeData).scaffoldBackgroundColor,
      'cardColor': (visitor, target) => (target as ThemeData).cardColor,
      'dividerColor': (visitor, target) => (target as ThemeData).dividerColor,
      'focusColor': (visitor, target) => (target as ThemeData).focusColor,
      'hoverColor': (visitor, target) => (target as ThemeData).hoverColor,
      'highlightColor': (visitor, target) =>
          (target as ThemeData).highlightColor,
      'splashColor': (visitor, target) => (target as ThemeData).splashColor,
      'unselectedWidgetColor': (visitor, target) =>
          (target as ThemeData).unselectedWidgetColor,
      'disabledColor': (visitor, target) => (target as ThemeData).disabledColor,
      'secondaryHeaderColor': (visitor, target) =>
          (target as ThemeData).secondaryHeaderColor,
      'dialogBackgroundColor': (visitor, target) =>
          (target as ThemeData).dialogBackgroundColor,
      'indicatorColor': (visitor, target) =>
          (target as ThemeData).indicatorColor,
      'hintColor': (visitor, target) => (target as ThemeData).hintColor,

      'textTheme': (visitor, target) => (target as ThemeData).textTheme,
      'primaryTextTheme': (visitor, target) =>
          (target as ThemeData).primaryTextTheme,

      'appBarTheme': (visitor, target) => (target as ThemeData).appBarTheme,
      'bottomAppBarTheme': (visitor, target) =>
          (target as ThemeData).bottomAppBarTheme,
      'bottomNavigationBarTheme': (visitor, target) =>
          (target as ThemeData).bottomNavigationBarTheme,
      'bottomSheetTheme': (visitor, target) =>
          (target as ThemeData).bottomSheetTheme,
      'buttonTheme': (visitor, target) => (target as ThemeData).buttonTheme,
      'cardTheme': (visitor, target) => (target as ThemeData).cardTheme,
      'chipTheme': (visitor, target) => (target as ThemeData).chipTheme,
      'dataTableTheme': (visitor, target) =>
          (target as ThemeData).dataTableTheme,
      'dialogTheme': (visitor, target) => (target as ThemeData).dialogTheme,
      'dividerTheme': (visitor, target) => (target as ThemeData).dividerTheme,
      'drawerTheme': (visitor, target) => (target as ThemeData).drawerTheme,
      'elevatedButtonTheme': (visitor, target) =>
          (target as ThemeData).elevatedButtonTheme,
      'floatingActionButtonTheme': (visitor, target) =>
          (target as ThemeData).floatingActionButtonTheme,
      'iconTheme': (visitor, target) => (target as ThemeData).iconTheme,
      'inputDecorationTheme': (visitor, target) =>
          (target as ThemeData).inputDecorationTheme,
      'listTileTheme': (visitor, target) => (target as ThemeData).listTileTheme,
      'outlinedButtonTheme': (visitor, target) =>
          (target as ThemeData).outlinedButtonTheme,
      'popupMenuTheme': (visitor, target) =>
          (target as ThemeData).popupMenuTheme,
      'progressIndicatorTheme': (visitor, target) =>
          (target as ThemeData).progressIndicatorTheme,
      'radioTheme': (visitor, target) => (target as ThemeData).radioTheme,
      'sliderTheme': (visitor, target) => (target as ThemeData).sliderTheme,
      'snackBarTheme': (visitor, target) => (target as ThemeData).snackBarTheme,
      'switchTheme': (visitor, target) => (target as ThemeData).switchTheme,
      'tabBarTheme': (visitor, target) => (target as ThemeData).tabBarTheme,
      'textButtonTheme': (visitor, target) =>
          (target as ThemeData).textButtonTheme,
      'textSelectionTheme': (visitor, target) =>
          (target as ThemeData).textSelectionTheme,
      'toggleButtonsTheme': (visitor, target) =>
          (target as ThemeData).toggleButtonsTheme,
      'tooltipTheme': (visitor, target) => (target as ThemeData).tooltipTheme,

      'visualDensity': (visitor, target) => (target as ThemeData).visualDensity,
      'platform': (visitor, target) => (target as ThemeData).platform,
      'materialTapTargetSize': (visitor, target) =>
          (target as ThemeData).materialTapTargetSize,
      'pageTransitionsTheme': (visitor, target) =>
          (target as ThemeData).pageTransitionsTheme,
      'splashFactory': (visitor, target) => (target as ThemeData).splashFactory,
    },
    methods: {
      'copyWith': (visitor, target, positionalArgs, namedArgs) {
        return (target as ThemeData).copyWith(
          useMaterial3: namedArgs.get<bool?>('useMaterial3'),
          colorScheme: namedArgs.get<ColorScheme?>('colorScheme'),
          brightness: namedArgs.get<Brightness?>('brightness'),
          primaryColor: namedArgs.get<Color?>('primaryColor'),
          primaryColorLight: namedArgs.get<Color?>('primaryColorLight'),
          primaryColorDark: namedArgs.get<Color?>('primaryColorDark'),
          canvasColor: namedArgs.get<Color?>('canvasColor'),
          shadowColor: namedArgs.get<Color?>('shadowColor'),
          scaffoldBackgroundColor: namedArgs.get<Color?>(
            'scaffoldBackgroundColor',
          ),
          cardColor: namedArgs.get<Color?>('cardColor'),
          dividerColor: namedArgs.get<Color?>('dividerColor'),
          focusColor: namedArgs.get<Color?>('focusColor'),
          hoverColor: namedArgs.get<Color?>('hoverColor'),
          highlightColor: namedArgs.get<Color?>('highlightColor'),
          splashColor: namedArgs.get<Color?>('splashColor'),
          unselectedWidgetColor: namedArgs.get<Color?>('unselectedWidgetColor'),
          disabledColor: namedArgs.get<Color?>('disabledColor'),
          secondaryHeaderColor: namedArgs.get<Color?>('secondaryHeaderColor'),
          dialogBackgroundColor: namedArgs.get<Color?>('dialogBackgroundColor'),
          indicatorColor: namedArgs.get<Color?>('indicatorColor'),
          hintColor: namedArgs.get<Color?>('hintColor'),
          textTheme: namedArgs.get<TextTheme?>('textTheme'),
          primaryTextTheme: namedArgs.get<TextTheme?>('primaryTextTheme'),
          appBarTheme: namedArgs.get<AppBarTheme?>('appBarTheme'),
          bottomAppBarTheme: namedArgs.get<BottomAppBarThemeData?>(
            'bottomAppBarTheme',
          ),
          bottomNavigationBarTheme: namedArgs
              .get<BottomNavigationBarThemeData?>('bottomNavigationBarTheme'),
          bottomSheetTheme: namedArgs.get<BottomSheetThemeData?>(
            'bottomSheetTheme',
          ),
          buttonTheme: namedArgs.get<ButtonThemeData?>('buttonTheme'),
          cardTheme: namedArgs.get<CardThemeData?>('cardTheme'),
          chipTheme: namedArgs.get<ChipThemeData?>('chipTheme'),
          dataTableTheme: namedArgs.get<DataTableThemeData?>('dataTableTheme'),
          dialogTheme: namedArgs.get<DialogThemeData?>('dialogTheme'),
          dividerTheme: namedArgs.get<DividerThemeData?>('dividerTheme'),
          drawerTheme: namedArgs.get<DrawerThemeData?>('drawerTheme'),
          elevatedButtonTheme: namedArgs.get<ElevatedButtonThemeData?>(
            'elevatedButtonTheme',
          ),
          floatingActionButtonTheme: namedArgs
              .get<FloatingActionButtonThemeData?>('floatingActionButtonTheme'),
          iconTheme: namedArgs.get<IconThemeData?>('iconTheme'),
          inputDecorationTheme: namedArgs.get<InputDecorationTheme?>(
            'inputDecorationTheme',
          ),
          listTileTheme: namedArgs.get<ListTileThemeData?>('listTileTheme'),
          outlinedButtonTheme: namedArgs.get<OutlinedButtonThemeData?>(
            'outlinedButtonTheme',
          ),
          popupMenuTheme: namedArgs.get<PopupMenuThemeData?>('popupMenuTheme'),
          progressIndicatorTheme: namedArgs.get<ProgressIndicatorThemeData?>(
            'progressIndicatorTheme',
          ),
          radioTheme: namedArgs.get<RadioThemeData?>('radioTheme'),
          sliderTheme: namedArgs.get<SliderThemeData?>('sliderTheme'),
          snackBarTheme: namedArgs.get<SnackBarThemeData?>('snackBarTheme'),
          switchTheme: namedArgs.get<SwitchThemeData?>('switchTheme'),
          tabBarTheme: namedArgs.get<TabBarThemeData?>('tabBarTheme'),
          textButtonTheme: namedArgs.get<TextButtonThemeData?>(
            'textButtonTheme',
          ),
          textSelectionTheme: namedArgs.get<TextSelectionThemeData?>(
            'textSelectionTheme',
          ),
          toggleButtonsTheme: namedArgs.get<ToggleButtonsThemeData?>(
            'toggleButtonsTheme',
          ),
          tooltipTheme: namedArgs.get<TooltipThemeData?>('tooltipTheme'),
          visualDensity: namedArgs.get<VisualDensity?>('visualDensity'),
          platform: namedArgs.get<TargetPlatform?>('platform'),
          materialTapTargetSize: namedArgs.get<MaterialTapTargetSize?>(
            'materialTapTargetSize',
          ),
          pageTransitionsTheme: namedArgs.get<PageTransitionsTheme?>(
            'pageTransitionsTheme',
          ),
          splashFactory: namedArgs.get<InteractiveInkFeatureFactory?>(
            'splashFactory',
          ),
        );
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter ColorScheme class.
BridgedClass getColorSchemeBridgingDefinition() {
  return BridgedClass(
    nativeType: ColorScheme,
    name: 'ColorScheme',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return ColorScheme(
          brightness:
              namedArgs.get<Brightness>('brightness') ?? Brightness.light,
          primary: namedArgs.get<Color>('primary') ?? Colors.blue,
          onPrimary: namedArgs.get<Color>('onPrimary') ?? Colors.white,
          primaryContainer: namedArgs.get<Color?>('primaryContainer'),
          onPrimaryContainer: namedArgs.get<Color?>('onPrimaryContainer'),
          secondary: namedArgs.get<Color>('secondary') ?? Colors.blueAccent,
          onSecondary: namedArgs.get<Color>('onSecondary') ?? Colors.white,
          secondaryContainer: namedArgs.get<Color?>('secondaryContainer'),
          onSecondaryContainer: namedArgs.get<Color?>('onSecondaryContainer'),
          tertiary: namedArgs.get<Color?>('tertiary'),
          onTertiary: namedArgs.get<Color?>('onTertiary'),
          tertiaryContainer: namedArgs.get<Color?>('tertiaryContainer'),
          onTertiaryContainer: namedArgs.get<Color?>('onTertiaryContainer'),
          error: namedArgs.get<Color>('error') ?? Colors.red,
          onError: namedArgs.get<Color>('onError') ?? Colors.white,
          errorContainer: namedArgs.get<Color?>('errorContainer'),
          onErrorContainer: namedArgs.get<Color?>('onErrorContainer'),
          background: namedArgs.get<Color>('background') ?? Colors.white,
          onBackground: namedArgs.get<Color>('onBackground') ?? Colors.black,
          surface: namedArgs.get<Color>('surface') ?? Colors.white,
          onSurface: namedArgs.get<Color>('onSurface') ?? Colors.black,
          surfaceVariant: namedArgs.get<Color?>('surfaceVariant'),
          onSurfaceVariant: namedArgs.get<Color?>('onSurfaceVariant'),
          outline: namedArgs.get<Color?>('outline'),
          outlineVariant: namedArgs.get<Color?>('outlineVariant'),
          shadow: namedArgs.get<Color?>('shadow'),
          scrim: namedArgs.get<Color?>('scrim'),
          inverseSurface: namedArgs.get<Color?>('inverseSurface'),
          onInverseSurface: namedArgs.get<Color?>('onInverseSurface'),
          inversePrimary: namedArgs.get<Color?>('inversePrimary'),
          surfaceTint: namedArgs.get<Color?>('surfaceTint'),
        );
      },
    },
    staticMethods: {
      'fromSeed': (visitor, positionalArgs, namedArgs) {
        final seedColor = namedArgs.get<Color>('seedColor');
        if (seedColor == null) {
          throw ArgumentError('seedColor is required for ColorScheme.fromSeed');
        }
        return ColorScheme.fromSeed(
          seedColor: seedColor,
          brightness:
              namedArgs.get<Brightness?>('brightness') ?? Brightness.light,
          primary: namedArgs.get<Color?>('primary'),
          onPrimary: namedArgs.get<Color?>('onPrimary'),
          primaryContainer: namedArgs.get<Color?>('primaryContainer'),
          onPrimaryContainer: namedArgs.get<Color?>('onPrimaryContainer'),
          secondary: namedArgs.get<Color?>('secondary'),
          onSecondary: namedArgs.get<Color?>('onSecondary'),
          secondaryContainer: namedArgs.get<Color?>('secondaryContainer'),
          onSecondaryContainer: namedArgs.get<Color?>('onSecondaryContainer'),
          tertiary: namedArgs.get<Color?>('tertiary'),
          onTertiary: namedArgs.get<Color?>('onTertiary'),
          tertiaryContainer: namedArgs.get<Color?>('tertiaryContainer'),
          onTertiaryContainer: namedArgs.get<Color?>('onTertiaryContainer'),
          error: namedArgs.get<Color?>('error'),
          onError: namedArgs.get<Color?>('onError'),
          errorContainer: namedArgs.get<Color?>('errorContainer'),
          onErrorContainer: namedArgs.get<Color?>('onErrorContainer'),
          background: namedArgs.get<Color?>('background'),
          onBackground: namedArgs.get<Color?>('onBackground'),
          surface: namedArgs.get<Color?>('surface'),
          onSurface: namedArgs.get<Color?>('onSurface'),
          surfaceVariant: namedArgs.get<Color?>('surfaceVariant'),
          onSurfaceVariant: namedArgs.get<Color?>('onSurfaceVariant'),
          outline: namedArgs.get<Color?>('outline'),
          outlineVariant: namedArgs.get<Color?>('outlineVariant'),
          shadow: namedArgs.get<Color?>('shadow'),
          scrim: namedArgs.get<Color?>('scrim'),
          inverseSurface: namedArgs.get<Color?>('inverseSurface'),
          onInverseSurface: namedArgs.get<Color?>('onInverseSurface'),
          inversePrimary: namedArgs.get<Color?>('inversePrimary'),
          surfaceTint: namedArgs.get<Color?>('surfaceTint'),
        );
      },
      'light': (visitor, positionalArgs, namedArgs) {
        return ColorScheme.light(
          brightness:
              namedArgs.get<Brightness?>('brightness') ?? Brightness.light,
          primary: namedArgs.get<Color?>('primary') ?? const Color(0xff6200ee),
          onPrimary: namedArgs.get<Color?>('onPrimary') ?? Colors.white,
          primaryContainer: namedArgs.get<Color?>('primaryContainer'),
          onPrimaryContainer: namedArgs.get<Color?>('onPrimaryContainer'),
          secondary:
              namedArgs.get<Color?>('secondary') ?? const Color(0xff03dac6),
          onSecondary: namedArgs.get<Color?>('onSecondary') ?? Colors.black,
          secondaryContainer: namedArgs.get<Color?>('secondaryContainer'),
          onSecondaryContainer: namedArgs.get<Color?>('onSecondaryContainer'),
          tertiary: namedArgs.get<Color?>('tertiary'),
          onTertiary: namedArgs.get<Color?>('onTertiary'),
          tertiaryContainer: namedArgs.get<Color?>('tertiaryContainer'),
          onTertiaryContainer: namedArgs.get<Color?>('onTertiaryContainer'),
          error: namedArgs.get<Color?>('error') ?? const Color(0xffb00020),
          onError: namedArgs.get<Color?>('onError') ?? Colors.white,
          errorContainer: namedArgs.get<Color?>('errorContainer'),
          onErrorContainer: namedArgs.get<Color?>('onErrorContainer'),
          background: namedArgs.get<Color?>('background'),
          onBackground: namedArgs.get<Color?>('onBackground'),
          surface: namedArgs.get<Color?>('surface') ?? Colors.white,
          onSurface: namedArgs.get<Color?>('onSurface') ?? Colors.black,
          surfaceVariant: namedArgs.get<Color?>('surfaceVariant'),
          onSurfaceVariant: namedArgs.get<Color?>('onSurfaceVariant'),
          outline: namedArgs.get<Color?>('outline'),
          outlineVariant: namedArgs.get<Color?>('outlineVariant'),
          shadow: namedArgs.get<Color?>('shadow'),
          scrim: namedArgs.get<Color?>('scrim'),
          inverseSurface: namedArgs.get<Color?>('inverseSurface'),
          onInverseSurface: namedArgs.get<Color?>('onInverseSurface'),
          inversePrimary: namedArgs.get<Color?>('inversePrimary'),
          surfaceTint: namedArgs.get<Color?>('surfaceTint'),
        );
      },
      'dark': (visitor, positionalArgs, namedArgs) {
        return ColorScheme.dark(
          brightness:
              namedArgs.get<Brightness?>('brightness') ?? Brightness.dark,
          primary: namedArgs.get<Color?>('primary') ?? const Color(0xffbb86fc),
          onPrimary: namedArgs.get<Color?>('onPrimary') ?? Colors.black,
          primaryContainer: namedArgs.get<Color?>('primaryContainer'),
          onPrimaryContainer: namedArgs.get<Color?>('onPrimaryContainer'),
          secondary:
              namedArgs.get<Color?>('secondary') ?? const Color(0xff03dac6),
          onSecondary: namedArgs.get<Color?>('onSecondary') ?? Colors.black,
          secondaryContainer: namedArgs.get<Color?>('secondaryContainer'),
          onSecondaryContainer: namedArgs.get<Color?>('onSecondaryContainer'),
          tertiary: namedArgs.get<Color?>('tertiary'),
          onTertiary: namedArgs.get<Color?>('onTertiary'),
          tertiaryContainer: namedArgs.get<Color?>('tertiaryContainer'),
          onTertiaryContainer: namedArgs.get<Color?>('onTertiaryContainer'),
          error: namedArgs.get<Color?>('error') ?? const Color(0xffcf6679),
          onError: namedArgs.get<Color?>('onError') ?? Colors.black,
          errorContainer: namedArgs.get<Color?>('errorContainer'),
          onErrorContainer: namedArgs.get<Color?>('onErrorContainer'),
          background: namedArgs.get<Color?>('background'),
          onBackground: namedArgs.get<Color?>('onBackground'),
          surface: namedArgs.get<Color?>('surface') ?? const Color(0xff121212),
          onSurface: namedArgs.get<Color?>('onSurface') ?? Colors.white,
          surfaceVariant: namedArgs.get<Color?>('surfaceVariant'),
          onSurfaceVariant: namedArgs.get<Color?>('onSurfaceVariant'),
          outline: namedArgs.get<Color?>('outline'),
          outlineVariant: namedArgs.get<Color?>('outlineVariant'),
          shadow: namedArgs.get<Color?>('shadow'),
          scrim: namedArgs.get<Color?>('scrim'),
          inverseSurface: namedArgs.get<Color?>('inverseSurface'),
          onInverseSurface: namedArgs.get<Color?>('onInverseSurface'),
          inversePrimary: namedArgs.get<Color?>('inversePrimary'),
          surfaceTint: namedArgs.get<Color?>('surfaceTint'),
        );
      },
      'highContrastLight': (visitor, positionalArgs, namedArgs) {
        return ColorScheme.highContrastLight(
          primary: namedArgs.get<Color?>('primary') ?? const Color(0xff0000ba),
          onPrimary: namedArgs.get<Color?>('onPrimary') ?? Colors.white,
          primaryContainer: namedArgs.get<Color?>('primaryContainer'),
          onPrimaryContainer: namedArgs.get<Color?>('onPrimaryContainer'),
          secondary:
              namedArgs.get<Color?>('secondary') ?? const Color(0xff66fff9),
          onSecondary: namedArgs.get<Color?>('onSecondary') ?? Colors.black,
          secondaryContainer: namedArgs.get<Color?>('secondaryContainer'),
          onSecondaryContainer: namedArgs.get<Color?>('onSecondaryContainer'),
          tertiary: namedArgs.get<Color?>('tertiary'),
          onTertiary: namedArgs.get<Color?>('onTertiary'),
          tertiaryContainer: namedArgs.get<Color?>('tertiaryContainer'),
          onTertiaryContainer: namedArgs.get<Color?>('onTertiaryContainer'),
          error: namedArgs.get<Color?>('error') ?? const Color(0xff790000),
          onError: namedArgs.get<Color?>('onError') ?? Colors.white,
          errorContainer: namedArgs.get<Color?>('errorContainer'),
          onErrorContainer: namedArgs.get<Color?>('onErrorContainer'),
          background: namedArgs.get<Color?>('background'),
          onBackground: namedArgs.get<Color?>('onBackground'),
          surface: namedArgs.get<Color?>('surface') ?? Colors.white,
          onSurface: namedArgs.get<Color?>('onSurface') ?? Colors.black,
          surfaceVariant: namedArgs.get<Color?>('surfaceVariant'),
          onSurfaceVariant: namedArgs.get<Color?>('onSurfaceVariant'),
          outline: namedArgs.get<Color?>('outline'),
          outlineVariant: namedArgs.get<Color?>('outlineVariant'),
          shadow: namedArgs.get<Color?>('shadow'),
          scrim: namedArgs.get<Color?>('scrim'),
          inverseSurface: namedArgs.get<Color?>('inverseSurface'),
          onInverseSurface: namedArgs.get<Color?>('onInverseSurface'),
          inversePrimary: namedArgs.get<Color?>('inversePrimary'),
          surfaceTint: namedArgs.get<Color?>('surfaceTint'),
        );
      },
      'highContrastDark': (visitor, positionalArgs, namedArgs) {
        return ColorScheme.highContrastDark(
          primary: namedArgs.get<Color?>('primary') ?? const Color(0xffefb7ff),
          onPrimary: namedArgs.get<Color?>('onPrimary') ?? Colors.black,
          primaryContainer: namedArgs.get<Color?>('primaryContainer'),
          onPrimaryContainer: namedArgs.get<Color?>('onPrimaryContainer'),
          secondary:
              namedArgs.get<Color?>('secondary') ?? const Color(0xff66fff9),
          onSecondary: namedArgs.get<Color?>('onSecondary') ?? Colors.black,
          secondaryContainer: namedArgs.get<Color?>('secondaryContainer'),
          onSecondaryContainer: namedArgs.get<Color?>('onSecondaryContainer'),
          tertiary: namedArgs.get<Color?>('tertiary'),
          onTertiary: namedArgs.get<Color?>('onTertiary'),
          tertiaryContainer: namedArgs.get<Color?>('tertiaryContainer'),
          onTertiaryContainer: namedArgs.get<Color?>('onTertiaryContainer'),
          error: namedArgs.get<Color?>('error') ?? const Color(0xff9b374d),
          onError: namedArgs.get<Color?>('onError') ?? Colors.black,
          errorContainer: namedArgs.get<Color?>('errorContainer'),
          onErrorContainer: namedArgs.get<Color?>('onErrorContainer'),
          background: namedArgs.get<Color?>('background'),
          onBackground: namedArgs.get<Color?>('onBackground'),
          surface: namedArgs.get<Color?>('surface') ?? const Color(0xff121212),
          onSurface: namedArgs.get<Color?>('onSurface') ?? Colors.white,
          surfaceVariant: namedArgs.get<Color?>('surfaceVariant'),
          onSurfaceVariant: namedArgs.get<Color?>('onSurfaceVariant'),
          outline: namedArgs.get<Color?>('outline'),
          outlineVariant: namedArgs.get<Color?>('outlineVariant'),
          shadow: namedArgs.get<Color?>('shadow'),
          scrim: namedArgs.get<Color?>('scrim'),
          inverseSurface: namedArgs.get<Color?>('inverseSurface'),
          onInverseSurface: namedArgs.get<Color?>('onInverseSurface'),
          inversePrimary: namedArgs.get<Color?>('inversePrimary'),
          surfaceTint: namedArgs.get<Color?>('surfaceTint'),
        );
      },
    },
    getters: {
      'brightness': (visitor, target) => (target as ColorScheme).brightness,
      'primary': (visitor, target) => (target as ColorScheme).primary,
      'onPrimary': (visitor, target) => (target as ColorScheme).onPrimary,
      'primaryContainer': (visitor, target) =>
          (target as ColorScheme).primaryContainer,
      'onPrimaryContainer': (visitor, target) =>
          (target as ColorScheme).onPrimaryContainer,
      'secondary': (visitor, target) => (target as ColorScheme).secondary,
      'onSecondary': (visitor, target) => (target as ColorScheme).onSecondary,
      'secondaryContainer': (visitor, target) =>
          (target as ColorScheme).secondaryContainer,
      'onSecondaryContainer': (visitor, target) =>
          (target as ColorScheme).onSecondaryContainer,
      'tertiary': (visitor, target) => (target as ColorScheme).tertiary,
      'onTertiary': (visitor, target) => (target as ColorScheme).onTertiary,
      'tertiaryContainer': (visitor, target) =>
          (target as ColorScheme).tertiaryContainer,
      'onTertiaryContainer': (visitor, target) =>
          (target as ColorScheme).onTertiaryContainer,
      'error': (visitor, target) => (target as ColorScheme).error,
      'onError': (visitor, target) => (target as ColorScheme).onError,
      'errorContainer': (visitor, target) =>
          (target as ColorScheme).errorContainer,
      'onErrorContainer': (visitor, target) =>
          (target as ColorScheme).onErrorContainer,
      'background': (visitor, target) => (target as ColorScheme).background,
      'onBackground': (visitor, target) => (target as ColorScheme).onBackground,
      'surface': (visitor, target) => (target as ColorScheme).surface,
      'onSurface': (visitor, target) => (target as ColorScheme).onSurface,
      'surfaceVariant': (visitor, target) =>
          (target as ColorScheme).surfaceVariant,
      'onSurfaceVariant': (visitor, target) =>
          (target as ColorScheme).onSurfaceVariant,
      'outline': (visitor, target) => (target as ColorScheme).outline,
      'outlineVariant': (visitor, target) =>
          (target as ColorScheme).outlineVariant,
      'shadow': (visitor, target) => (target as ColorScheme).shadow,
      'scrim': (visitor, target) => (target as ColorScheme).scrim,
      'inverseSurface': (visitor, target) =>
          (target as ColorScheme).inverseSurface,
      'onInverseSurface': (visitor, target) =>
          (target as ColorScheme).onInverseSurface,
      'inversePrimary': (visitor, target) =>
          (target as ColorScheme).inversePrimary,
      'surfaceTint': (visitor, target) => (target as ColorScheme).surfaceTint,
    },
    methods: {
      'copyWith': (visitor, target, positionalArgs, namedArgs) {
        return (target as ColorScheme).copyWith(
          brightness: namedArgs.get<Brightness?>('brightness'),
          primary: namedArgs.get<Color?>('primary'),
          onPrimary: namedArgs.get<Color?>('onPrimary'),
          primaryContainer: namedArgs.get<Color?>('primaryContainer'),
          onPrimaryContainer: namedArgs.get<Color?>('onPrimaryContainer'),
          secondary: namedArgs.get<Color?>('secondary'),
          onSecondary: namedArgs.get<Color?>('onSecondary'),
          secondaryContainer: namedArgs.get<Color?>('secondaryContainer'),
          onSecondaryContainer: namedArgs.get<Color?>('onSecondaryContainer'),
          tertiary: namedArgs.get<Color?>('tertiary'),
          onTertiary: namedArgs.get<Color?>('onTertiary'),
          tertiaryContainer: namedArgs.get<Color?>('tertiaryContainer'),
          onTertiaryContainer: namedArgs.get<Color?>('onTertiaryContainer'),
          error: namedArgs.get<Color?>('error'),
          onError: namedArgs.get<Color?>('onError'),
          errorContainer: namedArgs.get<Color?>('errorContainer'),
          onErrorContainer: namedArgs.get<Color?>('onErrorContainer'),
          background: namedArgs.get<Color?>('background'),
          onBackground: namedArgs.get<Color?>('onBackground'),
          surface: namedArgs.get<Color?>('surface'),
          onSurface: namedArgs.get<Color?>('onSurface'),
          surfaceVariant: namedArgs.get<Color?>('surfaceVariant'),
          onSurfaceVariant: namedArgs.get<Color?>('onSurfaceVariant'),
          outline: namedArgs.get<Color?>('outline'),
          outlineVariant: namedArgs.get<Color?>('outlineVariant'),
          shadow: namedArgs.get<Color?>('shadow'),
          scrim: namedArgs.get<Color?>('scrim'),
          inverseSurface: namedArgs.get<Color?>('inverseSurface'),
          onInverseSurface: namedArgs.get<Color?>('onInverseSurface'),
          inversePrimary: namedArgs.get<Color?>('inversePrimary'),
          surfaceTint: namedArgs.get<Color?>('surfaceTint'),
        );
      },
    },
  );
}
