import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_d4rt/flutter_d4rt.dart';

void main() {
  group('Custom Clipper and Clipping Tests', () {
    late FlutterRunInterpreter interpreter;

    setUp(() {
      interpreter = FlutterRunInterpreter();
      interpreter.initialize();
    });

    tearDown(() {
      interpreter.dispose();
    });

    test('should build ClipPath with custom CustomClipper<Path>', () {
      const code = '''
        import 'package:flutter/material.dart';

        class TriangleClipper extends CustomClipper<Path> {
          @override
          Path getClip(Size size) {
            final path = Path();
            path.moveTo(size.width / 2, 0.0);
            path.lineTo(size.width, size.height);
            path.lineTo(0.0, size.height);
            path.close();
            return path;
          }

          @override
          bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
        }

        Widget build() {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: ClipPath(
                  clipper: TriangleClipper(),
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.amber,
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

    test('should build ClipRRect, ClipOval, and ClipRect', () {
      const code = '''
        import 'package:flutter/material.dart';

        Widget build() {
          return MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                    ),
                  ),
                  ClipOval(
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.green,
                    ),
                  ),
                  ClipRect(
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.purple,
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
