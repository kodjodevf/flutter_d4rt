import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for the Flutter SearchBar widget.
BridgedClass getSearchBarBridgingDefinition() {
  return BridgedClass(
    nativeType: SearchBar,
    name: 'SearchBar',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final controller = namedArgs.get<TextEditingController?>('controller');
        final focusNode = namedArgs.get<FocusNode?>('focusNode');
        final hintText = namedArgs.get<String?>('hintText');
        final hintStyle = namedArgs.get<WidgetStateProperty<TextStyle?>?>(
          'hintStyle',
        );
        final textStyle = namedArgs.get<WidgetStateProperty<TextStyle?>?>(
          'textStyle',
        );
        final leading = visitor.toWidgets(namedArgs['leading']);
        final trailing = namedArgs['trailing'];

        List<Widget>? trailingWidgets;
        if (trailing != null) {
          final interpretedTrailing = visitor.toWidgets(trailing);
          if (interpretedTrailing is List) {
            trailingWidgets = interpretedTrailing.cast<Widget>();
          } else if (interpretedTrailing is Widget) {
            trailingWidgets = [interpretedTrailing];
          }
        }

        // Handle onTap callback
        final onTap = namedArgs.handleVoidCallback('onTap', visitor);

        // Handle onChanged callback
        final onChanged = namedArgs.handleValueCallback<String?>(
          'onChanged',
          visitor,
        );

        // Handle onSubmitted callback
        final onSubmitted = namedArgs.handleValueCallback<String?>(
          'onSubmitted',
          visitor,
        );

        final constraints = namedArgs.get<BoxConstraints?>('constraints');
        final elevation = namedArgs.get<WidgetStateProperty<double?>?>(
          'elevation',
        );
        final backgroundColor = namedArgs.get<WidgetStateProperty<Color?>?>(
          'backgroundColor',
        );
        final shadowColor = namedArgs.get<WidgetStateProperty<Color?>?>(
          'shadowColor',
        );
        final surfaceTintColor = namedArgs.get<WidgetStateProperty<Color?>?>(
          'surfaceTintColor',
        );
        final overlayColor = namedArgs.get<WidgetStateProperty<Color?>?>(
          'overlayColor',
        );
        final side = namedArgs.get<WidgetStateProperty<BorderSide?>?>('side');
        final shape = namedArgs.get<WidgetStateProperty<OutlinedBorder?>?>(
          'shape',
        );
        final padding = namedArgs
            .get<WidgetStateProperty<EdgeInsetsGeometry?>?>('padding');
        final textCapitalization =
            namedArgs.get<TextCapitalization?>('textCapitalization') ??
            TextCapitalization.none;
        final enabled = namedArgs.get<bool?>('enabled') ?? true;
        final autoFocus = namedArgs.get<bool?>('autoFocus') ?? false;
        final keyboardType = namedArgs.get<TextInputType?>('keyboardType');

        return SearchBar(
          key: key,
          controller: controller,
          focusNode: focusNode,
          hintText: hintText,
          hintStyle: hintStyle,
          textStyle: textStyle,
          leading: leading,
          trailing: trailingWidgets,
          onTap: onTap,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          constraints: constraints,
          elevation: elevation,
          backgroundColor: backgroundColor,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          overlayColor: overlayColor,
          side: side,
          shape: shape,
          padding: padding,
          textCapitalization: textCapitalization,
          enabled: enabled,
          autoFocus: autoFocus,
          keyboardType: keyboardType,
        );
      },
    },
    getters: {
      'controller': (visitor, target) => (target as SearchBar).controller,
      'focusNode': (visitor, target) => (target as SearchBar).focusNode,
      'hintText': (visitor, target) => (target as SearchBar).hintText,
      'leading': (visitor, target) => (target as SearchBar).leading,
      'trailing': (visitor, target) => (target as SearchBar).trailing,
      'constraints': (visitor, target) => (target as SearchBar).constraints,
      'textCapitalization': (visitor, target) =>
          (target as SearchBar).textCapitalization,
      'enabled': (visitor, target) => (target as SearchBar).enabled,
      'autoFocus': (visitor, target) => (target as SearchBar).autoFocus,
      'keyboardType': (visitor, target) => (target as SearchBar).keyboardType,
      'key': (visitor, target) => (target as SearchBar).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter SearchController.
BridgedClass getSearchControllerBridgingDefinition() {
  return BridgedClass(
    nativeType: SearchController,
    name: 'SearchController',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final initialText = namedArgs.get<String?>('initialText');
        final controller = SearchController();
        if (initialText != null) {
          controller.text = initialText;
        }
        return controller;
      },
    },
    getters: {
      'isOpen': (visitor, target) {
        try {
          return (target as SearchController).isOpen;
        } catch (_) {
          return false;
        }
      },
      'text': (visitor, target) => (target as SearchController).text,
      'value': (visitor, target) => (target as SearchController).value,
    },
    setters: {
      'text': (visitor, target, value) {
        (target as SearchController).text = value as String;
      },
    },
    methods: {
      'openView': (visitor, target, positionalArgs, namedArgs) {
        (target as SearchController).openView();
        return null;
      },
      'closeView': (visitor, target, positionalArgs, namedArgs) {
        final selectedText = positionalArgs.isNotEmpty
            ? positionalArgs[0] as String?
            : namedArgs['selectedText'] as String?;
        (target as SearchController).closeView(selectedText);
        return null;
      },
      'clear': (visitor, target, positionalArgs, namedArgs) {
        (target as SearchController).clear();
        return null;
      },
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        (target as SearchController).dispose();
        return null;
      },
    },
    isSubtypeOfFunc: (value) => value is SearchController,
  );
}

