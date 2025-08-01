import 'package:d4rt/d4rt.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/double.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Advanced display widgets bridging definitions

// Helper functions for callback handling
void Function()? _handleVoidCallback(
  InterpreterVisitor visitor,
  dynamic callback,
) {
  if (callback == null) return null;
  if (callback is InterpretedFunction) {
    return () => callback.call(visitor, []);
  }
  return callback as void Function()?;
}

void Function(T)? _handleValueCallback<T>(
  InterpreterVisitor visitor,
  dynamic callback,
) {
  if (callback == null) return null;
  if (callback is InterpretedFunction) {
    return (T value) => callback.call(visitor, [value]);
  }
  return callback as void Function(T)?;
}

// Stepper bridging
BridgedClassDefinition getStepperBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: Stepper,
    name: 'Stepper',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        // Handle steps list conversion
        List<Step> steps = [];
        final stepsValue = namedArgs['steps'];
        if (stepsValue is List) {
          for (final stepValue in stepsValue) {
            if (stepValue is Step) {
              steps.add(stepValue);
            }
          }
        }

        return Stepper(
          key: namedArgs.get<Key?>('key'),
          steps: steps,
          physics: namedArgs['physics'] as ScrollPhysics?,
          type: namedArgs['type'] as StepperType? ?? StepperType.vertical,
          currentStep: namedArgs['currentStep'] as int? ?? 0,
          onStepTapped: _handleValueCallback<int>(
            visitor,
            namedArgs['onStepTapped'],
          ),
          onStepContinue: _handleVoidCallback(
            visitor,
            namedArgs['onStepContinue'],
          ),
          onStepCancel: _handleVoidCallback(visitor, namedArgs['onStepCancel']),
          controlsBuilder:
              namedArgs['controlsBuilder']
                  as Widget Function(BuildContext, ControlsDetails)?,
          elevation: toDouble(namedArgs['elevation']),
          margin: namedArgs['margin'] as EdgeInsetsGeometry?,
          connectorColor:
              namedArgs['connectorColor'] as WidgetStateProperty<Color>?,
          connectorThickness: toDouble(namedArgs['connectorThickness']),
          stepIconBuilder:
              namedArgs['stepIconBuilder'] as Widget Function(int, StepState)?,
        );
      },
    },
    getters: {
      'steps': (visitor, target) => (target as Stepper).steps,
      'physics': (visitor, target) => (target as Stepper).physics,
      'type': (visitor, target) => (target as Stepper).type,
      'currentStep': (visitor, target) => (target as Stepper).currentStep,
      'elevation': (visitor, target) => (target as Stepper).elevation,
      'margin': (visitor, target) => (target as Stepper).margin,
      'key': (visitor, target) => (target as Stepper).key,
    },
  );
}

// Step bridging
BridgedClassDefinition getStepBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: Step,
    name: 'Step',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final title = visitor.toWidgets(namedArgs['title']);
        final content = visitor.toWidgets(namedArgs['content']);
        final subtitle = visitor.toWidgets(namedArgs['subtitle']);

        return Step(
          title: title,
          content: content,
          subtitle: subtitle,
          isActive: namedArgs['isActive'] as bool? ?? false,
          state: namedArgs['state'] as StepState? ?? StepState.indexed,
          label: visitor.toWidgets(namedArgs['label']),
        );
      },
    },
    getters: {
      'title': (visitor, target) => (target as Step).title,
      'content': (visitor, target) => (target as Step).content,
      'subtitle': (visitor, target) => (target as Step).subtitle,
      'isActive': (visitor, target) => (target as Step).isActive,
      'state': (visitor, target) => (target as Step).state,
      'label': (visitor, target) => (target as Step).label,
    },
  );
}

