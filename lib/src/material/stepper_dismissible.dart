import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for the Flutter Stepper widget.
BridgedClass getStepperBridgingDefinition() {
  return BridgedClass(
    nativeType: Stepper,
    name: 'Stepper',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final stepsRaw = namedArgs['steps'];
        final steps = stepsRaw is List
            ? stepsRaw.map((item) {
                if (item is Step) return item;
                if (item is BridgedInstance && item.nativeObject is Step) {
                  return item.nativeObject as Step;
                }
                throw ArgumentError(
                  'Expected Step, got: $item (${item.runtimeType})',
                );
              }).toList()
            : <Step>[];
        final controller = namedArgs.get<ScrollController?>('controller');
        final type =
            namedArgs.get<StepperType?>('type') ?? StepperType.vertical;
        final physics = namedArgs.get<ScrollPhysics?>('physics');
        final currentStep = namedArgs.get<int?>('currentStep') ?? 0;
        // Ensure currentStep is valid
        final validCurrentStep =
            (steps.isNotEmpty && currentStep >= 0 && currentStep < steps.length)
            ? currentStep
            : 0;
        final onStepTapped = namedArgs.get<ValueChanged<int?>?>('onStepTapped');
        final onStepContinue = namedArgs.get<VoidCallback?>('onStepContinue');
        final onStepCancel = namedArgs.get<VoidCallback?>('onStepCancel');
        final controlsBuilder = namedArgs.get<ControlsWidgetBuilder?>(
          'controlsBuilder',
        );
        final elevation = namedArgs.getToDouble('elevation');
        final margin = namedArgs.get<EdgeInsetsGeometry?>('margin');
        final connectorColor = namedArgs.get<MaterialStateProperty<Color?>?>(
          'connectorColor',
        );
        final connectorThickness =
            namedArgs.getToDouble('connectorThickness') ?? 1.0;
        final stepIconBuilder = namedArgs.get<StepIconBuilder?>(
          'stepIconBuilder',
        );

        return Stepper(
          key: key,
          steps: steps,
          controller: controller,
          type: type,
          physics: physics,
          currentStep: validCurrentStep,
          onStepTapped: onStepTapped,
          onStepContinue: onStepContinue,
          onStepCancel: onStepCancel,
          controlsBuilder: controlsBuilder,
          elevation: elevation,
          margin: margin,
          connectorColor: connectorColor as MaterialStateProperty<Color>?,
          connectorThickness: connectorThickness,
          stepIconBuilder: stepIconBuilder,
        );
      },
    },
    getters: {
      'steps': (visitor, target) => (target as Stepper).steps,
      'controller': (visitor, target) => (target as Stepper).controller,
      'type': (visitor, target) => (target as Stepper).type,
      'physics': (visitor, target) => (target as Stepper).physics,
      'currentStep': (visitor, target) => (target as Stepper).currentStep,
      'onStepTapped': (visitor, target) => (target as Stepper).onStepTapped,
      'onStepContinue': (visitor, target) => (target as Stepper).onStepContinue,
      'onStepCancel': (visitor, target) => (target as Stepper).onStepCancel,
      'controlsBuilder': (visitor, target) =>
          (target as Stepper).controlsBuilder,
      'elevation': (visitor, target) => (target as Stepper).elevation,
      'margin': (visitor, target) => (target as Stepper).margin,
      'connectorColor': (visitor, target) => (target as Stepper).connectorColor,
      'connectorThickness': (visitor, target) =>
          (target as Stepper).connectorThickness,
      'stepIconBuilder': (visitor, target) =>
          (target as Stepper).stepIconBuilder,
    },
  );
}

/// Returns the BridgedClass for the Flutter Step widget.
BridgedClass getStepBridgingDefinition() {
  return BridgedClass(
    nativeType: Step,
    name: 'Step',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final title = visitor.toWidgets(namedArgs['title']);
        final subtitle = visitor.toWidgets(namedArgs['subtitle']);
        final content = visitor.toWidgets(namedArgs['content']);
        final state = namedArgs.get<StepState?>('state') ?? StepState.indexed;
        final isActive = namedArgs.get<bool?>('isActive') ?? false;
        final label = visitor.toWidgets(namedArgs['label']);

        return Step(
          title: title,
          subtitle: subtitle,
          content: content,
          state: state,
          isActive: isActive,
          label: label,
        );
      },
    },
    getters: {
      'title': (visitor, target) => (target as Step).title,
      'subtitle': (visitor, target) => (target as Step).subtitle,
      'content': (visitor, target) => (target as Step).content,
      'state': (visitor, target) => (target as Step).state,
      'isActive': (visitor, target) => (target as Step).isActive,
      'label': (visitor, target) => (target as Step).label,
    },
  );
}

