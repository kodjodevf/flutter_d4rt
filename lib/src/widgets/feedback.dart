import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/double.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

// RefreshIndicator bridging
BridgedClass getRefreshIndicatorBridgingDefinition() {
  return BridgedClass(
    nativeType: RefreshIndicator,
    name: 'RefreshIndicator',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final child = visitor.toWidgets(namedArgs['child']);

        // Handle onRefresh callback
        Future<void> Function() onRefresh = () async {};
        final onRefreshValue = namedArgs['onRefresh'];
        if (onRefreshValue is InterpretedFunction) {
          onRefresh = () async {
            final result = onRefreshValue.call(visitor, []);
            if (result is Future) {
              await result;
            }
          };
        }

        return RefreshIndicator(
          key: key,
          onRefresh: onRefresh,
          color: namedArgs['color'] as Color?,
          backgroundColor: namedArgs['backgroundColor'] as Color?,
          notificationPredicate: namedArgs['notificationPredicate'] != null
              ? (notification) {
                  return (namedArgs['notificationPredicate']
                              as InterpretedFunction)
                          .call(visitor, [notification])
                      as bool;
                }
              : defaultScrollNotificationPredicate,
          semanticsLabel: namedArgs['semanticsLabel'] as String?,
          semanticsValue: namedArgs['semanticsValue'] as String?,
          strokeWidth:
              toDouble(namedArgs['strokeWidth']) ??
              RefreshProgressIndicator.defaultStrokeWidth,
          displacement: toDouble(namedArgs['displacement']) ?? 40.0,
          edgeOffset: toDouble(namedArgs['edgeOffset']) ?? 0.0,
          triggerMode:
              namedArgs['triggerMode'] as RefreshIndicatorTriggerMode? ??
              RefreshIndicatorTriggerMode.onEdge,
          child: child,
        );
      },
      'adaptive': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final child = visitor.toWidgets(namedArgs['child']);

        Future<void> Function() onRefresh = () async {};
        final onRefreshValue = namedArgs['onRefresh'];
        if (onRefreshValue is InterpretedFunction) {
          onRefresh = () async {
            final result = onRefreshValue.call(visitor, []);
            if (result is Future) {
              await result;
            }
          };
        }

        return RefreshIndicator.adaptive(
          key: key,
          onRefresh: onRefresh,
          color: namedArgs['color'] as Color?,
          backgroundColor: namedArgs['backgroundColor'] as Color?,
          notificationPredicate: namedArgs['notificationPredicate'] != null
              ? (notification) {
                  return (namedArgs['notificationPredicate']
                              as InterpretedFunction)
                          .call(visitor, [notification])
                      as bool;
                }
              : defaultScrollNotificationPredicate,
          semanticsLabel: namedArgs['semanticsLabel'] as String?,
          semanticsValue: namedArgs['semanticsValue'] as String?,
          strokeWidth:
              toDouble(namedArgs['strokeWidth']) ??
              RefreshProgressIndicator.defaultStrokeWidth,
          displacement: toDouble(namedArgs['displacement']) ?? 40.0,
          edgeOffset: toDouble(namedArgs['edgeOffset']) ?? 0.0,
          triggerMode:
              namedArgs['triggerMode'] as RefreshIndicatorTriggerMode? ??
              RefreshIndicatorTriggerMode.onEdge,
          child: child,
        );
      },
    },
    getters: {
      'child': (visitor, target) => (target as RefreshIndicator).child,
      'color': (visitor, target) => (target as RefreshIndicator).color,
      'backgroundColor': (visitor, target) =>
          (target as RefreshIndicator).backgroundColor,
      'semanticsLabel': (visitor, target) =>
          (target as RefreshIndicator).semanticsLabel,
      'semanticsValue': (visitor, target) =>
          (target as RefreshIndicator).semanticsValue,
      'strokeWidth': (visitor, target) =>
          (target as RefreshIndicator).strokeWidth,
      'displacement': (visitor, target) =>
          (target as RefreshIndicator).displacement,
      'edgeOffset': (visitor, target) =>
          (target as RefreshIndicator).edgeOffset,
      'triggerMode': (visitor, target) =>
          (target as RefreshIndicator).triggerMode,
      'key': (visitor, target) => (target as RefreshIndicator).key,
    },
  );
}

