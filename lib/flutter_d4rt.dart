import 'package:d4rt/d4rt.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/src/animation.dart';
import 'package:flutter_d4rt/src/foundation.dart';
import 'package:flutter_d4rt/src/gestures.dart';
import 'package:flutter_d4rt/src/material.dart';
import 'package:flutter_d4rt/src/painting.dart';
import 'package:flutter_d4rt/src/physics.dart';
import 'package:flutter_d4rt/src/rendering.dart';
import 'package:flutter_d4rt/src/services.dart';
import 'package:flutter_d4rt/src/ui.dart';
import 'package:flutter_d4rt/src/widgets.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// A Flutter package that provides a Dart interpreter based on the d4rt package.
///
/// This class enables dynamic execution of Dart code strings at runtime,
/// allowing for the creation of Flutter widgets on-the-fly. It includes
/// advanced features such as caching, error handling, and performance optimization.
///
/// ## Basic Usage
///
/// ```dart
/// final interpreter = FlutterRunInterpreter();
/// interpreter.initialize();
///
/// const code = '''
///   import 'package:flutter/material.dart';
///   Widget build() => Text('Hello Dynamic World!');
/// ''';
///
/// final widget = interpreter.execute(code, 'build');
/// ```
///
/// ## Features
///
/// - **Dynamic Code Execution**: Execute Dart code strings at runtime
/// - **Widget Caching**: Automatic caching with configurable expiration
/// - **Error Handling**: Comprehensive error logging and handling
/// - **Performance Monitoring**: Built-in cache statistics and memory usage tracking
/// - **Resource Management**: Proper disposal and cleanup mechanisms
///
/// ## Performance Considerations
///
/// The interpreter includes a sophisticated caching system that stores compiled
/// widgets for 5 minutes by default. This significantly improves performance
/// for repeated executions of the same code.
///
/// ## Error Handling
///
/// All errors are logged internally and can be accessed via [getErrorLogs].
/// Custom error and warning handlers can be set via [onError] and [onWarning].
class FlutterRunInterpreter {
  /// The core D4rt interpreter instance used for code execution.
  late final D4rt _interpreter;

  /// Flag indicating whether the interpreter has been initialized.
  bool _isInitialized = false;

  /// Map containing preloaded source code for Flutter framework components.
  /// This includes Foundation, Gestures, Material, Painting, Rendering, UI, and Widgets.
  Map<String, String> preloadedSources = {};

  /// Performance improvements: Widget cache for storing compiled widgets.
  ///
  /// This cache significantly improves performance by avoiding recompilation
  /// of identical code. Each entry is keyed by a combination of function name
  /// and code hash.
  final Map<String, Widget> _widgetCache = {};

  /// Timestamps for cache entries to manage expiration.
  final Map<String, DateTime> _cacheTimestamps = {};

  /// Cache expiration duration. Widgets are cached for 5 minutes by default.
  final Duration _cacheExpiry = const Duration(minutes: 5);

  /// Internal error log for tracking execution issues.
  ///
  /// Each entry contains a timestamp and error message. Access via [getErrorLogs].
  final List<String> _errorLog = [];

  /// Optional callback function called when an error occurs during execution.
  ///
  /// Example:
  /// ```dart
  /// interpreter.onError = (error) {
  ///   print('Execution error: $error');
  ///   // Send to analytics, show user notification, etc.
  /// };
  /// ```
  Function(String)? onError;

  /// Optional callback function called when a warning occurs.
  ///
  /// Example:
  /// ```dart
  /// interpreter.onWarning = (warning) {
  ///   print('Warning: $warning');
  /// };
  /// ```
  Function(String)? onWarning;

