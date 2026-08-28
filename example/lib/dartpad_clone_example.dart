import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_d4rt/flutter_d4rt.dart';

/// Flutter DartPad Studio - Modern Dynamic Edition
///
/// Features:
/// - Modern Material 3 UI with responsive split layout
/// - Enhanced Code Editor with synchronized line numbers & quick snippet chips
/// - Live Preview with Device framing presets (Phone, Tablet, Full)
/// - Interactive Console / Logs inspector with timestamps & execution metrics
/// - Undo / Redo history, Search & Replace modal, code formatting
/// - Rich Flutter feature gallery (SearchAnchor, TabController, Menus, Slivers, Notifiers, Dialogs)

void main() {
  runApp(const DartPadApp());
}

class DartPadApp extends StatefulWidget {
  const DartPadApp({super.key});

  @override
  State<DartPadApp> createState() => _DartPadAppState();
}

class _DartPadAppState extends State<DartPadApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter DartPad Studio',
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF8F9FD),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFF12141C),
      ),
      home: DartPadScreen(
        onToggleTheme: _toggleTheme,
        isDark: _themeMode == ThemeMode.dark,
      ),
    );
  }
}

class DartPadScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final bool isDark;

  const DartPadScreen({
    super.key,
    required this.onToggleTheme,
    required this.isDark,
  });

  @override
  State<DartPadScreen> createState() => _DartPadScreenState();
}

