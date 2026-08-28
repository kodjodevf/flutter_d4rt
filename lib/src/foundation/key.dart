import 'package:d4rt/d4rt.dart';
import 'package:flutter/widgets.dart';

BridgedClass getKeyBridgingDefinition() {
  return BridgedClass(
    nativeType: Key,
    name: 'Key',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final value = positionalArgs.isNotEmpty
            ? positionalArgs[0] as String
            : namedArgs['value'] as String? ?? '';
        return Key(value);
      },
    },
    getters: {
      'hashCode': (visitor, target) => (target as Key).hashCode,
      'runtimeType': (visitor, target) => (target as Key).runtimeType,
    },
    isSubtypeOfFunc: (value) => value is Key,
  );
}

BridgedClass getLocalKeyBridgingDefinition() {
  return BridgedClass(
    nativeType: LocalKey,
    name: 'LocalKey',
    constructors: {},
    getters: {
      'hashCode': (visitor, target) => (target as LocalKey).hashCode,
      'runtimeType': (visitor, target) => (target as LocalKey).runtimeType,
    },
    isSubtypeOfFunc: (value) => value is LocalKey,
  );
}

BridgedClass getValueKeyBridgingDefinition() {
  return BridgedClass(
    nativeType: ValueKey,
    name: 'ValueKey',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final value = positionalArgs.isNotEmpty
            ? positionalArgs[0]
            : namedArgs['value'];
        return ValueKey(value);
      },
    },
    getters: {
      'value': (visitor, target) => (target as ValueKey).value,
      'hashCode': (visitor, target) => (target as ValueKey).hashCode,
      'runtimeType': (visitor, target) => (target as ValueKey).runtimeType,
    },
    methods: {
      '==': (visitor, target, positionalArgs, namedArgs) {
        return (target as ValueKey) == positionalArgs[0];
      },
    },
    isSubtypeOfFunc: (value) => value is ValueKey,
  );
}

BridgedClass getUniqueKeyBridgingDefinition() {
  return BridgedClass(
    nativeType: UniqueKey,
    name: 'UniqueKey',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return UniqueKey();
      },
    },
    getters: {
      'hashCode': (visitor, target) => (target as UniqueKey).hashCode,
      'runtimeType': (visitor, target) => (target as UniqueKey).runtimeType,
    },
    isSubtypeOfFunc: (value) => value is UniqueKey,
  );
}

BridgedClass getObjectKeyBridgingDefinition() {
  return BridgedClass(
    nativeType: ObjectKey,
    name: 'ObjectKey',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final value = positionalArgs.isNotEmpty
            ? positionalArgs[0]
            : namedArgs['value'];
        return ObjectKey(value);
      },
    },
    getters: {
      'value': (visitor, target) => (target as ObjectKey).value,
      'hashCode': (visitor, target) => (target as ObjectKey).hashCode,
      'runtimeType': (visitor, target) => (target as ObjectKey).runtimeType,
    },
    isSubtypeOfFunc: (value) => value is ObjectKey,
  );
}

