import 'package:d4rt/d4rt.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';

/// Bridge class for CustomClipper that connects to d4rt interpreted instances
class CustomClipperBridge<T> extends CustomClipper<T> {
  final InterpreterVisitor visitor;
  final InterpretedInstance instance;
  final Listenable? reclip;

  CustomClipperBridge({
    required this.visitor,
    required this.instance,
    this.reclip,
  }) : super(reclip: reclip) {
    instance.bridgedSuperObject = this;
  }

  @override
  T getClip(Size size) {
    final fn = instance.klass.findInstanceMethod('getClip');
    if (fn == null) {
      throw RuntimeError('getClip method not found in CustomClipper instance');
    }
    final result = fn.bind(instance).call(visitor, [size], {});
    if (result is BridgedInstance) {
      return result.nativeObject as T;
    }
    return result as T;
  }

  @override
  bool shouldReclip(covariant CustomClipper<T> oldClipper) {
    final fn = instance.klass.findInstanceMethod('shouldReclip');
    if (fn == null) {
      return true;
    }
    final oldClipperWrapper = oldClipper is CustomClipperBridge<T>
        ? oldClipper.instance
        : oldClipper;
    final result = fn.bind(instance).call(visitor, [oldClipperWrapper], {});
    return result as bool? ?? true;
  }
}

/// Returns the BridgedClass for the Flutter CustomClipper abstract class.
BridgedClass getCustomClipperBridgingDefinition() {
  return BridgedClass(
    nativeType: CustomClipperBridge,
    name: 'CustomClipper',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final reclip = namedArgs.get<Listenable?>('reclip');
        return CustomClipperBridge<dynamic>(
          visitor: visitor,
          instance: positionalArgs.get<InterpretedInstance>(0)!,
          reclip: reclip,
        );
      },
    },
    methods: {
      'getClip': (visitor, target, positionalArgs, namedArgs) {
        final size = positionalArgs[0] as Size;
        return (target as CustomClipper).getClip(size);
      },
      'shouldReclip': (visitor, target, positionalArgs, namedArgs) {
        final oldClipper = positionalArgs[0] as CustomClipper;
        return (target as CustomClipper).shouldReclip(oldClipper);
      },
    },
    isSubtypeOfFunc: (value) => value is CustomClipper,
  );
}

