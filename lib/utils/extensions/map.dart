import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';

extension MapExtension<K, V> on Map<K, V> {
  double? getToDouble(K key) {
    return double.tryParse('${this[key]}');
  }

  VoidCallback? handleVoidCallback(String key, InterpreterVisitor visitor) {
    final callback = this[key];
    if (callback == null) return null;
    if (callback is InterpretedFunction) {
      return () {
        callback.call(visitor, [], {});
      };
    }
    return callback as VoidCallback?;
  }

  void Function(T)? handleValueCallback<T>(
    String key,
    InterpreterVisitor visitor,
  ) {
    final callback = this[key];
    if (callback == null) return null;
    if (callback is InterpretedFunction) {
      return (T value) => callback.call(visitor, [value]);
    }
    return callback as void Function(T)?;
  }

  void Function(T, U)? handle2ValueCallback<T, U>(
    String key,
    InterpreterVisitor visitor,
  ) {
    final callback = this[key];
    if (callback == null) return null;
    if (callback is InterpretedFunction) {
      return (T value, U value2) => callback.call(visitor, [value, value2]);
    }
    return callback as void Function(T, U)?;
  }

  U Function(T)? handleValueCallbackWithReturnType<U, T>(
    String key,
    InterpreterVisitor visitor,
  ) {
    final callback = this[key];
    if (callback == null) return null;
    if (callback is InterpretedFunction) {
      return (T value) => callback.call(visitor, [value]) as U;
    }
    return callback as U Function(T)?;
  }
}
