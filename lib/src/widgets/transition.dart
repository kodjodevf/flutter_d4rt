// ignore_for_file: deprecated_member_use

import 'package:d4rt/d4rt.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

Animation<T> _extractAnimation<T>(dynamic raw) {
  if (raw is BridgedInstance) {
    return _extractAnimation<T>(raw.nativeObject);
  }
  if (raw is Animation<T>) return raw;
  if (raw is AlwaysStoppedAnimation) {
    return AlwaysStoppedAnimation<T>(raw.value as T);
  }
  if (raw is Animation) {
    return raw.drive(Animatable.fromCallback((val) => val as T));
  }
  throw RuntimeError('Expected Animation<$T>, got $raw');
}

/// Returns the BridgedClass for AnimatedBuilder
BridgedClass getAnimatedBuilderBridgingDefinition() {
  return BridgedClass(
    nativeType: AnimatedBuilder,
    name: 'AnimatedBuilder',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final animation = namedArgs.get<Listenable>('animation');
        final builder = namedArgs['builder'];
        final child = visitor.toWidgets(namedArgs['child']);
        final key = namedArgs.get<Key?>('key');

        return AnimatedBuilder(
          key: key,
          animation: animation!,
          builder: (BuildContext context, Widget? child) {
            if (builder is InterpretedFunction) {
              final result = builder.call(visitor, [context, child], {});
              return visitor.toWidgets(result);
            } else {
              throw RuntimeError('AnimatedBuilder builder must be a function');
            }
          },
          child: child,
        );
      },
    },
  );
}

/// Returns the BridgedClass for FadeTransition
BridgedClass getFadeTransitionBridgingDefinition() {
  return BridgedClass(
    nativeType: FadeTransition,
    name: 'FadeTransition',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final opacity = _extractAnimation<double>(namedArgs['opacity']);
        final alwaysIncludeSemantics =
            namedArgs.get<bool?>('alwaysIncludeSemantics') ?? false;
        final child = visitor.toWidgets(namedArgs['child']);
        final key = namedArgs.get<Key?>('key');

        return FadeTransition(
          key: key,
          opacity: opacity,
          alwaysIncludeSemantics: alwaysIncludeSemantics,
          child: child,
        );
      },
    },
    getters: {
      'opacity': (visitor, target) => (target as FadeTransition).opacity,
      'alwaysIncludeSemantics': (visitor, target) =>
          (target as FadeTransition).alwaysIncludeSemantics,
    },
  );
}

/// Returns the BridgedClass for ScaleTransition
BridgedClass getScaleTransitionBridgingDefinition() {
  return BridgedClass(
    nativeType: ScaleTransition,
    name: 'ScaleTransition',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final scale = _extractAnimation<double>(namedArgs['scale']);
        final alignment =
            namedArgs.get<Alignment?>('alignment') ?? Alignment.center;
        final filterQuality = namedArgs.get<FilterQuality?>('filterQuality');
        final child = visitor.toWidgets(namedArgs['child']);
        final key = namedArgs.get<Key?>('key');

        return ScaleTransition(
          key: key,
          scale: scale,
          alignment: alignment,
          filterQuality: filterQuality,
          child: child,
        );
      },
    },
    getters: {
      'scale': (visitor, target) => (target as ScaleTransition).scale,
      'alignment': (visitor, target) => (target as ScaleTransition).alignment,
    },
  );
}

/// Returns the BridgedClass for RotationTransition
BridgedClass getRotationTransitionBridgingDefinition() {
  return BridgedClass(
    nativeType: RotationTransition,
    name: 'RotationTransition',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final turns = _extractAnimation<double>(namedArgs['turns']);
        final alignment =
            namedArgs.get<Alignment?>('alignment') ?? Alignment.center;
        final filterQuality = namedArgs.get<FilterQuality?>('filterQuality');
        final child = visitor.toWidgets(namedArgs['child']);
        final key = namedArgs.get<Key?>('key');

        return RotationTransition(
          key: key,
          turns: turns,
          alignment: alignment,
          filterQuality: filterQuality,
          child: child,
        );
      },
    },
    getters: {
      'turns': (visitor, target) => (target as RotationTransition).turns,
      'alignment': (visitor, target) =>
          (target as RotationTransition).alignment,
    },
  );
}

/// Returns the BridgedClass for SlideTransition
BridgedClass getSlideTransitionBridgingDefinition() {
  return BridgedClass(
    nativeType: SlideTransition,
    name: 'SlideTransition',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final position = _extractAnimation<Offset>(namedArgs['position']);
        final transformHitTests =
            namedArgs.get<bool?>('transformHitTests') ?? true;
        final textDirection = namedArgs.get<TextDirection?>('textDirection');
        final child = visitor.toWidgets(namedArgs['child']);
        final key = namedArgs.get<Key?>('key');

        return SlideTransition(
          key: key,
          position: position,
          transformHitTests: transformHitTests,
          textDirection: textDirection,
          child: child,
        );
      },
    },
    getters: {
      'position': (visitor, target) => (target as SlideTransition).position,
      'transformHitTests': (visitor, target) =>
          (target as SlideTransition).transformHitTests,
      'textDirection': (visitor, target) =>
          (target as SlideTransition).textDirection,
      'child': (visitor, target) => (target as SlideTransition).child,
      'key': (visitor, target) => (target as SlideTransition).key,
    },
  );
}

