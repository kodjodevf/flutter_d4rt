// ignore_for_file: deprecated_member_use

import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for Table widget.
BridgedClass getTableBridgingDefinition() {
  return BridgedClass(
    nativeType: Table,
    name: 'Table',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final border = namedArgs.get<TableBorder?>('border');
        final defaultColumnWidth =
            namedArgs.get<TableColumnWidth?>('defaultColumnWidth') ??
            const FlexColumnWidth();
        final textDirection = namedArgs.get<TextDirection?>('textDirection');
        final defaultVerticalAlignment =
            namedArgs.get<TableCellVerticalAlignment?>(
              'defaultVerticalAlignment',
            ) ??
            TableCellVerticalAlignment.top;
        final textBaseline = namedArgs.get<TextBaseline?>('textBaseline');

        final columnWidthsRaw = namedArgs['columnWidths'];
        Map<int, TableColumnWidth>? columnWidths;
        if (columnWidthsRaw is Map) {
          columnWidths = columnWidthsRaw.map((key, value) {
            final int k = (key is num) ? key.toInt() : int.parse(key.toString());
            final TableColumnWidth v = (value is BridgedInstance)
                ? value.nativeObject as TableColumnWidth
                : value as TableColumnWidth;
            return MapEntry(k, v);
          });
        }

        final childrenRaw = namedArgs['children'];
        final List<TableRow> children = [];
        if (childrenRaw is List) {
          for (final row in childrenRaw) {
            if (row is TableRow) {
              children.add(row);
            } else if (row is BridgedInstance && row.nativeObject is TableRow) {
              children.add(row.nativeObject as TableRow);
            }
          }
        }

        return Table(
          key: key,
          children: children,
          columnWidths: columnWidths,
          defaultColumnWidth: defaultColumnWidth,
          textDirection: textDirection,
          border: border,
          defaultVerticalAlignment: defaultVerticalAlignment,
          textBaseline: textBaseline,
        );
      },
    },
    getters: {
      'children': (visitor, target) => (target as Table).children,
      'border': (visitor, target) => (target as Table).border,
      'key': (visitor, target) => (target as Table).key,
    },
  );
}

/// Returns the BridgedClass for TableRow.
BridgedClass getTableRowBridgingDefinition() {
  return BridgedClass(
    nativeType: TableRow,
    name: 'TableRow',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<LocalKey?>('key');
        final decoration = namedArgs.get<Decoration?>('decoration');
        final childrenRaw = visitor.toWidgets(namedArgs['children']);
        final List<Widget> children = childrenRaw is List<Widget>
            ? childrenRaw
            : (childrenRaw is List
                ? childrenRaw.cast<Widget>()
                : (childrenRaw is Widget ? [childrenRaw] : <Widget>[]));

        return TableRow(
          key: key,
          decoration: decoration,
          children: children,
        );
      },
    },
    getters: {
      'decoration': (visitor, target) => (target as TableRow).decoration,
      'children': (visitor, target) => (target as TableRow).children,
      'key': (visitor, target) => (target as TableRow).key,
    },
    isSubtypeOfFunc: (value) => value is TableRow,
  );
}

/// Returns the BridgedClass for TableCell.
BridgedClass getTableCellBridgingDefinition() {
  return BridgedClass(
    nativeType: TableCell,
    name: 'TableCell',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final verticalAlignment =
            namedArgs.get<TableCellVerticalAlignment?>('verticalAlignment');
        final child = visitor.toWidgets(namedArgs['child']) ?? const SizedBox.shrink();

        return TableCell(
          key: key,
          verticalAlignment: verticalAlignment,
          child: child,
        );
      },
    },
    getters: {
      'verticalAlignment': (visitor, target) =>
          (target as TableCell).verticalAlignment,
      'child': (visitor, target) => (target as TableCell).child,
      'key': (visitor, target) => (target as TableCell).key,
    },
  );
}

