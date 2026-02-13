import 'package:d4rt/d4rt.dart';
import 'package:flutter/services.dart';

/// Returns the BridgedClass for MethodChannel
BridgedClass getMethodChannelBridgingDefinition() {
  return BridgedClass(
    nativeType: MethodChannel,
    name: 'MethodChannel',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final name = positionalArgs.get<String>(0)!;
        final codec =
            positionalArgs.get<MethodCodec?>(1) ?? const StandardMethodCodec();
        final binaryMessenger = positionalArgs.get<BinaryMessenger?>(2);
        return MethodChannel(name, codec, binaryMessenger);
      },
    },
    getters: {
      'name': (visitor, target) => (target as MethodChannel).name,
      'codec': (visitor, target) => (target as MethodChannel).codec,
      'binaryMessenger': (visitor, target) =>
          (target as MethodChannel).binaryMessenger,
    },
    methods: {
      'invokeMethod': (visitor, target, positionalArgs, namedArgs) {
        final method = positionalArgs.get<String>(0)!;
        final arguments = positionalArgs.get<dynamic>(1);
        return (target as MethodChannel).invokeMethod(method, arguments);
      },
      'invokeListMethod': (visitor, target, positionalArgs, namedArgs) {
        final method = positionalArgs.get<String>(0)!;
        final arguments = positionalArgs.get<dynamic>(1);
        return (target as MethodChannel).invokeListMethod(method, arguments);
      },
      'invokeMapMethod': (visitor, target, positionalArgs, namedArgs) {
        final method = positionalArgs.get<String>(0)!;
        final arguments = positionalArgs.get<dynamic>(1);
        return (target as MethodChannel).invokeMapMethod(method, arguments);
      },
      'setMethodCallHandler': (visitor, target, positionalArgs, namedArgs) {
        final handler = positionalArgs
            .get<Future<dynamic> Function(MethodCall)?>(0);
        return (target as MethodChannel).setMethodCallHandler(handler);
      },
    },
  );
}

/// Returns the BridgedClass for EventChannel
BridgedClass getEventChannelBridgingDefinition() {
  return BridgedClass(
    nativeType: EventChannel,
    name: 'EventChannel',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final name = positionalArgs.get<String>(0)!;
        final codec =
            positionalArgs.get<MethodCodec?>(1) ?? const StandardMethodCodec();
        final binaryMessenger = positionalArgs.get<BinaryMessenger?>(2);
        return EventChannel(name, codec, binaryMessenger);
      },
    },
    getters: {
      'name': (visitor, target) => (target as EventChannel).name,
      'codec': (visitor, target) => (target as EventChannel).codec,
      'binaryMessenger': (visitor, target) =>
          (target as EventChannel).binaryMessenger,
    },
    methods: {
      'receiveBroadcastStream': (visitor, target, positionalArgs, namedArgs) {
        final arguments = positionalArgs.get<dynamic>(0);
        return (target as EventChannel).receiveBroadcastStream(arguments);
      },
    },
  );
}

/// Returns the BridgedClass for BasicMessageChannel
BridgedClass getBasicMessageChannelBridgingDefinition() {
  return BridgedClass(
    nativeType: BasicMessageChannel,
    name: 'BasicMessageChannel',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final name = positionalArgs.get<String>(0)!;
        final codec = positionalArgs.get<MessageCodec>(1)!;
        final binaryMessenger = namedArgs.get<BinaryMessenger?>(
          'binaryMessenger',
        );

        return BasicMessageChannel(
          name,
          codec,
          binaryMessenger: binaryMessenger,
        );
      },
    },
    getters: {
      'name': (visitor, target) => (target as BasicMessageChannel).name,
      'codec': (visitor, target) => (target as BasicMessageChannel).codec,
      'binaryMessenger': (visitor, target) =>
          (target as BasicMessageChannel).binaryMessenger,
    },
    methods: {
      'send': (visitor, target, positionalArgs, namedArgs) {
        final message = positionalArgs.get<dynamic>(0);
        return (target as BasicMessageChannel).send(message);
      },
      'setMessageHandler': (visitor, target, positionalArgs, namedArgs) {
        final handler = positionalArgs.get<Future<dynamic> Function(dynamic)?>(
          0,
        );
        return (target as BasicMessageChannel).setMessageHandler(handler);
      },
    },
  );
}

/// Returns the BridgedClass for MethodCall
BridgedClass getMethodCallBridgingDefinition() {
  return BridgedClass(
    nativeType: MethodCall,
    name: 'MethodCall',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final method = positionalArgs.get<String>(0)!;
        final arguments = positionalArgs.get<dynamic>(1);

        return MethodCall(method, arguments);
      },
    },
    getters: {
      'method': (visitor, target) => (target as MethodCall).method,
      'arguments': (visitor, target) => (target as MethodCall).arguments,
    },
  );
}

/// Returns the BridgedClass for StandardMethodCodec
BridgedClass getStandardMethodCodecBridgingDefinition() {
  return BridgedClass(
    nativeType: StandardMethodCodec,
    name: 'StandardMethodCodec',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return const StandardMethodCodec();
      },
    },
  );
}

/// Returns the BridgedClass for JSONMethodCodec
BridgedClass getJSONMethodCodecBridgingDefinition() {
  return BridgedClass(
    nativeType: JSONMethodCodec,
    name: 'JSONMethodCodec',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return const JSONMethodCodec();
      },
    },
  );
}

/// Returns the BridgedClass for StringCodec
BridgedClass getStringCodecBridgingDefinition() {
  return BridgedClass(
    nativeType: StringCodec,
    name: 'StringCodec',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return const StringCodec();
      },
    },
  );
}

/// Returns the BridgedClass for BinaryCodec
BridgedClass getBinaryCodecBridgingDefinition() {
  return BridgedClass(
    nativeType: BinaryCodec,
    name: 'BinaryCodec',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return const BinaryCodec();
      },
    },
  );
}

/// Returns the BridgedClass for JSONMessageCodec
BridgedClass getJSONMessageCodecBridgingDefinition() {
  return BridgedClass(
    nativeType: JSONMessageCodec,
    name: 'JSONMessageCodec',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return const JSONMessageCodec();
      },
    },
  );
}