// LinearProgressIndicator bridging (enhanced)
BridgedClass getLinearProgressIndicatorBridgingDefinition() {
  return BridgedClass(
    nativeType: LinearProgressIndicator,
    name: 'LinearProgressIndicator',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return LinearProgressIndicator(
          key: namedArgs.get<Key?>('key'),
          value: toDouble(namedArgs['value']),
          backgroundColor: namedArgs['backgroundColor'] as Color?,
          color: namedArgs['color'] as Color?,
          valueColor: namedArgs['valueColor'] as Animation<Color?>?,
          minHeight: toDouble(namedArgs['minHeight']),
          semanticsLabel: namedArgs['semanticsLabel'] as String?,
          semanticsValue: namedArgs['semanticsValue'] as String?,
          borderRadius: namedArgs['borderRadius'] as BorderRadius?,
        );
      },
    },
    getters: {
      'value': (visitor, target) => (target as LinearProgressIndicator).value,
      'backgroundColor': (visitor, target) =>
          (target as LinearProgressIndicator).backgroundColor,
      'color': (visitor, target) => (target as LinearProgressIndicator).color,
      'valueColor': (visitor, target) =>
          (target as LinearProgressIndicator).valueColor,
      'minHeight': (visitor, target) =>
          (target as LinearProgressIndicator).minHeight,
      'semanticsLabel': (visitor, target) =>
          (target as LinearProgressIndicator).semanticsLabel,
      'semanticsValue': (visitor, target) =>
          (target as LinearProgressIndicator).semanticsValue,
      'borderRadius': (visitor, target) =>
          (target as LinearProgressIndicator).borderRadius,
      'key': (visitor, target) => (target as LinearProgressIndicator).key,
    },
  );
}

// Banner bridging
BridgedClass getBannerBridgingDefinition() {
  return BridgedClass(
    nativeType: Banner,
    name: 'Banner',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final child = visitor.toWidgets(namedArgs['child']);

        return Banner(
          key: key,
          message: namedArgs['message'] as String,
          textDirection: namedArgs['textDirection'] as TextDirection?,
          location:
              namedArgs['location'] as BannerLocation? ?? BannerLocation.topEnd,
          layoutDirection: namedArgs['layoutDirection'] as TextDirection?,
          color: namedArgs['color'] as Color? ?? const Color(0xA0B71C1C),
          textStyle:
              namedArgs['textStyle'] as TextStyle? ??
              const TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 12.0 * 0.85,
                fontWeight: FontWeight.w900,
                height: 1.0,
              ),
          child: child,
        );
      },
    },
    getters: {
      'child': (visitor, target) => (target as Banner).child,
      'message': (visitor, target) => (target as Banner).message,
      'textDirection': (visitor, target) => (target as Banner).textDirection,
      'location': (visitor, target) => (target as Banner).location,
      'layoutDirection': (visitor, target) =>
          (target as Banner).layoutDirection,
      'color': (visitor, target) => (target as Banner).color,
      'textStyle': (visitor, target) => (target as Banner).textStyle,
      'key': (visitor, target) => (target as Banner).key,
    },
  );
}

// Chip bridging (enhanced from existing)
BridgedClass getActionChipBridgingDefinition() {
  return BridgedClass(
    nativeType: ActionChip,
    name: 'ActionChip',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final label = visitor.toWidgets(namedArgs['label']);
        final avatar = visitor.toWidgets(namedArgs['avatar']);

        return ActionChip(
          key: namedArgs.get<Key?>('key'),
          avatar: avatar,
          label: label,
          labelStyle: namedArgs['labelStyle'] as TextStyle?,
          labelPadding: namedArgs['labelPadding'] as EdgeInsetsGeometry?,
          onPressed: namedArgs.handleVoidCallback('onPressed', visitor),
          pressElevation: toDouble(namedArgs['pressElevation']),
          tooltip: namedArgs['tooltip'] as String?,
          side: namedArgs['side'] as BorderSide?,
          shape: namedArgs['shape'] as OutlinedBorder?,
          clipBehavior: namedArgs['clipBehavior'] as Clip? ?? Clip.none,
          focusNode: namedArgs['focusNode'] as FocusNode?,
          autofocus: namedArgs['autofocus'] as bool? ?? false,
          color: namedArgs['color'] as WidgetStateProperty<Color?>?,
          backgroundColor: namedArgs['backgroundColor'] as Color?,
          disabledColor: namedArgs['disabledColor'] as Color?,
          padding: namedArgs['padding'] as EdgeInsetsGeometry?,
          visualDensity: namedArgs['visualDensity'] as VisualDensity?,
          materialTapTargetSize:
              namedArgs['materialTapTargetSize'] as MaterialTapTargetSize?,
          elevation: toDouble(namedArgs['elevation']),
          shadowColor: namedArgs['shadowColor'] as Color?,
          surfaceTintColor: namedArgs['surfaceTintColor'] as Color?,
          iconTheme: namedArgs['iconTheme'] as IconThemeData?,
        );
      },
    },
    getters: {
      'avatar': (visitor, target) => (target as ActionChip).avatar,
      'label': (visitor, target) => (target as ActionChip).label,
      'labelStyle': (visitor, target) => (target as ActionChip).labelStyle,
      'labelPadding': (visitor, target) => (target as ActionChip).labelPadding,
      'tooltip': (visitor, target) => (target as ActionChip).tooltip,
      'side': (visitor, target) => (target as ActionChip).side,
      'shape': (visitor, target) => (target as ActionChip).shape,
      'clipBehavior': (visitor, target) => (target as ActionChip).clipBehavior,
      'autofocus': (visitor, target) => (target as ActionChip).autofocus,
      'backgroundColor': (visitor, target) =>
          (target as ActionChip).backgroundColor,
      'disabledColor': (visitor, target) =>
          (target as ActionChip).disabledColor,
      'padding': (visitor, target) => (target as ActionChip).padding,
      'visualDensity': (visitor, target) =>
          (target as ActionChip).visualDensity,
      'materialTapTargetSize': (visitor, target) =>
          (target as ActionChip).materialTapTargetSize,
      'elevation': (visitor, target) => (target as ActionChip).elevation,
      'shadowColor': (visitor, target) => (target as ActionChip).shadowColor,
      'surfaceTintColor': (visitor, target) =>
          (target as ActionChip).surfaceTintColor,
      'key': (visitor, target) => (target as ActionChip).key,
    },
  );
}

