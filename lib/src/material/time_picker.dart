import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';

/// Returns the BridgedClass for the Flutter TimePicker related functions.
BridgedClass getTimeOfDayBridgingDefinition() {
  return BridgedClass(
    nativeType: TimeOfDay,
    name: 'TimeOfDay',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final hour = namedArgs.get<int>('hour') ?? 0;
        final minute = namedArgs.get<int>('minute') ?? 0;

        return TimeOfDay(hour: hour, minute: minute);
      },
      'now': (visitor, positionalArgs, namedArgs) {
        return TimeOfDay.now();
      },
      'fromDateTime': (visitor, positionalArgs, namedArgs) {
        final dateTime = positionalArgs.isNotEmpty
            ? positionalArgs[0] as DateTime
            : namedArgs.get<DateTime>('time');

        if (dateTime == null) {
          throw ArgumentError(
            'DateTime is required for TimeOfDay.fromDateTime',
          );
        }

        return TimeOfDay.fromDateTime(dateTime);
      },
    },
    getters: {
      'hour': (visitor, target) => (target as TimeOfDay).hour,
      'minute': (visitor, target) => (target as TimeOfDay).minute,
      'hourOfPeriod': (visitor, target) => (target as TimeOfDay).hourOfPeriod,
      'period': (visitor, target) => (target as TimeOfDay).period,
    },
    methods: {
      'toString': (visitor, target, positionalArgs, namedArgs) {
        return (target as TimeOfDay).toString();
      },
      // 'asTarget': (visitor, target, positionalArgs, namedArgs) {
      //   final className = namedArgs.get<String>('className');
      //   if (className == null) {
      //     throw ArgumentError('className is required for asTarget');
      //   }
      //   return (target as TimeOfDay).asTarget(className);
      // },
      'replacing': (visitor, target, positionalArgs, namedArgs) {
        final hour = namedArgs.get<int?>('hour');
        final minute = namedArgs.get<int?>('minute');
        return (target as TimeOfDay).replacing(hour: hour, minute: minute);
      },
      'compareTo': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.isNotEmpty
            ? positionalArgs[0] as TimeOfDay
            : namedArgs.get<TimeOfDay>('other');

        if (other == null) {
          throw ArgumentError('TimeOfDay is required for compareTo');
        }

        return (target as TimeOfDay).isAfter(other);
      },
      'isBefore': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.isNotEmpty
            ? positionalArgs[0] as TimeOfDay
            : namedArgs.get<TimeOfDay>('other');

        if (other == null) {
          throw ArgumentError('TimeOfDay is required for isBefore');
        }

        return (target as TimeOfDay).isBefore(other);
      },
      'isAfter': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.isNotEmpty
            ? positionalArgs[0] as TimeOfDay
            : namedArgs.get<TimeOfDay>('other');

        if (other == null) {
          throw ArgumentError('TimeOfDay is required for isAfter');
        }

        return (target as TimeOfDay).isAfter(other);
      },
      'isAtSameTimeAs': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.isNotEmpty
            ? positionalArgs[0] as TimeOfDay
            : namedArgs.get<TimeOfDay>('other');

        if (other == null) {
          throw ArgumentError('TimeOfDay is required for isAtSameTimeAs');
        }

        return (target as TimeOfDay).isAtSameTimeAs(other);
      },
      'format': (visitor, target, positionalArgs, namedArgs) {
        final context = positionalArgs.isNotEmpty
            ? positionalArgs[0] as BuildContext
            : namedArgs.get<BuildContext>('context');

        if (context == null) {
          throw ArgumentError('BuildContext is required for format');
        }

        return (target as TimeOfDay).format(context);
      },
    },
  );
}

/// Returns the BridgedClass for DatePicker related enums.
BridgedEnumDefinition getDayPeriodBridgingDefinition() {
  return BridgedEnumDefinition<DayPeriod>(
    name: 'DayPeriod',
    values: DayPeriod.values,
  );
}
