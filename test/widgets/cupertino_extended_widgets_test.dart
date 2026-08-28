import 'package:flutter/cupertino.dart';
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

  group('Cupertino Extended Widgets Tests', () {
    test('should build CupertinoListSection and CupertinoListTile', () {
      const code = '''
        import 'package:flutter/cupertino.dart';

        Widget build() {
          return CupertinoListSection.insetGrouped(
            header: Text('Header'),
            footer: Text('Footer'),
            children: [
              CupertinoListTile(
                title: Text('Wi-Fi'),
                subtitle: Text('Connected'),
                leading: Icon(CupertinoIcons.wifi),
                trailing: CupertinoListTileChevron(),
              ),
              CupertinoListTile.notched(
                title: Text('Bluetooth'),
                additionalInfo: Text('On'),
              ),
            ],
          );
        }
      ''';

      final widget = interpreter.execute(code, 'build');
      expect(widget, isA<CupertinoListSection>());
    });

    test('should build CupertinoSegmentedControl and CupertinoSlidingSegmentedControl', () {
      const code = '''
        import 'package:flutter/cupertino.dart';

        Widget build() {
          return Column(
            children: [
              CupertinoSegmentedControl(
                children: {
                  0: Text('Day'),
                  1: Text('Week'),
                  2: Text('Month'),
                },
                groupValue: 1,
                onValueChanged: (val) {},
              ),
              CupertinoSlidingSegmentedControl(
                children: {
                  'a': Text('First'),
                  'b': Text('Second'),
                },
                groupValue: 'a',
                onValueChanged: (val) {},
              ),
            ],
          );
        }
      ''';

      final widget = interpreter.execute(code, 'build');
      expect(widget, isA<Column>());
    });

    test('should build CupertinoSearchTextField', () {
      const code = '''
        import 'package:flutter/cupertino.dart';

        Widget build() {
          return CupertinoSearchTextField(
            placeholder: 'Search for apps...',
            onChanged: (text) {},
            onSubmitted: (text) {},
          );
        }
      ''';

      final widget = interpreter.execute(code, 'build');
      expect(widget, isA<CupertinoSearchTextField>());
    });

    test('should build CupertinoDatePicker and CupertinoTimerPicker', () {
      const code = '''
        import 'package:flutter/cupertino.dart';

        Widget build() {
          return Column(
            children: [
              CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                dateOrder: DatePickerDateOrder.dmy,
                onDateTimeChanged: (date) {},
              ),
              CupertinoTimerPicker(
                mode: CupertinoTimerPickerMode.hm,
                onTimerDurationChanged: (duration) {},
              ),
            ],
          );
        }
      ''';

      final widget = interpreter.execute(code, 'build');
      expect(widget, isA<Column>());
    });

    test('should build CupertinoFormSection and rows', () {
      const code = '''
        import 'package:flutter/cupertino.dart';

        Widget build() {
          return CupertinoFormSection.insetGrouped(
            header: Text('ACCOUNT'),
            children: [
              CupertinoFormRow(
                prefix: Text('Name'),
                helper: Text('Enter full name'),
                child: Text('John Doe'),
              ),
              CupertinoTextFormFieldRow(
                prefix: Text('Email'),
                placeholder: 'example@icloud.com',
              ),
            ],
          );
        }
      ''';

      final widget = interpreter.execute(code, 'build');
      expect(widget, isA<CupertinoFormSection>());
    });

    test('should build CupertinoContextMenu and PopupSurface', () {
      const code = '''
        import 'package:flutter/cupertino.dart';

        Widget build() {
          return CupertinoPopupSurface(
            child: CupertinoContextMenu(
              actions: [
                CupertinoContextMenuAction(
                  child: Text('Share'),
                  trailingIcon: CupertinoIcons.share,
                  onPressed: () {},
                ),
                CupertinoContextMenuAction(
                  child: Text('Delete'),
                  isDestructiveAction: true,
                  onPressed: () {},
                ),
              ],
              child: Container(
                width: 100,
                height: 100,
                color: CupertinoColors.systemBlue,
              ),
            ),
          );
        }
      ''';

      final widget = interpreter.execute(code, 'build');
      expect(widget, isA<CupertinoPopupSurface>());
    });

    test('should build CupertinoScrollbar, CupertinoCheckbox, and CupertinoRadio', () {
      const code = '''
        import 'package:flutter/cupertino.dart';

        Widget build() {
          return CupertinoScrollbar(
            child: Column(
              children: [
                CupertinoCheckbox(
                  value: true,
                  onChanged: (val) {},
                ),
                CupertinoRadio(
                  value: 1,
                  groupValue: 1,
                  onChanged: (val) {},
                ),
              ],
            ),
          );
        }
      ''';

      final widget = interpreter.execute(code, 'build');
      expect(widget, isA<CupertinoScrollbar>());
    });

    test('should build CupertinoSliverNavigationBar and SliverRefreshControl', () {
      const code = '''
        import 'package:flutter/cupertino.dart';

        Widget build() {
          return CustomScrollView(
            slivers: [
              CupertinoSliverNavigationBar(
                largeTitle: Text('Library'),
              ),
              CupertinoSliverRefreshControl(
                onRefresh: () async {},
              ),
            ],
          );
        }
      ''';

      final widget = interpreter.execute(code, 'build');
      expect(widget, isA<CustomScrollView>());
    });
  });
}
