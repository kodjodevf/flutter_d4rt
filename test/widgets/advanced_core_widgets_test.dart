import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_d4rt/flutter_d4rt.dart';

void main() {
  late FlutterRunInterpreter interpreter;

  setUp(() {
    interpreter = FlutterRunInterpreter();
    interpreter.initialize();
  });

  tearDown(() {
    interpreter.dispose();
  });

  group('Advanced Core Flutter Widgets Tests', () {
    test('should build InteractiveViewer and MouseRegion', () {
      const code = '''
        import 'package:flutter/widgets.dart';

        Widget build() {
          return MouseRegion(
            cursor: SystemMouseCursors.click,
            child: InteractiveViewer(
              panAxis: PanAxis.free,
              minScale: 0.5,
              maxScale: 3.0,
              child: Container(
                width: 200,
                height: 200,
              ),
            ),
          );
        }
      ''';

      final widget = interpreter.execute(code, 'build');
      expect(widget, isA<MouseRegion>());
    });

    test('should build LongPressDraggable', () {
      const code = '''
        import 'package:flutter/widgets.dart';

        Widget build() {
          return LongPressDraggable<String>(
            data: 'drag_data',
            feedback: Text('Dragging...'),
            child: Text('Hold to Drag'),
          );
        }
      ''';

      final widget = interpreter.execute(code, 'build');
      expect(widget, isA<LongPressDraggable>());
    });

    test('should build ReorderableListView with children and onReorder', () {
      const code = '''
        import 'package:flutter/material.dart';

        Widget build() {
          return ReorderableListView(
            onReorder: (oldIndex, newIndex) {},
            children: [
              Text('Item 1', key: ValueKey('1')),
              Text('Item 2', key: ValueKey('2')),
            ],
          );
        }
      ''';

      final widget = interpreter.execute(code, 'build');
      expect(widget, isA<ReorderableListView>());
    });

    test('should build ReorderableListView.builder', () {
      const code = '''
        import 'package:flutter/material.dart';

        Widget build() {
          return ReorderableListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Text('Item \$index', key: ValueKey(index));
            },
            onReorder: (oldIndex, newIndex) {},
          );
        }
      ''';

      final widget = interpreter.execute(code, 'build');
      expect(widget, isA<ReorderableListView>());
    });

    test('should build ValueListenableBuilder and ListenableBuilder', () {
      const code = '''
        import 'package:flutter/widgets.dart';
        import 'package:flutter/foundation.dart';

        Widget build() {
          final notifier = ValueNotifier<int>(0);
          return ListenableBuilder(
            listenable: notifier,
            builder: (context, child) {
              return ValueListenableBuilder<int>(
                valueListenable: notifier,
                builder: (context, value, child) {
                  return Text('Value: \$value');
                },
              );
            },
          );
        }
      ''';

      final widget = interpreter.execute(code, 'build');
      expect(widget, isA<ListenableBuilder>());
    });

    test('should build TweenAnimationBuilder', () {
      const code = '''
        import 'package:flutter/widgets.dart';

        Widget build() {
          return TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0.0, end: 1.0),
            duration: Duration(milliseconds: 500),
            builder: (context, val, child) {
              return Opacity(
                opacity: val,
                child: Text('Animated Text'),
              );
            },
          );
        }
      ''';

      final widget = interpreter.execute(code, 'build');
      expect(widget, isA<TweenAnimationBuilder<dynamic>>());
    });
  });
}
