import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for the Flutter Tooltip widget.
BridgedClass getTooltipBridgingDefinition() {
  return BridgedClass(
    nativeType: Tooltip,
    name: 'Tooltip',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final message = namedArgs.get<String?>('message');
        final height = namedArgs.getToDouble('height');
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding');
        final margin = namedArgs.get<EdgeInsetsGeometry?>('margin');
        final verticalOffset = namedArgs.getToDouble('verticalOffset');
        final preferBelow = namedArgs.get<bool?>('preferBelow');
        final excludeFromSemantics = namedArgs.get<bool?>(
          'excludeFromSemantics',
        );
        final decoration = namedArgs.get<Decoration?>('decoration');
        final textStyle = namedArgs.get<TextStyle?>('textStyle');
        final textAlign = namedArgs.get<TextAlign?>('textAlign');
        final waitDuration = namedArgs.get<Duration?>('waitDuration');
        final showDuration = namedArgs.get<Duration?>('showDuration');
        final triggerMode = namedArgs.get<TooltipTriggerMode?>('triggerMode');
        final enableFeedback = namedArgs.get<bool?>('enableFeedback');
        final onTriggered = namedArgs.handleVoidCallback(
          'onTriggered',
          visitor,
        );
        final richMessage = namedArgs.get<InlineSpan?>('richMessage');
        final child = visitor.toWidgets(namedArgs['child']);

        return Tooltip(
          key: key,
          message: message,
          height: height,
          padding: padding,
          margin: margin,
          verticalOffset: verticalOffset,
          preferBelow: preferBelow,
          excludeFromSemantics: excludeFromSemantics,
          decoration: decoration,
          textStyle: textStyle,
          textAlign: textAlign,
          waitDuration: waitDuration,
          showDuration: showDuration,
          triggerMode: triggerMode,
          enableFeedback: enableFeedback,
          onTriggered: onTriggered,
          richMessage: richMessage,
          child: child,
        );
      },
    },
    getters: {
      'message': (visitor, target) => (target as Tooltip).message,
      'height': (visitor, target) => (target as Tooltip).height,
      'padding': (visitor, target) => (target as Tooltip).padding,
      'margin': (visitor, target) => (target as Tooltip).margin,
      'verticalOffset': (visitor, target) => (target as Tooltip).verticalOffset,
      'preferBelow': (visitor, target) => (target as Tooltip).preferBelow,
      'excludeFromSemantics': (visitor, target) =>
          (target as Tooltip).excludeFromSemantics,
      'decoration': (visitor, target) => (target as Tooltip).decoration,
      'textStyle': (visitor, target) => (target as Tooltip).textStyle,
      'textAlign': (visitor, target) => (target as Tooltip).textAlign,
      'waitDuration': (visitor, target) => (target as Tooltip).waitDuration,
      'showDuration': (visitor, target) => (target as Tooltip).showDuration,
      'triggerMode': (visitor, target) => (target as Tooltip).triggerMode,
      'enableFeedback': (visitor, target) => (target as Tooltip).enableFeedback,
      'richMessage': (visitor, target) => (target as Tooltip).richMessage,
      'child': (visitor, target) => (target as Tooltip).child,
    },
  );
}

