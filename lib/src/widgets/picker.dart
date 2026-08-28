import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_d4rt/utils/double.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Picker and selection widgets bridging definitions

// DatePicker bridging
BridgedClass getDatePickerBridgingDefinition() {
  return BridgedClass(
    nativeType: CalendarDatePicker,
    name: 'CalendarDatePicker',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return CalendarDatePicker(
          key: namedArgs.get<Key?>('key'),
          initialDate: namedArgs['initialDate'] as DateTime,
          firstDate: namedArgs['firstDate'] as DateTime,
          lastDate: namedArgs['lastDate'] as DateTime,
          currentDate: namedArgs['currentDate'] as DateTime?,
          onDateChanged: (value) {
            final func = namedArgs['onDateChanged'] as InterpretedFunction;
            func.call(visitor, [value]);
          },
          onDisplayedMonthChanged: (() {
            if (namedArgs['onDisplayedMonthChanged'] == null) return null;
            if (namedArgs['onDisplayedMonthChanged'] is InterpretedFunction) {
              final func =
                  namedArgs['onDisplayedMonthChanged'] as InterpretedFunction;
              return (DateTime value) => func.call(visitor, [value]);
            }
            return namedArgs['onDisplayedMonthChanged']
                as ValueChanged<DateTime>?;
          })(),
          initialCalendarMode:
              namedArgs['initialCalendarMode'] as DatePickerMode? ??
              DatePickerMode.day,
          selectableDayPredicate: namedArgs['selectableDayPredicate'] == null
              ? null
              : (day) {
                  final func =
                      namedArgs['selectableDayPredicate']
                          as InterpretedFunction;
                  return func.call(visitor, [day]) as bool;
                },
        );
      },
    },
    staticMethods: {
      'showDatePicker': (visitor, positionalArgs, namedArgs) async {
        final context = namedArgs['context'] as BuildContext;
        final initialDate = namedArgs['initialDate'] as DateTime;
        final firstDate = namedArgs['firstDate'] as DateTime;
        final lastDate = namedArgs['lastDate'] as DateTime;

        return await showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: firstDate,
          lastDate: lastDate,
          currentDate: namedArgs['currentDate'] as DateTime?,
          helpText: namedArgs['helpText'] as String?,
          cancelText: namedArgs['cancelText'] as String?,
          confirmText: namedArgs['confirmText'] as String?,
          locale: namedArgs['locale'] as Locale?,
          useRootNavigator: namedArgs['useRootNavigator'] as bool? ?? true,
          routeSettings: namedArgs['routeSettings'] as RouteSettings?,
          textDirection: namedArgs['textDirection'] as TextDirection?,
          builder: namedArgs['builder'] == null
              ? null
              : (context, child) {
                  final func = namedArgs['builder'] as InterpretedFunction;
                  return func.call(visitor, [context, child]) as Widget;
                },
          initialEntryMode:
              namedArgs['initialEntryMode'] as DatePickerEntryMode? ??
              DatePickerEntryMode.calendar,
          selectableDayPredicate: namedArgs['selectableDayPredicate'] == null
              ? null
              : (day) {
                  final func =
                      namedArgs['selectableDayPredicate']
                          as InterpretedFunction;
                  return func.call(visitor, [day]) as bool;
                },
          errorFormatText: namedArgs['errorFormatText'] as String?,
          errorInvalidText: namedArgs['errorInvalidText'] as String?,
          fieldHintText: namedArgs['fieldHintText'] as String?,
          fieldLabelText: namedArgs['fieldLabelText'] as String?,
          keyboardType: namedArgs['keyboardType'] as TextInputType?,
          anchorPoint: namedArgs['anchorPoint'] as Offset?,
        );
      },
    },
    getters: {
      'initialDate': (visitor, target) =>
          (target as CalendarDatePicker).initialDate,
      'firstDate': (visitor, target) =>
          (target as CalendarDatePicker).firstDate,
      'lastDate': (visitor, target) => (target as CalendarDatePicker).lastDate,
      'currentDate': (visitor, target) =>
          (target as CalendarDatePicker).currentDate,
      'initialCalendarMode': (visitor, target) =>
          (target as CalendarDatePicker).initialCalendarMode,
      'key': (visitor, target) => (target as CalendarDatePicker).key,
    },
  );
}