/// Returns the BridgedClass for the Flutter SearchAnchor widget.
BridgedClass getSearchAnchorBridgingDefinition() {
  return BridgedClass(
    nativeType: SearchAnchor,
    name: 'SearchAnchor',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final searchController =
            namedArgs.get<SearchController?>('searchController');
        final rawBuilder = namedArgs['builder'];
        final rawSuggestionsBuilder = namedArgs['suggestionsBuilder'];
        final isFullScreen = namedArgs.get<bool?>('isFullScreen');
        final viewHintText = namedArgs.get<String?>('viewHintText');
        final viewBackgroundColor =
            namedArgs.get<Color?>('viewBackgroundColor');
        final viewElevation = namedArgs.getToDouble('viewElevation');
        final viewLeading = visitor.toWidget(namedArgs['viewLeading']);
        final viewTrailing = visitor.toWidgets(namedArgs['viewTrailing']);
        final viewSide = namedArgs.get<BorderSide?>('viewSide');
        final viewShape = namedArgs.get<OutlinedBorder?>('viewShape');
        final headerTextStyle = namedArgs.get<TextStyle?>('headerTextStyle');
        final headerHintStyle = namedArgs.get<TextStyle?>('headerHintStyle');
        final dividerColor = namedArgs.get<Color?>('dividerColor');

        Widget Function(BuildContext, SearchController)? builder;
        if (rawBuilder is InterpretedFunction) {
          builder = (context, controller) {
            final res =
                rawBuilder.call(visitor, [context, controller], {});
            return visitor.toWidget(res) ?? const SizedBox.shrink();
          };
        }

        Iterable<Widget> Function(BuildContext, SearchController)
            suggestionsBuilder = (context, controller) => [];
        if (rawSuggestionsBuilder is InterpretedFunction) {
          suggestionsBuilder = (context, controller) {
            final res = rawSuggestionsBuilder.call(
              visitor,
              [context, controller],
              {},
            );
            if (res is List) {
              return res
                  .map((e) => visitor.toWidget(e) ?? const SizedBox.shrink());
            }
            final widget = visitor.toWidget(res);
            if (widget != null) return [widget];
            return [];
          };
        }

        return SearchAnchor(
          key: key,
          searchController: searchController,
          builder: builder ??
              (context, controller) => SearchBar(
                    controller: controller,
                    onTap: () => controller.openView(),
                    onChanged: (_) => controller.openView(),
                  ),
          suggestionsBuilder: suggestionsBuilder,
          isFullScreen: isFullScreen,
          viewHintText: viewHintText,
          viewBackgroundColor: viewBackgroundColor,
          viewElevation: viewElevation,
          viewLeading: viewLeading,
          viewTrailing:
              viewTrailing is List ? viewTrailing.cast<Widget>() : null,
          viewSide: viewSide,
          viewShape: viewShape,
          headerTextStyle: headerTextStyle,
          headerHintStyle: headerHintStyle,
          dividerColor: dividerColor,
        );
      },
      'bar': (visitor, positionalArgs, namedArgs) {
        final searchController =
            namedArgs.get<SearchController?>('searchController');
        final rawSuggestionsBuilder = namedArgs['suggestionsBuilder'];
        final isFullScreen = namedArgs.get<bool?>('isFullScreen');
        final viewHintText = namedArgs.get<String?>('viewHintText');
        final viewBackgroundColor =
            namedArgs.get<Color?>('viewBackgroundColor');
        final viewElevation = namedArgs.getToDouble('viewElevation');
        final viewLeading = visitor.toWidget(namedArgs['viewLeading']);
        final viewTrailing = visitor.toWidgets(namedArgs['viewTrailing']);
        final barLeading = visitor.toWidget(namedArgs['barLeading']);
        final barTrailing = visitor.toWidgets(namedArgs['barTrailing']);
        final barHintText = namedArgs.get<String?>('barHintText');
        final barElevation =
            namedArgs.get<WidgetStateProperty<double?>?>('barElevation');
        final barBackgroundColor =
            namedArgs.get<WidgetStateProperty<Color?>?>('barBackgroundColor');
        final barOverlayColor =
            namedArgs.get<WidgetStateProperty<Color?>?>('barOverlayColor');
        final barSide =
            namedArgs.get<WidgetStateProperty<BorderSide?>?>('barSide');
        final barShape =
            namedArgs.get<WidgetStateProperty<OutlinedBorder?>?>('barShape');
        final barPadding = namedArgs
            .get<WidgetStateProperty<EdgeInsetsGeometry?>?>('barPadding');
        final barTextStyle =
            namedArgs.get<WidgetStateProperty<TextStyle?>?>('barTextStyle');
        final barHintStyle =
            namedArgs.get<WidgetStateProperty<TextStyle?>?>('barHintStyle');
        final dividerColor = namedArgs.get<Color?>('dividerColor');

        Iterable<Widget> Function(BuildContext, SearchController)
            suggestionsBuilder = (context, controller) => [];
        if (rawSuggestionsBuilder is InterpretedFunction) {
          suggestionsBuilder = (context, controller) {
            final res = rawSuggestionsBuilder.call(
              visitor,
              [context, controller],
              {},
            );
            if (res is List) {
              return res
                  .map((e) => visitor.toWidget(e) ?? const SizedBox.shrink());
            }
            final widget = visitor.toWidget(res);
            if (widget != null) return [widget];
            return [];
          };
        }

        return SearchAnchor.bar(
          searchController: searchController ?? SearchController(),
          suggestionsBuilder: suggestionsBuilder,
          isFullScreen: isFullScreen,
          viewHintText: viewHintText,
          viewBackgroundColor: viewBackgroundColor,
          viewElevation: viewElevation,
          viewLeading: viewLeading,
          viewTrailing:
              viewTrailing is List ? viewTrailing.cast<Widget>() : null,
          barLeading: barLeading,
          barTrailing:
              barTrailing is List ? barTrailing.cast<Widget>() : null,
          barHintText: barHintText,
          barElevation: barElevation,
          barBackgroundColor: barBackgroundColor,
          barOverlayColor: barOverlayColor,
          barSide: barSide,
          barShape: barShape,
          barPadding: barPadding,
          barTextStyle: barTextStyle,
          barHintStyle: barHintStyle,
          dividerColor: dividerColor,
        );
      },
    },
  );
}
