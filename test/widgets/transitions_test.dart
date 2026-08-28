import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_d4rt/flutter_d4rt.dart';

void main() {
  group('Transitions Suite Tests', () {
    late FlutterRunInterpreter interpreter;

    setUp(() {
      interpreter = FlutterRunInterpreter();
      interpreter.initialize();
    });

    tearDown(() {
      interpreter.dispose();
    });

    test('should build SlideTransition, SizeTransition, and FadeTransition', () {
      const code = '''
        import 'package:flutter/material.dart';

        Widget build() {
          final offsetAnimation = AlwaysStoppedAnimation<Offset>(Offset(0.0, 0.5));
          final doubleAnimation = AlwaysStoppedAnimation<double>(0.8);

          return MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  SlideTransition(
                    position: offsetAnimation,
                    child: Text('Sliding Text'),
                  ),
                  SizeTransition(
                    sizeFactor: doubleAnimation,
                    axis: Axis.horizontal,
                    child: Text('Sizing Text'),
                  ),
                  FadeTransition(
                    opacity: doubleAnimation,
                    child: Text('Fading Text'),
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

    test('should build ScaleTransition, RotationTransition, and AnimatedBuilder', () {
      const code = '''
        import 'package:flutter/material.dart';

        Widget build() {
          final doubleAnimation = AlwaysStoppedAnimation<double>(1.2);
          final notifier = ValueNotifier<int>(42);

          return MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  ScaleTransition(
                    scale: doubleAnimation,
                    alignment: Alignment.center,
                    child: Text('Scaling Text'),
                  ),
                  RotationTransition(
                    turns: doubleAnimation,
                    child: Text('Rotating Text'),
                  ),
                  AnimatedBuilder(
                    animation: notifier,
                    builder: (context, child) {
                      return Text('Value: \${notifier.value}');
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