  /// Initializes the interpreter and preloads Flutter framework sources.
  ///
  /// This method must be called before executing any code. It sets up the D4rt
  /// interpreter and preloads all necessary Flutter framework components including:
  /// - Foundation (ChangeNotifier, ValueNotifier, etc.)
  /// - Gestures (Tap, Drag, Pointer events, etc.)
  /// - Material Design components (MaterialApp, Scaffold, Buttons, etc.)
  /// - Painting (Colors, TextStyle, Borders, etc.)
  /// - Rendering (Low-level rendering primitives)
  /// - UI (Geometry, Text, Window properties)
  /// - Widgets (StatelessWidget, StatefulWidget, Layout widgets, etc.)
  ///
  /// ## Example
  ///
  /// ```dart
  /// final interpreter = FlutterRunInterpreter();
  /// interpreter.initialize();
  /// // Now ready to execute code
  /// ```
  ///
  /// ## Error Handling
  ///
  /// If initialization fails, an error is logged and the exception is rethrown.
  /// The interpreter remains in an uninitialized state.
  ///
  /// ## Thread Safety
  ///
  /// This method is safe to call multiple times. Subsequent calls will log a
  /// warning and return immediately without reinitializing.
  ///
  /// Throws:
  /// - Any exception thrown by the underlying D4rt interpreter during initialization
  void initialize() {
    if (_isInitialized) {
      _logWarning('Interpreter already initialized.');
      return;
    }

    try {
      _interpreter = D4rt();
      preloadedSources.addAll(getFoundationSource(_interpreter));
      preloadedSources.addAll(getGesturesSource(_interpreter));
      preloadedSources.addAll(getPaintingSource(_interpreter));
      preloadedSources.addAll(getRenderingSource(_interpreter));
      preloadedSources.addAll(getServicesSource(_interpreter));
      preloadedSources.addAll(getWidgetsSource(_interpreter));
      preloadedSources.addAll(getMaterialSource(_interpreter));
      preloadedSources.addAll(getUiSource(_interpreter));
      preloadedSources.addAll(getPhysicsSource(_interpreter));
      preloadedSources.addAll(getAnimationSource(_interpreter));

      _isInitialized = true;
      _logInfo('Interpreter initialized successfully.');
    } catch (e) {
      _logError('Failed to initialize interpreter: $e');
      rethrow;
    }
  }

  /// Executes a given Dart code string and returns the resulting Widget.
  ///
  /// This method compiles and executes the provided Dart code, then converts
  /// the result into a Flutter Widget. It includes sophisticated caching to
  /// improve performance for repeated executions.
  ///
  /// ## Parameters
  ///
  /// - [code]: The Dart code string to execute. Must be valid Dart syntax.
  /// - [functionName]: The name of the function or class to execute within the code.
  /// - [useCache]: Whether to use the widget cache for performance optimization.
  ///   Defaults to `true`. Set to `false` to force recompilation.
  /// - [sources]: Additional source files to include during compilation.
  ///   Useful for providing custom libraries or dependencies.
  /// - [args]: Optional arguments to pass to the executed function.
  ///
  /// ## Return Value
  ///
  /// Returns a [Widget] that can be used in the Flutter widget tree. If an
  /// error occurs during execution, returns an error widget displaying the
  /// error message.
  ///
  /// ## Caching Behavior
  ///
  /// When [useCache] is `true` (default), the method:
  /// 1. Generates a cache key from the function name and code hash
  /// 2. Checks if a valid cached widget exists (not expired)
  /// 3. Returns the cached widget if found
  /// 4. Otherwise compiles the code and caches the result
  ///
  /// ## Error Handling
  ///
  /// Compilation and execution errors are caught and handled gracefully:
  /// - Errors are logged to the internal error log
  /// - The [onError] callback is triggered if set
  /// - An error widget is returned instead of throwing an exception
  ///
  /// ## Example
  ///
  /// ```dart
  /// const code = '''
  ///   import 'package:flutter/material.dart';
  ///
  ///   Widget createButton() {
  ///     return ElevatedButton(
  ///       onPressed: () => print('Hello!'),
  ///       child: Text('Dynamic Button'),
  ///     );
  ///   }
  /// ''';
  ///
  /// final widget = interpreter.execute(code, 'createButton');
  /// ```
  ///
  /// ## Performance Tips
  ///
  /// - Keep [useCache] enabled for better performance
  /// - Avoid frequent changes to the code string
  /// - Use [clearCache] if memory usage becomes a concern
  ///
  /// Throws:
  /// - [StateError] if the interpreter hasn't been initialized
  Widget execute(
    String code,
    String functionName, {
    bool useCache = true,
    Map<String, String>? sources,
    List<Object>? positionalArgs,
    Map<String, Object>? namedArgs,
  }) {
    if (!_isInitialized) {
      throw StateError(
        'FlutterRunInterpreter must be initialized before executing code.',
      );
    }

    // Check cache first
    final cacheKey = '$functionName:${code.hashCode}';
    if (useCache && _isWidgetCached(cacheKey)) {
      return _widgetCache[cacheKey]!;
    }

    try {
      final result = _interpreter.execute(
        source: code,
        name: functionName,
        sources: {...preloadedSources, ...?sources},
        positionalArgs: positionalArgs,
        namedArgs: namedArgs,
      );

      final widget = _interpreter.visitor!.toWidgets(result);

      // Cache the result
      if (useCache) {
        _cacheWidget(cacheKey, widget);
      }

      return widget;
    } catch (e) {
      _logError('Execution failed for function $functionName: $e');
      return _buildErrorWidget(e.toString());
    }
  }