/// Returns the BridgedClass for the Flutter RefreshIndicator widget.
BridgedClass getRefreshIndicatorBridgingDefinition() {
  return BridgedClass(
    nativeType: RefreshIndicator,
    name: 'RefreshIndicator',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final child = visitor.toWidgets(namedArgs['child']);
        final displacement = namedArgs.getToDouble('displacement') ?? 40.0;
        final edgeOffset = namedArgs.getToDouble('edgeOffset') ?? 0.0;
        final onRefresh = namedArgs.get<RefreshCallback>('onRefresh');
        if (onRefresh == null) {
          throw ArgumentError('onRefresh is required for RefreshIndicator');
        }
        final color = namedArgs.get<Color?>('color');
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final notificationPredicate =
            namedArgs.get<ScrollNotificationPredicate?>(
              'notificationPredicate',
            ) ??
            defaultScrollNotificationPredicate;
        final semanticsLabel = namedArgs.get<String?>('semanticsLabel');
        final semanticsValue = namedArgs.get<String?>('semanticsValue');
        final strokeWidth =
            namedArgs.getToDouble('strokeWidth') ??
            RefreshProgressIndicator.defaultStrokeWidth;
        final triggerMode =
            namedArgs.get<RefreshIndicatorTriggerMode?>('triggerMode') ??
            RefreshIndicatorTriggerMode.onEdge;

        return RefreshIndicator(
          key: key,
          child: child,
          displacement: displacement,
          edgeOffset: edgeOffset,
          onRefresh: onRefresh,
          color: color,
          backgroundColor: backgroundColor,
          notificationPredicate: notificationPredicate,
          semanticsLabel: semanticsLabel,
          semanticsValue: semanticsValue,
          strokeWidth: strokeWidth,
          triggerMode: triggerMode,
        );
      },
    },
    getters: {
      'child': (visitor, target) => (target as RefreshIndicator).child,
      'displacement': (visitor, target) =>
          (target as RefreshIndicator).displacement,
      'edgeOffset': (visitor, target) =>
          (target as RefreshIndicator).edgeOffset,
      'onRefresh': (visitor, target) => (target as RefreshIndicator).onRefresh,
      'color': (visitor, target) => (target as RefreshIndicator).color,
      'backgroundColor': (visitor, target) =>
          (target as RefreshIndicator).backgroundColor,
      'semanticsLabel': (visitor, target) =>
          (target as RefreshIndicator).semanticsLabel,
      'semanticsValue': (visitor, target) =>
          (target as RefreshIndicator).semanticsValue,
      'strokeWidth': (visitor, target) =>
          (target as RefreshIndicator).strokeWidth,
      'triggerMode': (visitor, target) =>
          (target as RefreshIndicator).triggerMode,
    },
  );
}

