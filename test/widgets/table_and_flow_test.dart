import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_d4rt/flutter_d4rt.dart';

void main() {
  group('Table and Flow Suite Tests', () {
    late FlutterRunInterpreter interpreter;

    setUp(() {
      interpreter = FlutterRunInterpreter();
      interpreter.initialize();
    });

    tearDown(() {
      interpreter.dispose();
    });

    test('should build Table with TableRow and TableBorder and column widths', () {
      const code = '''
        import 'package:flutter/material.dart';

        Widget build() {
          return MaterialApp(
            home: Scaffold(
              body: Table(
                border: TableBorder.all(
                  color: Colors.blue,
                  width: 2.0,
                  style: BorderStyle.solid,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                columnWidths: {
                  0: FixedColumnWidth(100.0),
                  1: FlexColumnWidth(2.0),
                  2: IntrinsicColumnWidth(),
                },
                children: [
                  TableRow(
                    decoration: BoxDecoration(color: Colors.grey[200]),
                    children: [
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.top,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Header 1'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Header 2'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Header 3'),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Row 1 Cell 1'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Row 1 Cell 2'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Row 1 Cell 3'),
                      ),
                    ],
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

    test('should build Flow with Custom FlowDelegate', () {
      const code = '''
        import 'package:flutter/material.dart';

        class MyFlowDelegate extends FlowDelegate {
          @override
          void paintChildren(FlowPaintingContext context) {
            for (int i = 0; i < context.childCount; i++) {
              final x = i * 60.0;
              context.paintChild(i, transform: Matrix4.translationValues(x, 0.0, 0.0));
            }
          }

          @override
          bool shouldRepaint(covariant FlowDelegate oldDelegate) => false;
        }

        Widget build() {
          return MaterialApp(
            home: Scaffold(
              body: Flow(
                delegate: MyFlowDelegate(),
                children: [
                  Container(width: 50, height: 50, color: Colors.red),
                  Container(width: 50, height: 50, color: Colors.green),
                  Container(width: 50, height: 50, color: Colors.blue),
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