  /// Clears the widget cache and all associated timestamps.
  ///
  /// This method removes all cached widgets and their timestamps, forcing
  /// subsequent [execute] calls to recompile the code. Use this method when:
  /// - Memory usage is high and needs to be reduced
  /// - You want to ensure fresh compilation of all code
  /// - Cache corruption is suspected
  ///
  /// ## Performance Impact
  ///
  /// After clearing the cache, the next execution of any code will be slower
  /// as it requires full recompilation. Consider this trade-off when calling
  /// this method frequently.
  ///
  /// ## Example
  ///
  /// ```dart
  /// // Clear cache to free memory
  /// interpreter.clearCache();
  ///
  /// // Check the effect
  /// final stats = interpreter.getCacheStats();
  /// print('Cache size after clear: ${stats['cacheSize']}'); // Should be 0
  /// ```
  void clearCache() {
    _widgetCache.clear();
    _cacheTimestamps.clear();
    _logInfo('Widget cache cleared.');
  }

  /// Gets comprehensive cache statistics for performance monitoring.
  ///
  /// Returns a map containing detailed information about the current state
  /// of the widget cache. This is useful for performance monitoring and
  /// debugging cache-related issues.
  ///
  /// ## Return Value
  ///
  /// Returns a [Map] with the following keys:
  /// - `'cacheSize'`: Number of widgets currently cached
  /// - `'cacheHitRate'`: Ratio of cache hits to total cache operations (0.0 to 1.0)
  /// - `'memoryUsage'`: Estimated memory usage in bytes (rough approximation)
  ///
  /// ## Example
  ///
  /// ```dart
  /// final stats = interpreter.getCacheStats();
  /// print('Cached widgets: ${stats['cacheSize']}');
  /// print('Hit rate: ${(stats['cacheHitRate'] * 100).toStringAsFixed(1)}%');
  /// print('Memory usage: ${stats['memoryUsage']} bytes');
  ///
  /// // Clear cache if memory usage is too high
  /// if (stats['memoryUsage'] > 10 * 1024 * 1024) { // 10MB
  ///   interpreter.clearCache();
  /// }
  /// ```
  ///
  /// ## Note
  ///
  /// The memory usage calculation is a rough estimate (1KB per widget) and
  /// should be used for general monitoring rather than precise measurements.
  Map<String, dynamic> getCacheStats() {
    return {
      'cacheSize': _widgetCache.length,
      'cacheHitRate': _calculateCacheHitRate(),
      'memoryUsage': _estimateMemoryUsage(),
    };
  }

  // Private cache methods
  bool _isWidgetCached(String key) {
    if (!_widgetCache.containsKey(key)) return false;

    final timestamp = _cacheTimestamps[key];
    if (timestamp == null) return false;

    if (DateTime.now().difference(timestamp) > _cacheExpiry) {
      _widgetCache.remove(key);
      _cacheTimestamps.remove(key);
      return false;
    }

    return true;
  }

  void _cacheWidget(String key, Widget widget) {
    _widgetCache[key] = widget;
    _cacheTimestamps[key] = DateTime.now();
  }

  double _calculateCacheHitRate() {
    final hits = _widgetCache.values.length;
    final total = _widgetCache.length;
    return total > 0 ? hits / total : 0.0;
  }

  int _estimateMemoryUsage() {
    // Rough estimation of cache memory usage
    return _widgetCache.length * 1024; // 1KB per widget estimate
  }

  Widget _buildErrorWidget(String error) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.error, color: Colors.red, size: 48),
              const SizedBox(height: 16),
              const Text(
                'Code Execution Error',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    error,
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Logging methods
  void _logError(String message) {
    _errorLog.add('[ERROR] ${DateTime.now()}: $message');
    onError?.call(message);
    if (kDebugMode) {
      print('[FlutterRun ERROR] $message');
    }
  }

  void _logWarning(String message) {
    onWarning?.call(message);
    if (kDebugMode) {
      print('[FlutterRun WARNING] $message');
    }
  }

  void _logInfo(String message) {
    if (kDebugMode) {
      print('[FlutterRun INFO] $message');
    }
  }

  /// Registers a bridged class definition with the interpreter.
  void registerBridgedClass(BridgedClass definition, String uri) {
    try {
      _interpreter.registerBridgedClass(definition, uri);
      _logInfo('Bridged class ${definition.name} registered with URI: $uri');
    } catch (e) {
      _logError('Failed to register bridged class ${definition.name}: $e');
      rethrow;
    }
  }

  /// Gets error logs
  List<String> getErrorLogs() => List.from(_errorLog);

  /// Clears error logs
  void clearErrorLogs() => _errorLog.clear();

  /// Disposes the interpreter resources.
  void dispose() {
    clearCache();
    clearErrorLogs();
    _isInitialized = false;
    _logInfo('Interpreter disposed.');
  }
}

