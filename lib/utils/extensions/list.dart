import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';

extension ListExtension<T> on List<T> {
  double? getToDouble(int index) {
    try {
      return double.tryParse('${this[index]}');
    } on RangeError {
      return null;
    }
  }

  VoidCallback? handleVoidCallback(int index, InterpreterVisitor visitor) {
    final callback = get<dynamic>(index);
    if (callback == null) return null;
    if (callback is InterpretedFunction) {
      return () {
        callback.call(visitor, [], {});
      };
    }
    return callback as VoidCallback?;
  }

  void Function(K)? handleValueCallback<K>(
    int index,
    InterpreterVisitor visitor,
  ) {
    final callback = get<dynamic>(index);
    if (callback == null) return null;
    if (callback is InterpretedFunction) {
      return (K value) => callback.call(visitor, [value]);
    }
    return callback as void Function(K)?;
  }
}
