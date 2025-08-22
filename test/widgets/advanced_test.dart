import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_d4rt/flutter_d4rt.dart';

void main() {
  group('Advanced Widgets Tests', () {
    late FlutterRunInterpreter interpreter;

    setUp(() {
      interpreter = FlutterRunInterpreter();
      interpreter.initialize();
    });

    tearDown(() {
      interpreter.dispose();
    });

    group('Gesture Widgets', () {
      test('should create GestureDetector with all gestures', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return GestureDetector(
              onTap: () {},
              onDoubleTap: () {},
              onLongPress: () {},
              onPanStart: (details) {},
              onPanUpdate: (details) {},
              onPanEnd: (details) {},
              onScaleStart: (details) {},
              onScaleUpdate: (details) {},
              onScaleEnd: (details) {},
              child: Container(
                width: 200,
                height: 200,
                color: Colors.blue,
                child: Center(child: Text('All Gestures')),
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create InkWell with custom splash', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return InkWell(
              onTap: () {},
              splashColor: Colors.red,
              highlightColor: Colors.blue.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: EdgeInsets.all(16),
                child: Text('Custom Splash'),
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create Draggable widget', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Draggable<String>(
              data: 'draggable_data',
              child: Container(
                width: 100,
                height: 100,
                color: Colors.green,
                child: Center(child: Text('Drag Me')),
              ),
              feedback: Container(
                width: 100,
                height: 100,
                color: Colors.green.withOpacity(0.7),
                child: Center(child: Text('Dragging')),
              ),
              childWhenDragging: Container(
                width: 100,
                height: 100,
                color: Colors.grey,
                child: Center(child: Text('Dragged')),
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create DragTarget widget', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return DragTarget<String?>(
              onAccept: (data) {},
              onWillAccept: (data) => true,
              builder: (context, candidateData, rejectedData) {
                return Container(
                  width: 150,
                  height: 150,
                  color: candidateData.isNotEmpty ? Colors.red : Colors.blue,
                  child: Center(child: Text('Drop Here')),
                );
              },
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create Dismissible widget', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Dismissible(
              key: Key('dismissible_item'),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {},
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 20),
                child: Icon(Icons.delete, color: Colors.white),
              ),
              child: ListTile(
                title: Text('Swipe to dismiss'),
                leading: Icon(Icons.email),
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('Layout Widgets', () {
      test('should create Wrap widget', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              alignment: WrapAlignment.center,
              children: [
                Chip(label: Text('Tag 1')),
                Chip(label: Text('Tag 2')),
                Chip(label: Text('Tag 3')),
                Chip(label: Text('Tag 4')),
                Chip(label: Text('Tag 5')),
              ],
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create Table widget', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Table(
              border: TableBorder.all(),
              columnWidths: {
                0: FixedColumnWidth(50),
                1: FlexColumnWidth(),
                2: FixedColumnWidth(100),
              },
              children: [
                TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text('ID'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text('Name'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text('Score'),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text('1'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text('John'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text('95'),
                    ),
                  ],
                ),
              ],
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create Flow widget', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Flow(
              delegate: TestFlowDelegate(),
              children: [
                Container(width: 50, height: 50, color: Colors.red),
                Container(width: 50, height: 50, color: Colors.blue),
                Container(width: 50, height: 50, color: Colors.green),
              ],
            );
          }
          
          class TestFlowDelegate extends FlowDelegate {
            @override
            void paintChildren(FlowPaintingContext context) {
              for (int i = 0; i < context.childCount; i++) {
                context.paintChild(i, transform: Matrix4.translationValues(i * 60.0, 0, 0));
              }
            }
            
            @override
            bool shouldRepaint(FlowDelegate oldDelegate) => false;
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('Scrolling Widgets', () {
      test('should create NotificationListener', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification is ScrollStartNotification) {
                  // Handle scroll start
                } else if (notification is ScrollUpdateNotification) {
                  // Handle scroll update
                } else if (notification is ScrollEndNotification) {
                  // Handle scroll end
                }
                return true;
              },
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Monitored Item \${index + 1}'),
                  );
                },
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create ReorderableListView', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            List<String> items = ['Item 1', 'Item 2', 'Item 3'];
            
            return ReorderableListView(
              onReorder: (oldIndex, newIndex) {
                if (newIndex > oldIndex) {
                  newIndex -= 1;
                }
                final item = items.removeAt(oldIndex);
                items.insert(newIndex, item);
              },
              children: items.map((item) {
                return ListTile(
                  key: ValueKey(item),
                  title: Text(item),
                  trailing: Icon(Icons.drag_handle),
                );
              }).toList(),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('Interactive Widgets', () {
      test('should create Tooltip widget', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Tooltip(
              message: 'This is a helpful tooltip',
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(4),
              ),
              textStyle: TextStyle(color: Colors.white),
              child: IconButton(
                icon: Icon(Icons.help),
                onPressed: () {},
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create PopupMenuButton', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return PopupMenuButton<String>(
              onSelected: (value) {},
              itemBuilder: (context) => [
                PopupMenuItem<String>(
                  value: 'option1',
                  child: Text('Option 1'),
                ),
                PopupMenuItem<String>(
                  value: 'option2',
                  child: Text('Option 2'),
                ),
                PopupMenuDivider(),
                PopupMenuItem<String>(
                  value: 'option3',
                  child: Text('Option 3'),
                ),
              ],
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create ExpansionTile', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return ExpansionTile(
              title: Text('Expandable Section'),
              subtitle: Text('Tap to expand'),
              leading: Icon(Icons.expand_more),
              children: [
                ListTile(
                  title: Text('Sub Item 1'),
                  leading: Icon(Icons.star),
                ),
                ListTile(
                  title: Text('Sub Item 2'),
                  leading: Icon(Icons.star),
                ),
              ],
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create Banner widget', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Banner(
              message: 'DEBUG',
              location: BannerLocation.topStart,
              color: Colors.red,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.blue,
                child: Center(child: Text('Content with Banner')),
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('Custom Paint and Effect Widgets', () {
      test('should create ClipRRect widget', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.purple,
                child: Center(child: Text('Clipped')),
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create ClipOval widget', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return ClipOval(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.orange,
                child: Center(child: Text('Oval')),
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create ClipPath widget', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return ClipPath(
              clipper: TriangleClipper(),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
            );
          }
          
          class TriangleClipper extends CustomClipper<Path> {
            @override
            Path getClip(Size size) {
              final path = Path();
              path.moveTo(size.width / 2, 0);
              path.lineTo(size.width, size.height);
              path.lineTo(0, size.height);
              path.close();
              return path;
            }
            
            @override
            bool shouldReclip(CustomClipper<Path> oldClipper) => false;
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create Opacity widget', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Opacity(
              opacity: 0.6,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
                child: Center(child: Text('Semi-transparent')),
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create BackdropFilter widget', () {
        const code = '''
          import 'dart:ui';
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Stack(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.purple],
                    ),
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.white.withOpacity(0.1),
                    child: Center(child: Text('Blurred Background')),
                  ),
                ),
              ],
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('Size and Constraint Widgets', () {
      test('should create SizedBox widget', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return SizedBox(
              width: 100,
              height: 100,
              child: Container(
                color: Colors.amber,
                child: Center(child: Text('Sized')),
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create ConstrainedBox widget', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 100,
                maxWidth: 200,
                minHeight: 50,
                maxHeight: 100,
              ),
              child: Container(
                color: Colors.teal,
                child: Text('Constrained Content'),
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create AspectRatio widget', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                color: Colors.indigo,
                child: Center(child: Text('16:9 Aspect')),
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create FractionallySizedBox widget', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return FractionallySizedBox(
              widthFactor: 0.8,
              heightFactor: 0.6,
              child: Container(
                color: Colors.pink,
                child: Center(child: Text('80% x 60%')),
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });
  });
}