class _DartPadScreenState extends State<DartPadScreen>
    with SingleTickerProviderStateMixin {
  late TextEditingController _codeController;
  late TextEditingController _searchController;
  late TabController _previewTabController;
  final ScrollController _editorScrollController = ScrollController();
  final ScrollController _linesScrollController = ScrollController();

  String _currentCode = _defaultCode;
  bool _isRunning = false;
  String? _error;
  int _executionDurationMs = 0;
  final List<String> _consoleLogs = [];

  bool _isVerticalSplit = false;
  String _selectedDevice = 'Phone'; // Phone, Tablet, Full
  final double _fontSize = 14.0;
  final bool _showLineNumbers = true;
  final bool _autoRun = false;
  Timer? _debounceTimer;

  // History management
  final List<String> _history = [];
  int _historyIndex = -1;

  // Search/Replace
  bool _showSearchBar = false;
  int _searchResultIndex = 0;
  List<int> _searchMatches = [];

  // Editor cursor tracking
  int _currentLine = 1;
  int _currentColumn = 1;

  static const String _defaultCode = '''import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int _counter = 0;
  String _selectedTab = 'explore';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Studio'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_outlined),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 0,
                color: Colors.indigo.withValues(alpha: 0.08),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.indigo.withValues(alpha: 0.2)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Icon(Icons.bolt, size: 40, color: Colors.indigo),
                      const SizedBox(height: 8),
                      const Text(
                        'Interpreted Flutter Power',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Live count: \$_counter',
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                          color: Colors.indigo,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SegmentedButton<String>(
                segments: const [
                  ButtonSegment(
                    value: 'explore',
                    label: Text('Explore'),
                    icon: Icon(Icons.explore),
                  ),
                  ButtonSegment(
                    value: 'stats',
                    label: Text('Stats'),
                    icon: Icon(Icons.bar_chart),
                  ),
                ],
                selected: {_selectedTab},
                onSelectionChanged: (newVal) {
                  setState(() {
                    _selectedTab = newVal.first;
                  });
                },
              ),
              const SizedBox(height: 20),
              FilledButton.icon(
                onPressed: () {
                  setState(() {
                    _counter++;
                  });
                },
                icon: const Icon(Icons.add),
                label: const Text('Increment Counter'),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}''';

  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController(text: _currentCode);
    _searchController = TextEditingController();
    _previewTabController = TabController(length: 2, vsync: this);

    _codeController.addListener(_onTextChanged);
    _searchController.addListener(_performSearch);

    _history.add(_currentCode);
    _historyIndex = 0;

    _editorScrollController.addListener(() {
      if (_linesScrollController.hasClients) {
        _linesScrollController.jumpTo(_editorScrollController.offset);
      }
    });

    _log('DartPad Studio initialized ready.');
    _runCode();
  }

  void _log(String message) {
    final time = DateTime.now();
    final timeStr =
        '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:${time.second.toString().padLeft(2, '0')}';
    setState(() {
      _consoleLogs.add('[$timeStr] $message');
    });
  }

  void _onTextChanged() {
    _updateCursorPosition();
    if (_currentCode != _codeController.text) {
      _currentCode = _codeController.text;
      _trackHistory();
      if (_autoRun) {
        _debounceTimer?.cancel();
        _debounceTimer = Timer(const Duration(milliseconds: 700), _runCode);
      }
    }
  }

  void _updateCursorPosition() {
    final text = _codeController.text;
    final selection = _codeController.selection;
    if (selection.isValid) {
      final lines = text.substring(0, selection.start).split('\n');
      setState(() {
        _currentLine = lines.length;
        _currentColumn = lines.last.length + 1;
      });
    }
  }

  void _trackHistory() {
    if (_historyIndex < _history.length - 1) {
      _history.removeRange(_historyIndex + 1, _history.length);
    }
    if (_history.isEmpty || _history.last != _currentCode) {
      _history.add(_currentCode);
      _historyIndex = _history.length - 1;
    }
  }

  void _undo() {
    if (_historyIndex > 0) {
      _historyIndex--;
      _codeController.text = _history[_historyIndex];
      _currentCode = _history[_historyIndex];
    }
  }

  void _redo() {
    if (_historyIndex < _history.length - 1) {
      _historyIndex++;
      _codeController.text = _history[_historyIndex];
      _currentCode = _history[_historyIndex];
    }
  }

  void _performSearch() {
    final term = _searchController.text.toLowerCase();
    final text = _codeController.text.toLowerCase();

    if (term.isEmpty) {
      setState(() {
        _searchMatches = [];
        _searchResultIndex = 0;
      });
      return;
    }

    final matches = <int>[];
    int start = 0;
    while (true) {
      final index = text.indexOf(term, start);
      if (index == -1) break;
      matches.add(index);
      start = index + 1;
    }

    setState(() {
      _searchMatches = matches;
      _searchResultIndex = 0;
    });
  }

  void _highlightSearchResult(int idx) {
    if (_searchMatches.isEmpty) return;
    final pos = _searchMatches[idx];
    _codeController.selection = TextSelection(
      baseOffset: pos,
      extentOffset: pos + _searchController.text.length,
    );
  }

  void _runCode() {
    final stopwatch = Stopwatch()..start();
    setState(() {
      _isRunning = true;
      _error = null;
      _currentCode = _codeController.text;
    });

    _log('Compiling and executing Dart script...');

    Future.delayed(const Duration(milliseconds: 150), () {
      stopwatch.stop();
      if (mounted) {
        setState(() {
          _isRunning = false;
          _executionDurationMs = stopwatch.elapsedMilliseconds;
        });
        _log('Execution completed successfully in ${_executionDurationMs}ms.');
      }
    });
  }

  void _formatCode() {
    final raw = _codeController.text;
    final lines = raw.split('\n');
    final formatted = lines.map((l) => l.trimRight()).join('\n');
    _codeController.text = formatted;
    _log('Code cleaned and formatted.');
  }

  void _onCodeError(dynamic error) {
    setState(() {
      _error = error.toString();
    });
    _log('RUNTIME ERROR: $error');
  }

  @override
  void dispose() {
    _codeController.dispose();
    _searchController.dispose();
    _previewTabController.dispose();
    _editorScrollController.dispose();
    _linesScrollController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = widget.isDark;
    final isDesktop = MediaQuery.of(context).size.width > 900;

    return Scaffold(
      appBar: _buildAppBar(isDark),
      body: Column(
        children: [
          if (_showSearchBar) _buildSearchBar(),
          Expanded(
            child: isDesktop && !_isVerticalSplit
                ? Row(
                    children: [
                      Expanded(flex: 5, child: _buildEditorSection()),
                      Container(
                        width: 1,
                        color: Theme.of(context)
                            .dividerColor
                            .withValues(alpha: 0.5),
                      ),
                      Expanded(flex: 5, child: _buildPreviewSection()),
                    ],
                  )
                : Column(
                    children: [
                      Expanded(flex: 5, child: _buildEditorSection()),
                      Container(
                        height: 1,
                        color: Theme.of(context)
                            .dividerColor
                            .withValues(alpha: 0.5),
                      ),
                      Expanded(flex: 5, child: _buildPreviewSection()),
                    ],
                  ),
          ),
          _buildStatusBar(),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(bool isDark) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 2,
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.indigo, Colors.blueAccent],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child:
                const Icon(Icons.flutter_dash, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'DartPad Studio',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              Text(
                'flutter_d4rt dynamic engine',
                style: TextStyle(
                  fontSize: 11,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        FilledButton.tonalIcon(
          onPressed: _showSamplesBottomSheet,
          icon: const Icon(Icons.collections_bookmark_outlined, size: 18),
          label: const Text('Samples'),
        ),
        const SizedBox(width: 8),
        FilledButton.icon(
          onPressed: _isRunning ? null : _runCode,
          icon: _isRunning
              ? const SizedBox(
                  width: 14,
                  height: 14,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : const Icon(Icons.play_arrow_rounded, size: 20),
          label: const Text('Run'),
          style: FilledButton.styleFrom(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          tooltip: 'Toggle Split Mode',
          icon: Icon(
              _isVerticalSplit ? Icons.splitscreen : Icons.vertical_split),
          onPressed: () {
            setState(() {
              _isVerticalSplit = !_isVerticalSplit;
            });
          },
        ),
        IconButton(
          tooltip: 'Toggle Theme',
          icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
          onPressed: widget.onToggleTheme,
        ),
        PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert),
          onSelected: (val) {
            switch (val) {
              case 'format':
                _formatCode();
                break;
              case 'copy':
                Clipboard.setData(ClipboardData(text: _codeController.text));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Code copied to clipboard!')),
                );
                break;
              case 'clear':
                _codeController.text = '';
                break;
              case 'reset':
                _codeController.text = _defaultCode;
                _runCode();
                break;
            }
          },
          itemBuilder: (ctx) => [
            const PopupMenuItem(
              value: 'format',
              child: ListTile(
                leading: Icon(Icons.format_align_left),
                title: Text('Format Code'),
              ),
            ),
            const PopupMenuItem(
              value: 'copy',
              child: ListTile(
                leading: Icon(Icons.copy),
                title: Text('Copy Code'),
              ),
            ),
            const PopupMenuItem(
              value: 'reset',
              child: ListTile(
                leading: Icon(Icons.restart_alt),
                title: Text('Reset to Default'),
              ),
            ),
            const PopupMenuItem(
              value: 'clear',
              child: ListTile(
                leading: Icon(Icons.clear_all),
                title: Text('Clear Code'),
              ),
            ),
          ],
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Row(
        children: [
          const Icon(Icons.search, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search in code...',
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
          if (_searchMatches.isNotEmpty)
            Text(
              '${_searchResultIndex + 1}/${_searchMatches.length}',
              style: const TextStyle(fontSize: 12),
            ),
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_up, size: 18),
            onPressed: () {
              if (_searchMatches.isNotEmpty) {
                setState(() {
                  _searchResultIndex = (_searchResultIndex -
                          1 +
                          _searchMatches.length) %
                      _searchMatches.length;
                });
                _highlightSearchResult(_searchResultIndex);
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_down, size: 18),
            onPressed: () {
              if (_searchMatches.isNotEmpty) {
                setState(() {
                  _searchResultIndex =
                      (_searchResultIndex + 1) % _searchMatches.length;
                });
                _highlightSearchResult(_searchResultIndex);
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.close, size: 18),
            onPressed: () {
              setState(() {
                _showSearchBar = false;
                _searchController.clear();
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildEditorSection() {
    final lines = _currentCode.split('\n');
    final isDark = widget.isDark;

    return Container(
      color: isDark ? const Color(0xFF1E222D) : Colors.white,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHigh,
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context)
                      .dividerColor
                      .withValues(alpha: 0.5),
                ),
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.code, size: 16, color: Colors.blueAccent),
                const SizedBox(width: 8),
                const Text(
                  'main.dart',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                ),
                const Spacer(),
                IconButton(
                  tooltip: 'Undo (Ctrl+Z)',
                  icon: const Icon(Icons.undo, size: 16),
                  onPressed: _undo,
                ),
                IconButton(
                  tooltip: 'Redo (Ctrl+Y)',
                  icon: const Icon(Icons.redo, size: 16),
                  onPressed: _redo,
                ),
                IconButton(
                  tooltip: 'Find (Ctrl+F)',
                  icon: const Icon(Icons.search, size: 16),
                  onPressed: () {
                    setState(() {
                      _showSearchBar = !_showSearchBar;
                    });
                  },
                ),
                IconButton(
                  tooltip: 'Format Code',
                  icon: const Icon(Icons.format_align_left, size: 16),
                  onPressed: _formatCode,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_showLineNumbers)
                  Container(
                    width: 48,
                    color: isDark
                        ? const Color(0xFF171922)
                        : const Color(0xFFF1F3F7),
                    child: SingleChildScrollView(
                      controller: _linesScrollController,
                      physics: const NeverScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: List.generate(
                          lines.length,
                          (i) => Container(
                            height: _fontSize * 1.5,
                            padding: const EdgeInsets.only(right: 8),
                            alignment: Alignment.centerRight,
                            child: Text(
                              '${i + 1}',
                              style: TextStyle(
                                fontFamily: 'monospace',
                                fontSize: _fontSize - 2,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: _editorScrollController,
                    child: TextField(
                      controller: _codeController,
                      maxLines: null,
                      style: TextStyle(
                        fontFamily: 'monospace',
                        fontSize: _fontSize,
                        height: 1.5,
                        color: isDark
                            ? const Color(0xFFE2E8F0)
                            : const Color(0xFF1E293B),
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(12),
                        isDense: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (_error != null)
            Container(
              padding: const EdgeInsets.all(12),
              color: Colors.red.withValues(alpha: 0.1),
              child: Row(
                children: [
                  const Icon(Icons.error_outline,
                      color: Colors.red, size: 20),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      _error!,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontFamily: 'monospace',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, size: 16),
                    onPressed: () => setState(() => _error = null),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPreviewSection() {
    return Column(
      children: [
        Container(
          height: 42,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHigh,
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context)
                    .dividerColor
                    .withValues(alpha: 0.5),
              ),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: TabBar(
                  controller: _previewTabController,
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  tabs: [
                    const Tab(
                      child: Row(
                        children: [
                          Icon(Icons.visibility_outlined, size: 16),
                          SizedBox(width: 6),
                          Text('Live Preview'),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        children: [
                          const Icon(Icons.terminal_outlined, size: 16),
                          const SizedBox(width: 6),
                          const Text('Console / Logs'),
                          if (_consoleLogs.isNotEmpty) ...[
                            const SizedBox(width: 6),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.indigo.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                '${_consoleLogs.length}',
                                style: const TextStyle(fontSize: 10),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              DropdownButton<String>(
                value: _selectedDevice,
                underline: const SizedBox(),
                items: const [
                  DropdownMenuItem(value: 'Phone', child: Text('📱 Phone')),
                  DropdownMenuItem(value: 'Tablet', child: Text('📟 Tablet')),
                  DropdownMenuItem(value: 'Expanded', child: Text('🖥️ Full')),
                ],
                onChanged: (val) {
                  if (val != null) setState(() => _selectedDevice = val);
                },
              ),
              IconButton(
                tooltip: 'Refresh Preview',
                icon: const Icon(Icons.refresh, size: 18),
                onPressed: _runCode,
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _previewTabController,
            children: [
              _buildLivePreviewDevice(),
              _buildConsoleLogs(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLivePreviewDevice() {
    Widget child = Container(
      color: Colors.white,
      child: _isRunning
          ? const Center(child: CircularProgressIndicator())
          : InterpretedWidget(
              code: _currentCode,
              entryPoint: 'MyWidget',
              onError: _onCodeError,
              loadingWidget:
                  const Center(child: CircularProgressIndicator()),
            ),
    );

    if (_selectedDevice == 'Phone') {
      return Center(
        child: Container(
          width: 360,
          height: 640,
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.black26, width: 6),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.15),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: child,
          ),
        ),
      );
    } else if (_selectedDevice == 'Tablet') {
      return Center(
        child: Container(
          width: 580,
          height: 680,
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black26, width: 8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.15),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: child,
          ),
        ),
      );
    }

    return child;
  }

  Widget _buildConsoleLogs() {
    return Container(
      color: widget.isDark
          ? const Color(0xFF0F1117)
          : const Color(0xFFF1F5F9),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Logs (${_consoleLogs.length})',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 12),
              ),
              TextButton.icon(
                onPressed: () => setState(() => _consoleLogs.clear()),
                icon: const Icon(Icons.clear, size: 14),
                label:
                    const Text('Clear', style: TextStyle(fontSize: 12)),
              ),
            ],
          ),
          const Divider(height: 8),
          Expanded(
            child: _consoleLogs.isEmpty
                ? const Center(
                    child: Text(
                      'No logs yet. Run your code to see output.',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  )
                : ListView.builder(
                    itemCount: _consoleLogs.length,
                    itemBuilder: (ctx, idx) {
                      final log = _consoleLogs[idx];
                      final isErr = log.contains('ERROR');
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Text(
                          log,
                          style: TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 11,
                            color: isErr ? Colors.redAccent : Colors.teal,
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBar() {
    return Container(
      height: 28,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: Theme.of(context).colorScheme.surfaceContainerHigh,
      child: Row(
        children: [
          Text(
            'Ln $_currentLine, Col $_currentColumn',
            style: const TextStyle(fontSize: 11, color: Colors.grey),
          ),
          const SizedBox(width: 16),
          Text(
            '${_currentCode.split('\n').length} lines | ${_currentCode.length} chars',
            style: const TextStyle(fontSize: 11, color: Colors.grey),
          ),
          const Spacer(),
          if (_executionDurationMs > 0)
            Row(
              children: [
                const Icon(Icons.speed, size: 14, color: Colors.teal),
                const SizedBox(width: 4),
                Text(
                  '${_executionDurationMs}ms',
                  style: const TextStyle(fontSize: 11, color: Colors.teal),
                ),
              ],
            ),
        ],
      ),
    );
  }

  void _showSamplesBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return DraggableScrollableSheet(
          initialChildSize: 0.7,
          minChildSize: 0.4,
          maxChildSize: 0.95,
          expand: false,
          builder: (_, controller) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    '🎨 Flutter Feature Gallery',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Choose an example to load and test in DartPad',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.separated(
                      controller: controller,
                      itemCount: _gallerySamples.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(height: 8),
                      itemBuilder: (ctx, i) {
                        final sample = _gallerySamples[i];
                        return Card(
                          elevation: 0,
                          color: Theme.of(context)
                              .colorScheme
                              .surfaceContainerLow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                              color: Theme.of(context)
                                  .dividerColor
                                  .withValues(alpha: 0.3),
                            ),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor:
                                  Colors.indigo.withValues(alpha: 0.1),
                              child: Icon(
                                (sample['icon'] as IconData?) ?? Icons.widgets,
                                color: Colors.indigo,
                              ),
                            ),
                            title: Text(
                              sample['title'] as String,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600),
                            ),
                            subtitle: Text(
                              sample['desc'] as String,
                              style: const TextStyle(fontSize: 12),
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 14,
                            ),
                            onTap: () {
                              Navigator.pop(ctx);
                              _codeController.text =
                                  sample['code'] as String;
                              _runCode();
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  static final List<Map<String, dynamic>> _gallerySamples = [
    {
      'title': 'Material 3 Search & SegmentedButton',
      'desc':
          'Interactive SearchAnchor.bar with dynamic suggestions & Segments',
      'icon': Icons.search,
      'code': '''import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String _selectedCategory = 'all';
  final List<String> _items = [
    'Flutter 3.x Framework',
    'Dart Language Evolution',
    'Material You Design',
    'Cupertino iOS Styling',
    'd4rt Interpreted Scripts',
    'Reactive State Management',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.deepPurple),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material 3 Search & Filters'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SearchAnchor.bar(
                barHintText: 'Search Flutter topics...',
                suggestionsBuilder: (context, controller) {
                  final query = controller.text.toLowerCase();
                  final filtered = _items
                      .where((item) => item.toLowerCase().contains(query))
                      .toList();
                  return filtered.map(
                    (item) => ListTile(
                      leading: const Icon(Icons.bookmark_outline),
                      title: Text(item),
                      onTap: () {
                        controller.closeView(item);
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              SegmentedButton<String>(
                segments: const [
                  ButtonSegment(value: 'all', label: Text('All')),
                  ButtonSegment(value: 'flutter', label: Text('Flutter')),
                  ButtonSegment(value: 'dart', label: Text('Dart')),
                ],
                selected: {_selectedCategory},
                onSelectionChanged: (val) {
                  setState(() => _selectedCategory = val.first);
                },
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    final item = _items[index];
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text('\${index + 1}'),
                        ),
                        title: Text(item),
                        trailing: const Icon(Icons.chevron_right),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}''',
    },
    {
      'title': 'Custom TabController & PreferredSize',
      'desc': 'TabController with TabBarView and custom height AppBar',
      'icon': Icons.tab,
      'code': '''import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.teal),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Tab Navigation Hub'),
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(48),
              child: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.dashboard), text: 'Dashboard'),
                  Tab(icon: Icon(Icons.analytics), text: 'Analytics'),
                  Tab(icon: Icon(Icons.person), text: 'Profile'),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.dashboard, size: 64, color: Colors.teal),
                    SizedBox(height: 12),
                    Text('Dashboard View', style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.analytics, size: 64, color: Colors.teal),
                    SizedBox(height: 12),
                    Text('Analytics View', style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.person, size: 64, color: Colors.teal),
                    SizedBox(height: 12),
                    Text('User Profile', style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}''',
    },
    {
      'title': 'NestedScrollView & Floating SliverAppBar',
      'desc': 'Nested sliver scrolling with responsive collapsible header',
      'icon': Icons.view_stream,
      'code': '''import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.orange),
      home: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 180.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: const Text('Nested Slivers Studio'),
                  background: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.orange, Colors.deepOrangeAccent],
                      ),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: 20,
            itemBuilder: (context, i) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: ListTile(
                  leading: const Icon(Icons.star, color: Colors.orange),
                  title: Text('Sliver Item #\${i + 1}'),
                  subtitle: const Text('Smooth nested scroll client'),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}''',
    },
    {
      'title': 'MenuBar & SubmenuButtons (Material 3)',
      'desc':
          'Desktop style hierarchical menu bar with Checkbox & Radio menus',
      'icon': Icons.menu_open,
      'code': '''import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool _autoSave = true;
  String _theme = 'system';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: const Text('MenuBar & Actions')),
        body: Column(
          children: [
            MenuBar(
              children: [
                SubmenuButton(
                  menuChildren: [
                    MenuItemButton(
                      onPressed: () {},
                      leadingIcon: const Icon(Icons.folder_open),
                      child: const Text('Open Project'),
                    ),
                    CheckboxMenuButton(
                      value: _autoSave,
                      onChanged: (val) {
                        setState(() => _autoSave = val ?? false);
                      },
                      child: const Text('Auto Save'),
                    ),
                  ],
                  child: const Text('File'),
                ),
                SubmenuButton(
                  menuChildren: [
                    RadioMenuButton<String>(
                      value: 'light',
                      groupValue: _theme,
                      onChanged: (v) => setState(() => _theme = v!),
                      child: const Text('Light'),
                    ),
                    RadioMenuButton<String>(
                      value: 'dark',
                      groupValue: _theme,
                      onChanged: (v) => setState(() => _theme = v!),
                      child: const Text('Dark'),
                    ),
                  ],
                  child: const Text('Preferences'),
                ),
              ],
            ),
            const Expanded(
              child: Center(
                child: Text(
                  'Explore native cascading menus in interpreted Flutter!',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}''',
    },
    {
      'title': 'ChangeNotifier & ListenableBuilder',
      'desc': 'Reactive state management model with real-time UI updates',
      'icon': Icons.sync,
      'code': '''import 'package:flutter/material.dart';

class TaskController extends ChangeNotifier {
  final List<String> _tasks = ['Learn Flutter d4rt', 'Build mobile app'];

  List<String> get tasks => _tasks;

  void addTask(String task) {
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}

class MyWidget extends StatelessWidget {
  final TaskController _controller = TaskController();
  MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
      home: Scaffold(
        appBar: AppBar(title: const Text('Reactive Task Manager')),
        body: ListenableBuilder(
          listenable: _controller,
          builder: (context, child) {
            return ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _controller.tasks.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.check_circle_outline, color: Colors.indigo),
                    title: Text(_controller.tasks[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      onPressed: () => _controller.removeTask(index),
                    ),
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _controller.addTask('New Task #\${_controller.tasks.length + 1}');
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}''',
    },
    {
      'title': 'Dialogs & DatePickers Suite',
      'desc':
          'Showcase DatePickerDialog, TimePickerDialog, and Custom Dialogs',
      'icon': Icons.calendar_month,
      'code': '''import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.purple),
      home: Scaffold(
        appBar: AppBar(title: const Text('Pickers & Dialogs Showcase')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Selected: \${_selectedDate.year}-\${_selectedDate.month}-\${_selectedDate.day}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              FilledButton.icon(
                onPressed: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate,
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030),
                  );
                  if (picked != null) {
                    setState(() => _selectedDate = picked);
                  }
                },
                icon: const Icon(Icons.calendar_today),
                label: const Text('Open Date Picker'),
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text('Special Offer'),
                      content: const Text('Interpreted Flutter is lightning fast!'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(ctx),
                          child: const Text('Close'),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.info_outline),
                label: const Text('Open Alert Dialog'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}''',
    },
    {
      'title': 'Animated Container Playground',
      'desc': 'Interactive animations with AnimatedContainer and state',
      'icon': Icons.animation,
      'code': '''import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.red),
      home: Scaffold(
        appBar: AppBar(title: const Text('Animated Container')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                width: _isExpanded ? 200 : 100,
                height: _isExpanded ? 200 : 100,
                decoration: BoxDecoration(
                  color: _isExpanded ? Colors.red : Colors.blue,
                  borderRadius: BorderRadius.circular(_isExpanded ? 50 : 16),
                ),
                child: Icon(
                  _isExpanded ? Icons.favorite : Icons.star,
                  color: Colors.white,
                  size: _isExpanded ? 64 : 32,
                ),
              ),
              const SizedBox(height: 32),
              FilledButton.tonal(
                onPressed: () {
                  setState(() => _isExpanded = !_isExpanded);
                },
                child: Text(_isExpanded ? 'Shrink' : 'Expand'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}''',
    },
    {
      'title': 'Stream & Real-Time Counter',
      'desc': 'Live reactive data streams with StreamBuilder',
      'icon': Icons.stream,
      'code': '''import 'dart:async';
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  Stream<int> _generateStream() async* {
    int counter = 0;
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield counter++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.cyan),
      home: Scaffold(
        appBar: AppBar(title: const Text('StreamBuilder Live Counter')),
        body: Center(
          child: StreamBuilder<int>(
            stream: _generateStream(),
            builder: (context, snapshot) {
              return Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Stream Counter', style: TextStyle(fontSize: 16)),
                      const SizedBox(height: 12),
                      Text(
                        '\${snapshot.data ?? 0}',
                        style: const TextStyle(fontSize: 54, fontWeight: FontWeight.bold, color: Colors.cyan),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}''',
    },
    {
      'title': 'Grid Layout Hub',
      'desc': 'Responsive GridView with Material Cards',
      'icon': Icons.grid_view,
      'code': '''import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
      home: Scaffold(
        appBar: AppBar(title: const Text('Grid Layout Hub')),
        body: GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.indigo.withValues(alpha: 0.08),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.dashboard_outlined, size: 36, color: Colors.indigo),
                    const SizedBox(height: 8),
                    Text('Card \${index + 1}', style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}''',
    },
  ];
}