// DataTable bridging
BridgedClassDefinition getDataTableBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: DataTable,
    name: 'DataTable',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return DataTable(
          key: namedArgs.get<Key?>('key'),
          columns: (namedArgs['columns'] as List? ?? []).cast(),
          rows: (namedArgs['rows'] as List? ?? []).cast(),
          sortColumnIndex: namedArgs['sortColumnIndex'] as int?,
          sortAscending: namedArgs['sortAscending'] as bool? ?? true,
          onSelectAll: _handleValueCallback<bool?>(
            visitor,
            namedArgs['onSelectAll'],
          ),
          decoration: namedArgs['decoration'] as Decoration?,
          dataRowColor:
              namedArgs['dataRowColor'] as WidgetStateProperty<Color?>?,
          dataRowHeight: toDouble(namedArgs['dataRowHeight']),
          dataRowMinHeight: toDouble(namedArgs['dataRowMinHeight']),
          dataRowMaxHeight: toDouble(namedArgs['dataRowMaxHeight']),
          dataTextStyle: namedArgs['dataTextStyle'] as TextStyle?,
          headingRowColor:
              namedArgs['headingRowColor'] as WidgetStateProperty<Color?>?,
          headingRowHeight: toDouble(namedArgs['headingRowHeight']),
          headingTextStyle: namedArgs['headingTextStyle'] as TextStyle?,
          horizontalMargin: toDouble(namedArgs['horizontalMargin']),
          columnSpacing: toDouble(namedArgs['columnSpacing']),
          showCheckboxColumn: namedArgs['showCheckboxColumn'] as bool? ?? true,
          showBottomBorder: namedArgs['showBottomBorder'] as bool? ?? false,
          dividerThickness: toDouble(namedArgs['dividerThickness']),
          checkboxHorizontalMargin: toDouble(
            namedArgs['checkboxHorizontalMargin'],
          ),
          border: namedArgs['border'] as TableBorder?,
          clipBehavior: namedArgs['clipBehavior'] as Clip? ?? Clip.none,
        );
      },
    },
    getters: {
      'columns': (visitor, target) => (target as DataTable).columns,
      'rows': (visitor, target) => (target as DataTable).rows,
      'sortColumnIndex': (visitor, target) =>
          (target as DataTable).sortColumnIndex,
      'sortAscending': (visitor, target) => (target as DataTable).sortAscending,
      'decoration': (visitor, target) => (target as DataTable).decoration,
      'dataRowHeight': (visitor, target) => (target as DataTable).dataRowHeight,
      'dataTextStyle': (visitor, target) => (target as DataTable).dataTextStyle,
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
      'key': (visitor, target) => (target as DataTable).key,
    },
  );
}

// DataColumn bridging
BridgedClassDefinition getDataColumnBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: DataColumn,
    name: 'DataColumn',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final label = visitor.toWidgets(namedArgs['label']);

        return DataColumn(
          label: label,
          tooltip: namedArgs['tooltip'] as String?,
          numeric: namedArgs['numeric'] as bool? ?? false,
          // onSort: _handleValueCallback<bool>(visitor, namedArgs['onSort']),
          // mouseCursor: namedArgs['mouseCursor'] as MouseCursor?,
        );
      },
    },
    getters: {
      'label': (visitor, target) => (target as DataColumn).label,
      'tooltip': (visitor, target) => (target as DataColumn).tooltip,
      'numeric': (visitor, target) => (target as DataColumn).numeric,
      'mouseCursor': (visitor, target) => (target as DataColumn).mouseCursor,
    },
  );
}

// DataRow bridging
BridgedClassDefinition getDataRowBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: DataRow,
    name: 'DataRow',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return DataRow(
          key: namedArgs.get<Key?>('key') as LocalKey?,
          selected: namedArgs['selected'] as bool? ?? false,
          onSelectChanged: _handleValueCallback<bool?>(
            visitor,
            namedArgs['onSelectChanged'],
          ),
          onLongPress: _handleVoidCallback(visitor, namedArgs['onLongPress']),
          color: namedArgs['color'] as WidgetStateProperty<Color?>?,
          cells: (namedArgs['cells'] as List? ?? []).cast(),
          mouseCursor:
              namedArgs['mouseCursor'] as WidgetStateProperty<MouseCursor?>?,
        );
      },
      'byIndex': (visitor, positionalArgs, namedArgs) {
        return DataRow.byIndex(
          index: namedArgs['index'] as int?,
          selected: namedArgs['selected'] as bool? ?? false,
          onSelectChanged: _handleValueCallback<bool?>(
            visitor,
            namedArgs['onSelectChanged'],
          ),
          onLongPress: _handleVoidCallback(visitor, namedArgs['onLongPress']),
          color: namedArgs['color'] as WidgetStateProperty<Color?>?,
          cells: (namedArgs['cells'] as List? ?? []).cast(),
          mouseCursor:
              namedArgs['mouseCursor'] as WidgetStateProperty<MouseCursor?>?,
        );
      },
    },
    getters: {
      'key': (visitor, target) => (target as DataRow).key,
      'selected': (visitor, target) => (target as DataRow).selected,
      'color': (visitor, target) => (target as DataRow).color,
      'cells': (visitor, target) => (target as DataRow).cells,
    },
  );
}

