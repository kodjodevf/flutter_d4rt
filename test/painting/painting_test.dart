import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_d4rt/flutter_d4rt.dart';

void main() {
  group('Painting and Decoration Suite Tests', () {
    late FlutterRunInterpreter interpreter;

    setUp(() {
      interpreter = FlutterRunInterpreter();
      interpreter.initialize();
    });

    tearDown(() {
      interpreter.dispose();
    });

    test('should build Container with complex BoxDecoration including gradients and shadows', () {
      const code = '''
        import 'package:flutter/material.dart';

        Widget build() {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    border: Border.all(
                      color: Colors.indigo,
                      width: 3.0,
                      style: BorderStyle.solid,
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.purple, Colors.orange],
                      stops: [0.2, 0.8],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(4.0, 4.0),
                        blurRadius: 8.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                  ),
                  child: Center(child: Text('Styled Container')),
                ),
              ),
            ),
          );
        }
      ''';

      final widget = interpreter.execute(code, 'build');
      expect(widget, isA<Widget>());
      expect(interpreter.getErrorLogs(), isEmpty);
    });

    test('should construct RadialGradient and SweepGradient', () {
      const code = '''
        import 'package:flutter/material.dart';

        Widget build() {
          return MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        colors: [Colors.yellow, Colors.red],
                        radius: 0.8,
                        center: Alignment.center,
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      gradient: SweepGradient(
                        colors: [Colors.blue, Colors.green, Colors.blue],
                        startAngle: 0.0,
                        endAngle: 3.14 * 2,
                      ),
                    ),
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