/// Returns the BridgedClass for the Flutter DataTable widget.
BridgedClass getDataTableBridgingDefinition() {
  return BridgedClass(
    nativeType: DataTable,
    name: 'DataTable',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final columns = visitor.toWidgets(namedArgs['columns']);
        final rowsRaw = namedArgs['rows'];
        final rows = rowsRaw is List
            ? rowsRaw.map((item) {
                if (item is DataRow) return item;
                if (item is BridgedInstance && item.nativeObject is DataRow) {
                  return item.nativeObject as DataRow;
                }
                throw ArgumentError(
                  'Expected DataRow, got: $item (${item.runtimeType})',
                );
              }).toList()
            : <DataRow>[];
        final sortColumnIndex = namedArgs.get<int?>('sortColumnIndex');
        final sortAscending = namedArgs.get<bool?>('sortAscending') ?? true;
        final onSelectAll = namedArgs.get<ValueSetter<bool?>?>('onSelectAll');
        final dataRowColor = namedArgs.get<MaterialStateProperty<Color?>?>(
          'dataRowColor',
        );
        final dataRowHeight = namedArgs.getToDouble('dataRowHeight');
        final dataTextStyle = namedArgs.get<TextStyle?>('dataTextStyle');
        final headingRowColor = namedArgs.get<MaterialStateProperty<Color?>?>(
          'headingRowColor',
        );
        final headingRowHeight = namedArgs.getToDouble('headingRowHeight');
        final headingTextStyle = namedArgs.get<TextStyle?>('headingTextStyle');
        final horizontalMargin = namedArgs.getToDouble('horizontalMargin');
        final columnSpacing = namedArgs.getToDouble('columnSpacing');
        final showCheckboxColumn =
            namedArgs.get<bool?>('showCheckboxColumn') ?? true;
        final showBottomBorder =
            namedArgs.get<bool?>('showBottomBorder') ?? false;
        final dividerThickness = namedArgs.getToDouble('dividerThickness');
        final checkboxHorizontalMargin = namedArgs.getToDouble(
          'checkboxHorizontalMargin',
        );
        final border = namedArgs.get<TableBorder?>('border');
        final clipBehavior = namedArgs.get<Clip?>('clipBehavior') ?? Clip.none;

        return DataTable(
          key: key,
          columns: columns is List<DataColumn> ? columns : [],
          rows: rows,
          sortColumnIndex: sortColumnIndex,
          sortAscending: sortAscending,
          onSelectAll: onSelectAll,
          dataRowColor: dataRowColor,
          dataRowHeight: dataRowHeight,
          dataTextStyle: dataTextStyle,
          headingRowColor: headingRowColor,
          headingRowHeight: headingRowHeight,
          headingTextStyle: headingTextStyle,
          horizontalMargin: horizontalMargin,
          columnSpacing: columnSpacing,
          showCheckboxColumn: showCheckboxColumn,
          showBottomBorder: showBottomBorder,
          dividerThickness: dividerThickness,
          checkboxHorizontalMargin: checkboxHorizontalMargin,
          border: border,
          clipBehavior: clipBehavior,
        );
      },
    },
    getters: {
      'columns': (visitor, target) => (target as DataTable).columns,
      'rows': (visitor, target) => (target as DataTable).rows,
      'sortColumnIndex': (visitor, target) =>
          (target as DataTable).sortColumnIndex,
      'sortAscending': (visitor, target) => (target as DataTable).sortAscending,
      'onSelectAll': (visitor, target) => (target as DataTable).onSelectAll,
      'dataRowColor': (visitor, target) => (target as DataTable).dataRowColor,
      'dataRowHeight': (visitor, target) => (target as DataTable).dataRowHeight,
      'dataTextStyle': (visitor, target) => (target as DataTable).dataTextStyle,
      'headingRowColor': (visitor, target) =>
          (target as DataTable).headingRowColor,
      'headingRowHeight': (visitor, target) =>
          (target as DataTable).headingRowHeight,
      'headingTextStyle': (visitor, target) =>
          (target as DataTable).headingTextStyle,
      'horizontalMargin': (visitor, target) =>
          (target as DataTable).horizontalMargin,
      'columnSpacing': (visitor, target) => (target as DataTable).columnSpacing,
      'showCheckboxColumn': (visitor, target) =>
          (target as DataTable).showCheckboxColumn,
      'showBottomBorder': (visitor, target) =>
          (target as DataTable).showBottomBorder,
      'dividerThickness': (visitor, target) =>
          (target as DataTable).dividerThickness,
      'checkboxHorizontalMargin': (visitor, target) =>
          (target as DataTable).checkboxHorizontalMargin,
      'border': (visitor, target) => (target as DataTable).border,
      'clipBehavior': (visitor, target) => (target as DataTable).clipBehavior,
    },
  );
}

/// Returns the BridgedClass for the Flutter DataColumn widget.
BridgedClass getDataColumnBridgingDefinition() {
  return BridgedClass(
    nativeType: DataColumn,
    name: 'DataColumn',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final label = visitor.toWidgets(namedArgs['label']);
        final tooltip = namedArgs.get<String?>('tooltip');
        final numeric = namedArgs.get<bool?>('numeric') ?? false;
        final onSort = namedArgs.get<DataColumnSortCallback?>('onSort');

        return DataColumn(
          label: label,
          tooltip: tooltip,
          numeric: numeric,
          onSort: onSort,
        );
      },
    },
    getters: {
      'label': (visitor, target) => (target as DataColumn).label,
      'tooltip': (visitor, target) => (target as DataColumn).tooltip,
      'numeric': (visitor, target) => (target as DataColumn).numeric,
      'onSort': (visitor, target) => (target as DataColumn).onSort,
    },
  );
}