/// Returns the BridgedClass for SizeTransition
BridgedClass getSizeTransitionBridgingDefinition() {
  return BridgedClass(
    nativeType: SizeTransition,
    name: 'SizeTransition',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final sizeFactor = _extractAnimation<double>(namedArgs['sizeFactor']);
        final axis = namedArgs.get<Axis?>('axis') ?? Axis.vertical;
        final axisAlignment =
            (namedArgs['axisAlignment'] as num?)?.toDouble() ?? 0.0;
        final child = visitor.toWidgets(namedArgs['child']);
        final key = namedArgs.get<Key?>('key');

        return SizeTransition(
          key: key,
          sizeFactor: sizeFactor,
          axis: axis,
          axisAlignment: axisAlignment,
          child: child,
        );
      },
    },
    getters: {
      'sizeFactor': (visitor, target) =>
          (target as SizeTransition).sizeFactor,
      'axis': (visitor, target) => (target as SizeTransition).axis,
      'axisAlignment': (visitor, target) =>
          (target as SizeTransition).axisAlignment,
      'child': (visitor, target) => (target as SizeTransition).child,
      'key': (visitor, target) => (target as SizeTransition).key,
    },
  );
}

/// Returns the BridgedClass for ListenableBuilder
BridgedClass getListenableBuilderBridgingDefinition() {
  return BridgedClass(
    nativeType: ListenableBuilder,
    name: 'ListenableBuilder',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final rawListenable = namedArgs['listenable'];
        final Listenable listenable = rawListenable is BridgedInstance
            ? rawListenable.nativeObject as Listenable
            : rawListenable as Listenable;
        final builder = namedArgs['builder'];
        final child = visitor.toWidget(namedArgs['child']);

        return ListenableBuilder(
          key: key,
          listenable: listenable,
          builder: (BuildContext context, Widget? child) {
            if (builder is InterpretedFunction) {
              final result = builder.call(visitor, [context, child], {});
              return visitor.toWidget(result) ?? const SizedBox();
            }
            return const SizedBox();
          },
          child: child,
        );
      },
    },
  );
}

/// Returns the BridgedClass for ValueListenableBuilder
BridgedClass getValueListenableBuilderBridgingDefinition() {
  return BridgedClass(
    nativeType: ValueListenableBuilder,
    name: 'ValueListenableBuilder',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final rawListenable = namedArgs['valueListenable'];
        final ValueListenable<dynamic> valueListenable =
            rawListenable is BridgedInstance
                ? rawListenable.nativeObject as ValueListenable<dynamic>
                : rawListenable as ValueListenable<dynamic>;
        final builder = namedArgs['builder'];
        final child = visitor.toWidget(namedArgs['child']);

        return ValueListenableBuilder<dynamic>(
          key: key,
          valueListenable: valueListenable,
          builder: (BuildContext context, dynamic value, Widget? child) {
            if (builder is InterpretedFunction) {
              final result = builder.call(visitor, [context, value, child], {});
              return visitor.toWidget(result) ?? const SizedBox();
            }
            return const SizedBox();
          },
          child: child,
        );
      },
    },
  );
}

/// Returns the BridgedClass for TweenAnimationBuilder
BridgedClass getTweenAnimationBuilderBridgingDefinition() {
  return BridgedClass(
    nativeType: TweenAnimationBuilder,
    name: 'TweenAnimationBuilder',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final rawTween = namedArgs['tween'];
        final Tween<dynamic> tween = rawTween is BridgedInstance
            ? rawTween.nativeObject as Tween<dynamic>
            : (rawTween is Tween<dynamic>
                ? rawTween
                : Tween<double>(begin: 0.0, end: 1.0));
        final duration = namedArgs.get<Duration>('duration') ??
            const Duration(milliseconds: 300);
        final curve = namedArgs.get<Curve?>('curve') ?? Curves.linear;
        final builder = namedArgs['builder'];
        final onEnd = namedArgs.handleVoidCallback('onEnd', visitor);
        final child = visitor.toWidget(namedArgs['child']);

        return TweenAnimationBuilder<dynamic>(
          key: key,
          tween: tween,
          duration: duration,
          curve: curve,
          builder: (BuildContext context, dynamic value, Widget? child) {
            if (builder is InterpretedFunction) {
              final result = builder.call(visitor, [context, value, child], {});
              return visitor.toWidget(result) ?? const SizedBox();
            }
            return const SizedBox();
          },
          onEnd: onEnd,
          child: child,
        );
      },
    },
  );
}
