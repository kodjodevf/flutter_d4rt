// ignore_for_file: deprecated_member_use

import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Bridge class for FlowDelegate
class FlowDelegateBridge extends FlowDelegate {
  final InterpreterVisitor visitor;
  final InterpretedInstance instance;
  final Listenable? repaint;

  FlowDelegateBridge({
    required this.visitor,
    required this.instance,
    this.repaint,
  }) : super(repaint: repaint) {
    instance.bridgedSuperObject = this;
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    final fn = instance.klass.findInstanceMethod('paintChildren');
    if (fn != null) {
      fn.bind(instance).call(visitor, [context], {});
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    final fn = instance.klass.findInstanceMethod('shouldRepaint');
    if (fn != null) {
      final oldDelegateWrapper = oldDelegate is FlowDelegateBridge
          ? oldDelegate.instance
          : oldDelegate;
      final result = fn.bind(instance).call(visitor, [oldDelegateWrapper], {});
      return result as bool? ?? true;
    }
    return true;
  }

  @override
  bool shouldRelayout(covariant FlowDelegate oldDelegate) {
    final fn = instance.klass.findInstanceMethod('shouldRelayout');
    if (fn != null) {
      final oldDelegateWrapper = oldDelegate is FlowDelegateBridge
          ? oldDelegate.instance
          : oldDelegate;
      final result = fn.bind(instance).call(visitor, [oldDelegateWrapper], {});
      return result as bool? ?? false;
    }
    return false;
  }

  @override
  Size getSize(BoxConstraints constraints) {
    final fn = instance.klass.findInstanceMethod('getSize');
    if (fn != null) {
      final result = fn.bind(instance).call(visitor, [constraints], {});
      if (result is Size) return result;
    }
    return super.getSize(constraints);
  }

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    final fn = instance.klass.findInstanceMethod('getConstraintsForChild');
    if (fn != null) {
      final result = fn.bind(instance).call(visitor, [i, constraints], {});
      if (result is BoxConstraints) return result;
    }
    return super.getConstraintsForChild(i, constraints);
  }
}

/// Returns the BridgedClass for FlowDelegate.
BridgedClass getFlowDelegateBridgingDefinition() {
  return BridgedClass(
    nativeType: FlowDelegateBridge,
    name: 'FlowDelegate',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final repaint = namedArgs.get<Listenable?>('repaint');
        return FlowDelegateBridge(
          visitor: visitor,
          instance: positionalArgs.get<InterpretedInstance>(0)!,
          repaint: repaint,
        );
      },
    },
    methods: {
      'paintChildren': (visitor, target, positionalArgs, namedArgs) {
        final context = positionalArgs[0] as FlowPaintingContext;
        (target as FlowDelegate).paintChildren(context);
        return null;
      },
      'shouldRepaint': (visitor, target, positionalArgs, namedArgs) {
        final oldDelegate = positionalArgs[0] as FlowDelegate;
        return (target as FlowDelegate).shouldRepaint(oldDelegate);
      },
    },
    isSubtypeOfFunc: (value) => value is FlowDelegate,
  );
}

/// Returns the BridgedClass for FlowPaintingContext.
BridgedClass getFlowPaintingContextBridgingDefinition() {
  return BridgedClass(
    nativeType: FlowPaintingContext,
    name: 'FlowPaintingContext',
    constructors: {},
    getters: {
      'size': (visitor, target) => (target as FlowPaintingContext).size,
      'childCount': (visitor, target) =>
          (target as FlowPaintingContext).childCount,
    },
    methods: {
      'paintChild': (visitor, target, positionalArgs, namedArgs) {
        final i = positionalArgs[0] as int;
        final transform =
            namedArgs.get<Matrix4?>('transform') ?? Matrix4.identity();
        final opacity = (namedArgs['opacity'] as num?)?.toDouble() ?? 1.0;
        (target as FlowPaintingContext).paintChild(
          i,
          transform: transform,
          opacity: opacity,
        );
        return null;
      },
      'getChildSize': (visitor, target, positionalArgs, namedArgs) {
        final i = positionalArgs[0] as int;
        return (target as FlowPaintingContext).getChildSize(i);
      },
    },
    isSubtypeOfFunc: (value) => value is FlowPaintingContext,
  );
}

/// Returns the BridgedClass for Flow widget.
BridgedClass getFlowBridgingDefinition() {
  return BridgedClass(
    nativeType: Flow,
    name: 'Flow',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final delegateRaw = namedArgs['delegate'];
        FlowDelegate delegate;
        if (delegateRaw is InterpretedInstance) {
          if (delegateRaw.bridgedSuperObject is FlowDelegate) {
            delegate = delegateRaw.bridgedSuperObject as FlowDelegate;
          } else {
            delegate = FlowDelegateBridge(
              visitor: visitor,
              instance: delegateRaw,
            );
          }
        } else if (delegateRaw is BridgedInstance) {
          delegate = delegateRaw.nativeObject as FlowDelegate;
        } else {
          delegate = delegateRaw as FlowDelegate;
        }
        final clipBehavior =
            namedArgs.get<Clip?>('clipBehavior') ?? Clip.hardEdge;
        final childrenRaw = visitor.toWidgets(namedArgs['children']);
        final List<Widget> children = childrenRaw is List<Widget>
            ? childrenRaw
            : (childrenRaw is List
                ? childrenRaw.cast<Widget>()
                : (childrenRaw is Widget ? [childrenRaw] : <Widget>[]));

        return Flow(
          key: key,
          delegate: delegate,
          clipBehavior: clipBehavior,
          children: children,
        );
      },
      'unwrapped': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final delegateRaw = namedArgs['delegate'];
        FlowDelegate delegate;
        if (delegateRaw is InterpretedInstance) {
          if (delegateRaw.bridgedSuperObject is FlowDelegate) {
            delegate = delegateRaw.bridgedSuperObject as FlowDelegate;
          } else {
            delegate = FlowDelegateBridge(
              visitor: visitor,
              instance: delegateRaw,
            );
          }
        } else if (delegateRaw is BridgedInstance) {
          delegate = delegateRaw.nativeObject as FlowDelegate;
        } else {
          delegate = delegateRaw as FlowDelegate;
        }
        final clipBehavior =
            namedArgs.get<Clip?>('clipBehavior') ?? Clip.none;
        final childrenRaw = visitor.toWidgets(namedArgs['children']);
        final List<Widget> children = childrenRaw is List<Widget>
            ? childrenRaw
            : (childrenRaw is List
                ? childrenRaw.cast<Widget>()
                : (childrenRaw is Widget ? [childrenRaw] : <Widget>[]));

        return Flow.unwrapped(
          key: key,
          delegate: delegate,
          clipBehavior: clipBehavior,
          children: children,
        );
      },
    },
    getters: {
      'delegate': (visitor, target) => (target as Flow).delegate,
      'clipBehavior': (visitor, target) => (target as Flow).clipBehavior,
      'key': (visitor, target) => (target as Flow).key,
    },
  );
}
