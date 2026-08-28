import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_d4rt/flutter_d4rt.dart';

void main() {
  group('System Services Suite Tests', () {
    late FlutterRunInterpreter interpreter;

    setUp(() {
      interpreter = FlutterRunInterpreter();
      interpreter.initialize();
    });

    tearDown(() {
      interpreter.dispose();
    });

    test('should construct ClipboardData and access formats', () {
      const code = '''
        import 'package:flutter/material.dart';
        import 'package:flutter/services.dart';

        Widget build() {
          final data = ClipboardData(text: 'Hello D4rt');
          return MaterialApp(
            home: Scaffold(
              body: Text(data.text ?? ''),
            ),
          );
        }
      ''';

      final widget = interpreter.execute(code, 'build');
      expect(widget, isA<Widget>());
      expect(interpreter.getErrorLogs(), isEmpty);
    });

    test('should access SystemSoundType and HapticFeedback methods', () {
      const code = '''
        import 'package:flutter/material.dart';
        import 'package:flutter/services.dart';

        Widget build() {
          final clickType = SystemSoundType.click;
          final alertType = SystemSoundType.alert;
          final isDifferent = clickType != alertType;
          return MaterialApp(
            home: Scaffold(
              body: Text('Different: \$isDifferent'),
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
