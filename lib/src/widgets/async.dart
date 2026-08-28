import 'dart:async';
import 'package:d4rt/d4rt.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for the Flutter FutureBuilder widget.
BridgedClass getFutureBuilderBridgingDefinition() {
  return BridgedClass(
    nativeType: FutureBuilder,
    name: 'FutureBuilder',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final future = namedArgs.get<Future?>('future');
        final builder = namedArgs['builder'];
        final initialData = namedArgs.get<dynamic>('initialData');
        final key = namedArgs.get<Key?>('key');

        if (builder == null) {
          throw ArgumentError('builder is required for FutureBuilder');
        }

        return FutureBuilder<dynamic>(
          key: key,
          future: future,
          initialData: initialData,
          builder: (context, snapshot) {
            if (builder is InterpretedFunction) {
              final result = builder.call(visitor, [context, snapshot]);
              return visitor.toWidgets(result)!;
            } else if (builder is Function) {
              final result = (builder as dynamic)(context, snapshot);
              return visitor.toWidgets(result)!;
            }
            return Container();
          },
        );
      },
    },
    getters: {
      'future': (visitor, target) => (target as FutureBuilder).future,
      'initialData': (visitor, target) => (target as FutureBuilder).initialData,
      'key': (visitor, target) => (target as FutureBuilder).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter StreamBuilder widget.
BridgedClass getStreamBuilderBridgingDefinition() {
  return BridgedClass(
    nativeType: StreamBuilder,
    name: 'StreamBuilder',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final stream = namedArgs.get<Stream?>('stream');
        final builder = namedArgs['builder'];
        final initialData = namedArgs.get<dynamic>('initialData');
        final key = namedArgs.get<Key?>('key');

        if (builder == null) {
          throw ArgumentError('builder is required for StreamBuilder');
        }

        return StreamBuilder<dynamic>(
          key: key,
          stream: stream?.cast(),
          initialData: initialData,
          builder: (context, snapshot) {
            if (builder is InterpretedFunction) {
              final result = builder.call(visitor, [context, snapshot]);
              return visitor.toWidgets(result)!;
            } else if (builder is Function) {
              final result = (builder as dynamic)(context, snapshot);
              return visitor.toWidgets(result)!;
            }
            return Container();
          },
        );
      },
    },
    getters: {
      'stream': (visitor, target) => (target as StreamBuilder).stream,
      'initialData': (visitor, target) => (target as StreamBuilder).initialData,
      'key': (visitor, target) => (target as StreamBuilder).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter AsyncSnapshot class.
BridgedClass getAsyncSnapshotBridgingDefinition() {
  return BridgedClass(
    nativeType: AsyncSnapshot,
    name: 'AsyncSnapshot',
    constructors: {
      'nothing': (visitor, positionalArgs, namedArgs) {
        return AsyncSnapshot<dynamic>.nothing();
      },
      'waiting': (visitor, positionalArgs, namedArgs) {
        return AsyncSnapshot<dynamic>.waiting();
      },
      'withData': (visitor, positionalArgs, namedArgs) {
        final state =
            namedArgs.get<ConnectionState>('connectionState') ??
            ConnectionState.done;
        final data = namedArgs.get<dynamic>('data');
        return AsyncSnapshot<dynamic>.withData(state, data);
      },
      'withError': (visitor, positionalArgs, namedArgs) {
        final state =
            namedArgs.get<ConnectionState>('connectionState') ??
            ConnectionState.done;
        final error = namedArgs.get<Object?>('error');
        final stackTrace = namedArgs.get<StackTrace?>('stackTrace');

        if (error == null) {
          throw ArgumentError('error is required for AsyncSnapshot.withError');
        }

        return AsyncSnapshot<dynamic>.withError(
          state,
          error,
          stackTrace ?? StackTrace.empty,
        );
      },
    },
    getters: {
      'connectionState': (visitor, target) =>
          (target as AsyncSnapshot).connectionState,
      'data': (visitor, target) => (target as AsyncSnapshot).data,
      'error': (visitor, target) => (target as AsyncSnapshot).error,
      'stackTrace': (visitor, target) => (target as AsyncSnapshot).stackTrace,
      'hasData': (visitor, target) => (target as AsyncSnapshot).hasData,
      'hasError': (visitor, target) => (target as AsyncSnapshot).hasError,
      'requireData': (visitor, target) => (target as AsyncSnapshot).requireData,
    },
    methods: {
      'toString': (visitor, target, positionalArgs, namedArgs) {
        return (target as AsyncSnapshot).toString();
      },
      'requireData': (visitor, target, positionalArgs, namedArgs) {
        return (target as AsyncSnapshot).requireData;
      },
    },
  );
}

/// Returns the BridgedEnumDefinition for the Flutter ConnectionState enum.
BridgedEnumDefinition<ConnectionState> getConnectionStateBridgingDefinition() {
  return BridgedEnumDefinition(
    name: 'ConnectionState',
    values: ConnectionState.values,
  );
}
