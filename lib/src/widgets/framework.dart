// ignore_for_file: invalid_use_of_protected_member, no_logic_in_create_state

import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

BridgedClass getGlobalKeyBridgingDefinition() {
  return BridgedClass(
    nativeType: GlobalKey,
    name: 'GlobalKey',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return GlobalKey(debugLabel: namedArgs.get<String?>('debugLabel'));
      },
    },
    getters: {
      'currentState': (visitor, target) {
        final key = target as GlobalKey;
        return key.currentState;
      },
      'currentWidget': (visitor, target) {
        final key = target as GlobalKey;
        return key.currentWidget;
      },
      'hashCode': (visitor, target) => (target as GlobalKey).hashCode,
      'runtimeType': (visitor, target) => (target as GlobalKey).runtimeType,
      'currentContext': (visitor, target) {
        final key = target as GlobalKey;
        return key.currentContext;
      },
    },
  );
}

BridgedClass getWidgetBridgingDefinition() {
  return BridgedClass(
    nativeType: Widget,
    name: 'Widget',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return Widget;
      },
      'canUpdate': (visitor, positionalArgs, namedArgs) {
        final oldWidget = visitor.toWidgets(namedArgs['oldWidget']);
        final newWidget = visitor.toWidgets(namedArgs['newWidget']);

        return Widget.canUpdate(oldWidget!, newWidget!);
      },
    },
    isSubtypeOfFunc: (value) => value is Widget,
  );
}

BridgedClass getStatelessWidgetBridgingDefinition() {
  return BridgedClass(
    nativeType: StatelessWidgetBridge,
    name: 'StatelessWidget',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return StatelessWidgetBridge(
          key: namedArgs.get<Key?>('key'),
          visitor: visitor,
          instance: positionalArgs.get<dynamic>(0),
        );
      },
    },
    methods: {
      'build': (visitor, target, positionalArgs, namedArgs) {
        final BuildContext context = namedArgs.get<BuildContext>('context')!;
        return (target as StatelessWidgetBridge).build(context);
      },
      'toString': (visitor, target, positionalArgs, namedArgs) {
        final minLevel =
            namedArgs.get<DiagnosticLevel?>('minLevel') ?? DiagnosticLevel.info;
        return (target as StatelessWidgetBridge).toString(minLevel: minLevel);
      },
    },
  );
}

BridgedClass getStatelessElementBridgingDefinition() {
  return BridgedClass(
    nativeType: StatelessElement,
    name: 'StatelessElement',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return StatelessElement(positionalArgs.get<StatelessWidget>(0)!);
      },
    },
  );
}

class StatelessWidgetBridge extends StatelessWidget {
  final InterpreterVisitor visitor;
  final InterpretedInstance instance;
  const StatelessWidgetBridge({
    super.key,
    required this.visitor,
    required this.instance,
  });

  @override
  Widget build(BuildContext context) {
    final fn = instance.klass.findInstanceMethod('build');
    if (fn == null) {
      throw RuntimeError('build method not found in StatelessWidget instance');
    }

    final result = fn.bind(instance).call(visitor, [context], {});

    return visitor.toWidgets(result);
  }
}

/// Returns the BridgedClass for the Flutter StatefulWidget class.
BridgedClass getStatefulWidgetBridgingDefinition() {
  return BridgedClass(
    nativeType: StatefulWidgetBridge,
    name: 'StatefulWidget',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return StatefulWidgetBridge(
          key: namedArgs.get<Key?>('key'),
          visitor: visitor,
          instance: positionalArgs.get<dynamic>(0),
        );
      },
    },
    getters: {
      'key': (visitor, target) => (target as StatefulWidgetBridge).key,
      'hashCode': (visitor, target) =>
          (target as StatefulWidgetBridge).hashCode,
      'runtimeType': (visitor, target) =>
          (target as StatefulWidgetBridge).runtimeType,
    },
    methods: {
      'createState': (visitor, target, positionalArgs, namedArgs) {
        return (target as StatefulWidgetBridge).createState();
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter State class.
BridgedClass getStateBridgingDefinition() {
  return BridgedClass(
    nativeType: StateBridge,
    name: 'State',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return StateBridge(
          visitor: visitor,
          instance: positionalArgs.get<dynamic>(0),
        );
      },
    },
    getters: {
      'widget': (visitor, target) {
        final bridge = target as StateBridge;
        // Return the interpreted widget instance directly
        return bridge.widget.instance;
      },
      'context': (visitor, target) => (target as StateBridge).context,
      'mounted': (visitor, target) => (target as StateBridge).mounted,
    },
    methods: {
      'build': (visitor, target, positionalArgs, namedArgs) {
        final BuildContext context = positionalArgs.get<BuildContext>(0)!;
        return (target as StateBridge).build(context);
      },
      'setState': (visitor, target, positionalArgs, namedArgs) {
        final fn = positionalArgs.isNotEmpty ? positionalArgs[0] : null;
        (target as StateBridge).setState(() {
          if (fn is InterpretedFunction) {
            fn.call(visitor, []);
          } else if (fn is Function) {
            fn();
          }
        });
        return null;
      },
      'initState': (visitor, target, positionalArgs, namedArgs) {
        return null;
      },
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        return null;
      },
      'didUpdateWidget': (visitor, target, positionalArgs, namedArgs) {
        return null;
      },
      'didChangeDependencies': (visitor, target, positionalArgs, namedArgs) {
        return null;
      },
      'deactivate': (visitor, target, positionalArgs, namedArgs) {
        return null;
      },
      'activate': (visitor, target, positionalArgs, namedArgs) {
        return null;
      },
    },
  );
}

