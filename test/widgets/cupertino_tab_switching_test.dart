import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_d4rt/flutter_d4rt.dart';
import '../fixtures/cupertino_example_source.dart';

void main() {
  testWidgets('CupertinoTabScaffold should switch tabs without error', (tester) async {
    final interpreter = FlutterRunInterpreter();
    interpreter.initialize();

    final widget = interpreter.execute(
      cupertinoExampleCode,
      'CupertinoRootApp',
    );

    await tester.pumpWidget(widget);
    await tester.pump(const Duration(milliseconds: 300));

    // Verify Settings Tab is shown
    expect(find.text('Settings'), findsWidgets);

    // Tap Profile Tab (Tab 2)
    await tester.tap(find.text('Profile'));
    await tester.pump(const Duration(milliseconds: 300));

    // Check what is rendered
    expect(find.text('Developer Profile'), findsOneWidget);
    expect(find.text('Live Interpreter Stats'), findsOneWidget);
  });
}
