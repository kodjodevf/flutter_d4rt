import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_d4rt/flutter_d4rt.dart';

void main() {
  group('Notifications and Feedback Tests', () {
    late FlutterRunInterpreter interpreter;

    setUp(() {
      interpreter = FlutterRunInterpreter();
      interpreter.initialize();
    });

    tearDown(() {
      interpreter.dispose();
    });

    test('should build NotificationListener with ScrollNotification', () {
      const code = '''
        import 'package:flutter/material.dart';

        Widget build() {
          return MaterialApp(
            home: Scaffold(
              body: NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if (notification is ScrollStartNotification) {
                    return true;
                  } else if (notification is ScrollUpdateNotification) {
                    return true;
                  } else if (notification is ScrollEndNotification) {
                    return true;
                  }
                  return false;
                },
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Item \$index'),
                    );
                  },
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

    test('should build Tooltip and interactive feedback elements', () {
      const code = '''
        import 'package:flutter/material.dart';

        Widget build() {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Tooltip(
                  message: 'This is a helpful tooltip',
                  waitDuration: Duration(seconds: 1),
                  showDuration: Duration(seconds: 2),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Hover me'),
                  ),
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
  });
}
