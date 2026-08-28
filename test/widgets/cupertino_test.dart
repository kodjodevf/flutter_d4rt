import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_d4rt/flutter_d4rt.dart';

void main() {
  group('Cupertino Widgets Tests', () {
    late FlutterRunInterpreter interpreter;

    setUp(() {
      interpreter = FlutterRunInterpreter();
      interpreter.initialize();
    });

    tearDown(() {
      interpreter.dispose();
    });

    test('should construct CupertinoApp and CupertinoPageScaffold', () {
      const code = '''
        import 'package:flutter/cupertino.dart';

        Widget build() {
          return CupertinoApp(
            home: CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text('Cupertino Demo'),
              ),
              child: Center(
                child: Text('Hello Cupertino'),
              ),
            ),
          );
        }
      ''';

      final widget = interpreter.execute(code, 'build');
      expect(widget, isA<Widget>());
      expect(interpreter.getErrorLogs(), isEmpty);
    });

    test('should construct CupertinoButton, CupertinoActivityIndicator, and CupertinoIcons', () {
      const code = '''
        import 'package:flutter/cupertino.dart';

        Widget build() {
          return CupertinoApp(
            home: CupertinoPageScaffold(
              child: Column(
                children: [
                  CupertinoButton(
                    onPressed: () {},
                    child: Text('Normal Button'),
                  ),
                  CupertinoButton.filled(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(CupertinoIcons.heart),
                        Text('Filled Button'),
                      ],
                    ),
                  ),
                  CupertinoActivityIndicator(
                    radius: 15.0,
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

    test('should construct CupertinoSwitch, CupertinoSlider, and CupertinoTextField', () {
      const code = '''
        import 'package:flutter/cupertino.dart';

        Widget build() {
          return CupertinoApp(
            home: CupertinoPageScaffold(
              child: Column(
                children: [
                  CupertinoSwitch(
                    value: true,
                    onChanged: (val) {},
                  ),
                  CupertinoSlider(
                    value: 0.5,
                    min: 0.0,
                    max: 1.0,
                    onChanged: (val) {},
                  ),
                  CupertinoTextField(
                    placeholder: 'Enter text...',
                    clearButtonMode: OverlayVisibilityMode.editing,
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

    test('should construct CupertinoTabScaffold and CupertinoTabBar', () {
      const code = '''
        import 'package:flutter/cupertino.dart';

        Widget build() {
          return CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              items: [
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.settings),
                  label: 'Settings',
                ),
              ],
            ),
            tabBuilder: (context, index) {
              return CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(
                    child: Center(
                      child: Text('Tab \$index'),
                    ),
                  );
                },
              );
            },
          );
        }
      ''';

      final widget = interpreter.execute(code, 'build');
      expect(widget, isA<Widget>());
      expect(interpreter.getErrorLogs(), isEmpty);
    });
  });
}
