// ignore_for_file: deprecated_member_use

import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';

/// Returns the BridgedEnumDefinition for WidgetState
BridgedEnumDefinition<WidgetState> getWidgetStateBridgingDefinition() {
  return BridgedEnumDefinition<WidgetState>(
    name: 'WidgetState',
    values: WidgetState.values,
  );
}

/// Returns the BridgedEnumDefinition for MaterialState (alias of WidgetState)
BridgedEnumDefinition<MaterialState> getMaterialStateBridgingDefinition() {
  return BridgedEnumDefinition<MaterialState>(
    name: 'MaterialState',
    values: MaterialState.values,
  );
}

/// Returns the BridgedClass for WidgetStateProperty
BridgedClass getWidgetStatePropertyBridgingDefinition() {
  return BridgedClass(
    nativeType: WidgetStateProperty,
    name: 'WidgetStateProperty',
    constructors: {},
    staticMethods: {
      'all': (visitor, positionalArgs, namedArgs) {
        final value = positionalArgs.first;
        return WidgetStateProperty.all(value);
      },
      'resolveWith': (visitor, positionalArgs, namedArgs) {
        final callback = positionalArgs.first;
        if (callback is InterpretedFunction) {
          return WidgetStateProperty.resolveWith((states) {
            final result = callback.call(visitor, [states], {});
            return result is BridgedInstance ? result.nativeObject : result;
          });
        }
        return WidgetStateProperty.resolveWith(
          callback as WidgetPropertyResolver,
        );
      },
      'fromMap': (visitor, positionalArgs, namedArgs) {
        final map = positionalArgs.first as Map;
        return WidgetStateProperty.fromMap(map.cast());
      },
    },
    methods: {
      'resolve': (visitor, target, positionalArgs, namedArgs) {
        final states = positionalArgs.first as Set;
        return (target as WidgetStateProperty).resolve(states.cast());
      },
    },
    isSubtypeOfFunc: (value) => value is WidgetStateProperty,
  );
}

/// Returns the BridgedClass for MaterialStateProperty (legacy alias)
BridgedClass getMaterialStatePropertyBridgingDefinition() {
  return BridgedClass(
    nativeType: MaterialStateProperty,
    name: 'MaterialStateProperty',
    constructors: {},
    staticMethods: {
      'all': (visitor, positionalArgs, namedArgs) {
        final value = positionalArgs.first;
        return MaterialStateProperty.all(value);
      },
      'resolveWith': (visitor, positionalArgs, namedArgs) {
        final callback = positionalArgs.first;
        if (callback is InterpretedFunction) {
          return MaterialStateProperty.resolveWith((states) {
            final result = callback.call(visitor, [states], {});
            return result is BridgedInstance ? result.nativeObject : result;
          });
        }
        return MaterialStateProperty.resolveWith(
          callback as MaterialPropertyResolver,
        );
      },
    },
    methods: {
      'resolve': (visitor, target, positionalArgs, namedArgs) {
        final states = positionalArgs.first as Set;
        return (target as MaterialStateProperty).resolve(states.cast());
      },
    },
    isSubtypeOfFunc: (value) => value is MaterialStateProperty,
  );
}

/// Returns the BridgedClass for WidgetStateColor
BridgedClass getWidgetStateColorBridgingDefinition() {
  return BridgedClass(
    nativeType: WidgetStateColor,
    name: 'WidgetStateColor',
    constructors: {
      'resolveWith': (visitor, positionalArgs, namedArgs) {
        final callback = positionalArgs.first;
        if (callback is InterpretedFunction) {
          return WidgetStateColor.resolveWith((states) {
            final result = callback.call(visitor, [states], {});
            return (result is BridgedInstance ? result.nativeObject : result)
                as Color;
          });
        }
        return WidgetStateColor.resolveWith(
          callback as Color Function(Set<WidgetState>),
        );
      },
    },
    isSubtypeOfFunc: (value) => value is WidgetStateColor,
  );
}

/// Returns the BridgedClass for MaterialStateColor
BridgedClass getMaterialStateColorBridgingDefinition() {
  return BridgedClass(
    nativeType: MaterialStateColor,
    name: 'MaterialStateColor',
    constructors: {
      'resolveWith': (visitor, positionalArgs, namedArgs) {
        final callback = positionalArgs.first;
        if (callback is InterpretedFunction) {
          return MaterialStateColor.resolveWith((states) {
            final result = callback.call(visitor, [states], {});
            return (result is BridgedInstance ? result.nativeObject : result)
                as Color;
          });
        }
        return MaterialStateColor.resolveWith(
          callback as Color Function(Set<MaterialState>),
        );
      },
    },
    isSubtypeOfFunc: (value) => value is MaterialStateColor,
  );
}

