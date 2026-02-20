import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_d4rt/flutter_d4rt.dart';

/// Flutter DartPad Clone Pro - Version Enrichie
///
/// Fonctionnalités principales :
/// - Historique avec Undo/Redo (Cmd+Z / Cmd+Shift+Z)
/// - Recherche & Remplacement (Cmd+F)
/// - Configuration (FontSize, WordWrap, LineNumbers)
/// - Export du code (Plain Text, JSON)
/// - 16 samples de code avancés
/// - Statistiques en temps réel (lignes, mots, caractères)
/// - Raccourcis clavier complets
/// - Formatage automatique du code
/// - Gestion robuste des erreurs

void main() {
  runApp(const DartPadApp());
}

// Keyboard shortcuts intents
class _RunCodeIntent extends Intent {
  const _RunCodeIntent();
}

class _FormatCodeIntent extends Intent {
  const _FormatCodeIntent();
}

class _UndoIntent extends Intent {
  const _UndoIntent();
}

class _RedoIntent extends Intent {
  const _RedoIntent();
}

class _FindIntent extends Intent {
  const _FindIntent();
}

class _SaveIntent extends Intent {
  const _SaveIntent();
}

class DartPadApp extends StatelessWidget {
  const DartPadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter DartPad Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: ThemeData.light().textTheme,
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark().copyWith(
        textTheme: ThemeData.dark().textTheme,
      ),
      home: const DartPadScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DartPadScreen extends StatefulWidget {
  const DartPadScreen({super.key});

  @override
  State<DartPadScreen> createState() => _DartPadScreenState();
}

class _DartPadScreenState extends State<DartPadScreen> {
  late TextEditingController _codeController;
  late TextEditingController _searchController;
  String _currentCode = _defaultCode;
  bool _isRunning = false;
  String? _error;
  bool _isVerticalSplit = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentLine = 1;
  int _currentColumn = 1;

  // History management
  final List<String> _history = [];
  int _historyIndex = -1;

  // Search/Replace
  bool _showSearchBar = false;
  int _searchResultIndex = 0;
  List<int> _searchMatches = [];

  // Settings
  bool _showSettings = false;
  int _fontSize = 14;
  bool _wordWrap = true;
  bool _showLineNumbers = true;

  // Statistics
  int _characterCount = 0;
  int _lineCount = 1;
  int _wordCount = 0;

