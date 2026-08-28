import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_d4rt/flutter_d4rt.dart';

void main() {
  group('Cupertino Icons Comprehensive Test', () {
    late FlutterRunInterpreter interpreter;

    setUp(() {
      interpreter = FlutterRunInterpreter();
      interpreter.initialize();
    });

    tearDown(() {
      interpreter.dispose();
    });

    test('should resolve all CupertinoIcons', () {
      const code = '''
        import 'package:flutter/cupertino.dart';

        Widget build() {
          return CupertinoPageScaffold(
            child: ListView(
              children: [
                Icon(CupertinoIcons.square_grid_2x2),
                Icon(CupertinoIcons.square_grid_2x2_fill),
                Icon(CupertinoIcons.person_crop_circle),
                Icon(CupertinoIcons.person_crop_circle_fill),
                Icon(CupertinoIcons.moon_stars),
                Icon(CupertinoIcons.moon_stars_fill),
                Icon(CupertinoIcons.airplane),
                Icon(CupertinoIcons.wifi),
                Icon(CupertinoIcons.bluetooth),
                Icon(CupertinoIcons.sun_min),
                Icon(CupertinoIcons.sun_max_fill),
                Icon(CupertinoIcons.volume_mute),
                Icon(CupertinoIcons.volume_up),
                Icon(CupertinoIcons.chevron_right),
                Icon(CupertinoIcons.chevron_back),
                Icon(CupertinoIcons.person_fill),
                Icon(CupertinoIcons.sparkles),
                Icon(CupertinoIcons.pencil_outline),
                Icon(CupertinoIcons.gear_alt_fill),
                Icon(CupertinoIcons.cart_fill),
                Icon(CupertinoIcons.bag_fill),
                Icon(CupertinoIcons.location_fill),
                Icon(CupertinoIcons.shield_fill),
                Icon(CupertinoIcons.wrench_fill),
              ],
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
