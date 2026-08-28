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

  group('Material Extended Widgets Tests', () {
    test('should build Chips: ActionChip, ChoiceChip, FilterChip, InputChip', () {
      const code = '''
        import 'package:flutter/material.dart';

        Widget build() {
          return Column(
            children: [
              ActionChip(
                avatar: Icon(Icons.favorite),
                label: Text('Action'),
                onPressed: () {},
              ),
              ChoiceChip(
                label: Text('Choice'),
                selected: true,
                onSelected: (val) {},
              ),
              FilterChip(
                label: Text('Filter'),
                selected: false,
                onSelected: (val) {},
              ),
              InputChip(
                label: Text('Input'),
                selected: true,
                onDeleted: () {},
              ),
            ],
          );
        }
      ''';

      final widget = interpreter.execute(code, 'build');
      expect(widget, isA<Column>());
    });

    test('should build SimpleDialog with SimpleDialogOptions', () {
      const code = '''
        import 'package:flutter/material.dart';

        Widget build() {
          return SimpleDialog(
            title: Text('Select option'),
            children: [
              SimpleDialogOption(
                onPressed: () {},
                child: Text('Option 1'),
              ),
              SimpleDialogOption(
                onPressed: () {},
                child: Text('Option 2'),
              ),
            ],
          );
        }
      ''';

      final widget = interpreter.execute(code, 'build');
      expect(widget, isA<SimpleDialog>());
    });

    test('should build RangeSlider with RangeValues and RangeLabels', () {
      const code = '''
        import 'package:flutter/material.dart';

        Widget build() {
          return RangeSlider(
            values: RangeValues(20.0, 80.0),
            min: 0.0,
            max: 100.0,
            divisions: 10,
            labels: RangeLabels('20', '80'),
            onChanged: (values) {},
          );
        }
      ''';

      final widget = interpreter.execute(code, 'build');
      expect(widget, isA<RangeSlider>());
    });
  });
}
