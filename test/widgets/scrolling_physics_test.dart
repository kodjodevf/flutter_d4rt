import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_d4rt/flutter_d4rt.dart';

void main() {
  group('Scroll Physics Suite Tests', () {
    late FlutterRunInterpreter interpreter;

    setUp(() {
      interpreter = FlutterRunInterpreter();
      interpreter.initialize();
    });

    tearDown(() {
      interpreter.dispose();
    });

    test('should apply different ScrollPhysics to ListView and GridView', () {
      const code = '''
        import 'package:flutter/material.dart';

        Widget build() {
          return MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  Expanded(
                    child: ListView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Text('Non-scrollable item 1'),
                        Text('Non-scrollable item 2'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics(),
                      ),
                      children: [
                        Text('Bouncing item 1'),
                        Text('Bouncing item 2'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      physics: ClampingScrollPhysics(),
                      children: [
                        Text('Clamping 1'),
                        Text('Clamping 2'),
                      ],
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