  static const String _defaultCode = '''import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('DartPad Example'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You have pushed the button this many times:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                '\$_counter',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _incrementCounter,
                child: Text('Increment'),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
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
    _codeController.addListener(_onTextChanged);
    _searchController.addListener(_onSearchChanged);
    _history.add(_currentCode);
    _historyIndex = 0;
    _updateStatistics();
    _runCode(); // Auto-run on start
  }

  void _onTextChanged() {
    setState(() {
      _currentCode = _codeController.text;
      _updateCursorPosition();
      _updateStatistics();
      _trackHistory();
    });
  }

  void _updateStatistics() {
    final text = _codeController.text;
    setState(() {
      _characterCount = text.length;
      _lineCount = text.split('\n').length;
      _wordCount = text.split(RegExp(r'\s+')).where((w) => w.isNotEmpty).length;
    });
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
      _updateStatistics();
    }
  }

  void _redo() {
    if (_historyIndex < _history.length - 1) {
      _historyIndex++;
      _codeController.text = _history[_historyIndex];
      _currentCode = _history[_historyIndex];
      _updateStatistics();
    }
  }

  void _onSearchChanged() {
    _performSearch();
  }

  void _performSearch() {
    final searchTerm = _searchController.text.toLowerCase();
    final codeText = _codeController.text.toLowerCase();

    if (searchTerm.isEmpty) {
      setState(() {
        _searchMatches = [];
        _searchResultIndex = 0;
      });
      return;
    }

    _searchMatches = [];
    int startIndex = 0;

    while (true) {
      final index = codeText.indexOf(searchTerm, startIndex);
      if (index == -1) break;
      _searchMatches.add(index);
      startIndex = index + 1;
    }

    if (_searchMatches.isNotEmpty &&
        _searchResultIndex >= _searchMatches.length) {
      _searchResultIndex = 0;
    }

    setState(() {});
  }

  void _findNext() {
    if (_searchMatches.isNotEmpty) {
      setState(() {
        _searchResultIndex = (_searchResultIndex + 1) % _searchMatches.length;
      });
      _highlightSearchResult();
    }
  }

  void _findPrevious() {
    if (_searchMatches.isNotEmpty) {
      setState(() {
        _searchResultIndex =
            (_searchResultIndex - 1 + _searchMatches.length) %
            _searchMatches.length;
      });
      _highlightSearchResult();
    }
  }

  void _highlightSearchResult() {
    if (_searchMatches.isEmpty) return;
    final startPos = _searchMatches[_searchResultIndex];
    final endPos = startPos + _searchController.text.length;
    _codeController.selection = TextSelection(
      baseOffset: startPos,
      extentOffset: endPos,
    );
  }

  void _replaceAll() {
    showDialog(
      context: context,
      builder: (context) {
        final replaceController = TextEditingController();
        return AlertDialog(
          title: Text('Replace All'),
          content: TextField(
            controller: replaceController,
            decoration: InputDecoration(
              labelText: 'Replace with',
              hintText: 'Replacement text',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                final searchTerm = _searchController.text;
                final replaceTerm = replaceController.text;

                if (searchTerm.isNotEmpty) {
                  setState(() {
                    _codeController.text = _codeController.text.replaceAll(
                      searchTerm,
                      replaceTerm,
                    );
                    _currentCode = _codeController.text;
                    _trackHistory();
                    _updateStatistics();
                  });
                }
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Replaced ${_searchMatches.length} occurrences',
                    ),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              child: Text('Replace All'),
            ),
          ],
        );
      },
    );
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

  @override
  void dispose() {
    _codeController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _runCode() {
    setState(() {
      _isRunning = true;
      _error = null;
      _currentCode = _codeController.text;
    });

    // Simulate compilation delay
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          _isRunning = false;
        });

        // Show success feedback if no errors
        if (_error == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  Icon(Icons.play_circle_filled, color: Colors.white, size: 16),
                  SizedBox(width: 8),
                  Text('Code executed successfully'),
                ],
              ),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 1),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      }
    });
  }

  void _resetCode() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(Icons.warning, color: Colors.orange),
              SizedBox(width: 8),
              Text('Reset Code'),
            ],
          ),
          content: Text(
            'Are you sure you want to reset the code to the default template? All current changes will be lost.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _codeController.text = _defaultCode;
                  _currentCode = _defaultCode;
                  _error = null;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Row(
                      children: [
                        Icon(Icons.refresh, color: Colors.white, size: 16),
                        SizedBox(width: 8),
                        Text('Code reset to default'),
                      ],
                    ),
                    backgroundColor: Colors.blue,
                    duration: Duration(seconds: 2),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              child: Text('Reset'),
            ),
          ],
        );
      },
    );
  }

  void _copyCode() {
    Clipboard.setData(ClipboardData(text: _codeController.text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.white, size: 16),
            SizedBox(width: 8),
            Text('Code copied to clipboard'),
          ],
        ),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _exportCode() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Export Code'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('What format would you like to export?'),
            SizedBox(height: 16),
            SizedBox(
              width: double.maxFinite,
              child: Wrap(
                spacing: 8,
                children: [
                  FilledButton.tonal(
                    onPressed: () {
                      Clipboard.setData(
                        ClipboardData(text: _codeController.text),
                      );
                      Navigator.pop(context);
                      _showSnackBar('Code copied as plain text', Colors.green);
                    },
                    child: Text('Plain Text'),
                  ),
                  FilledButton.tonal(
                    onPressed: () {
                      final json =
                          '{"code": "${_codeController.text.replaceAll('"', '\\"').replaceAll('\n', '\\n')}"}';
                      Clipboard.setData(ClipboardData(text: json));
                      Navigator.pop(context);
                      _showSnackBar('Code copied as JSON', Colors.green);
                    },
                    child: Text('JSON'),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _formatCode() {
    try {
      // Simple indentation formatting with improved logic
      final lines = _codeController.text.split('\n');
      final formattedLines = <String>[];
      int indentLevel = 0;

      for (String line in lines) {
        final trimmed = line.trim();

        // Skip empty lines
        if (trimmed.isEmpty) {
          formattedLines.add('');
          continue;
        }

        // Handle closing braces first
        if (trimmed.startsWith('}')) {
          indentLevel = (indentLevel - 1).clamp(0, 100);
          formattedLines.add('  ' * indentLevel + trimmed);
        }
        // Handle standalone opening braces
        else if (trimmed == '{') {
          formattedLines.add('  ' * indentLevel + trimmed);
          indentLevel++;
        }
        // Handle lines ending with opening brace
        else if (trimmed.endsWith('{')) {
          formattedLines.add('  ' * indentLevel + trimmed);
          indentLevel++;
        }
        // Handle other lines
        else {
          formattedLines.add('  ' * indentLevel + trimmed);
        }
      }

      setState(() {
        _codeController.text = formattedLines.join('\n');
        _currentCode = _codeController.text;
        _trackHistory();
        _updateStatistics();
      });

      _showSnackBar('Code formatted successfully', Colors.blue);
    } catch (e) {
      _showSnackBar('Failed to format code: $e', Colors.red);
    }
  }

  void _onCodeError(String error) {
    setState(() {
      _error = error;
      _isRunning = false;
    });

    // Show error feedback
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.error, color: Colors.white, size: 16),
            SizedBox(width: 8),
            Expanded(child: Text('Compilation failed')),
          ],
        ),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: 'DETAILS',
          textColor: Colors.white,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Row(
                  children: [
                    Icon(Icons.bug_report, color: Colors.red),
                    SizedBox(width: 8),
                    Text('Compilation Error'),
                  ],
                ),
                content: SingleChildScrollView(
                  child: Text(
                    error,
                    style: TextStyle(fontFamily: 'monospace', fontSize: 12),
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('OK'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _showSamples() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => SampleCodeSheet(
        onCodeSelected: (code) {
          setState(() {
            _codeController.text = code;
            _currentCode = code;
            _error = null; // Clear any existing errors
          });
          Navigator.pop(context);

          // Auto-run the selected sample
          _runCode();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.meta, LogicalKeyboardKey.enter):
            const _RunCodeIntent(),
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.enter):
            const _RunCodeIntent(),
        LogicalKeySet(LogicalKeyboardKey.meta, LogicalKeyboardKey.keyZ):
            const _UndoIntent(),
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyZ):
            const _UndoIntent(),
        LogicalKeySet(
          LogicalKeyboardKey.meta,
          LogicalKeyboardKey.shift,
          LogicalKeyboardKey.keyZ,
        ): const _RedoIntent(),
        LogicalKeySet(
          LogicalKeyboardKey.control,
          LogicalKeyboardKey.shift,
          LogicalKeyboardKey.keyZ,
        ): const _RedoIntent(),
        LogicalKeySet(LogicalKeyboardKey.meta, LogicalKeyboardKey.keyF):
            const _FindIntent(),
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyF):
            const _FindIntent(),
        LogicalKeySet(
          LogicalKeyboardKey.meta,
          LogicalKeyboardKey.shift,
          LogicalKeyboardKey.keyF,
        ): const _FormatCodeIntent(),
        LogicalKeySet(
          LogicalKeyboardKey.control,
          LogicalKeyboardKey.shift,
          LogicalKeyboardKey.keyF,
        ): const _FormatCodeIntent(),
        LogicalKeySet(LogicalKeyboardKey.meta, LogicalKeyboardKey.keyS):
            const _SaveIntent(),
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyS):
            const _SaveIntent(),
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          _RunCodeIntent: CallbackAction<_RunCodeIntent>(
            onInvoke: (_RunCodeIntent intent) {
              if (!_isRunning) _runCode();
              return null;
            },
          ),
          _UndoIntent: CallbackAction<_UndoIntent>(
            onInvoke: (_UndoIntent intent) {
              _undo();
              return null;
            },
          ),
          _RedoIntent: CallbackAction<_RedoIntent>(
            onInvoke: (_RedoIntent intent) {
              _redo();
              return null;
            },
          ),
          _FindIntent: CallbackAction<_FindIntent>(
            onInvoke: (_FindIntent intent) {
              setState(() => _showSearchBar = !_showSearchBar);
              return null;
            },
          ),
          _FormatCodeIntent: CallbackAction<_FormatCodeIntent>(
            onInvoke: (_FormatCodeIntent intent) {
              _formatCode();
              return null;
            },
          ),
          _SaveIntent: CallbackAction<_SaveIntent>(
            onInvoke: (_SaveIntent intent) {
              _copyCode();
              return null;
            },
          ),
        },
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: const Text('Flutter DartPad Clone Pro'),
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            elevation: 4,
            actions: [
              IconButton(
                icon: Icon(
                  _isVerticalSplit ? Icons.view_agenda : Icons.view_column,
                ),
                tooltip: 'Toggle Layout (Split orientation)',
                onPressed: () {
                  setState(() {
                    _isVerticalSplit = !_isVerticalSplit;
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.history),
                tooltip: 'History',
                onPressed: () {
                  _showSnackBar(
                    'History: ${_historyIndex + 1}/${_history.length}',
                    Colors.blue,
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.undo),
                tooltip: 'Undo (Cmd+Z)',
                onPressed: _historyIndex > 0 ? _undo : null,
              ),
              IconButton(
                icon: const Icon(Icons.redo),
                tooltip: 'Redo (Cmd+Shift+Z)',
                onPressed: _historyIndex < _history.length - 1 ? _redo : null,
              ),
              IconButton(
                icon: const Icon(Icons.search),
                tooltip: 'Find & Replace (Cmd+F)',
                onPressed: () {
                  setState(() => _showSearchBar = !_showSearchBar);
                },
              ),
              IconButton(
                icon: const Icon(Icons.copy),
                tooltip: 'Copy Code',
                onPressed: _copyCode,
              ),
              IconButton(
                icon: const Icon(Icons.download),
                tooltip: 'Export Code',
                onPressed: _exportCode,
              ),
              IconButton(
                icon: const Icon(Icons.auto_fix_high),
                tooltip: 'Format Code (Ctrl+Shift+F)',
                onPressed: _formatCode,
              ),
              IconButton(
                icon: const Icon(Icons.palette),
                tooltip: 'Sample Code',
                onPressed: _showSamples,
              ),
              IconButton(
                icon: const Icon(Icons.refresh),
                tooltip: 'Reset to Default',
                onPressed: _resetCode,
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                tooltip: 'Settings',
                onPressed: () => setState(() => _showSettings = !_showSettings),
              ),
              const SizedBox(width: 8),
              FilledButton.icon(
                onPressed: _isRunning ? null : _runCode,
                icon: _isRunning
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.play_arrow),
                label: Text(_isRunning ? 'Running...' : 'Run (Cmd+⏎)'),
              ),
              const SizedBox(width: 16),
            ],
          ),
          body: Column(
            children: [
              if (_showSearchBar) _buildSearchBar(),
              if (_showSettings) _buildSettingsPanel(),
              Expanded(
                child: _isVerticalSplit
                    ? Column(
                        children: [
                          Expanded(child: _buildCodeEditor()),
                          const Divider(height: 1, thickness: 1),
                          Expanded(child: _buildPreview()),
                        ],
                      )
                    : Row(
                        children: [
                          Expanded(child: _buildCodeEditor()),
                          const VerticalDivider(width: 1, thickness: 1),
                          Expanded(child: _buildPreview()),
                        ],
                      ),
              ),
              _buildStatusBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        border: Border(
          bottom: BorderSide(color: Theme.of(context).dividerColor),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Find...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
              ),
              onSubmitted: (_) => _findNext(),
            ),
          ),
          SizedBox(width: 8),
          if (_searchMatches.isNotEmpty)
            Chip(
              label: Text('${_searchResultIndex + 1}/${_searchMatches.length}'),
              backgroundColor: Colors.blue.shade100,
            ),
          SizedBox(width: 8),
          IconButton(
            icon: Icon(Icons.arrow_upward),
            onPressed: _searchMatches.isNotEmpty ? _findPrevious : null,
            tooltip: 'Previous',
          ),
          IconButton(
            icon: Icon(Icons.arrow_downward),
            onPressed: _searchMatches.isNotEmpty ? _findNext : null,
            tooltip: 'Next',
          ),
          IconButton(
            icon: Icon(Icons.find_replace),
            onPressed: _searchMatches.isNotEmpty ? _replaceAll : null,
            tooltip: 'Replace All',
          ),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => setState(() => _showSearchBar = false),
            tooltip: 'Close',
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsPanel() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        border: Border(
          bottom: BorderSide(color: Theme.of(context).dividerColor),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Wrap(
              spacing: 24,
              runSpacing: 16,
              children: [
                Column(
                  children: [
                    Text(
                      'Font Size',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: _fontSize > 10
                              ? () => setState(() => _fontSize--)
                              : null,
                        ),
                        SizedBox(
                          width: 50,
                          child: TextField(
                            textAlign: TextAlign.center,
                            readOnly: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              isDense: true,
                            ),
                            controller: TextEditingController(
                              text: '$_fontSize',
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: _fontSize < 32
                              ? () => setState(() => _fontSize++)
                              : null,
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Word Wrap',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Switch(
                      value: _wordWrap,
                      onChanged: (value) => setState(() => _wordWrap = value),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Line Numbers',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Switch(
                      value: _showLineNumbers,
                      onChanged: (value) =>
                          setState(() => _showLineNumbers = value),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => setState(() => _showSettings = false),
          ),
        ],
      ),
    );
  }

  Widget _buildCodeEditor() {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              border: Border(
                bottom: BorderSide(color: Theme.of(context).dividerColor),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.code,
                  size: 16,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 8),
                Text(
                  'main.dart',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const Spacer(),
                if (_error != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.error, size: 12, color: Colors.white),
                        const SizedBox(width: 4),
                        Text(
                          'Error',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Line numbers
                if (_showLineNumbers)
                  Container(
                    width: 50,
                    color: Colors.grey[100],
                    child: Column(
                      children: [
                        Container(height: 48, color: Colors.grey[200]),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: List.generate(
                                _currentCode.split('\n').length,
                                (index) => Container(
                                  height: _fontSize * 1.4,
                                  padding: EdgeInsets.only(right: 8),
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    '${index + 1}',
                                    style: TextStyle(
                                      fontFamily: 'monospace',
                                      fontSize: (_fontSize - 2).toDouble(),
                                      color: Colors.grey[600],
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                // Code editor
                Expanded(
                  child: TextField(
                    controller: _codeController,
                    maxLines: _wordWrap ? null : 1,
                    expands: _wordWrap,
                    onTap: () {
                      Future.delayed(
                        Duration(milliseconds: 10),
                        _updateCursorPosition,
                      );
                    },
                    style: TextStyle(
                      fontFamily: 'monospace',
                      fontSize: _fontSize.toDouble(),
                      height: 1.4,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16),
                      hintText: 'Write your Flutter code here...',
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (_error != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              color: Colors.red.shade50,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.error, color: Colors.red, size: 16),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _error!,
                      style: TextStyle(
                        color: Colors.red.shade700,
                        fontSize: 12,
                        fontFamily: 'monospace',
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPreview() {
    return Container(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              border: Border(
                bottom: BorderSide(color: Theme.of(context).dividerColor),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.phone_android,
                  size: 16,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                const SizedBox(width: 8),
                Text('Preview', style: Theme.of(context).textTheme.titleSmall),
                const Spacer(),
                if (_isRunning)
                  const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: _isRunning
                    ? const Center(child: CircularProgressIndicator())
                    : InterpretedWidget(
                        code: _currentCode,
                        entryPoint: 'MyWidget',
                        onError: _onCodeError,
                        loadingWidget: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBar() {
    return Container(
      height: 32,
      color: Colors.blueGrey[100],
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Icon(Icons.code, size: 16, color: Colors.blueGrey[600]),
          const SizedBox(width: 8),
          Text(
            'Ln $_currentLine, Col $_currentColumn',
            style: TextStyle(fontSize: 12, color: Colors.blueGrey[700]),
          ),
          const SizedBox(width: 16),
          Container(width: 1, color: Colors.blueGrey[300]),
          const SizedBox(width: 16),
          Icon(Icons.description, size: 14, color: Colors.blueGrey[600]),
          const SizedBox(width: 4),
          Text(
            'Lines: $_lineCount | Words: $_wordCount | Chars: $_characterCount',
            style: TextStyle(fontSize: 11, color: Colors.blueGrey[700]),
          ),
          const Spacer(),
          if (_isRunning) ...[
            SizedBox(
              width: 12,
              height: 12,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.blue[600],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'Running...',
              style: TextStyle(fontSize: 12, color: Colors.blue[600]),
            ),
          ] else if (_error != null) ...[
            Icon(Icons.error, size: 16, color: Colors.red[600]),
            const SizedBox(width: 4),
            Text(
              'Error',
              style: TextStyle(fontSize: 12, color: Colors.red[600]),
            ),
          ] else ...[
            Icon(Icons.check_circle, size: 16, color: Colors.green[600]),
            const SizedBox(width: 4),
            Text(
              'Ready',
              style: TextStyle(fontSize: 12, color: Colors.green[600]),
            ),
          ],
        ],
      ),
    );
  }
}

class SampleCodeSheet extends StatelessWidget {
  final Function(String) onCodeSelected;

  const SampleCodeSheet({super.key, required this.onCodeSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Sample Code',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const Spacer(),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: _sampleCodes.map((sample) {
                return Card(
                  child: ListTile(
                    title: Text(sample['title']!),
                    subtitle: Text(sample['description']!),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () => onCodeSelected(sample['code']!),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  static final List<Map<String, String>> _sampleCodes = [
    {
      'title': 'Hello World',
      'description': 'Simple text display',
      'code': '''import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello World'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Text(
            'Hello, Flutter World!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}''',
    },
    {
      'title': 'Counter App',
      'description': 'Stateful widget with counter',
      'code': '''import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Counter App'),
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Button pressed:',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '\$_counter times',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}''',
    },
    {
      'title': 'ListView Example',
      'description': 'Scrollable list of items',
      'code': '''import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView Example'),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
        body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green,
                child: Text('\${index + 1}'),
              ),
              title: Text('Item \${index + 1}'),
              subtitle: Text('This is item number \${index + 1}'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle tap
              },
            );
          },
        ),
      ),
    );
  }
}''',
    },
    {
      'title': 'Form Example',
      'description': 'Input form with validation',
      'code': '''import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Form Example'),
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) => _name = value ?? '',
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) => _email = value ?? '',
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Form submitted!')),
                      );
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}''',
    },
    {
      'title': 'Animated Container',
      'description': 'Container with smooth animations',
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
      home: Scaffold(
        appBar: AppBar(
          title: Text('Animated Container'),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: _isExpanded ? 200 : 100,
                height: _isExpanded ? 200 : 100,
                decoration: BoxDecoration(
                  color: _isExpanded ? Colors.red : Colors.blue,
                  borderRadius: BorderRadius.circular(_isExpanded ? 50 : 10),
                ),
                child: Icon(
                  _isExpanded ? Icons.favorite : Icons.star,
                  color: Colors.white,
                  size: _isExpanded ? 50 : 30,
                ),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
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
      'title': 'StreamBuilder Example',
      'description': 'Real-time data stream with StreamBuilder',
      'code': '''import 'package:flutter/material.dart';
import 'dart:async';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late StreamController<int> _streamController;
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _streamController = StreamController<int>();
    
    // Emit a new value every second
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (!_streamController.isClosed) {
        _streamController.add(_counter++);
      }
    });
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('StreamBuilder Example'),
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Real-time Counter:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              StreamBuilder<int>(
                stream: _streamController.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(
                      'Error: \${snapshot.error}',
                      style: TextStyle(color: Colors.red),
                    );
                  }
                  
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  }
                  
                  return Text(
                    '\${snapshot.data}',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  );
                },
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
      'title': 'FutureBuilder Example',
      'description': 'Async data loading with FutureBuilder',
      'code': '''import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late Future<String> _futureData;

  Future<String> _fetchData() async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 3));
    
    // Simulate random success/failure
    if (DateTime.now().millisecond % 2 == 0) {
      return 'Data loaded successfully!';
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    _futureData = _fetchData();
  }

  void _refreshData() {
    setState(() {
      _futureData = _fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('FutureBuilder Example'),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder<String>(
                future: _futureData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Column(
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 16),
                        Text('Loading data...'),
                      ],
                    );
                  }
                  
                  if (snapshot.hasError) {
                    return Column(
                      children: [
                        Icon(Icons.error, color: Colors.red, size: 64),
                        SizedBox(height: 16),
                        Text(
                          'Error: \${snapshot.error}',
                          style: TextStyle(color: Colors.red),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  }
                  
                  return Column(
                    children: [
                      Icon(Icons.check_circle, color: Colors.green, size: 64),
                      SizedBox(height: 16),
                      Text(
                        snapshot.data ?? 'No data',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: _refreshData,
                child: Text('Refresh Data'),
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
      'title': 'Timer Example',
      'description': 'Countdown timer with periodic updates',
      'code': '''import 'package:flutter/material.dart';
import 'dart:async';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  Timer? _timer;
  int _seconds = 60;
  bool _isRunning = false;

  void _startTimer() {
    if (_timer != null) return;
    
    setState(() {
      _isRunning = true;
    });
    
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          _stopTimer();
          _showCompletionDialog();
        }
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
    setState(() {
      _isRunning = false;
    });
  }

  void _resetTimer() {
    _stopTimer();
    setState(() {
      _seconds = 60;
    });
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Timer Complete!'),
        content: Text('The countdown has finished.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _resetTimer();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '\${minutes.toString().padLeft(2, '0')}:\${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Timer Example'),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Countdown Timer',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 32),
              Container(
                padding: EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  _formatTime(_seconds),
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                    fontFamily: 'monospace',
                  ),
                ),
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _isRunning ? null : _startTimer,
                    child: Text('Start'),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: _isRunning ? _stopTimer : null,
                    child: Text('Stop'),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: _resetTimer,
                    child: Text('Reset'),
                  ),
                ],
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
      'title': 'Navigation Example',
      'description': 'Page navigation and routing',
      'code': '''import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SecondPage()),
            );
          },
          child: Text('Go to Second Page'),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Back'),
        ),
      ),
    );
  }
}''',
    },
    {
      'title': 'Grid Layout Example',
      'description': 'Grid view with items',
      'code': '''import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Grid View'),
          backgroundColor: Colors.cyan,
        ),
        body: GridView.builder(
          padding: EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: 12,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.cyan.withOpacity(0.7),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  '\${index + 1}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
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
    {
      'title': 'Checkbox & Switch Example',
      'description': 'User input widgets',
      'code': '''import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool _isChecked = false;
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Input Widgets'),
          backgroundColor: Colors.pink,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() => _isChecked = value ?? false);
                    },
                  ),
                  Text('Checkbox'),
                ],
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Switch(
                    value: _isSwitched,
                    onChanged: (value) {
                      setState(() => _isSwitched = value);
                    },
                  ),
                  Text('Toggle'),
                ],
              ),
              SizedBox(height: 24),
              Text(
                'Checked: \$_isChecked, Switched: \$_isSwitched',
                style: TextStyle(fontSize: 16),
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
      'title': 'Card & Dialog Example',
      'description': 'Material design cards and dialogs',
      'code': '''import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cards & Dialogs'),
          backgroundColor: Colors.lime,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Icon(Icons.card_giftcard, size: 64, color: Colors.lime),
                      SizedBox(height: 16),
                      Text(
                        'Material Card',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text('This is a card with elevation'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Hello'),
                      content: Text('This is a dialog'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                child: Text('Show Dialog'),
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
      'title': 'Gradient & CustomPaint',
      'description': 'Advanced styling with gradients',
      'code': '''import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple, Colors.blue, Colors.cyan],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [Colors.yellow, Colors.orange],
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text(
                      'Gradient',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}''',
    },
    {
      'title': 'Tab Navigation Example',
      'description': 'Tab bar with multiple tabs',
      'code': '''import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Tab Navigation'),
            backgroundColor: Colors.indigo,
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home), text: 'Home'),
                Tab(icon: Icon(Icons.search), text: 'Search'),
                Tab(icon: Icon(Icons.settings), text: 'Settings'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(child: Text('Home Tab')),
              Center(child: Text('Search Tab')),
              Center(child: Text('Settings Tab')),
            ],
          ),
        ),
      ),
    );
  }
}''',
    },
    {
      'title': 'Floating Action Button Menu',
      'description': 'Advanced FAB with menu',
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
      home: Scaffold(
        appBar: AppBar(
          title: Text('FAB Menu'),
          backgroundColor: Colors.teal,
        ),
        body: Center(
          child: Text('FAB Menu Example'),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (_isExpanded) ...[
              FloatingActionButton(
                mini: true,
                onPressed: null,
                child: Icon(Icons.edit),
              ),
              SizedBox(height: 12),
              FloatingActionButton(
                mini: true,
                onPressed: null,
                child: Icon(Icons.delete),
              ),
              SizedBox(height: 12),
              FloatingActionButton(
                mini: true,
                onPressed: null,
                child: Icon(Icons.share),
              ),
              SizedBox(height: 12),
            ],
            FloatingActionButton(
              onPressed: () {
                setState(() => _isExpanded = !_isExpanded);
              },
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}''',
    },
    {
      'title': 'Snackbar & Toast Example',
      'description': 'User notifications with snackbars',
      'code': '''import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Snackbars'),
          backgroundColor: Colors.brown,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Simple Snackbar'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: Text('Show Snackbar'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Snackbar with Action'),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {},
                      ),
                    ),
                  );
                },
                child: Text('Show with Action'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}''',
    },
  ];
}
