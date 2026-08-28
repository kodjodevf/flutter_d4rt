import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_d4rt/flutter_d4rt.dart';

void main() {
  group('TextInput and Formatters Tests', () {
    late FlutterRunInterpreter interpreter;

    setUp(() {
      interpreter = FlutterRunInterpreter();
      interpreter.initialize();
    });

    tearDown(() {
      interpreter.dispose();
    });

    test('should construct and use TextInputType and TextInputAction in TextField', () {
      const code = '''
        import 'package:flutter/material.dart';
        import 'package:flutter/services.dart';

        Widget build() {
          final keyboard = TextInputType.numberWithOptions(signed: true, decimal: true);
          final action = TextInputAction.search;
          final cap = TextCapitalization.words;
          return MaterialApp(
            home: Scaffold(
              body: TextField(
                keyboardType: keyboard,
                textInputAction: action,
                textCapitalization: cap,
              ),
            ),
          );
        }
      ''';
      final widget = interpreter.execute(code, 'build');
      expect(widget, isA<Widget>());
      expect(interpreter.getErrorLogs(), isEmpty);
    });

    test('should construct TextEditingValue, TextSelection and formatters in TextField', () {
      const code = '''
        import 'package:flutter/material.dart';
        import 'package:flutter/services.dart';

        Widget build() {
          final selection = TextSelection.collapsed(offset: 4);
          final value = TextEditingValue(text: 'Flutter', selection: selection);
          final digits = FilteringTextInputFormatter.digitsOnly;
          final lengthLimit = LengthLimitingTextInputFormatter(5);
          
          return MaterialApp(
            home: Scaffold(
              body: TextField(
                inputFormatters: [digits, lengthLimit],
              ),
            ),
          );
        }
      ''';
      final widget = interpreter.execute(code, 'build');
      expect(widget, isA<Widget>());
      expect(interpreter.getErrorLogs(), isEmpty);
    });

    test('should construct WidgetStateProperty and resolve in ElevatedButton', () {
      const code = '''
        import 'package:flutter/material.dart';

        Widget build() {
          final propAll = WidgetStateProperty.all(Colors.blue);
          final propResolver = WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) {
              return Colors.red;
            }
            return Colors.green;
          });
          
          return ElevatedButton(
            style: ButtonStyle(
              backgroundColor: propResolver,
              foregroundColor: propAll,
            ),
            onPressed: () {},
            child: Text('Button'),
          );
        }
      ''';
      final widget = interpreter.execute(code, 'build');
      expect(widget, isA<Widget>());
      expect(interpreter.getErrorLogs(), isEmpty);
    });

    test('should use ThemeData constructors and helpers in MaterialApp', () {
      const code = '''
        import 'package:flutter/material.dart';

        Widget build() {
          final lightTheme = ThemeData.light(useMaterial3: true);
          final darkTheme = ThemeData.dark(useMaterial3: true);
          final scheme = ColorScheme.fromSeed(seedColor: Colors.purple);
          final themeFromScheme = ThemeData.from(colorScheme: scheme, useMaterial3: true);
          final brightness = ThemeData.estimateBrightnessForColor(Colors.white);
          
          return MaterialApp(
            theme: lightTheme,
            darkTheme: darkTheme,
            home: Scaffold(
              body: Text('Themed App'),
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