// TimePicker bridging
BridgedClass getTimePickerBridgingDefinition() {
  return BridgedClass(
    nativeType: TimePickerDialog,
    name: 'TimePickerDialog',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return TimePickerDialog(
          key: namedArgs.get<Key?>('key'),
          initialTime: namedArgs['initialTime'] as TimeOfDay,
          cancelText: namedArgs['cancelText'] as String?,
          confirmText: namedArgs['confirmText'] as String?,
          helpText: namedArgs['helpText'] as String?,
          errorInvalidText: namedArgs['errorInvalidText'] as String?,
          hourLabelText: namedArgs['hourLabelText'] as String?,
          minuteLabelText: namedArgs['minuteLabelText'] as String?,
          restorationId: namedArgs['restorationId'] as String?,
          initialEntryMode:
              namedArgs['initialEntryMode'] as TimePickerEntryMode? ??
              TimePickerEntryMode.dial,
          orientation: namedArgs['orientation'] as Orientation?,
          onEntryModeChanged: (TimePickerEntryMode value) {
            final func = namedArgs['onEntryModeChanged'] as InterpretedFunction;
            func.call(visitor, [value]);
          },
        );
      },
    },
    staticMethods: {
      'showTimePicker': (visitor, positionalArgs, namedArgs) async {
        final context = namedArgs['context'] as BuildContext;
        final initialTime = namedArgs['initialTime'] as TimeOfDay;

        return await showTimePicker(
          context: context,
          initialTime: initialTime,
          builder: namedArgs['builder'] == null
              ? null
              : (context, child) {
                  final func = namedArgs['builder'] as InterpretedFunction;
                  return func.call(visitor, [context, child]) as Widget;
                },
          useRootNavigator: namedArgs['useRootNavigator'] as bool? ?? true,
          initialEntryMode:
              namedArgs['initialEntryMode'] as TimePickerEntryMode? ??
              TimePickerEntryMode.dial,
          cancelText: namedArgs['cancelText'] as String?,
          confirmText: namedArgs['confirmText'] as String?,
          helpText: namedArgs['helpText'] as String?,
          errorInvalidText: namedArgs['errorInvalidText'] as String?,
          hourLabelText: namedArgs['hourLabelText'] as String?,
          minuteLabelText: namedArgs['minuteLabelText'] as String?,
          routeSettings: namedArgs['routeSettings'] as RouteSettings?,
          orientation: namedArgs['orientation'] as Orientation?,
          anchorPoint: namedArgs['anchorPoint'] as Offset?,
        );
      },
    },
    getters: {
      'initialTime': (visitor, target) =>
          (target as TimePickerDialog).initialTime,
      'initialEntryMode': (visitor, target) =>
          (target as TimePickerDialog).initialEntryMode,
      'key': (visitor, target) => (target as TimePickerDialog).key,
    },
  );
}

// Cupertino Date Picker bridging
BridgedClass getCupertinoDatePickerBridgingDefinition() {
  return BridgedClass(
    nativeType: CupertinoDatePicker,
    name: 'CupertinoDatePicker',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return CupertinoDatePicker(
          key: namedArgs.get<Key?>('key'),
          mode:
              namedArgs['mode'] as CupertinoDatePickerMode? ??
              CupertinoDatePickerMode.dateAndTime,
          onDateTimeChanged: (() {
            final func = namedArgs['onDateTimeChanged'] as InterpretedFunction;
            return (DateTime value) => func.call(visitor, [value]);
          })(),
          initialDateTime: namedArgs['initialDateTime'] as DateTime?,
          minimumDate: namedArgs['minimumDate'] as DateTime?,
          maximumDate: namedArgs['maximumDate'] as DateTime?,
          minimumYear: namedArgs['minimumYear'] as int? ?? 1,
          maximumYear: namedArgs['maximumYear'] as int?,
          minuteInterval: namedArgs['minuteInterval'] as int? ?? 1,
          use24hFormat: namedArgs['use24hFormat'] as bool? ?? false,
          dateOrder: namedArgs['dateOrder'] as DatePickerDateOrder?,
          backgroundColor: namedArgs['backgroundColor'] as Color?,
          showDayOfWeek: namedArgs['showDayOfWeek'] as bool? ?? false,
          itemExtent: toDouble(namedArgs['itemExtent']) ?? 32.0,
        );
      },
    },
    getters: {
      'mode': (visitor, target) => (target as CupertinoDatePicker).mode,
      'initialDateTime': (visitor, target) =>
          (target as CupertinoDatePicker).initialDateTime,
      'minimumDate': (visitor, target) =>
          (target as CupertinoDatePicker).minimumDate,
      'maximumDate': (visitor, target) =>
          (target as CupertinoDatePicker).maximumDate,
      'minimumYear': (visitor, target) =>
          (target as CupertinoDatePicker).minimumYear,
      'maximumYear': (visitor, target) =>
          (target as CupertinoDatePicker).maximumYear,
      'minuteInterval': (visitor, target) =>
          (target as CupertinoDatePicker).minuteInterval,
      'use24hFormat': (visitor, target) =>
          (target as CupertinoDatePicker).use24hFormat,
      'backgroundColor': (visitor, target) =>
          (target as CupertinoDatePicker).backgroundColor,
      'showDayOfWeek': (visitor, target) =>
          (target as CupertinoDatePicker).showDayOfWeek,
      'itemExtent': (visitor, target) =>
          (target as CupertinoDatePicker).itemExtent,
      'key': (visitor, target) => (target as CupertinoDatePicker).key,
    },
  );
}

