import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_d4rt/flutter_d4rt.dart';

void main() {
  group('New Material Bridges Tests', () {
    late FlutterRunInterpreter interpreter;

    setUp(() {
      interpreter = FlutterRunInterpreter();
      interpreter.initialize();
    });

    tearDown(() {
      interpreter.dispose();
    });

    group('Tooltip Widget', () {
      test('should create Tooltip with message and child', () {
        const code = '''
          import 'package:flutter/material.dart';

          Widget build() {
            return Tooltip(
              message: 'This is a tooltip',
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Click me'),
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Tooltip>());
      });
    });

    group('RefreshIndicator Widget', () {
      test('should create RefreshIndicator with onRefresh callback', () {
        const code = '''
          import 'package:flutter/material.dart';

          Widget build() {
            return RefreshIndicator(
              onRefresh: () async {},
              child: ListView(
                children: [
                  ListTile(title: Text('Item 1')),
                  ListTile(title: Text('Item 2')),
                ],
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<RefreshIndicator>());
      });
    });

    group('DataRow Widget', () {
      test('should create DataRow with DataCell', () {
        const code = '''
          import 'package:flutter/material.dart';

          DataRow build() {
            return DataRow(cells: [
              DataCell(child: Text('John')),
            ]);
          }
        ''';

        final dataRow = interpreter.execute(code, 'build');
        expect(dataRow, isA<MaterialApp>());
      });
    });

    group('DataTable Widget', () {
      test('should create DataTable with DataCell', () {
        const code = '''
          import 'package:flutter/material.dart';

          Widget build() {
            return DataTable(
              columns: [
                DataColumn(label: Text('Name')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(child: Text('John')),
                ]),
              ],
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<MaterialApp>());
      });
    });

    group('Stepper Widget', () {
      test('should create Stepper with steps', () {
        const code = '''
          import 'package:flutter/material.dart';

          Widget build() {
            return Stepper(
              steps: [
                Step(
                  title: Text('Step 1'),
                  content: Text('Content 1'),
                ),
                Step(
                  title: Text('Step 2'),
                  content: Text('Content 2'),
                ),
              ],
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<MaterialApp>());
      });
    });

    group('Card Widget', () {
      test('should create Card with child', () {
        const code = '''
          import 'package:flutter/material.dart';

          Widget build() {
            return Card(
              child: Text('Card content'),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Card>());
      });

      test('should create Card with custom properties', () {
        const code = '''
          import 'package:flutter/material.dart';

          Widget build() {
            return Card(
              elevation: 8.0,
              margin: EdgeInsets.all(16.0),
              color: Colors.blue,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Custom Card'),
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Card>());
      });
    });

    group('Divider Widget', () {
      test('should create Divider', () {
        const code = '''
          import 'package:flutter/material.dart';

          Widget build() {
            return Divider();
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Divider>());
      });

      test('should create Divider with custom properties', () {
        const code = '''
          import 'package:flutter/material.dart';

          Widget build() {
            return Divider(
              height: 20.0,
              thickness: 2.0,
              indent: 16.0,
              endIndent: 16.0,
              color: Colors.red,
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Divider>());
      });
    });

    group('Chip Widget', () {
      test('should create Chip with label', () {
        const code = '''
          import 'package:flutter/material.dart';

          Widget build() {
            return Chip(
              label: Text('Chip Label'),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Chip>());
      });

      test('should create Chip with avatar and delete icon', () {
        const code = '''
          import 'package:flutter/material.dart';

          Widget build() {
            return Chip(
              avatar: CircleAvatar(child: Text('A')),
              label: Text('Chip with Avatar'),
              deleteIcon: Icon(Icons.close),
              onDeleted: () {},
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Chip>());
      });
    });

    group('FloatingActionButton Widget', () {
      test('should create FloatingActionButton', () {
        const code = '''
          import 'package:flutter/material.dart';

          Widget build() {
            return FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<FloatingActionButton>());
      });
    });

    group('IconButton Widget', () {
      test('should create IconButton', () {
        const code = '''
          import 'package:flutter/material.dart';

          Widget build() {
            return IconButton(
              onPressed: () {},
              icon: Icon(Icons.star),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<IconButton>());
      });
    });

    group('ListTile Widget', () {
      test('should create ListTile with title', () {
        const code = '''
          import 'package:flutter/material.dart';

          Widget build() {
            return ListTile(
              title: Text('List Item'),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<ListTile>());
      });

      test('should create ListTile with leading and trailing', () {
        const code = '''
          import 'package:flutter/material.dart';

          Widget build() {
            return ListTile(
              leading: Icon(Icons.person),
              title: Text('Person'),
              subtitle: Text('Subtitle'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {},
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<ListTile>());
      });
    });

    group('TextButton Widget', () {
      test('should create TextButton with text and onPressed', () {
        const code = '''
          import 'package:flutter/material.dart';

          Widget build() {
            return TextButton(
              onPressed: () {},
              child: Text('Click me'),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<TextButton>());
      });
    });

    group('TextField Widget', () {
      test('should create TextField with hint text', () {
        const code = '''
          import 'package:flutter/material.dart';

          Widget build() {
            return TextField(
              decoration: InputDecoration(
                hintText: 'Enter text',
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<TextField>());
      });
    });

    group('CircularProgressIndicator Widget', () {
      test('should create CircularProgressIndicator', () {
        const code = '''
          import 'package:flutter/material.dart';

          Widget build() {
            return CircularProgressIndicator();
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<CircularProgressIndicator>());
      });
    });

    group('Radio Widget', () {
      test('should create Radio with value and groupValue', () {
        const code = '''
          import 'package:flutter/material.dart';

          Widget build() {
            return Radio<int>(
              value: 1,
              groupValue: 1,
              onChanged: (value) {},
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Radio<dynamic>>());
      });
    });

    group('Scaffold Widget', () {
      test('should create Scaffold with appBar and body', () {
        const code = '''
          import 'package:flutter/material.dart';

          Widget build() {
            return Scaffold(
              appBar: AppBar(
                title: Text('Test App'),
              ),
              body: Center(
                child: Text('Hello World'),
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Scaffold>());
      });
    });

    group('Slider Widget', () {
      test('should create Slider with value and onChanged', () {
        const code = '''
          import 'package:flutter/material.dart';

          Widget build() {
            return Slider(
              value: 0.5,
              onChanged: (value) {},
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Slider>());
      });
    });

    group('SnackBar Widget', () {
      test('should create SnackBar with content', () {
        const code = '''
          import 'package:flutter/material.dart';

          Widget build() {
            return SnackBar(
              content: Text('This is a snackbar'),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<SnackBar>());
      });
    });

    group('Switch Widget', () {
      test('should create Switch with value and onChanged', () {
        const code = '''
          import 'package:flutter/material.dart';

          Widget build() {
            return Switch(
              value: true,
              onChanged: (value) {},
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Switch>());
      });
    });

    group('TabBar Widget', () {
      test('should create TabBar with tabs', () {
        const code = '''
          import 'package:flutter/material.dart';

          Widget build() {
            return TabBar(
              tabs: [
                Tab(text: 'Tab 1'),
                Tab(text: 'Tab 2'),
              ],
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<TabBar>());
      });
    });

    group('Tab Widget', () {
      test('should create Tab with text', () {
        const code = '''
          import 'package:flutter/material.dart';

          Widget build() {
            return Tab(
              text: 'Tab Title',
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Tab>());
      });
    });
  });
}