/// Returns the BridgedClass for WidgetStateMouseCursor
BridgedClass getWidgetStateMouseCursorBridgingDefinition() {
  return BridgedClass(
    nativeType: WidgetStateMouseCursor,
    name: 'WidgetStateMouseCursor',
    constructors: {},
    staticGetters: {
      'clickable': (visitor) => WidgetStateMouseCursor.clickable,
      'textable': (visitor) => WidgetStateMouseCursor.textable,
    },
    isSubtypeOfFunc: (value) => value is WidgetStateMouseCursor,
  );
}

/// Returns the BridgedClass for MaterialStateMouseCursor
BridgedClass getMaterialStateMouseCursorBridgingDefinition() {
  return BridgedClass(
    nativeType: MaterialStateMouseCursor,
    name: 'MaterialStateMouseCursor',
    constructors: {},
    staticGetters: {
      'clickable': (visitor) => MaterialStateMouseCursor.clickable,
      'textable': (visitor) => MaterialStateMouseCursor.textable,
    },
    isSubtypeOfFunc: (value) => value is MaterialStateMouseCursor,
  );
}

/// Returns the BridgedClass for WidgetStateBorderSide
BridgedClass getWidgetStateBorderSideBridgingDefinition() {
  return BridgedClass(
    nativeType: WidgetStateBorderSide,
    name: 'WidgetStateBorderSide',
    constructors: {
      'resolveWith': (visitor, positionalArgs, namedArgs) {
        final callback = positionalArgs.first;
        if (callback is InterpretedFunction) {
          return WidgetStateBorderSide.resolveWith((states) {
            final result = callback.call(visitor, [states], {});
            return (result is BridgedInstance ? result.nativeObject : result)
                as BorderSide?;
          });
        }
        return WidgetStateBorderSide.resolveWith(
          callback as BorderSide? Function(Set<WidgetState>),
        );
      },
    },
    isSubtypeOfFunc: (value) => value is WidgetStateBorderSide,
  );
}

/// Returns the BridgedClass for MaterialStateBorderSide
BridgedClass getMaterialStateBorderSideBridgingDefinition() {
  return BridgedClass(
    nativeType: MaterialStateBorderSide,
    name: 'MaterialStateBorderSide',
    constructors: {
      'resolveWith': (visitor, positionalArgs, namedArgs) {
        final callback = positionalArgs.first;
        if (callback is InterpretedFunction) {
          return MaterialStateBorderSide.resolveWith((states) {
            final result = callback.call(visitor, [states], {});
            return (result is BridgedInstance ? result.nativeObject : result)
                as BorderSide?;
          });
        }
        return MaterialStateBorderSide.resolveWith(
          callback as BorderSide? Function(Set<MaterialState>),
        );
      },
    },
    isSubtypeOfFunc: (value) => value is MaterialStateBorderSide,
  );
}

/// Returns the BridgedClass for WidgetStateTextStyle
BridgedClass getWidgetStateTextStyleBridgingDefinition() {
  return BridgedClass(
    nativeType: WidgetStateTextStyle,
    name: 'WidgetStateTextStyle',
    constructors: {
      'resolveWith': (visitor, positionalArgs, namedArgs) {
        final callback = positionalArgs.first;
        if (callback is InterpretedFunction) {
          return WidgetStateTextStyle.resolveWith((states) {
            final result = callback.call(visitor, [states], {});
            return (result is BridgedInstance ? result.nativeObject : result)
                as TextStyle;
          });
        }
        return WidgetStateTextStyle.resolveWith(
          callback as TextStyle Function(Set<WidgetState>),
        );
      },
    },
    isSubtypeOfFunc: (value) => value is WidgetStateTextStyle,
  );
}

/// Returns the BridgedClass for MaterialStateTextStyle
BridgedClass getMaterialStateTextStyleBridgingDefinition() {
  return BridgedClass(
    nativeType: MaterialStateTextStyle,
    name: 'MaterialStateTextStyle',
    constructors: {
      'resolveWith': (visitor, positionalArgs, namedArgs) {
        final callback = positionalArgs.first;
        if (callback is InterpretedFunction) {
          return MaterialStateTextStyle.resolveWith((states) {
            final result = callback.call(visitor, [states], {});
            return (result is BridgedInstance ? result.nativeObject : result)
                as TextStyle;
          });
        }
        return MaterialStateTextStyle.resolveWith(
          callback as TextStyle Function(Set<MaterialState>),
        );
      },
    },
    isSubtypeOfFunc: (value) => value is MaterialStateTextStyle,
  );
}
