import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_d4rt/flutter_d4rt.dart';

void main() {
  group('Slivers Suite Tests', () {
    late FlutterRunInterpreter interpreter;

    setUp(() {
      interpreter = FlutterRunInterpreter();
      interpreter.initialize();
    });

    tearDown(() {
      interpreter.dispose();
    });

    test('should build CustomScrollView with SliverAppBar and SliverToBoxAdapter', () {
      const code = '''
        import 'package:flutter/material.dart';

        Widget build() {
          return MaterialApp(
            home: Scaffold(
              body: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    title: Text('Sliver App Bar'),
                    floating: true,
                    pinned: true,
                    expandedHeight: 200.0,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text('Flexible Space'),
                      centerTitle: true,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 100,
                      color: Colors.amber,
                      child: Center(child: Text('Box Adapter Content')),
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

    test('should build SliverList and SliverGrid with delegates', () {
      const code = '''
        import 'package:flutter/material.dart';

        Widget build() {
          return MaterialApp(
            home: Scaffold(
              body: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Text('Item 1'),
                      Text('Item 2'),
                      Text('Item 3'),
                    ]),
                  ),
                  SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 1.0,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Container(
                          color: Colors.teal[100 * (index % 9)],
                          child: Text('Grid Item \$index'),
                        );
                      },
                      childCount: 4,
                    ),
                  ),
                  SliverFixedExtentList(
                    itemExtent: 50.0,
                    delegate: SliverChildListDelegate([
                      Text('Fixed Item 1'),
                      Text('Fixed Item 2'),
                    ]),
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

    test('should build SliverPadding and SliverFillRemaining', () {
      const code = '''
        import 'package:flutter/material.dart';

        Widget build() {
          return MaterialApp(
            home: Scaffold(
              body: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.all(16.0),
                    sliver: SliverToBoxAdapter(
                      child: Text('Padded Content'),
                    ),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Text('Remaining Space'),
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