/// Returns the BridgedClass for the Flutter DataRow widget.
BridgedClass getDataRowBridgingDefinition() {
  return BridgedClass(
    nativeType: DataRow,
    name: 'DataRow',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<LocalKey?>('key');
        final selected = namedArgs.get<bool?>('selected') ?? false;
        final onSelectChanged = namedArgs.get<ValueChanged<bool?>?>(
          'onSelectChanged',
        );
        final onLongPress = namedArgs.handleVoidCallback(
          'onLongPress',
          visitor,
        );
        final color = namedArgs.get<MaterialStateProperty<Color?>?>('color');
        final cellsRaw = namedArgs['cells'];
        final cells = cellsRaw is List
            ? cellsRaw.map((item) {
                if (item is DataCell) return item;
                if (item is BridgedInstance && item.nativeObject is DataCell) {
                  return item.nativeObject as DataCell;
                }
                throw ArgumentError(
                  'Expected DataCell, got: $item (${item.runtimeType})',
                );
              }).toList()
            : <DataCell>[];
        return DataRow(
          key: key,
          selected: selected,
          onSelectChanged: onSelectChanged,
          onLongPress: onLongPress,
          color: color,
          cells: cells,
        );
      },
      'byIndex': (visitor, positionalArgs, namedArgs) {
        final index = positionalArgs.get<int>(0);
        final selected = namedArgs.get<bool?>('selected') ?? false;
        final onSelectChanged = namedArgs.get<ValueChanged<bool?>?>(
          'onSelectChanged',
        );
        final onLongPress = namedArgs.handleVoidCallback(
          'onLongPress',
          visitor,
        );
        final color = namedArgs.get<MaterialStateProperty<Color?>?>('color');
        final cellsRaw = namedArgs['cells'];
        final cells = cellsRaw is List
            ? cellsRaw.map((item) {
                if (item is DataCell) return item;
                if (item is BridgedInstance && item.nativeObject is DataCell) {
                  return item.nativeObject as DataCell;
                }
                throw ArgumentError(
                  'Expected DataCell, got: $item (${item.runtimeType})',
                );
              }).toList()
            : <DataCell>[];

        return DataRow.byIndex(
          index: index,
          selected: selected,
          onSelectChanged: onSelectChanged,
          onLongPress: onLongPress,
          color: color,
          cells: cells,
        );
      },
    },
    getters: {
      'key': (visitor, target) => (target as DataRow).key,
      'selected': (visitor, target) => (target as DataRow).selected,
      'onSelectChanged': (visitor, target) =>
          (target as DataRow).onSelectChanged,
      'onLongPress': (visitor, target) => (target as DataRow).onLongPress,
      'color': (visitor, target) => (target as DataRow).color,
      'cells': (visitor, target) => (target as DataRow).cells,
    },
  );
}

/// Returns the BridgedClass for the Flutter DataCell widget.
BridgedClass getDataCellBridgingDefinition() {
  return BridgedClass(
    nativeType: DataCell,
    name: 'DataCell',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final child = visitor.toWidgets(namedArgs['child']);
        if (child == null) {
          throw ArgumentError('DataCell requires a child widget');
        }
        final placeholder = namedArgs.get<bool?>('placeholder') ?? false;
        final showEditIcon = namedArgs.get<bool?>('showEditIcon') ?? false;
        final onTap = namedArgs.handleVoidCallback('onTap', visitor);
        final onLongPress = namedArgs.handleVoidCallback(
          'onLongPress',
          visitor,
        );
        final onTapDown = namedArgs.get<GestureTapDownCallback?>('onTapDown');
        final onDoubleTap = namedArgs.handleVoidCallback(
          'onDoubleTap',
          visitor,
        );
        final onTapCancel = namedArgs.handleVoidCallback(
          'onTapCancel',
          visitor,
        );

        return DataCell(
          child,
          placeholder: placeholder,
          showEditIcon: showEditIcon,
          onTap: onTap,
          onLongPress: onLongPress,
          onTapDown: onTapDown,
          onDoubleTap: onDoubleTap,
          onTapCancel: onTapCancel,
        );
      },
      'empty': (visitor, positionalArgs, namedArgs) {
        return DataCell.empty;
      },
    },
    getters: {
      'child': (visitor, target) => (target as DataCell).child,
      'placeholder': (visitor, target) => (target as DataCell).placeholder,
      'showEditIcon': (visitor, target) => (target as DataCell).showEditIcon,
      'onTap': (visitor, target) => (target as DataCell).onTap,
      'onLongPress': (visitor, target) => (target as DataCell).onLongPress,
      'onTapDown': (visitor, target) => (target as DataCell).onTapDown,
      'onDoubleTap': (visitor, target) => (target as DataCell).onDoubleTap,
      'onTapCancel': (visitor, target) => (target as DataCell).onTapCancel,
    },
  );
}