// FilterChip bridging
BridgedClass getFilterChipBridgingDefinition() {
  return BridgedClass(
    nativeType: FilterChip,
    name: 'FilterChip',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final label = visitor.toWidgets(namedArgs['label']);
        final avatar = visitor.toWidgets(namedArgs['avatar']);

        return FilterChip(
          key: namedArgs.get<Key?>('key'),
          avatar: avatar,
          label: label,
          labelStyle: namedArgs['labelStyle'] as TextStyle?,
          labelPadding: namedArgs['labelPadding'] as EdgeInsetsGeometry?,
          selected: namedArgs['selected'] as bool? ?? false,
          onSelected: namedArgs.handleValueCallback<bool>(
            'onSelected',
            visitor,
          ),
          pressElevation: toDouble(namedArgs['pressElevation']),
          disabledColor: namedArgs['disabledColor'] as Color?,
          selectedColor: namedArgs['selectedColor'] as Color?,
          tooltip: namedArgs['tooltip'] as String?,
          side: namedArgs['side'] as BorderSide?,
          shape: namedArgs['shape'] as OutlinedBorder?,
          clipBehavior: namedArgs['clipBehavior'] as Clip? ?? Clip.none,
          focusNode: namedArgs['focusNode'] as FocusNode?,
          autofocus: namedArgs['autofocus'] as bool? ?? false,
          color: namedArgs['color'] as WidgetStateProperty<Color?>?,
          backgroundColor: namedArgs['backgroundColor'] as Color?,
          padding: namedArgs['padding'] as EdgeInsetsGeometry?,
          visualDensity: namedArgs['visualDensity'] as VisualDensity?,
          materialTapTargetSize:
              namedArgs['materialTapTargetSize'] as MaterialTapTargetSize?,
          elevation: toDouble(namedArgs['elevation']),
          shadowColor: namedArgs['shadowColor'] as Color?,
          surfaceTintColor: namedArgs['surfaceTintColor'] as Color?,
          iconTheme: namedArgs['iconTheme'] as IconThemeData?,
          selectedShadowColor: namedArgs['selectedShadowColor'] as Color?,
          showCheckmark: namedArgs['showCheckmark'] as bool?,
          checkmarkColor: namedArgs['checkmarkColor'] as Color?,
        );
      },
    },
    getters: {
      'avatar': (visitor, target) => (target as FilterChip).avatar,
      'label': (visitor, target) => (target as FilterChip).label,
      'labelStyle': (visitor, target) => (target as FilterChip).labelStyle,
      'labelPadding': (visitor, target) => (target as FilterChip).labelPadding,
      'selected': (visitor, target) => (target as FilterChip).selected,
      'disabledColor': (visitor, target) =>
          (target as FilterChip).disabledColor,
      'selectedColor': (visitor, target) =>
          (target as FilterChip).selectedColor,
      'tooltip': (visitor, target) => (target as FilterChip).tooltip,
      'side': (visitor, target) => (target as FilterChip).side,
      'shape': (visitor, target) => (target as FilterChip).shape,
      'clipBehavior': (visitor, target) => (target as FilterChip).clipBehavior,
      'autofocus': (visitor, target) => (target as FilterChip).autofocus,
      'backgroundColor': (visitor, target) =>
          (target as FilterChip).backgroundColor,
      'padding': (visitor, target) => (target as FilterChip).padding,
      'visualDensity': (visitor, target) =>
          (target as FilterChip).visualDensity,
      'materialTapTargetSize': (visitor, target) =>
          (target as FilterChip).materialTapTargetSize,
      'elevation': (visitor, target) => (target as FilterChip).elevation,
      'shadowColor': (visitor, target) => (target as FilterChip).shadowColor,
      'surfaceTintColor': (visitor, target) =>
          (target as FilterChip).surfaceTintColor,
      'selectedShadowColor': (visitor, target) =>
          (target as FilterChip).selectedShadowColor,
      'showCheckmark': (visitor, target) =>
          (target as FilterChip).showCheckmark,
      'checkmarkColor': (visitor, target) =>
          (target as FilterChip).checkmarkColor,
      'key': (visitor, target) => (target as FilterChip).key,
    },
  );
}