/// Returns the BridgedClass for TableBorder.
BridgedClass getTableBorderBridgingDefinition() {
  return BridgedClass(
    nativeType: TableBorder,
    name: 'TableBorder',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final top = namedArgs.get<BorderSide?>('top') ?? BorderSide.none;
        final right = namedArgs.get<BorderSide?>('right') ?? BorderSide.none;
        final bottom = namedArgs.get<BorderSide?>('bottom') ?? BorderSide.none;
        final left = namedArgs.get<BorderSide?>('left') ?? BorderSide.none;
        final horizontalInside =
            namedArgs.get<BorderSide?>('horizontalInside') ?? BorderSide.none;
        final verticalInside =
            namedArgs.get<BorderSide?>('verticalInside') ?? BorderSide.none;
        final borderRadius =
            namedArgs.get<BorderRadius?>('borderRadius') ?? BorderRadius.zero;

        return TableBorder(
          top: top,
          right: right,
          bottom: bottom,
          left: left,
          horizontalInside: horizontalInside,
          verticalInside: verticalInside,
          borderRadius: borderRadius,
        );
      },
      'all': (visitor, positionalArgs, namedArgs) {
        final color = namedArgs.get<Color?>('color') ?? const Color(0xFF000000);
        final width = namedArgs.getToDouble('width') ?? 1.0;
        final style = namedArgs.get<BorderStyle?>('style') ?? BorderStyle.solid;
        final borderRadius =
            namedArgs.get<BorderRadius?>('borderRadius') ?? BorderRadius.zero;

        return TableBorder.all(
          color: color,
          width: width,
          style: style,
          borderRadius: borderRadius,
        );
      },
      'symmetric': (visitor, positionalArgs, namedArgs) {
        final inside =
            namedArgs.get<BorderSide?>('inside') ?? BorderSide.none;
        final outside =
            namedArgs.get<BorderSide?>('outside') ?? BorderSide.none;
        final borderRadius =
            namedArgs.get<BorderRadius?>('borderRadius') ?? BorderRadius.zero;

        return TableBorder.symmetric(
          inside: inside,
          outside: outside,
          borderRadius: borderRadius,
        );
      },
    },
    getters: {
      'top': (visitor, target) => (target as TableBorder).top,
      'right': (visitor, target) => (target as TableBorder).right,
      'bottom': (visitor, target) => (target as TableBorder).bottom,
      'left': (visitor, target) => (target as TableBorder).left,
      'borderRadius': (visitor, target) => (target as TableBorder).borderRadius,
    },
    isSubtypeOfFunc: (value) => value is TableBorder,
  );
}

/// Returns the BridgedEnum for TableCellVerticalAlignment.
BridgedEnumDefinition<TableCellVerticalAlignment>
    getTableCellVerticalAlignmentBridgingDefinition() {
  return BridgedEnumDefinition<TableCellVerticalAlignment>(
    name: 'TableCellVerticalAlignment',
    values: TableCellVerticalAlignment.values,
  );
}

/// Returns the BridgedClass for TableColumnWidth abstract class.
BridgedClass getTableColumnWidthBridgingDefinition() {
  return BridgedClass(
    nativeType: TableColumnWidth,
    name: 'TableColumnWidth',
    constructors: {},
    isSubtypeOfFunc: (value) => value is TableColumnWidth,
  );
}

/// Returns the BridgedClass for FlexColumnWidth.
BridgedClass getFlexColumnWidthBridgingDefinition() {
  return BridgedClass(
    nativeType: FlexColumnWidth,
    name: 'FlexColumnWidth',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final value = positionalArgs.isNotEmpty
            ? (positionalArgs[0] as num).toDouble()
            : namedArgs.getToDouble('value') ?? 1.0;
        return FlexColumnWidth(value);
      },
    },
    getters: {
      'value': (visitor, target) => (target as FlexColumnWidth).value,
    },
    isSubtypeOfFunc: (value) => value is FlexColumnWidth,
  );
}

/// Returns the BridgedClass for FixedColumnWidth.
BridgedClass getFixedColumnWidthBridgingDefinition() {
  return BridgedClass(
    nativeType: FixedColumnWidth,
    name: 'FixedColumnWidth',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final value = positionalArgs.isNotEmpty
            ? (positionalArgs[0] as num).toDouble()
            : namedArgs.getToDouble('value') ?? 0.0;
        return FixedColumnWidth(value);
      },
    },
    getters: {
      'value': (visitor, target) => (target as FixedColumnWidth).value,
    },
    isSubtypeOfFunc: (value) => value is FixedColumnWidth,
  );
}

/// Returns the BridgedClass for FractionColumnWidth.
BridgedClass getFractionColumnWidthBridgingDefinition() {
  return BridgedClass(
    nativeType: FractionColumnWidth,
    name: 'FractionColumnWidth',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final value = positionalArgs.isNotEmpty
            ? (positionalArgs[0] as num).toDouble()
            : namedArgs.getToDouble('value') ?? 0.0;
        return FractionColumnWidth(value);
      },
    },
    getters: {
      'value': (visitor, target) => (target as FractionColumnWidth).value,
    },
    isSubtypeOfFunc: (value) => value is FractionColumnWidth,
  );
}

/// Returns the BridgedClass for IntrinsicColumnWidth.
BridgedClass getIntrinsicColumnWidthBridgingDefinition() {
  return BridgedClass(
    nativeType: IntrinsicColumnWidth,
    name: 'IntrinsicColumnWidth',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final flex = positionalArgs.isNotEmpty
            ? (positionalArgs[0] as num?)?.toDouble()
            : namedArgs.getToDouble('flex');
        return IntrinsicColumnWidth(flex: flex);
      },
    },
    isSubtypeOfFunc: (value) => value is IntrinsicColumnWidth,
  );
}
