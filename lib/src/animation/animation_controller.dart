import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_d4rt/utils/double.dart';
import 'package:flutter_d4rt/utils/extensions/list.dart';

/// Wrapper class to handle interpreted instances as TickerProvider
class _InterpretedTickerProviderWrapper implements TickerProvider {
  final InterpretedInstance _instance;
  final InterpreterVisitor _visitor;

  _InterpretedTickerProviderWrapper(this._instance, this._visitor);

  @override
  Ticker createTicker(TickerCallback onTick) {
    // Try to call createTicker method on the interpreted instance
    final fn = _instance.klass.findInstanceMethod('createTicker');
    if (fn != null) {
      try {
        final result = fn.bind(_instance).call(_visitor, [onTick], {});
        if (result is Ticker) {
          return result;
        }
      } catch (e) {
        // Fallback to manual creation
      }
    }

    // Fallback: create ticker manually using basic Ticker
    return Ticker(
      onTick,
      debugLabel: 'created by interpreted ${_instance.klass.name}',
    );
  }
}

/// Returns the BridgedEnumDefinition for AnimationBehavior
BridgedEnumDefinition getAnimationBehaviorBridgingDefinition() {
  return BridgedEnumDefinition<AnimationBehavior>(
    name: 'AnimationBehavior',
    values: AnimationBehavior.values,
  );
}