// DataCell bridging
BridgedClassDefinition getDataCellBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: DataCell,
    name: 'DataCell',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final child = visitor.toWidgets(namedArgs['child']);

        return DataCell(
          child,
          placeholder: namedArgs['placeholder'] as bool? ?? false,
          showEditIcon: namedArgs['showEditIcon'] as bool? ?? false,
          onTap: _handleVoidCallback(visitor, namedArgs['onTap']),
          onLongPress: _handleVoidCallback(visitor, namedArgs['onLongPress']),
          onTapDown: _handleValueCallback<TapDownDetails>(
            visitor,
            namedArgs['onTapDown'],
          ),
          onDoubleTap: _handleVoidCallback(visitor, namedArgs['onDoubleTap']),
          onTapCancel: _handleVoidCallback(visitor, namedArgs['onTapCancel']),
        );
      },
    },
    getters: {
      'child': (visitor, target) => (target as DataCell).child,
      'placeholder': (visitor, target) => (target as DataCell).placeholder,
      'showEditIcon': (visitor, target) => (target as DataCell).showEditIcon,
    },
  );
}

// ReorderableListView bridging
BridgedClassDefinition getReorderableListViewBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: ReorderableListView,
    name: 'ReorderableListView',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final children = visitor.toWidgets(namedArgs['children']);
        // Handle onReorder callback
        void Function(int, int) onReorder = (oldIndex, newIndex) {};
        final onReorderValue = namedArgs['onReorder'];
        if (onReorderValue is InterpretedFunction) {
          onReorder = (oldIndex, newIndex) {
            onReorderValue.call(visitor, [oldIndex, newIndex]);
          };
        }

        return ReorderableListView(
          key: namedArgs.get<Key?>('key'),
          onReorder: onReorder,
          onReorderStart: _handleValueCallback<int>(
            visitor,
            namedArgs['onReorderStart'],
          ),
          onReorderEnd: _handleValueCallback<int>(
            visitor,
            namedArgs['onReorderEnd'],
          ),
          itemExtent: toDouble(namedArgs['itemExtent']),
          itemExtentBuilder: (index, dimensions) {
            return toDouble(
              (namedArgs['itemExtentBuilder'] as InterpretedFunction?)?.call(
                visitor,
                [index, dimensions],
              ),
            );
          },
          prototypeItem: visitor.toWidgets(namedArgs['prototypeItem']),
          proxyDecorator:
              namedArgs['proxyDecorator']
                  as Widget Function(Widget, int, Animation<double>)?,
          buildDefaultDragHandles:
              namedArgs['buildDefaultDragHandles'] as bool? ?? true,
          padding: namedArgs['padding'] as EdgeInsets?,
          header: visitor.toWidgets(namedArgs['header']),
          footer: visitor.toWidgets(namedArgs['footer']),
          scrollDirection:
              namedArgs['scrollDirection'] as Axis? ?? Axis.vertical,
          reverse: namedArgs['reverse'] as bool? ?? false,
          scrollController: namedArgs['controller'] as ScrollController?,
          primary: namedArgs['primary'] as bool?,
          physics: namedArgs['physics'] as ScrollPhysics?,
          shrinkWrap: namedArgs['shrinkWrap'] as bool? ?? false,
          anchor: toDouble(namedArgs['anchor']),
          cacheExtent: toDouble(namedArgs['cacheExtent']),
          dragStartBehavior:
              namedArgs['dragStartBehavior'] as DragStartBehavior? ??
              DragStartBehavior.start,
          keyboardDismissBehavior:
              namedArgs['keyboardDismissBehavior']
                  as ScrollViewKeyboardDismissBehavior? ??
              ScrollViewKeyboardDismissBehavior.manual,
          restorationId: namedArgs['restorationId'] as String?,
          clipBehavior: namedArgs['clipBehavior'] as Clip? ?? Clip.hardEdge,
          autoScrollerVelocityScalar: toDouble(
            namedArgs['autoScrollerVelocityScalar'],
          ),
          children: children,
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

        // Handle onReorder callback
        void Function(int, int) onReorder = (oldIndex, newIndex) {};
        final onReorderValue = namedArgs['onReorder'];
        if (onReorderValue is InterpretedFunction) {
          onReorder = (oldIndex, newIndex) {
            onReorderValue.call(visitor, [oldIndex, newIndex]);
          };
        }

        return ReorderableListView.builder(
          key: namedArgs.get<Key?>('key'),
          itemBuilder: itemBuilder,
          itemCount: namedArgs['itemCount'] as int,
          onReorder: onReorder,
          onReorderStart: _handleValueCallback<int>(
            visitor,
            namedArgs['onReorderStart'],
          ),
          onReorderEnd: _handleValueCallback<int>(
            visitor,
            namedArgs['onReorderEnd'],
          ),
          itemExtent: toDouble(namedArgs['itemExtent']),
          itemExtentBuilder: (index, dimensions) {
            return toDouble(
              (namedArgs['itemExtentBuilder'] as InterpretedFunction?)?.call(
                visitor,
                [index, dimensions],
              ),
            );
          },

          prototypeItem: visitor.toWidgets(namedArgs['prototypeItem']),
          proxyDecorator:
              namedArgs['proxyDecorator']
                  as Widget Function(Widget, int, Animation<double>)?,
          buildDefaultDragHandles:
              namedArgs['buildDefaultDragHandles'] as bool? ?? true,
          padding: namedArgs['padding'] as EdgeInsets?,
          header: visitor.toWidgets(namedArgs['header']),
          footer: visitor.toWidgets(namedArgs['footer']),
          scrollDirection:
              namedArgs['scrollDirection'] as Axis? ?? Axis.vertical,
          reverse: namedArgs['reverse'] as bool? ?? false,
          scrollController: namedArgs['controller'] as ScrollController?,
          primary: namedArgs['primary'] as bool?,
          physics: namedArgs['physics'] as ScrollPhysics?,
          shrinkWrap: namedArgs['shrinkWrap'] as bool? ?? false,
          anchor: toDouble(namedArgs['anchor']),
          cacheExtent: toDouble(namedArgs['cacheExtent']),
          dragStartBehavior:
              namedArgs['dragStartBehavior'] as DragStartBehavior? ??
              DragStartBehavior.start,
          keyboardDismissBehavior:
              namedArgs['keyboardDismissBehavior']
                  as ScrollViewKeyboardDismissBehavior? ??
              ScrollViewKeyboardDismissBehavior.manual,
          restorationId: namedArgs['restorationId'] as String?,
          clipBehavior: namedArgs['clipBehavior'] as Clip? ?? Clip.hardEdge,
          autoScrollerVelocityScalar: toDouble(
            namedArgs['autoScrollerVelocityScalar'],
          ),
        );
      },
    },
    getters: {
      'scrollDirection': (visitor, target) =>
          (target as ReorderableListView).scrollDirection,
      'reverse': (visitor, target) => (target as ReorderableListView).reverse,
      'scrollController': (visitor, target) =>
          (target as ReorderableListView).scrollController,
      'primary': (visitor, target) => (target as ReorderableListView).primary,
      'physics': (visitor, target) => (target as ReorderableListView).physics,
      'shrinkWrap': (visitor, target) =>
          (target as ReorderableListView).shrinkWrap,
      'padding': (visitor, target) => (target as ReorderableListView).padding,
      'buildDefaultDragHandles': (visitor, target) =>
          (target as ReorderableListView).buildDefaultDragHandles,
      'key': (visitor, target) => (target as ReorderableListView).key,
    },
  );
}
