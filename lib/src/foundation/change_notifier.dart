import 'package:d4rt/d4rt.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for the Flutter Listenable interface.
BridgedClass getListenableBridgingDefinition() {
  return BridgedClass(
    nativeType: Listenable,
    name: 'Listenable',
    nativeNames: ["_MergingListenable"],
    constructors: {
      'merge': (visitor, positionalArgs, namedArgs) {
        final listenables = positionalArgs.get<Iterable>(0)!.map((item) {
          if (item is BridgedInstance) {
            return item.nativeObject;
          }
          return item;
        });

        return Listenable.merge(listenables.cast());
      },
    },
    methods: {
      'addListener': (visitor, target, positionalArgs, namedArgs) {
        final listener = positionalArgs.get<InterpretedFunction>(0);
        if (listener != null) {
          (target as Listenable).addListener(
            () => listener.call(visitor, [], {}),
          );
        }
        return null;
      },
      'removeListener': (visitor, target, positionalArgs, namedArgs) {
        final listener = positionalArgs.get<InterpretedFunction>(0);
        if (listener != null) {
          (target as Listenable).removeListener(
            () => listener.call(visitor, [], {}),
          );
        }
        return null;
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter ValueListenable interface.
BridgedClass getValueListenableBridgingDefinition() {
  return BridgedClass(
    nativeType: ValueListenable,
    name: 'ValueListenable',
    getters: {'value': (visitor, target) => (target as ValueListenable).value},
    methods: {
      'addListener': (visitor, target, positionalArgs, namedArgs) {
        final listener = positionalArgs.get<InterpretedFunction>(0);
        if (listener != null) {
          (target as ValueListenable).addListener(
            () => listener.call(visitor, [], {}),
          );
        }
        return null;
      },
      'removeListener': (visitor, target, positionalArgs, namedArgs) {
        final listener = positionalArgs.get<InterpretedFunction>(0);
        if (listener != null) {
          (target as ValueListenable).removeListener(
            () => listener.call(visitor, [], {}),
          );
        }
        return null;
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter ChangeNotifier class.
BridgedClass getChangeNotifierBridgingDefinition() {
  return BridgedClass(
    nativeType: ChangeNotifierBridge,
    name: 'ChangeNotifier',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final arg0 = positionalArgs.isNotEmpty ? positionalArgs[0] : null;
        return ChangeNotifierBridge(
          visitor: visitor,
          instance: arg0 is InterpretedInstance ? arg0 : null,
        );
      },
    },
    getters: {
      'hashCode': (visitor, target) =>
          (target as ChangeNotifierBridge).hashCode,
    },
    methods: {
      'addListener': (visitor, target, positionalArgs, namedArgs) {
        final listener = positionalArgs.get<InterpretedFunction>(0);
        if (listener != null) {
          (target as ChangeNotifierBridge).addListener(
            () => listener.call(visitor, [], {}),
          );
        }
        return null;
      },
      'removeListener': (visitor, target, positionalArgs, namedArgs) {
        final listener = positionalArgs.get<InterpretedFunction>(0);
        if (listener != null) {
          (target as ChangeNotifierBridge).removeListener(
            () => listener.call(visitor, [], {}),
          );
        }
        return null;
      },
      'notifyListeners': (visitor, target, positionalArgs, namedArgs) {
        (target as ChangeNotifierBridge).notifyListeners();
        return null;
      },
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        (target as ChangeNotifierBridge).dispose();
        return null;
      },
      'debugAssertNotDisposed': (visitor, target, positionalArgs, namedArgs) {
        return ChangeNotifier.debugAssertNotDisposed(
          target as ChangeNotifierBridge,
        );
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter ValueNotifier class.
BridgedClass getValueNotifierBridgingDefinition() {
  return BridgedClass(
    nativeType: ValueNotifierBridge,
    name: 'ValueNotifier',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final value = positionalArgs.isNotEmpty ? positionalArgs[0] : null;
        final arg1 = positionalArgs.length > 1 ? positionalArgs[1] : null;
        return ValueNotifierBridge(
          visitor: visitor,
          instance: arg1 is InterpretedInstance ? arg1 : null,
          initialValue: value,
        );
      },
    },
    getters: {
      'value': (visitor, target) => (target as ValueNotifierBridge).value,
    },
    setters: {
      'value': (visitor, target, value) {
        (target as ValueNotifierBridge).value = value;
      },
    },
    methods: {
      'addListener': (visitor, target, positionalArgs, namedArgs) {
        final listener = positionalArgs.get<InterpretedFunction>(0);
        if (listener != null) {
          (target as ValueNotifierBridge).addListener(
            () => listener.call(visitor, [], {}),
          );
        }
        return null;
      },
      'removeListener': (visitor, target, positionalArgs, namedArgs) {
        final listener = positionalArgs.get<InterpretedFunction>(0);
        if (listener != null) {
          (target as ValueNotifierBridge).removeListener(
            () => listener.call(visitor, [], {}),
          );
        }
        return null;
      },
      'notifyListeners': (visitor, target, positionalArgs, namedArgs) {
        (target as ValueNotifierBridge).notifyListeners();
        return null;
      },
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        (target as ValueNotifierBridge).dispose();
        return null;
      },
      'toString': (visitor, target, positionalArgs, namedArgs) {
        return (target as ValueNotifierBridge).toString();
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter ValueListenableBuilder widget.
BridgedClass getValueListenableBuilderBridgingDefinition() {
  return BridgedClass(
    nativeType: ValueListenableBuilder,
    name: 'ValueListenableBuilder',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final rawListenable = namedArgs['valueListenable'];
        ValueListenable valueListenable;
        if (rawListenable is BridgedInstance) {
          valueListenable = rawListenable.nativeObject as ValueListenable;
        } else if (rawListenable is ValueListenable) {
          valueListenable = rawListenable;
        } else if (rawListenable is InterpretedInstance &&
            rawListenable.bridgedSuperObject is ValueListenable) {
          valueListenable =
              rawListenable.bridgedSuperObject as ValueListenable;
        } else {
          throw RuntimeError(
            'valueListenable must be a ValueListenable for ValueListenableBuilder',
          );
        }

        final builderFunction = namedArgs['builder'];
        final child = namedArgs['child'] != null
            ? visitor.toWidgets(namedArgs['child'])
            : null;

        // Convert the interpreted builder function to a native one
        Widget Function(BuildContext, dynamic, Widget?) builder;
        if (builderFunction is InterpretedFunction) {
          builder = (context, value, child) {
            final result = builderFunction.call(visitor, [
              context,
              value,
              child,
            ]);
            return visitor.toWidgets(result);
          };
        } else {
          throw RuntimeError(
            'builder must be a function for ValueListenableBuilder',
          );
        }

        return ValueListenableBuilder(
          key: key,
          valueListenable: valueListenable,
          builder: builder,
          child: child,
        );
      },
    },
    getters: {
      'valueListenable': (visitor, target) =>
          (target as ValueListenableBuilder).valueListenable,
      'key': (visitor, target) => (target as ValueListenableBuilder).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter ListenableBuilder widget.
BridgedClass getListenableBuilderBridgingDefinition() {
  return BridgedClass(
    nativeType: ListenableBuilder,
    name: 'ListenableBuilder',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final rawListenable = namedArgs['listenable'];
        Listenable listenable;
        if (rawListenable is BridgedInstance) {
          listenable = rawListenable.nativeObject as Listenable;
        } else if (rawListenable is Listenable) {
          listenable = rawListenable;
        } else if (rawListenable is InterpretedInstance) {
          if (rawListenable.bridgedSuperObject is Listenable) {
            listenable = rawListenable.bridgedSuperObject as Listenable;
          } else {
            listenable = ChangeNotifierBridge(
              visitor: visitor,
              instance: rawListenable,
            );
          }
        } else {
          throw RuntimeError(
            'listenable must be a Listenable for ListenableBuilder',
          );
        }

        final builderFunction = namedArgs['builder'];
        final child = namedArgs['child'] != null
            ? visitor.toWidgets(namedArgs['child'])
            : null;

        // Convert the interpreted builder function to a native one
        Widget Function(BuildContext, Widget?) builder;
        if (builderFunction is InterpretedFunction) {
          builder = (context, child) {
            final result = builderFunction.call(visitor, [context, child]);
            return visitor.toWidgets(result);
          };
        } else {
          throw RuntimeError(
            'builder must be a function for ListenableBuilder',
          );
        }

        return ListenableBuilder(
          key: key,
          listenable: listenable,
          builder: builder,
          child: child,
        );
      },
    },
    getters: {
      'listenable': (visitor, target) =>
          (target as ListenableBuilder).listenable,
      'key': (visitor, target) => (target as ListenableBuilder).key,
    },
  );
}

/// Bridge class for ChangeNotifier that connects to d4rt interpreted instances
class ChangeNotifierBridge extends ChangeNotifier {
  final InterpreterVisitor visitor;
  final InterpretedInstance? instance;

  ChangeNotifierBridge({required this.visitor, this.instance}) {
    instance?.bridgedSuperObject = this;
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
    if (instance != null) {
      final fn = instance!.klass.findInstanceMethod('notifyListeners');
      if (fn != null) {
        fn.bind(instance!).call(visitor, [], {});
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (instance != null) {
      final fn = instance!.klass.findInstanceMethod('dispose');
      if (fn != null) {
        fn.bind(instance!).call(visitor, [], {});
      }
    }
  }

  /// Called when the interpreted instance calls notifyListeners()
  /// to trigger notification to native listeners
  void notifyListenersFromNative() {
    super.notifyListeners();
  }
}

/// Bridge class for ValueNotifier that connects to d4rt interpreted instances
class ValueNotifierBridge<T> extends ValueNotifier<T> {
  final InterpreterVisitor visitor;
  final InterpretedInstance? instance;

  ValueNotifierBridge({
    required this.visitor,
    this.instance,
    required T initialValue,
  }) : super(initialValue) {
    instance?.bridgedSuperObject = this;
  }

  @override
  T get value {
    if (instance != null) {
      final interpretedValue = instance!.get('value');
      if (interpretedValue is T) {
        return interpretedValue;
      }
    }
    return super.value;
  }

  @override
  set value(T newValue) {
    if (value == newValue) {
      return;
    }
    if (instance != null) {
      instance!.set('value', newValue, visitor);
    }
    super.value = newValue;
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
    if (instance != null) {
      final fn = instance!.klass.findInstanceMethod('notifyListeners');
      if (fn != null) {
        fn.bind(instance!).call(visitor, [], {});
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (instance != null) {
      final fn = instance!.klass.findInstanceMethod('dispose');
      if (fn != null) {
        fn.bind(instance!).call(visitor, [], {});
      }
    }
  }

  @override
  String toString() {
    if (instance != null) {
      return '${instance!.klass.name}($value)';
    }
    return 'ValueNotifier($value)';
  }
}