// ChoiceChip bridging
BridgedClass getChoiceChipBridgingDefinition() {
  return BridgedClass(
    nativeType: ChoiceChip,
    name: 'ChoiceChip',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final label = visitor.toWidgets(namedArgs['label']);
        final avatar = visitor.toWidgets(namedArgs['avatar']);

        return ChoiceChip(
          key: namedArgs.get<Key?>('key'),
          avatar: avatar,
          label: label,
          labelStyle: namedArgs['labelStyle'] as TextStyle?,
          labelPadding: namedArgs['labelPadding'] as EdgeInsetsGeometry?,
          onSelected: namedArgs.handleValueCallback<bool>(
            'onSelected',
            visitor,
          ),
          pressElevation: toDouble(namedArgs['pressElevation']),
          disabledColor: namedArgs['disabledColor'] as Color?,
          selectedColor: namedArgs['selectedColor'] as Color?,
          tooltip: namedArgs['tooltip'] as String?,
          side: namedArgs['side'] as BorderSide?,
          shape: namedArgs['shape'] as OutlinedBorder?,
          clipBehavior: namedArgs['clipBehavior'] as Clip? ?? Clip.none,
          focusNode: namedArgs['focusNode'] as FocusNode?,
          autofocus: namedArgs['autofocus'] as bool? ?? false,
          color: namedArgs['color'] as WidgetStateProperty<Color?>?,
          backgroundColor: namedArgs['backgroundColor'] as Color?,
          padding: namedArgs['padding'] as EdgeInsetsGeometry?,
          visualDensity: namedArgs['visualDensity'] as VisualDensity?,
          materialTapTargetSize:
              namedArgs['materialTapTargetSize'] as MaterialTapTargetSize?,
          elevation: toDouble(namedArgs['elevation']),
          shadowColor: namedArgs['shadowColor'] as Color?,
          surfaceTintColor: namedArgs['surfaceTintColor'] as Color?,
          iconTheme: namedArgs['iconTheme'] as IconThemeData?,
          selectedShadowColor: namedArgs['selectedShadowColor'] as Color?,
          selected: namedArgs['selected'] as bool,
        );
      },
    },
    getters: {
      'avatar': (visitor, target) => (target as ChoiceChip).avatar,
      'label': (visitor, target) => (target as ChoiceChip).label,
      'labelStyle': (visitor, target) => (target as ChoiceChip).labelStyle,
      'labelPadding': (visitor, target) => (target as ChoiceChip).labelPadding,
      'selected': (visitor, target) => (target as ChoiceChip).selected,
      'disabledColor': (visitor, target) =>
          (target as ChoiceChip).disabledColor,
      'selectedColor': (visitor, target) =>
          (target as ChoiceChip).selectedColor,
      'tooltip': (visitor, target) => (target as ChoiceChip).tooltip,
      'side': (visitor, target) => (target as ChoiceChip).side,
      'shape': (visitor, target) => (target as ChoiceChip).shape,
      'clipBehavior': (visitor, target) => (target as ChoiceChip).clipBehavior,
      'autofocus': (visitor, target) => (target as ChoiceChip).autofocus,
      'backgroundColor': (visitor, target) =>
          (target as ChoiceChip).backgroundColor,
      'padding': (visitor, target) => (target as ChoiceChip).padding,
      'visualDensity': (visitor, target) =>
          (target as ChoiceChip).visualDensity,
      'materialTapTargetSize': (visitor, target) =>
          (target as ChoiceChip).materialTapTargetSize,
      'elevation': (visitor, target) => (target as ChoiceChip).elevation,
      'shadowColor': (visitor, target) => (target as ChoiceChip).shadowColor,
      'surfaceTintColor': (visitor, target) =>
          (target as ChoiceChip).surfaceTintColor,
      'selectedShadowColor': (visitor, target) =>
          (target as ChoiceChip).selectedShadowColor,
      'key': (visitor, target) => (target as ChoiceChip).key,
    },
  );
}