/// Returns the BridgedClass for the Flutter Dismissible widget.
BridgedClass getDismissibleBridgingDefinition() {
  return BridgedClass(
    nativeType: Dismissible,
    name: 'Dismissible',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key>('key');
        if (key == null) {
          throw ArgumentError('key is required for Dismissible');
        }
        final child = visitor.toWidgets(namedArgs['child']);
        final background = visitor.toWidgets(namedArgs['background']);
        final secondaryBackground = visitor.toWidgets(
          namedArgs['secondaryBackground'],
        );
        final confirmDismiss = namedArgs.get<ConfirmDismissCallback?>(
          'confirmDismiss',
        );
        final onDismissed = namedArgs.get<DismissDirectionCallback?>(
          'onDismissed',
        );
        final onUpdate = namedArgs.get<DismissUpdateCallback?>('onUpdate');
        final onResize = namedArgs.get<VoidCallback?>('onResize');
        final direction =
            namedArgs.get<DismissDirection?>('direction') ??
            DismissDirection.horizontal;
        final resizeDuration =
            namedArgs.get<Duration?>('resizeDuration') ??
            const Duration(milliseconds: 300);
        final dismissThresholds =
            namedArgs.get<Map<DismissDirection, double>?>(
              'dismissThresholds',
            ) ??
            const {};
        final movementDuration =
            namedArgs.get<Duration?>('movementDuration') ??
            const Duration(milliseconds: 200);
        final crossAxisEndOffset =
            namedArgs.getToDouble('crossAxisEndOffset') ?? 0.0;
        final dragStartBehavior =
            namedArgs.get<DragStartBehavior?>('dragStartBehavior') ??
            DragStartBehavior.start;
        final behavior =
            namedArgs.get<HitTestBehavior?>('behavior') ??
            HitTestBehavior.opaque;

        return Dismissible(
          key: key,
          child: child,
          background: background,
          secondaryBackground: secondaryBackground,
          confirmDismiss: confirmDismiss,
          onDismissed: onDismissed,
          onUpdate: onUpdate,
          onResize: onResize,
          direction: direction,
          resizeDuration: resizeDuration,
          dismissThresholds: dismissThresholds,
          movementDuration: movementDuration,
          crossAxisEndOffset: crossAxisEndOffset,
          dragStartBehavior: dragStartBehavior,
          behavior: behavior,
        );
      },
    },
    getters: {
      'key': (visitor, target) => (target as Dismissible).key,
      'child': (visitor, target) => (target as Dismissible).child,
      'background': (visitor, target) => (target as Dismissible).background,
      'secondaryBackground': (visitor, target) =>
          (target as Dismissible).secondaryBackground,
      'confirmDismiss': (visitor, target) =>
          (target as Dismissible).confirmDismiss,
      'onDismissed': (visitor, target) => (target as Dismissible).onDismissed,
      'onUpdate': (visitor, target) => (target as Dismissible).onUpdate,
      'onResize': (visitor, target) => (target as Dismissible).onResize,
      'direction': (visitor, target) => (target as Dismissible).direction,
      'resizeDuration': (visitor, target) =>
          (target as Dismissible).resizeDuration,
      'dismissThresholds': (visitor, target) =>
          (target as Dismissible).dismissThresholds,
      'movementDuration': (visitor, target) =>
          (target as Dismissible).movementDuration,
      'crossAxisEndOffset': (visitor, target) =>
          (target as Dismissible).crossAxisEndOffset,
      'dragStartBehavior': (visitor, target) =>
          (target as Dismissible).dragStartBehavior,
      'behavior': (visitor, target) => (target as Dismissible).behavior,
    },
  );
}

/// Returns the BridgedClass for the Flutter DraggableScrollableSheet widget.
BridgedClass getDraggableScrollableSheetBridgingDefinition() {
  return BridgedClass(
    nativeType: DraggableScrollableSheet,
    name: 'DraggableScrollableSheet',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final initialChildSize =
            namedArgs.getToDouble('initialChildSize') ?? 0.5;
        final minChildSize = namedArgs.getToDouble('minChildSize') ?? 0.25;
        final maxChildSize = namedArgs.getToDouble('maxChildSize') ?? 1.0;
        final expand = namedArgs.get<bool?>('expand') ?? true;
        final snap = namedArgs.get<bool?>('snap') ?? false;
        final snapSizes = namedArgs.get<List<double>?>('snapSizes');
        final snapAnimationDuration =
            namedArgs.get<Duration?>('snapAnimationDuration') ??
            const Duration(milliseconds: 250);
        final controller = namedArgs.get<DraggableScrollableController?>(
          'controller',
        );
        final shouldCloseOnMinExtent =
            namedArgs.get<bool?>('shouldCloseOnMinExtent') ?? true;
        final builder = namedArgs.get<ScrollableWidgetBuilder>('builder');
        if (builder == null) {
          throw ArgumentError(
            'builder is required for DraggableScrollableSheet',
          );
        }

        return DraggableScrollableSheet(
          key: key,
          initialChildSize: initialChildSize,
          minChildSize: minChildSize,
          maxChildSize: maxChildSize,
          expand: expand,
          snap: snap,
          snapSizes: snapSizes,
          snapAnimationDuration: snapAnimationDuration,
          controller: controller,
          shouldCloseOnMinExtent: shouldCloseOnMinExtent,
          builder: builder,
        );
      },
    },
    getters: {
      'initialChildSize': (visitor, target) =>
          (target as DraggableScrollableSheet).initialChildSize,
      'minChildSize': (visitor, target) =>
          (target as DraggableScrollableSheet).minChildSize,
      'maxChildSize': (visitor, target) =>
          (target as DraggableScrollableSheet).maxChildSize,
      'expand': (visitor, target) =>
          (target as DraggableScrollableSheet).expand,
      'snap': (visitor, target) => (target as DraggableScrollableSheet).snap,
      'snapSizes': (visitor, target) =>
          (target as DraggableScrollableSheet).snapSizes,
      'snapAnimationDuration': (visitor, target) =>
          (target as DraggableScrollableSheet).snapAnimationDuration,
      'controller': (visitor, target) =>
          (target as DraggableScrollableSheet).controller,
      'shouldCloseOnMinExtent': (visitor, target) =>
          (target as DraggableScrollableSheet).shouldCloseOnMinExtent,
      'builder': (visitor, target) =>
          (target as DraggableScrollableSheet).builder,
    },
  );
}