/// Returns the BridgedClass for AnimationController
BridgedClass getAnimationControllerBridgingDefinition() {
  return BridgedClass(
    nativeType: AnimationController,
    name: 'AnimationController',
    nativeNames: ['_AnimatedEvaluation'],
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final duration = namedArgs.get<Duration>('duration');
        final reverseDuration = namedArgs.get<Duration?>('reverseDuration');
        final debugLabel = namedArgs.get<String?>('debugLabel');
        final lowerBound =
            toDouble(namedArgs.get<dynamic>('lowerBound')) ?? 0.0;
        final upperBound =
            toDouble(namedArgs.get<dynamic>('upperBound')) ?? 1.0;
        final animationBehavior =
            namedArgs.get<AnimationBehavior?>('animationBehavior') ??
            AnimationBehavior.normal;
        final value = toDouble(namedArgs.get<dynamic>('value'));
        final vsyncParam = namedArgs['vsync'];
        TickerProvider? vsync;

        if (vsyncParam is TickerProvider) {
          vsync = vsyncParam;
        } else if (vsyncParam is InterpretedInstance) {
          // Create a wrapper for interpreted instances with ticker provider mixin
          vsync = _InterpretedTickerProviderWrapper(vsyncParam, visitor);
        } else {
          throw RuntimeError(
            'AnimationController requires a valid TickerProvider as vsync parameter',
          );
        }

        return AnimationController(
          duration: duration,
          reverseDuration: reverseDuration,
          debugLabel: debugLabel,
          lowerBound: lowerBound,
          upperBound: upperBound,
          animationBehavior: animationBehavior,
          vsync: vsync,
          value: value,
        );
      },
      'unbounded': (visitor, positionalArgs, namedArgs) {
        final value = toDouble(namedArgs.get<dynamic>('value')) ?? 0.0;
        final duration = namedArgs.get<Duration>('duration');
        final reverseDuration = namedArgs.get<Duration?>('reverseDuration');
        final debugLabel = namedArgs.get<String?>('debugLabel');
        final animationBehavior =
            namedArgs.get<AnimationBehavior?>('animationBehavior') ??
            AnimationBehavior.preserve;
        final vsyncParam = namedArgs['vsync'];
        TickerProvider? vsync;

        if (vsyncParam is TickerProvider) {
          vsync = vsyncParam;
        } else if (vsyncParam is InterpretedInstance) {
          vsync = _InterpretedTickerProviderWrapper(vsyncParam, visitor);
        } else {
          throw RuntimeError(
            'AnimationController.unbounded requires a valid TickerProvider as vsync parameter',
          );
        }

        return AnimationController.unbounded(
          value: value,
          duration: duration,
          reverseDuration: reverseDuration,
          debugLabel: debugLabel,
          vsync: vsync,
          animationBehavior: animationBehavior,
        );
      },
    },
    methods: {
      'forward': (visitor, target, positionalArgs, namedArgs) {
        final from = toDouble(namedArgs.get<dynamic>('from'));
        return (target as dynamic).forward(from: from);
      },
      'reverse': (visitor, target, positionalArgs, namedArgs) {
        final from = toDouble(namedArgs.get<dynamic>('from'));
        return (target as dynamic).reverse(from: from);
      },
      'reset': (visitor, target, positionalArgs, namedArgs) {
        (target as dynamic).reset();
        return null;
      },
      'stop': (visitor, target, positionalArgs, namedArgs) {
        final canceled = namedArgs.get<bool?>('canceled') ?? true;
        (target as dynamic).stop(canceled: canceled);
        return null;
      },
      'toggle': (visitor, target, positionalArgs, namedArgs) {
        final from = toDouble(namedArgs.get<dynamic>('from'));
        return (target as dynamic).toggle(from: from);
      },
      'animateTo': (visitor, target, positionalArgs, namedArgs) {
        final targetValue = toDouble(positionalArgs.get<dynamic>(0))!;
        final duration = namedArgs.get<Duration?>('duration');
        final curve = namedArgs.get<Curve?>('curve') ?? Curves.linear;
        return (target as dynamic).animateTo(
          targetValue,
          duration: duration,
          curve: curve,
        );
      },
      'animateBack': (visitor, target, positionalArgs, namedArgs) {
        final targetValue = toDouble(positionalArgs.get<dynamic>(0))!;
        final duration = namedArgs.get<Duration?>('duration');
        final curve = namedArgs.get<Curve?>('curve') ?? Curves.linear;
        return (target as dynamic).animateBack(
          targetValue,
          duration: duration,
          curve: curve,
        );
      },
      'repeat': (visitor, target, positionalArgs, namedArgs) {
        final min = toDouble(namedArgs.get<dynamic>('min'));
        final max = toDouble(namedArgs.get<dynamic>('max'));
        final reverse = namedArgs.get<bool?>('reverse') ?? false;
        final period = namedArgs.get<Duration?>('period');
        final count = namedArgs.get<int?>('count');
        return (target as dynamic).repeat(
          min: min,
          max: max,
          reverse: reverse,
          period: period,
          count: count,
        );
      },
      'fling': (visitor, target, positionalArgs, namedArgs) {
        final velocity = toDouble(namedArgs.get<dynamic>('velocity')) ?? 1.0;
        final springDescription = namedArgs.get<SpringDescription?>(
          'springDescription',
        );
        final animationBehavior = namedArgs.get<AnimationBehavior?>(
          'animationBehavior',
        );
        return (target as dynamic).fling(
          velocity: velocity,
          springDescription: springDescription,
          animationBehavior: animationBehavior,
        );
      },
      'animateWith': (visitor, target, positionalArgs, namedArgs) {
        final simulation = positionalArgs.get<Simulation>(0)!;
        return (target as dynamic).animateWith(simulation);
      },
      'animateBackWith': (visitor, target, positionalArgs, namedArgs) {
        final simulation = positionalArgs.get<Simulation>(0)!;
        return (target as dynamic).animateBackWith(simulation);
      },
      'resync': (visitor, target, positionalArgs, namedArgs) {
        final vsyncParam = positionalArgs.get<dynamic>(0);
        TickerProvider? vsync;

        if (vsyncParam is TickerProvider) {
          vsync = vsyncParam;
        } else if (vsyncParam is InterpretedInstance) {
          vsync = _InterpretedTickerProviderWrapper(vsyncParam, visitor);
        } else {
          throw RuntimeError(
            'resync requires a valid TickerProvider parameter',
          );
        }

        (target as dynamic).resync(vsync);
        return null;
      },
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        (target as dynamic).dispose();
        return null;
      },
      'addListener': (visitor, target, positionalArgs, namedArgs) {
        final listener = positionalArgs.handleVoidCallback(0, visitor)!;
        (target as dynamic).addListener(listener);
        return null;
      },
      'removeListener': (visitor, target, positionalArgs, namedArgs) {
        final listener = positionalArgs.handleVoidCallback(0, visitor)!;
        (target as dynamic).removeListener(listener);
        return null;
      },
      'addStatusListener': (visitor, target, positionalArgs, namedArgs) {
        final listener = positionalArgs.get<AnimationStatusListener>(0)!;
        (target as dynamic).addStatusListener(listener);
        return null;
      },
      'removeStatusListener': (visitor, target, positionalArgs, namedArgs) {
        final listener = positionalArgs.get<AnimationStatusListener>(0)!;
        (target as dynamic).removeStatusListener(listener);
        return null;
      },
      'toStringDetails': (visitor, target, positionalArgs, namedArgs) {
        return (target as dynamic).toStringDetails();
      },
    },
    getters: {
      'value': (visitor, target) => (target as dynamic).value,
      'status': (visitor, target) => (target as dynamic).status,
      'isAnimating': (visitor, target) => (target as dynamic).isAnimating,
      'isCompleted': (visitor, target) => (target as dynamic).isCompleted,
      'isDismissed': (visitor, target) => (target as dynamic).isDismissed,
      'isForwardOrCompleted': (visitor, target) =>
          (target as dynamic).isForwardOrCompleted,
      'duration': (visitor, target) => (target as dynamic).duration,
      'reverseDuration': (visitor, target) =>
          (target as dynamic).reverseDuration,
      'debugLabel': (visitor, target) => (target as dynamic).debugLabel,
      'lowerBound': (visitor, target) => (target as dynamic).lowerBound,
      'upperBound': (visitor, target) => (target as dynamic).upperBound,
      'animationBehavior': (visitor, target) =>
          (target as dynamic).animationBehavior,
      'view': (visitor, target) => (target as dynamic).view,
      'velocity': (visitor, target) => (target as dynamic).velocity,
      'lastElapsedDuration': (visitor, target) =>
          (target as dynamic).lastElapsedDuration,
    },
    setters: {
      'value': (visitor, target, value) {
        (target as dynamic).value = toDouble(value)!;
      },
      'duration': (visitor, target, value) {
        (target as dynamic).duration = value as Duration?;
      },
      'reverseDuration': (visitor, target, value) {
        (target as dynamic).reverseDuration = value as Duration?;
      },
    },
  );
}
