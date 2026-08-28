import 'package:d4rt/d4rt.dart';
import 'package:flutter/cupertino.dart';

/// Returns the BridgedEnumDefinition for CupertinoDatePickerMode.
BridgedEnumDefinition<CupertinoDatePickerMode>
    getCupertinoDatePickerModeBridgingDefinition() {
  return BridgedEnumDefinition<CupertinoDatePickerMode>(
    name: 'CupertinoDatePickerMode',
    values: CupertinoDatePickerMode.values,
  );
}

/// Returns the BridgedEnumDefinition for CupertinoTimerPickerMode.
BridgedEnumDefinition<CupertinoTimerPickerMode>
    getCupertinoTimerPickerModeBridgingDefinition() {
  return BridgedEnumDefinition<CupertinoTimerPickerMode>(
    name: 'CupertinoTimerPickerMode',
    values: CupertinoTimerPickerMode.values,
  );
}

/// Returns the BridgedEnumDefinition for DatePickerDateOrder.
BridgedEnumDefinition<DatePickerDateOrder>
    getDatePickerDateOrderBridgingDefinition() {
  return BridgedEnumDefinition<DatePickerDateOrder>(
    name: 'DatePickerDateOrder',
    values: DatePickerDateOrder.values,
  );
}

/// Returns the BridgedClass for Flutter CupertinoDatePicker.
BridgedClass getCupertinoDatePickerBridgingDefinition() {
  return BridgedClass(
    nativeType: CupertinoDatePicker,
    name: 'CupertinoDatePicker',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final mode = namedArgs.get<CupertinoDatePickerMode?>('mode') ??
            CupertinoDatePickerMode.dateAndTime;
        final rawOnDateTimeChanged = namedArgs['onDateTimeChanged'];
        ValueChanged<DateTime>? onDateTimeChanged;
        if (rawOnDateTimeChanged is InterpretedFunction) {
          onDateTimeChanged = (DateTime val) {
            rawOnDateTimeChanged.call(visitor, [val], {});
          };
        }
        final initialDateTime = namedArgs.get<DateTime?>('initialDateTime');
        final minimumDate = namedArgs.get<DateTime?>('minimumDate');
        final maximumDate = namedArgs.get<DateTime?>('maximumDate');
        final minimumYear = namedArgs.get<int?>('minimumYear') ?? 1;
        final maximumYear = namedArgs.get<int?>('maximumYear');
        final minuteInterval = namedArgs.get<int?>('minuteInterval') ?? 1;
        final use24hFormat = namedArgs.get<bool?>('use24hFormat') ?? false;
        final dateOrder = namedArgs.get<DatePickerDateOrder?>('dateOrder');
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final showDayOfWeek = namedArgs.get<bool?>('showDayOfWeek') ?? false;

        return CupertinoDatePicker(
          key: key,
          mode: mode,
          onDateTimeChanged: onDateTimeChanged ?? (_) {},
          initialDateTime: initialDateTime,
          minimumDate: minimumDate,
          maximumDate: maximumDate,
          minimumYear: minimumYear,
          maximumYear: maximumYear,
          minuteInterval: minuteInterval,
          use24hFormat: use24hFormat,
          dateOrder: dateOrder,
          backgroundColor: backgroundColor,
          showDayOfWeek: showDayOfWeek,
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
      'dateOrder': (visitor, target) =>
          (target as CupertinoDatePicker).dateOrder,
      'backgroundColor': (visitor, target) =>
          (target as CupertinoDatePicker).backgroundColor,
      'showDayOfWeek': (visitor, target) =>
          (target as CupertinoDatePicker).showDayOfWeek,
    },
  );
}

/// Returns the BridgedClass for Flutter CupertinoTimerPicker.
BridgedClass getCupertinoTimerPickerBridgingDefinition() {
  return BridgedClass(
    nativeType: CupertinoTimerPicker,
    name: 'CupertinoTimerPicker',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final mode = namedArgs.get<CupertinoTimerPickerMode?>('mode') ??
            CupertinoTimerPickerMode.hms;
        final initialTimerDuration =
            namedArgs.get<Duration?>('initialTimerDuration') ?? Duration.zero;
        final minuteInterval = namedArgs.get<int?>('minuteInterval') ?? 1;
        final secondInterval = namedArgs.get<int?>('secondInterval') ?? 1;
        final alignment =
            namedArgs.get<AlignmentGeometry?>('alignment') ?? Alignment.center;
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final rawOnTimerDurationChanged = namedArgs['onTimerDurationChanged'];
        ValueChanged<Duration>? onTimerDurationChanged;
        if (rawOnTimerDurationChanged is InterpretedFunction) {
          onTimerDurationChanged = (Duration val) {
            rawOnTimerDurationChanged.call(visitor, [val], {});
          };
        }

        return CupertinoTimerPicker(
          key: key,
          mode: mode,
          initialTimerDuration: initialTimerDuration,
          minuteInterval: minuteInterval,
          secondInterval: secondInterval,
          alignment: alignment,
          backgroundColor: backgroundColor,
          onTimerDurationChanged: onTimerDurationChanged ?? (_) {},
        );
      },
    },
    getters: {
      'mode': (visitor, target) => (target as CupertinoTimerPicker).mode,
      'initialTimerDuration': (visitor, target) =>
          (target as CupertinoTimerPicker).initialTimerDuration,
      'minuteInterval': (visitor, target) =>
          (target as CupertinoTimerPicker).minuteInterval,
      'secondInterval': (visitor, target) =>
          (target as CupertinoTimerPicker).secondInterval,
      'alignment': (visitor, target) =>
          (target as CupertinoTimerPicker).alignment,
      'backgroundColor': (visitor, target) =>
          (target as CupertinoTimerPicker).backgroundColor,
    },
  );
}
