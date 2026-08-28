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

  test('Test ScrollController and PageController bridging', () {
    const code = '''
      import 'package:flutter/material.dart';

      Map<String, dynamic> testControllers() {
        final scrollController = ScrollController(
          initialScrollOffset: 50.0,
          keepScrollOffset: true,
          debugLabel: 'customScroll',
        );

        final initialOffset = scrollController.initialScrollOffset;
        final hasClients = scrollController.hasClients;
        final debugLabel = scrollController.debugLabel;

        final pageController = PageController(
          initialPage: 2,
          viewportFraction: 0.8,
        );

        final initialPage = pageController.initialPage;
        final viewportFraction = pageController.viewportFraction;

        scrollController.dispose();
        pageController.dispose();

        return {
          'initialOffset': initialOffset,
          'hasClients': hasClients,
          'debugLabel': debugLabel,
          'initialPage': initialPage,
          'viewportFraction': viewportFraction,
        };
      }
    ''';

    final result = interpreter.interpreter.execute(
      source: code,
      name: 'testControllers',
      sources: interpreter.preloadedSources,
    ) as Map;

    expect(result['initialOffset'], equals(50.0));
    expect(result['hasClients'], isFalse);
    expect(result['debugLabel'], equals('customScroll'));
    expect(result['initialPage'], equals(2));
    expect(result['viewportFraction'], equals(0.8));
  });

  test('Test SearchController, SearchBar, and SearchAnchor bridging', () {
    const code = '''
      import 'package:flutter/material.dart';

      Widget testSearchAnchor() {
        final controller = SearchController(initialText: 'Flutter');
        final initialText = controller.text;
        final isOpen = controller.isOpen;

        controller.text = 'Dart';
        final updatedText = controller.text;

        final searchBar = SearchBar(
          controller: controller,
          hintText: 'Search here...',
          leading: Icon(Icons.search),
        );

        final searchAnchor = SearchAnchor(
          searchController: controller,
          builder: (context, c) => searchBar,
          suggestionsBuilder: (context, c) => [
            ListTile(title: Text('Result 1')),
            ListTile(title: Text('Result 2')),
          ],
        );

        final searchAnchorBar = SearchAnchor.bar(
          barHintText: 'Search with bar...',
          suggestionsBuilder: (context, c) => [
            ListTile(title: Text('Suggestion A')),
          ],
        );

        return Column(
          children: [
            searchAnchor,
            searchAnchorBar,
          ],
        );
      }
    ''';

    final result = interpreter.interpreter.execute(
      source: code,
      name: 'testSearchAnchor',
      sources: interpreter.preloadedSources,
    );

    expect(result, isA<Widget>());
  });

  test('Test TabController and DefaultTabController bridging', () {
    const code = '''
      import 'package:flutter/material.dart';

      Widget testTabs() {
        final tabController = TabController(
          length: 3,
          initialIndex: 1,
        );

        final length = tabController.length;
        final index = tabController.index;

        tabController.index = 2;
        final newIndex = tabController.index;

        final tabBar = TabBar(
          controller: tabController,
          tabs: [
            Tab(text: 'Tab 1', icon: Icon(Icons.home)),
            Tab(text: 'Tab 2', icon: Icon(Icons.star)),
            Tab(text: 'Tab 3', icon: Icon(Icons.settings)),
          ],
        );

        final tabBarView = TabBarView(
          controller: tabController,
          children: [
            Center(child: Text('Page 1')),
            Center(child: Text('Page 2')),
            Center(child: Text('Page 3')),
          ],
        );

        return Scaffold(
          appBar: AppBar(
            title: Text('Tabs Test (Length: \$length, Index: \$newIndex)'),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(48.0),
              child: tabBar,
            ),
          ),
          body: tabBarView,
        );
      }
    ''';

    final result = interpreter.interpreter.execute(
      source: code,
      name: 'testTabs',
      sources: interpreter.preloadedSources,
    );

    expect(result, isA<Widget>());
  });

  test('Test SegmentedButton and HeroMode bridging', () {
    const code = '''
      import 'package:flutter/material.dart';

      Widget testSegmentedAndHero() {
        final button = SegmentedButton<String>(
          segments: [
            ButtonSegment<String>(
              value: 'day',
              label: Text('Day'),
              icon: Icon(Icons.wb_sunny),
            ),
            ButtonSegment<String>(
              value: 'night',
              label: Text('Night'),
              icon: Icon(Icons.nightlight_round),
            ),
          ],
          selected: {'day'},
          onSelectionChanged: (newSelection) {},
        );

        final hero = HeroMode(
          enabled: true,
          child: Hero(
            tag: 'testTag',
            child: Icon(Icons.star),
          ),
        );

        final nested = NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(title: Text('Nested Header')),
          ],
          body: Center(child: Text('Nested Body')),
        );

        return Column(
          children: [
            button,
            hero,
            Expanded(child: nested),
          ],
        );
      }
    ''';

    final result = interpreter.interpreter.execute(
      source: code,
      name: 'testSegmentedAndHero',
      sources: interpreter.preloadedSources,
    );

    expect(result, isA<Widget>());
  });

  test('Test MenuBar, SubmenuButton, CheckboxMenuButton, RadioMenuButton bridging', () {
    const code = '''
      import 'package:flutter/material.dart';

      Widget testMenus() {
        final menuBar = MenuBar(
          children: [
            SubmenuButton(
              menuChildren: [
                MenuItemButton(
                  onPressed: () {},
                  child: Text('New File'),
                ),
                CheckboxMenuButton(
                  value: true,
                  onChanged: (val) {},
                  child: Text('Auto Save'),
                ),
                RadioMenuButton(
                  value: 'dark',
                  groupValue: 'dark',
                  onChanged: (val) {},
                  child: Text('Dark Theme'),
                ),
              ],
              child: Text('File'),
            ),
          ],
        );

        return menuBar;
      }
    ''';

    final result = interpreter.interpreter.execute(
      source: code,
      name: 'testMenus',
      sources: interpreter.preloadedSources,
    );

    expect(result, isA<Widget>());
  });

  test('Test DatePickerDialog and TimePickerDialog bridging', () {
    const code = '''
      import 'package:flutter/material.dart';

      Widget testPickerWidgets() {
        final datePicker = DatePickerDialog(
          initialDate: DateTime(2026, 8, 28),
          firstDate: DateTime(2020),
          lastDate: DateTime(2030),
        );

        final timePicker = TimePickerDialog(
          initialTime: TimeOfDay(hour: 14, minute: 30),
        );

        return Column(
          children: [
            datePicker,
            timePicker,
          ],
        );
      }
    ''';

    final result = interpreter.interpreter.execute(
      source: code,
      name: 'testPickerWidgets',
      sources: interpreter.preloadedSources,
    );

    expect(result, isA<Widget>());
  });

  test('Test Dialog, Dialog.fullscreen, and SimpleDialogOption bridging', () {
    const code = '''
      import 'package:flutter/material.dart';

      Widget testDialogs() {
        final dialog = Dialog(
          backgroundColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Custom Dialog Content'),
          ),
        );

        final fullscreenDialog = Dialog.fullscreen(
          backgroundColor: Colors.black,
          child: Center(child: Text('Fullscreen Dialog Content')),
        );

        final simpleOption = SimpleDialogOption(
          onPressed: () {},
          child: Text('Option 1'),
        );

        return Column(
          children: [
            dialog,
            fullscreenDialog,
            simpleOption,
          ],
        );
      }
    ''';

    final result = interpreter.interpreter.execute(
      source: code,
      name: 'testDialogs',
      sources: interpreter.preloadedSources,
    );

    expect(result, isA<Widget>());
  });
}
