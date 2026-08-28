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

ChangeNotifierBridge? _extractChangeNotifier(dynamic target) {
  if (target is ChangeNotifierBridge) return target;
  if (target is InterpretedInstance) {
    if (target.bridgedSuperObject is ChangeNotifierBridge) {
      return target.bridgedSuperObject as ChangeNotifierBridge;
    }
  }
  if (target is BridgedInstance) {
    if (target.nativeObject is ChangeNotifierBridge) {
      return target.nativeObject as ChangeNotifierBridge;
    }
  }
  return null;
}

ValueNotifierBridge? _extractValueNotifier(dynamic target) {
  if (target is ValueNotifierBridge) return target;
  if (target is InterpretedInstance) {
    if (target.bridgedSuperObject is ValueNotifierBridge) {
      return target.bridgedSuperObject as ValueNotifierBridge;
    }
  }
  if (target is BridgedInstance) {
    if (target.nativeObject is ValueNotifierBridge) {
      return target.nativeObject as ValueNotifierBridge;
    }
  }
  return null;
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
          _extractChangeNotifier(target)?.hashCode ?? target.hashCode,
      'hasListeners': (visitor, target) =>
          _extractChangeNotifier(target)?.hasListeners ?? false,
    },
    methods: {
      'hasListeners': (visitor, target, positionalArgs, namedArgs) =>
          _extractChangeNotifier(target)?.hasListeners ?? false,
      'addListener': (visitor, target, positionalArgs, namedArgs) {
        final listener = positionalArgs.get<InterpretedFunction>(0);
        if (listener != null) {
          _extractChangeNotifier(target)?.addInterpretedListener(
            listener,
            visitor,
          );
        }
        return null;
      },
      'removeListener': (visitor, target, positionalArgs, namedArgs) {
        final listener = positionalArgs.get<InterpretedFunction>(0);
        if (listener != null) {
          _extractChangeNotifier(target)?.removeInterpretedListener(listener);
        }
        return null;
      },
      'notifyListeners': (visitor, target, positionalArgs, namedArgs) {
        _extractChangeNotifier(target)?.notifyListeners();
        return null;
      },
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        _extractChangeNotifier(target)?.dispose();
        return null;
      },
      'debugAssertNotDisposed': (visitor, target, positionalArgs, namedArgs) {
        final bridge = _extractChangeNotifier(target);
        if (bridge != null) {
          return ChangeNotifier.debugAssertNotDisposed(bridge);
        }
        return true;
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
      'value': (visitor, target) => _extractValueNotifier(target)?.value,
      'hasListeners': (visitor, target) =>
          _extractValueNotifier(target)?.hasListeners ?? false,
    },
    setters: {
      'value': (visitor, target, value) {
        final bridge = _extractValueNotifier(target);
        if (bridge != null) {
          bridge.value = value;
        }
      },
    },
    methods: {
      'hasListeners': (visitor, target, positionalArgs, namedArgs) =>
          _extractValueNotifier(target)?.hasListeners ?? false,
      'addListener': (visitor, target, positionalArgs, namedArgs) {
        final listener = positionalArgs.get<InterpretedFunction>(0);
        if (listener != null) {
          _extractValueNotifier(target)?.addInterpretedListener(
            listener,
            visitor,
          );
        }
        return null;
      },
      'removeListener': (visitor, target, positionalArgs, namedArgs) {
        final listener = positionalArgs.get<InterpretedFunction>(0);
        if (listener != null) {
          _extractValueNotifier(target)?.removeInterpretedListener(listener);
        }
        return null;
      },
      'notifyListeners': (visitor, target, positionalArgs, namedArgs) {
        _extractValueNotifier(target)?.notifyListeners();
        return null;
      },
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        _extractValueNotifier(target)?.dispose();
        return null;
      },
      'toString': (visitor, target, positionalArgs, namedArgs) {
        return _extractValueNotifier(target)?.toString() ?? target.toString();
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
  final Map<InterpretedFunction, VoidCallback> _listenersMap = {};

  ChangeNotifierBridge({required this.visitor, this.instance}) {
    instance?.bridgedSuperObject = this;
  }

  @override
  bool get hasListeners => super.hasListeners;

  void addInterpretedListener(
    InterpretedFunction listener,
    InterpreterVisitor visitor,
  ) {
    if (_listenersMap.containsKey(listener)) return;
    void callback() {
      listener.call(visitor, [], {});
    }

    _listenersMap[listener] = callback;
    addListener(callback);
  }

  void removeInterpretedListener(InterpretedFunction listener) {
    final callback = _listenersMap.remove(listener);
    if (callback != null) {
      removeListener(callback);
    }
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }

  @override
  void dispose() {
    _listenersMap.clear();
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
  final Map<InterpretedFunction, VoidCallback> _listenersMap = {};

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
  bool get hasListeners => super.hasListeners;

  void addInterpretedListener(
    InterpretedFunction listener,
    InterpreterVisitor visitor,
  ) {
    if (_listenersMap.containsKey(listener)) return;
    void callback() {
      listener.call(visitor, [], {});
    }

    _listenersMap[listener] = callback;
    addListener(callback);
  }

  void removeInterpretedListener(InterpretedFunction listener) {
    final callback = _listenersMap.remove(listener);
    if (callback != null) {
      removeListener(callback);
    }
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }

  @override
  void dispose() {
    _listenersMap.clear();
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
