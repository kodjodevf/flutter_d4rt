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

/// Returns the BridgedClass for the Flutter DatePickerDialog widget.
BridgedClass getDatePickerDialogBridgingDefinition() {
  return BridgedClass(
    nativeType: DatePickerDialog,
    name: 'DatePickerDialog',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final initialDate =
            namedArgs.get<DateTime>('initialDate') ?? DateTime.now();
        final firstDate =
            namedArgs.get<DateTime>('firstDate') ?? DateTime(1900);
        final lastDate =
            namedArgs.get<DateTime>('lastDate') ?? DateTime(2100);
        final currentDate = namedArgs.get<DateTime?>('currentDate');
        final initialEntryMode =
            namedArgs.get<DatePickerEntryMode?>('initialEntryMode') ??
                DatePickerEntryMode.calendar;
        final helpText = namedArgs.get<String?>('helpText');
        final cancelText = namedArgs.get<String?>('cancelText');
        final confirmText = namedArgs.get<String?>('confirmText');
        final restorationId = namedArgs.get<String?>('restorationId');
        final initialCalendarMode =
            namedArgs.get<DatePickerMode?>('initialCalendarMode') ??
                DatePickerMode.day;

        return DatePickerDialog(
          key: key,
          initialDate: initialDate,
          firstDate: firstDate,
          lastDate: lastDate,
          currentDate: currentDate,
          initialEntryMode: initialEntryMode,
          helpText: helpText,
          cancelText: cancelText,
          confirmText: confirmText,
          restorationId: restorationId,
          initialCalendarMode: initialCalendarMode,
        );
      },
    },
    getters: {
      'initialDate': (visitor, target) =>
          (target as DatePickerDialog).initialDate,
      'firstDate': (visitor, target) => (target as DatePickerDialog).firstDate,
      'lastDate': (visitor, target) => (target as DatePickerDialog).lastDate,
      'currentDate': (visitor, target) =>
          (target as DatePickerDialog).currentDate,
      'initialEntryMode': (visitor, target) =>
          (target as DatePickerDialog).initialEntryMode,
      'helpText': (visitor, target) => (target as DatePickerDialog).helpText,
      'cancelText': (visitor, target) =>
          (target as DatePickerDialog).cancelText,
      'confirmText': (visitor, target) =>
          (target as DatePickerDialog).confirmText,
      'key': (visitor, target) => (target as DatePickerDialog).key,
    },
    isSubtypeOfFunc: (value) => value is DatePickerDialog,
  );
}

/// Returns the BridgedClass for the Flutter TimePickerDialog widget.
BridgedClass getTimePickerDialogBridgingDefinition() {
  return BridgedClass(
    nativeType: TimePickerDialog,
    name: 'TimePickerDialog',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final initialTime =
            namedArgs.get<TimeOfDay>('initialTime') ?? TimeOfDay.now();
        final cancelText = namedArgs.get<String?>('cancelText');
        final confirmText = namedArgs.get<String?>('confirmText');
        final helpText = namedArgs.get<String?>('helpText');
        final initialEntryMode =
            namedArgs.get<TimePickerEntryMode?>('initialEntryMode') ??
                TimePickerEntryMode.dial;
        final restorationId = namedArgs.get<String?>('restorationId');

        return TimePickerDialog(
          key: key,
          initialTime: initialTime,
          cancelText: cancelText,
          confirmText: confirmText,
          helpText: helpText,
          initialEntryMode: initialEntryMode,
          restorationId: restorationId,
        );
      },
    },
    getters: {
      'initialTime': (visitor, target) =>
          (target as TimePickerDialog).initialTime,
      'cancelText': (visitor, target) =>
          (target as TimePickerDialog).cancelText,
      'confirmText': (visitor, target) =>
          (target as TimePickerDialog).confirmText,
      'helpText': (visitor, target) => (target as TimePickerDialog).helpText,
      'initialEntryMode': (visitor, target) =>
          (target as TimePickerDialog).initialEntryMode,
      'key': (visitor, target) => (target as TimePickerDialog).key,
    },
    isSubtypeOfFunc: (value) => value is TimePickerDialog,
  );
}
