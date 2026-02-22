import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for the Flutter AppBar widget.
BridgedClass getAppBarBridgingDefinition() {
  return BridgedClass(
    nativeType: AppBar,
    name: 'AppBar',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final title = visitor.toWidgets(namedArgs['title']);
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final foregroundColor = namedArgs.get<Color?>('foregroundColor');
        final elevation = namedArgs.getToDouble('elevation');
        final centerTitle = namedArgs.get<bool?>('centerTitle');
        final leading = visitor.toWidgets(namedArgs['leading']);
        final automaticallyImplyLeading =
            namedArgs.get<bool?>('automaticallyImplyLeading') ?? true;
        final bottom = visitor.toWidgets(namedArgs['bottom']);

        final actions = visitor.toWidgets(namedArgs['actions']);

        return AppBar(
          key: key,
          title: title,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          elevation: elevation,
          centerTitle: centerTitle,
          leading: leading,
          automaticallyImplyLeading: automaticallyImplyLeading,
          actions: actions,
          bottom: bottom,
          actionsIconTheme: namedArgs.get<IconThemeData?>('actionsIconTheme'),
          actionsPadding: namedArgs.get<EdgeInsetsGeometry?>('actionsPadding'),
          animateColor: namedArgs.get<bool?>('animateColor') ?? false,
          automaticallyImplyActions:
              namedArgs.get<bool?>('automaticallyImplyActions') ?? false,
          leadingWidth: namedArgs.getToDouble('leadingWidth'),
          excludeHeaderSemantics:
              namedArgs.get<bool?>('excludeHeaderSemantics') ?? false,
          titleSpacing: namedArgs.getToDouble('titleSpacing'),
          toolbarOpacity: namedArgs.getToDouble('toolbarOpacity') ?? 1.0,
          titleTextStyle: namedArgs.get<TextStyle?>('titleTextStyle'),
          toolbarTextStyle: namedArgs.get<TextStyle?>('toolbarTextStyle'),
          toolbarHeight: namedArgs.getToDouble('toolbarHeight'),
          iconTheme: namedArgs.get<IconThemeData?>('iconTheme'),
          surfaceTintColor: namedArgs.get<Color?>('surfaceTintColor'),
          forceMaterialTransparency:
              namedArgs.get<bool?>('forceMaterialTransparency') ?? false,
          scrolledUnderElevation: namedArgs.getToDouble(
            'scrolledUnderElevation',
          ),
          clipBehavior: namedArgs.get<Clip?>('clipBehavior'),
          shadowColor: namedArgs.get<Color?>('shadowColor'),
          bottomOpacity: namedArgs.getToDouble('bottomOpacity') ?? 1.0,
          notificationPredicate:
              namedArgs.get<ScrollNotificationPredicate?>(
                'notificationPredicate',
              ) ??
              defaultScrollNotificationPredicate,
          useDefaultSemanticsOrder:
              namedArgs.get<bool?>('useDefaultSemanticsOrder') ?? true,
          shape: namedArgs.get<ShapeBorder?>('shape'),
          systemOverlayStyle: namedArgs.get<SystemUiOverlayStyle?>(
            'systemOverlayStyle',
          ),
          flexibleSpace: namedArgs.get<Widget?>('flexibleSpace'),
        );
      },
    },
    getters: {
      'title': (visitor, target) => (target as AppBar).title,
      'backgroundColor': (visitor, target) =>
          (target as AppBar).backgroundColor,
      'foregroundColor': (visitor, target) =>
          (target as AppBar).foregroundColor,
      'elevation': (visitor, target) => (target as AppBar).elevation,
      'centerTitle': (visitor, target) => (target as AppBar).centerTitle,
      'leading': (visitor, target) => (target as AppBar).leading,
      'automaticallyImplyLeading': (visitor, target) =>
          (target as AppBar).automaticallyImplyLeading,
      'actions': (visitor, target) => (target as AppBar).actions,
      'key': (visitor, target) => (target as AppBar).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter AppBarTheme class.
BridgedClass getAppBarThemeBridgingDefinition() {
  return BridgedClass(
    nativeType: AppBarTheme,
    name: 'AppBarTheme',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return AppBarTheme(
          backgroundColor: namedArgs.get<Color?>('backgroundColor'),
          foregroundColor: namedArgs.get<Color?>('foregroundColor'),
          elevation: namedArgs.getToDouble('elevation'),
          shadowColor: namedArgs.get<Color?>('shadowColor'),
          surfaceTintColor: namedArgs.get<Color?>('surfaceTintColor'),
          shape: namedArgs.get<ShapeBorder?>('shape'),
          iconTheme: namedArgs.get<IconThemeData?>('iconTheme'),
          actionsIconTheme: namedArgs.get<IconThemeData?>('actionsIconTheme'),
          centerTitle: namedArgs.get<bool?>('centerTitle'),
          titleSpacing: namedArgs.getToDouble('titleSpacing'),
          toolbarHeight: namedArgs.getToDouble('toolbarHeight'),
          toolbarTextStyle: namedArgs.get<TextStyle?>('toolbarTextStyle'),
          titleTextStyle: namedArgs.get<TextStyle?>('titleTextStyle'),
          systemOverlayStyle: namedArgs.get<SystemUiOverlayStyle?>(
            'systemOverlayStyle',
          ),
          scrolledUnderElevation: namedArgs.getToDouble(
            'scrolledUnderElevation',
          ),
        );
      },
    },
    staticMethods: {
      'of': (visitor, positionalArgs, namedArgs) {
        final context = positionalArgs.first as BuildContext;
        return AppBarTheme.of(context);
      },
    },
    getters: {
      'backgroundColor': (visitor, target) =>
          (target as AppBarTheme).backgroundColor,
      'foregroundColor': (visitor, target) =>
          (target as AppBarTheme).foregroundColor,
      'elevation': (visitor, target) => (target as AppBarTheme).elevation,
      'shadowColor': (visitor, target) => (target as AppBarTheme).shadowColor,
      'surfaceTintColor': (visitor, target) =>
          (target as AppBarTheme).surfaceTintColor,
      'shape': (visitor, target) => (target as AppBarTheme).shape,
      'iconTheme': (visitor, target) => (target as AppBarTheme).iconTheme,
      'actionsIconTheme': (visitor, target) =>
          (target as AppBarTheme).actionsIconTheme,
      'centerTitle': (visitor, target) => (target as AppBarTheme).centerTitle,
      'titleSpacing': (visitor, target) => (target as AppBarTheme).titleSpacing,
      'toolbarHeight': (visitor, target) =>
          (target as AppBarTheme).toolbarHeight,
      'toolbarTextStyle': (visitor, target) =>
          (target as AppBarTheme).toolbarTextStyle,
      'titleTextStyle': (visitor, target) =>
          (target as AppBarTheme).titleTextStyle,
      'systemOverlayStyle': (visitor, target) =>
          (target as AppBarTheme).systemOverlayStyle,
      'scrolledUnderElevation': (visitor, target) =>
          (target as AppBarTheme).scrolledUnderElevation,
    },
    methods: {
      'copyWith': (visitor, target, positionalArgs, namedArgs) {
        return (target as AppBarTheme).copyWith(
          backgroundColor: namedArgs.get<Color?>('backgroundColor'),
          foregroundColor: namedArgs.get<Color?>('foregroundColor'),
          elevation: namedArgs.getToDouble('elevation'),
          shadowColor: namedArgs.get<Color?>('shadowColor'),
          surfaceTintColor: namedArgs.get<Color?>('surfaceTintColor'),
          shape: namedArgs.get<ShapeBorder?>('shape'),
          iconTheme: namedArgs.get<IconThemeData?>('iconTheme'),
          actionsIconTheme: namedArgs.get<IconThemeData?>('actionsIconTheme'),
          centerTitle: namedArgs.get<bool?>('centerTitle'),
          titleSpacing: namedArgs.getToDouble('titleSpacing'),
          toolbarHeight: namedArgs.getToDouble('toolbarHeight'),
          toolbarTextStyle: namedArgs.get<TextStyle?>('toolbarTextStyle'),
          titleTextStyle: namedArgs.get<TextStyle?>('titleTextStyle'),
          systemOverlayStyle: namedArgs.get<SystemUiOverlayStyle?>(
            'systemOverlayStyle',
          ),
          scrolledUnderElevation: namedArgs.getToDouble(
            'scrolledUnderElevation',
          ),
        );
      },
    },
  );
}
