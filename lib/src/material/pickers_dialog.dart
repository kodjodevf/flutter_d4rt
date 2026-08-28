import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedEnumDefinition for DatePickerEntryMode.
BridgedEnumDefinition<DatePickerEntryMode>
    getDatePickerEntryModeBridgingDefinition() {
  return BridgedEnumDefinition<DatePickerEntryMode>(
    name: 'DatePickerEntryMode',
    values: DatePickerEntryMode.values,
  );
}

/// Returns the BridgedEnumDefinition for DatePickerMode.
BridgedEnumDefinition<DatePickerMode> getDatePickerModeBridgingDefinition() {
  return BridgedEnumDefinition<DatePickerMode>(
    name: 'DatePickerMode',
    values: DatePickerMode.values,
  );
}

/// Returns the BridgedEnumDefinition for TimePickerEntryMode.
BridgedEnumDefinition<TimePickerEntryMode>
    getTimePickerEntryModeBridgingDefinition() {
  return BridgedEnumDefinition<TimePickerEntryMode>(
    name: 'TimePickerEntryMode',
    values: TimePickerEntryMode.values,
  );
}

/// Returns the BridgedClass for Flutter showDatePicker function.
BridgedClass getShowDatePickerBridgingDefinition() {
  return BridgedClass(
    nativeType: Object,
    name: 'showDatePicker',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final context = namedArgs.get<BuildContext>('context') ??
            (positionalArgs.isNotEmpty
                ? positionalArgs[0] as BuildContext
                : null);
        if (context == null) {
          throw ArgumentError('BuildContext is required for showDatePicker');
        }
        final initialDate = namedArgs.get<DateTime>('initialDate') ??
            (positionalArgs.length > 1
                ? positionalArgs[1] as DateTime
                : DateTime.now());
        final firstDate = namedArgs.get<DateTime>('firstDate') ??
            (positionalArgs.length > 2
                ? positionalArgs[2] as DateTime
                : DateTime(1900));
        final lastDate = namedArgs.get<DateTime>('lastDate') ??
            (positionalArgs.length > 3
                ? positionalArgs[3] as DateTime
                : DateTime(2100));
        final currentDate = namedArgs.get<DateTime?>('currentDate');
        final initialEntryMode =
            namedArgs.get<DatePickerEntryMode?>('initialEntryMode') ??
                DatePickerEntryMode.calendar;
        final helpText = namedArgs.get<String?>('helpText');
        final cancelText = namedArgs.get<String?>('cancelText');
        final confirmText = namedArgs.get<String?>('confirmText');
        final barrierDismissible =
            namedArgs.get<bool?>('barrierDismissible') ?? true;
        final barrierColor = namedArgs.get<Color?>('barrierColor');
        final barrierLabel = namedArgs.get<String?>('barrierLabel');
        final useRootNavigator =
            namedArgs.get<bool?>('useRootNavigator') ?? true;
        final initialDatePickerMode =
            namedArgs.get<DatePickerMode?>('initialDatePickerMode') ??
                DatePickerMode.day;

        return showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: firstDate,
          lastDate: lastDate,
          currentDate: currentDate,
          initialEntryMode: initialEntryMode,
          helpText: helpText,
          cancelText: cancelText,
          confirmText: confirmText,
          barrierDismissible: barrierDismissible,
          barrierColor: barrierColor,
          barrierLabel: barrierLabel,
          useRootNavigator: useRootNavigator,
          initialDatePickerMode: initialDatePickerMode,
        );
      },
    },
  );
}

/// Returns the BridgedClass for Flutter showTimePicker function.
BridgedClass getShowTimePickerBridgingDefinition() {
  return BridgedClass(
    nativeType: Object,
    name: 'showTimePicker',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final context = namedArgs.get<BuildContext>('context') ??
            (positionalArgs.isNotEmpty
                ? positionalArgs[0] as BuildContext
                : null);
        if (context == null) {
          throw ArgumentError('BuildContext is required for showTimePicker');
        }
        final initialTime = namedArgs.get<TimeOfDay>('initialTime') ??
            (positionalArgs.length > 1
                ? positionalArgs[1] as TimeOfDay
                : TimeOfDay.now());
        final initialEntryMode =
            namedArgs.get<TimePickerEntryMode?>('initialEntryMode') ??
                TimePickerEntryMode.dial;
        final helpText = namedArgs.get<String?>('helpText');
        final cancelText = namedArgs.get<String?>('cancelText');
        final confirmText = namedArgs.get<String?>('confirmText');
        final barrierDismissible =
            namedArgs.get<bool?>('barrierDismissible') ?? true;
        final barrierColor = namedArgs.get<Color?>('barrierColor');
        final barrierLabel = namedArgs.get<String?>('barrierLabel');
        final useRootNavigator =
            namedArgs.get<bool?>('useRootNavigator') ?? true;

        return showTimePicker(
          context: context,
          initialTime: initialTime,
          initialEntryMode: initialEntryMode,
          helpText: helpText,
          cancelText: cancelText,
          confirmText: confirmText,
          barrierDismissible: barrierDismissible,
          barrierColor: barrierColor,
          barrierLabel: barrierLabel,
          useRootNavigator: useRootNavigator,
        );
      },
    },
  );
}

