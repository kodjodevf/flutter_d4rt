import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_d4rt/flutter_d4rt.dart';

void main() {
  group('Foundation and Keys Suite Tests', () {
    late FlutterRunInterpreter interpreter;

    setUp(() {
      interpreter = FlutterRunInterpreter();
      interpreter.initialize();
    });

    tearDown(() {
      interpreter.dispose();
    });

    test('should construct various Keys (ValueKey, UniqueKey, ObjectKey, Key)', () {
      const code = '''
        import 'package:flutter/material.dart';

        Widget build() {
          final key1 = Key('my_key');
          final key2 = ValueKey('my_value_key');
          final key3 = ValueKey<int>(123);
          final key4 = UniqueKey();
          final key5 = ObjectKey('object_key');

          return MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  Container(key: key1, child: Text('K1')),
                  Container(key: key2, child: Text('K2')),
                  Container(key: key3, child: Text('K3')),
                  Container(key: key4, child: Text('K4')),
                  Container(key: key5, child: Text('K5')),
                ],
              ),
            ),
          );
        }
      ''';

      final widget = interpreter.execute(code, 'build');
      expect(widget, isA<Widget>());
      expect(interpreter.getErrorLogs(), isEmpty);
    });

    test('should construct and use ValueListenableBuilder and ListenableBuilder', () {
      const code = '''
        import 'package:flutter/material.dart';

        Widget build() {
          final countNotifier = ValueNotifier<int>(10);
          final changeNotifier = ChangeNotifier();

          return MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  ValueListenableBuilder<int>(
                    valueListenable: countNotifier,
                    builder: (context, value, child) {
                      return Text('Count: \$value');
                    },
                  ),
                  ListenableBuilder(
                    listenable: changeNotifier,
                    builder: (context, child) {
                      return Text('Listenable updated');
                    },
                  ),
                ],
              ),
            ),
          );
        }
      ''';

      final widget = interpreter.execute(code, 'build');
      expect(widget, isA<Widget>());
      expect(interpreter.getErrorLogs(), isEmpty);
    });
  });
}