// Cupertino Picker bridging
BridgedClass getCupertinoPickerBridgingDefinition() {
  return BridgedClass(
    nativeType: CupertinoPicker,
    name: 'CupertinoPicker',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return CupertinoPicker(
          key: namedArgs.get<Key?>('key'),
          diameterRatio: toDouble(namedArgs['diameterRatio']) ?? 1.07,
          backgroundColor: namedArgs['backgroundColor'] as Color?,
          offAxisFraction: toDouble(namedArgs['offAxisFraction']) ?? 0.0,
          useMagnifier: namedArgs['useMagnifier'] as bool? ?? false,
          magnification: toDouble(namedArgs['magnification']) ?? 1.0,
          scrollController:
              namedArgs['scrollController'] as FixedExtentScrollController?,
          squeeze: toDouble(namedArgs['squeeze']) ?? 1.45,
          itemExtent: toDouble(namedArgs['itemExtent']) ?? 32.0,
          onSelectedItemChanged: (value) {
            final func =
                namedArgs['onSelectedItemChanged'] as InterpretedFunction;
            func.call(visitor, [value]);
          },
          selectionOverlay:
              visitor.toWidgets(namedArgs['selectionOverlay']) ??
              const CupertinoPickerDefaultSelectionOverlay(),
          children: visitor.toWidgetList(namedArgs['children']),
        );
      },
      'builder': (visitor, positionalArgs, namedArgs) {
        // Handle itemBuilder function
        Widget Function(BuildContext, int) itemBuilder = (context, index) =>
            SizedBox.shrink();
        final itemBuilderValue = namedArgs['itemBuilder'];

        if (itemBuilderValue is InterpretedFunction) {
          itemBuilder = (context, index) {
            final result = itemBuilderValue.call(visitor, [context, index]);
            return visitor.toWidgets(result);
          };
        }

        return CupertinoPicker.builder(
          key: namedArgs.get<Key?>('key'),
          diameterRatio: toDouble(namedArgs['diameterRatio']) ?? 1.07,
          backgroundColor: namedArgs['backgroundColor'] as Color?,
          offAxisFraction: toDouble(namedArgs['offAxisFraction']) ?? 0.0,
          useMagnifier: namedArgs['useMagnifier'] as bool? ?? false,
          magnification: toDouble(namedArgs['magnification']) ?? 1.0,
          scrollController:
              namedArgs['scrollController'] as FixedExtentScrollController?,
          squeeze: toDouble(namedArgs['squeeze']) ?? 1.45,
          itemExtent: toDouble(namedArgs['itemExtent']) ?? 32.0,
          onSelectedItemChanged: (value) {
            final func =
                namedArgs['onSelectedItemChanged'] as InterpretedFunction;
            func.call(visitor, [value]);
          },
          itemBuilder: itemBuilder,
          childCount: namedArgs['childCount'] as int?,
          selectionOverlay:
              visitor.toWidgets(namedArgs['selectionOverlay']) ??
              const CupertinoPickerDefaultSelectionOverlay(),
        );
      },
    },
    getters: {
      'diameterRatio': (visitor, target) =>
          (target as CupertinoPicker).diameterRatio,
      'backgroundColor': (visitor, target) =>
          (target as CupertinoPicker).backgroundColor,
      'offAxisFraction': (visitor, target) =>
          (target as CupertinoPicker).offAxisFraction,
      'useMagnifier': (visitor, target) =>
          (target as CupertinoPicker).useMagnifier,
      'magnification': (visitor, target) =>
          (target as CupertinoPicker).magnification,
      'squeeze': (visitor, target) => (target as CupertinoPicker).squeeze,
      'itemExtent': (visitor, target) => (target as CupertinoPicker).itemExtent,
      'selectionOverlay': (visitor, target) =>
          (target as CupertinoPicker).selectionOverlay,
      'key': (visitor, target) => (target as CupertinoPicker).key,
    },
  );
}