/// Returns the BridgedClass for Flutter showDateRangePicker function.
BridgedClass getShowDateRangePickerBridgingDefinition() {
  return BridgedClass(
    nativeType: Object,
    name: 'showDateRangePicker',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final context = namedArgs.get<BuildContext>('context') ??
            (positionalArgs.isNotEmpty
                ? positionalArgs[0] as BuildContext
                : null);
        if (context == null) {
          throw ArgumentError(
            'BuildContext is required for showDateRangePicker',
          );
        }
        final firstDate = namedArgs.get<DateTime>('firstDate') ??
            (positionalArgs.length > 1
                ? positionalArgs[1] as DateTime
                : DateTime(1900));
        final lastDate = namedArgs.get<DateTime>('lastDate') ??
            (positionalArgs.length > 2
                ? positionalArgs[2] as DateTime
                : DateTime(2100));
        final initialDateRange =
            namedArgs.get<DateTimeRange?>('initialDateRange');
        final currentDate = namedArgs.get<DateTime?>('currentDate');
        final initialEntryMode =
            namedArgs.get<DatePickerEntryMode?>('initialEntryMode') ??
                DatePickerEntryMode.calendar;
        final helpText = namedArgs.get<String?>('helpText');
        final cancelText = namedArgs.get<String?>('cancelText');
        final confirmText = namedArgs.get<String?>('confirmText');
        final saveText = namedArgs.get<String?>('saveText');
        final barrierDismissible =
            namedArgs.get<bool?>('barrierDismissible') ?? true;
        final barrierColor = namedArgs.get<Color?>('barrierColor');
        final barrierLabel = namedArgs.get<String?>('barrierLabel');
        final useRootNavigator =
            namedArgs.get<bool?>('useRootNavigator') ?? true;

        return showDateRangePicker(
          context: context,
          firstDate: firstDate,
          lastDate: lastDate,
          initialDateRange: initialDateRange,
          currentDate: currentDate,
          initialEntryMode: initialEntryMode,
          helpText: helpText,
          cancelText: cancelText,
          confirmText: confirmText,
          saveText: saveText,
          barrierDismissible: barrierDismissible,
          barrierColor: barrierColor,
          barrierLabel: barrierLabel,
          useRootNavigator: useRootNavigator,
        );
      },
    },
  );
}

/// Returns the BridgedClass for Flutter showMenu function.
BridgedClass getShowMenuBridgingDefinition() {
  return BridgedClass(
    nativeType: Object,
    name: 'showMenu',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final context = namedArgs.get<BuildContext>('context') ??
            (positionalArgs.isNotEmpty
                ? positionalArgs[0] as BuildContext
                : null);
        if (context == null) {
          throw ArgumentError('BuildContext is required for showMenu');
        }
        final position = namedArgs.get<RelativeRect>('position') ??
            (positionalArgs.length > 1
                ? positionalArgs[1] as RelativeRect
                : RelativeRect.fill);
        final rawItems = visitor.toElements(namedArgs['items']);
        final List<PopupMenuEntry<dynamic>> items = rawItems is List
            ? rawItems.whereType<PopupMenuEntry<dynamic>>().toList()
            : [];
        final initialValue = namedArgs['initialValue'];
        final elevation = (namedArgs['elevation'] as num?)?.toDouble();
        final semanticLabel = namedArgs.get<String?>('semanticLabel');
        final shape = namedArgs.get<ShapeBorder?>('shape');
        final color = namedArgs.get<Color?>('color');
        final useRootNavigator =
            namedArgs.get<bool?>('useRootNavigator') ?? false;

        return showMenu<dynamic>(
          context: context,
          position: position,
          items: items,
          initialValue: initialValue,
          elevation: elevation,
          semanticLabel: semanticLabel,
          shape: shape,
          color: color,
          useRootNavigator: useRootNavigator,
        );
      },
    },
  );
}
