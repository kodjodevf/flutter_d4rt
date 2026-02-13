import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_d4rt/flutter_d4rt.dart';

void main() {
  group('Material Widgets Tests', () {
    late FlutterRunInterpreter interpreter;

    setUp(() {
      interpreter = FlutterRunInterpreter();
      interpreter.initialize();
    });

    tearDown(() {
      interpreter.dispose();
    });

    group('MaterialApp Widget', () {
      test('should create MaterialApp with title', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return MaterialApp(
              title: 'Test App',
              home: Scaffold(
                body: Text('Hello World'),
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create MaterialApp with theme', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return MaterialApp(
              title: 'Themed App',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: Scaffold(
                body: Text('Themed App'),
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('Scaffold Widget', () {
      test('should create Scaffold with basic properties', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Scaffold(
              appBar: AppBar(title: Text('Test')),
              body: Text('Body Content'),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create Scaffold with drawer and bottom navigation', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Scaffold(
              appBar: AppBar(title: Text('Full Scaffold')),
              body: Center(child: Text('Center Content')),
              drawer: Drawer(
                child: ListView(
                  children: [
                    DrawerHeader(child: Text('Header')),
                    ListTile(title: Text('Item 1')),
                  ],
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Settings',
                  ),
                ],
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create Scaffold with floating action button', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Scaffold(
              body: Text('Content'),
              floatingActionButton: FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.add),
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('AppBar Widget', () {
      test('should create AppBar with title', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return AppBar(
              title: Text('AppBar Title'),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create AppBar with actions and leading', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return AppBar(
              title: Text('Complex AppBar'),
              leading: Icon(Icons.menu),
              actions: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              ],
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create AppBar with background color', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return AppBar(
              title: Text('Colored AppBar'),
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('Button Widgets', () {
      test('should create ElevatedButton', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return ElevatedButton(
              onPressed: () {},
              child: Text('Elevated Button'),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create TextButton', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return TextButton(
              onPressed: () {},
              child: Text('Text Button'),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create OutlinedButton', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return OutlinedButton(
              onPressed: () {},
              child: Text('Outlined Button'),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create IconButton', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {},
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

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
        expect(widget, isA<Widget>());
      });
    });

    group('Card Widget', () {
      test('should create Card with default properties', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Card(
              child: ListTile(
                title: Text('Card Title'),
                subtitle: Text('Card Subtitle'),
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create Card with elevation and margin', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Card(
              elevation: 8.0,
              margin: EdgeInsets.all(16.0),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Elevated Card'),
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('ListTile Widget', () {
      test('should create ListTile with title and subtitle', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return ListTile(
              title: Text('List Item Title'),
              subtitle: Text('List Item Subtitle'),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create ListTile with leading and trailing', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return ListTile(
              leading: Icon(Icons.person),
              title: Text('John Doe'),
              subtitle: Text('Software Developer'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('Icon Widget', () {
      test('should create Icon with default properties', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Icon(Icons.star);
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create Icon with size and color', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Icon(
              Icons.favorite,
              size: 48.0,
              color: Colors.red,
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
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
        expect(widget, isA<Widget>());
      });

      test('should create CircularProgressIndicator with value', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return CircularProgressIndicator(
              value: 0.7,
              strokeWidth: 6.0,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('LinearProgressIndicator Widget', () {
      test('should create LinearProgressIndicator', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return LinearProgressIndicator();
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create LinearProgressIndicator with value', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return LinearProgressIndicator(
              value: 0.5,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('Divider Widget', () {
      test('should create Divider with default properties', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Divider();
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create Divider with custom properties', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Divider(
              height: 20,
              thickness: 2,
              indent: 16,
              endIndent: 16,
              color: Colors.grey,
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('Drawer Widget', () {
      test('should create Drawer with ListView', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text(
                      'Drawer Header',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Home'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                    onTap: () {},
                  ),
                ],
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('Bottom Navigation', () {
      test('should create BottomNavigationBar', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return BottomNavigationBar(
              currentIndex: 0,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
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
        final tooltip = widget as Tooltip;
        expect(tooltip.message, 'This is a tooltip');
        expect(tooltip.child, isA<ElevatedButton>());
      });

      test('should create Tooltip with custom properties', () {
        const code = '''
          import 'package:flutter/material.dart';

          Widget build() {
            return Tooltip(
              message: 'Custom tooltip',
              height: 50.0,
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.all(5.0),
              verticalOffset: 20.0,
              preferBelow: false,
              showDuration: Duration(seconds: 2),
              child: Text('Hover me'),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Tooltip>());
        final tooltip = widget as Tooltip;
        expect(tooltip.message, 'Custom tooltip');
        expect(tooltip.height, 50.0);
        expect(tooltip.verticalOffset, 20.0);
        expect(tooltip.preferBelow, false);
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
        final refreshIndicator = widget as RefreshIndicator;
        expect(refreshIndicator.child, isA<ListView>());
        expect(refreshIndicator.onRefresh, isNotNull);
      });

      test('should create RefreshIndicator with custom properties', () {
        const code = '''
          import 'package:flutter/material.dart';

          Widget build() {
            return RefreshIndicator(
              onRefresh: () async {},
              displacement: 50.0,
              edgeOffset: 10.0,
              color: Colors.red,
              backgroundColor: Colors.blue,
              strokeWidth: 3.0,
              child: Text('Content'),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<RefreshIndicator>());
        final refreshIndicator = widget as RefreshIndicator;
        expect(refreshIndicator.displacement, 50.0);
        expect(refreshIndicator.edgeOffset, 10.0);
        expect(refreshIndicator.strokeWidth, 3.0);
      });
    });

    group('DataTable Widget', () {
      test('should create DataTable with columns and rows', () {
        const code = '''
          import 'package:flutter/material.dart';

          Widget build() {
            return DataTable(
              columns: [
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Age')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('John')),
                  DataCell(Text('25')),
                ]),
              ],
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<MaterialApp>());
      });

      test('should create DataTable with sorting', () {
        const code = '''
          import 'package:flutter/material.dart';

          Widget build() {
            return DataTable(
              columns: [
                DataColumn(
                  label: Text('Name'),
                  onSort: (columnIndex, ascending) {},
                ),
              ],
              rows: [
                DataRow(cells: [DataCell(Text('Test'))]),
              ],
              sortColumnIndex: 0,
              sortAscending: false,
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
  });
}