/// Bridge class for StatefulWidget that connects to d4rt interpreted instances
class StatefulWidgetBridge extends StatefulWidget {
  final InterpreterVisitor visitor;
  final InterpretedInstance instance;

  const StatefulWidgetBridge({
    super.key,
    required this.visitor,
    required this.instance,
  });

  @override
  State<StatefulWidgetBridge> createState() {
    final fn = instance.klass.findInstanceMethod('createState');
    if (fn == null) {
      throw RuntimeError(
        'createState method not found in StatefulWidget instance',
      );
    }

    // Call the createState method
    final result = fn.bind(instance).call(visitor, [], {});
    // Handle the result - it should be a State instance
    if (result is InterpretedInstance) {
      final state = StateBridge(visitor: visitor, instance: result);
      result.bridgedSuperObject = state;
      return state;
    } else {
      throw RuntimeError(
        'createState method must return a State instance, got ${result?.runtimeType}',
      );
    }
  }
}

/// Bridge class for State that connects to d4rt interpreted instances
class StateBridge extends State<StatefulWidgetBridge> {
  final InterpreterVisitor visitor;
  final InterpretedInstance instance;

  StateBridge({required this.visitor, required this.instance});

  @override
  Widget build(BuildContext context) {
    final fn = instance.klass.findInstanceMethod('build');
    if (fn == null) {
      throw RuntimeError('build method not found in State instance');
    }

    final result = fn.bind(instance).call(visitor, [context], {});
    return visitor.toWidgets(result);
  }

  @override
  void initState() {
    super.initState();
    final fn = instance.klass.findInstanceMethod('initState');
    if (fn != null) {
      fn.bind(instance).call(visitor, [], {});
    }
  }

  @override
  void dispose() {
    super.dispose();
    final fn = instance.klass.findInstanceMethod('dispose');
    if (fn != null) {
      fn.bind(instance).call(visitor, [], {});
    }
  }

  @override
  void didUpdateWidget(StatefulWidgetBridge oldWidget) {
    super.didUpdateWidget(oldWidget);
    final fn = instance.klass.findInstanceMethod('didUpdateWidget');
    if (fn != null) {
      fn.bind(instance).call(visitor, [oldWidget], {});
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final fn = instance.klass.findInstanceMethod('didChangeDependencies');
    if (fn != null) {
      fn.bind(instance).call(visitor, [], {});
    }
  }

  @override
  void deactivate() {
    super.deactivate();
    final fn = instance.klass.findInstanceMethod('deactivate');
    if (fn != null) {
      fn.bind(instance).call(visitor, [], {});
    }
  }

  @override
  void activate() {
    super.activate();
    final fn = instance.klass.findInstanceMethod('activate');
    if (fn != null) {
      fn.bind(instance).call(visitor, [], {});
    }
  }
}

class TickerProviderStateBridge extends StateBridge
    with TickerProviderStateMixin {
  TickerProviderStateBridge({required super.visitor, required super.instance});

  @override
  void dispose() {
    super.dispose();
    final fn = instance.klass.findInstanceMethod('dispose');
    if (fn != null) {
      fn.bind(instance).call(visitor, [], {});
    }
  }
}

class SingleTickerProviderStateBridge extends StateBridge
    with SingleTickerProviderStateMixin {
  SingleTickerProviderStateBridge({
    required super.visitor,
    required super.instance,
  });

  @override
  void dispose() {
    super.dispose();
    final fn = instance.klass.findInstanceMethod('dispose');
    if (fn != null) {
      fn.bind(instance).call(visitor, [], {});
    }
  }
}

/// Returns the BridgedClass for BuildContext
BridgedClass getBuildContextBridgingDefinition() {
  return BridgedClass(
    nativeType: BuildContext,
    name: 'BuildContext',
    constructors: {},
    getters: {
      'mounted': (visitor, target) => (target as BuildContext).mounted,
      'size': (visitor, target) => (target as BuildContext).size,
      'widget': (visitor, target) => (target as BuildContext).widget,
    },
    isSubtypeOfFunc: (value) => value is BuildContext,
  );
}

