import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_d4rt/flutter_d4rt.dart';
import '../fixtures/cupertino_example_source.dart';

void main() {
  group('Cupertino Complex Example Execution Test', () {
    late FlutterRunInterpreter interpreter;

    setUp(() {
      interpreter = FlutterRunInterpreter();
      interpreter.initialize();
    });

    tearDown(() {
      interpreter.dispose();
    });

    test('should execute CupertinoRootApp without any runtime errors', () {
      final widget = interpreter.execute(
        cupertinoExampleCode,
        'CupertinoRootApp',
      );

      expect(widget, isA<Widget>());
      expect(interpreter.getErrorLogs(), isEmpty);
    });
  });
}