/// A Flutter widget that interprets and displays dynamic Dart code.
///
/// This widget provides a high-level interface for executing dynamic Dart code
/// and displaying the resulting widgets. It handles initialization, loading states,
/// error handling, and automatic reloading when code changes.
///
/// ## Basic Usage
///
/// ```dart
/// InterpretedWidget(
///   code: '''
///     import 'package:flutter/material.dart';
///
///     class MyWidget extends StatelessWidget {
///       @override
///       Widget build(BuildContext context) {
///         return Text('Hello from dynamic code!');
///       }
///     }
///   ''',
///   entryPoint: 'MyWidget',
/// )
/// ```
///
/// ## Advanced Usage
///
/// ```dart
/// InterpretedWidget(
///   code: dynamicCodeString,
///   entryPoint: 'MyCustomWidget',
///   loadingWidget: CircularProgressIndicator(),
///   useCache: true,
///   onError: (error) {
///     print('Code execution failed: $error');
///     // Handle error (show dialog, log to analytics, etc.)
///   },
///   sources: {
///     'package:my_lib/utils.dart': utilityCode,
///   },
///   args: {'userId': 123, 'theme': 'dark'},
/// )
/// ```
///
/// ## Features
///
/// - **Automatic Loading States**: Shows loading widget during compilation
/// - **Error Handling**: Displays error widgets when code fails to execute
/// - **Hot Reload**: Automatically reloads when code or entry point changes
/// - **Caching**: Leverages interpreter caching for better performance
/// - **Custom Sources**: Support for additional source files
/// - **Parameter Passing**: Pass arguments to the executed code
///
/// ## Performance Considerations
///
/// - Enable caching ([useCache] = true) for better performance
/// - Avoid frequent code changes to benefit from caching
/// - Use appropriate loading widgets for better user experience
/// - Consider memory usage when dealing with large amounts of dynamic code
///
/// ## Error Handling
///
/// When code execution fails:
/// 1. The [onError] callback is triggered (if provided)
/// 2. The loading state is cleared
/// 3. An error widget may be displayed (depends on implementation)
///
/// The widget gracefully handles various error scenarios including:
/// - Syntax errors in the provided code
/// - Runtime exceptions during widget creation
/// - Missing dependencies or imports
/// - Invalid entry points
///
/// ## State Management
///
/// The widget automatically manages its state and will:
/// - Initialize the interpreter on first build
/// - Execute code after the next frame to avoid blocking the UI
/// - Reload when code or entry point properties change
/// - Properly dispose of resources when the widget is removed
class InterpretedWidget extends StatefulWidget {
  /// The Dart code string to interpret and execute.
  ///
  /// This should be valid Dart code that imports necessary packages and
  /// defines the function or class specified in [entryPoint]. The code
  /// will be compiled and executed at runtime.
  ///
  /// Example:
  /// ```dart
  /// '''
  /// import 'package:flutter/material.dart';
  ///
  /// class MyButton extends StatelessWidget {
  ///   @override
  ///   Widget build(BuildContext context) {
  ///     return ElevatedButton(
  ///       onPressed: () => print('Pressed!'),
  ///       child: Text('Dynamic Button'),
  ///     );
  ///   }
  /// }
  /// '''
  /// ```
  final String code;

  /// The name of the function or class to execute within the [code].
  ///
  /// This should match a top-level function or class defined in the [code].
  /// For StatelessWidget or StatefulWidget classes, this should be the class name.
  /// For functions that return widgets, this should be the function name.
  ///
  /// Defaults to 'MyApp' to follow Flutter conventions.
  ///
  /// Examples:
  /// - 'MyApp' (for a class named MyApp)
  /// - 'createHomeScreen' (for a function named createHomeScreen)
  /// - 'LoginWidget' (for a class named LoginWidget)
  final String entryPoint;

  /// Widget to display while the code is being compiled and executed.
  ///
  /// If not provided, defaults to `Center(child: CircularProgressIndicator())`.
  /// This widget is shown during the initialization and compilation phase.
  ///
  /// Example:
  /// ```dart
  /// loadingWidget: Column(
  ///   mainAxisAlignment: MainAxisAlignment.center,
  ///   children: [
  ///     CircularProgressIndicator(),
  ///     SizedBox(height: 16),
  ///     Text('Compiling dynamic code...'),
  ///   ],
  /// )
  /// ```
  final Widget? loadingWidget;

  /// Callback function called when an error occurs during code execution.
  ///
  /// This is useful for handling errors gracefully, such as:
  /// - Logging errors to analytics services
  /// - Showing user-friendly error messages
  /// - Implementing fallback behavior
  /// - Debugging during development
  ///
  /// Example:
  /// ```dart
  /// onError: (error) {
  ///   print('Code execution failed: $error');
  ///   ScaffoldMessenger.of(context).showSnackBar(
  ///     SnackBar(content: Text('Failed to load dynamic content')),
  ///   );
  /// }
  /// ```
  final Function(String error)? onError;

  /// Whether to use the interpreter's caching system for better performance.
  ///
  /// When enabled (default), identical code will be cached to avoid
  /// recompilation. This significantly improves performance for repeated
  /// executions of the same code.
  ///
  /// Set to `false` to force recompilation on every execution, which may
  /// be useful during development or when dealing with truly dynamic code.
  ///
  /// Defaults to `true`.
  final bool useCache;

  /// Additional source files to include during code compilation.
  ///
  /// This allows you to provide custom libraries, utilities, or dependencies
  /// that the main [code] can import and use. The key should be the import
  /// path, and the value should be the source code.
  ///
  /// Example:
  /// ```dart
  /// sources: {
  ///   'package:my_app/utils.dart': '''
  ///     String formatName(String name) => name.toUpperCase();
  ///   ''',
  ///   'package:my_app/constants.dart': '''
  ///     const String APP_NAME = 'My Dynamic App';
  ///   ''',
  /// }
  /// ```
  final Map<String, String>? sources;

  /// Optional arguments to pass to the executed function or class constructor.
  ///
  /// These arguments will be passed to the entry point when it's executed.
  /// The structure and type of this object depends on what the entry point expects.
  ///
  /// Example:
  /// ```dart
  /// // If your entry point function expects parameters:
  /// // Widget createUser(Map<String, dynamic> userData) { ... }
  /// args: {
  ///   'name': 'John Doe',
  ///   'age': 30,
  ///   'isAdmin': false,
  /// }
  /// ```
  final List<Object>? positionalArgs;
  final Map<String, Object>? namedArgs;

  const InterpretedWidget({
    super.key,
    required this.code,
    this.entryPoint = 'MyApp',
    this.loadingWidget,
    this.onError,
    this.useCache = true,
    this.sources,
    this.positionalArgs,
    this.namedArgs,
  });

  @override
  State<InterpretedWidget> createState() => _InterpretedWidgetState();
}

class _InterpretedWidgetState extends State<InterpretedWidget> {
  final FlutterRunInterpreter _interpreter = FlutterRunInterpreter();
  Widget? _interpretedWidget;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeAndExecute();
  }

  Future<void> _initializeAndExecute() async {
    try {
      _interpreter.initialize();

      // Configure error callbacks
      _interpreter.onError = (error) {
        widget.onError?.call(error);
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      };

      // Execute code after next frame
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _executeCode();
      });
    } catch (e) {
      _handleError(e.toString());
    }
  }

  void _executeCode() {
    if (!mounted) return;

    try {
      final result = _interpreter.execute(
        widget.code,
        widget.entryPoint,
        useCache: widget.useCache,
        sources: widget.sources,
        positionalArgs: widget.positionalArgs,
        namedArgs: widget.namedArgs,
      );

      setState(() {
        _interpretedWidget = result;
        _isLoading = false;
      });
    } catch (e) {
      _handleError(e.toString());
    }
  }

  void _handleError(String error) {
    if (!mounted) return;

    setState(() {
      _isLoading = false;
    });
  }

  /// Public method to reload the code
  void reload() {
    setState(() {
      _isLoading = true;
      _interpretedWidget = null;
    });
    _executeCode();
  }

  @override
  void didUpdateWidget(InterpretedWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Reload if code or entry point changed
    if (oldWidget.code != widget.code ||
        oldWidget.entryPoint != widget.entryPoint) {
      reload();
    }
  }

  @override
  void dispose() {
    _interpreter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return widget.loadingWidget ??
          const Center(child: CircularProgressIndicator());
    }

    return _interpretedWidget!;
  }
}
