# Changelog

## [0.0.6] - 2026-02-22

### Added

#### Enhanced DartPad Clone Example
- **Code History Management**: Full undo/redo functionality (Cmd+Z / Ctrl+Z)
  - Complete history stack with navigation
  - Redo support (Cmd+Shift+Z / Ctrl+Shift+Z)
  - Visual history status indicator
  - Automatic history tracking on every change

- **Advanced Search & Replace**: Comprehensive find and replace system
  - Find & Replace dialog (Cmd+F / Ctrl+F)
  - Next/Previous navigation between search results
  - Match counter showing current position (N/Total)
  - Replace All functionality for bulk replacements
  - Automatic result highlighting and selection

- **Settings Panel**: Customizable editor preferences
  - Dynamic font size adjustment (10-32pt range with +/- controls)
  - Word wrap toggle for flexible text wrapping
  - Line numbers visibility toggle
  - Real-time editor updates with visual feedback

- **Real-time Statistics**: Code analysis display in status bar
  - Line count tracking
  - Word count calculation
  - Character count monitoring
  - Live updates on every keystroke

- **Code Export Options**: Multiple export formats
  - Copy to clipboard (Cmd+S / Ctrl+S)
  - Export as Plain Text
  - Export as JSON format
  - One-click export with confirmation

- **Comprehensive Keyboard Shortcuts**:
  - Cmd/Ctrl+Enter: Run code
  - Cmd/Ctrl+Z: Undo
  - Cmd/Ctrl+Shift+Z: Redo
  - Cmd/Ctrl+F: Find & Replace
  - Cmd/Ctrl+Shift+F: Format code
  - Cmd/Ctrl+S: Save/Copy code

- **16 Code Samples** for learning and quick starts:
  - Hello World - Simple text display
  - Counter App - Stateful widget example
  - ListView Example - Scrollable list with builder
  - Form Example - Input forms with validation
  - Animated Container - Smooth animations
  - StreamBuilder Example - Real-time data streams
  - FutureBuilder Example - Asynchronous data loading
  - Timer Example - Countdown timer with controls
  - Navigation Example - Page routing and navigation
  - Grid Layout Example - Responsive grid view
  - Checkbox & Switch Example - Input controls
  - Card & Dialog Example - Material Design components
  - Gradient & CustomPaint - Advanced styling with gradients
  - Tab Navigation Example - Tabbed interface
  - Floating Action Button Menu - Expandable FAB menu
  - Snackbar & Toast Example - User notifications

- **Enhanced Editor Features**:
  - Dynamic line number sizing based on font size
  - Flexible word wrap options
  - Improved code formatting with better brace handling
  - Smart indentation detection (up to 100 levels)
  - Automatic formatting history tracking

- **Improved Toolbar**:
  - 15+ action buttons with clear tooltips
  - Status indicators (Running/Ready/Error)
  - Split layout toggle (horizontal/vertical)
  - Organized action groups
  - Material 3 design compliance

- **Better Error Handling**:
  - Try-catch blocks with descriptive messages
  - User-friendly error notifications
  - Error state indication in status bar
  - Error details in separate panel below editor

#### Widget Bridging Improvements
- **Callback Handling Refactor**: Fixed premature callback execution
  - Callbacks now execute only on user interaction, not widget creation
  - Eliminated unwanted print statements during widget initialization
  - Improved InterpretedFunction callback wrapping
  - Better closure handling in button and gesture widgets

- **New Widget Bridging Definitions**: Added support for additional Flutter widgets
  - Enhanced existing widget bridges with better parameter handling
  - Improved type safety in callback definitions
  - More consistent method signatures across bridges
  - Better support for nested widget hierarchies

### Technical Improvements

#### Code Quality
- **Callback System**: Refactored VoidCallback handling to prevent early execution
- **Widget Bridging**: Improved consistency across all widget bridge definitions
- **Error Messages**: More descriptive and actionable error reporting
- **Code Organization**: Better structured example code with comprehensive comments

#### Performance
- **Editor Responsiveness**: Optimized real-time statistics calculations
- **Search Performance**: Efficient string matching algorithm for large documents
- **History Management**: Memory-efficient history stack implementation
- **Widget Initialization**: Faster widget creation with fixed callback system

#### Developer Experience
- **Documentation**: Added inline comments explaining complex features
- **Example Quality**: High-quality, well-commented code samples
- **Tooltip Clarity**: Enhanced tooltips with keyboard shortcut information
- **Feedback System**: Immediate visual feedback for all user actions

### Bug Fixes
- Fixed callback printing issue in ElevatedButton and other interactive widgets
- Corrected premature InterpretedFunction execution on widget creation
- Improved parameter validation in widget bridge constructors
- Fixed line number height calculation with dynamic font sizes
- Better error state management across editor operations

### Breaking Changes
- None

### Deprecations
- None

## [0.0.5] - 2025-09-11

- update d4rt dependency to version 0.1.5

## [0.0.4] - 2025-08-27

### Added

#### Complete Animation System Support
- **Animation Controllers**: Full AnimationController bridge with comprehensive TickerProvider support
  - Support for both bounded and unbounded controllers
  - Complete animation lifecycle management (forward, reverse, reset, stop, toggle)
  - Animation targeting, repetition, and spring-based animations
  - Proper disposal and resource management
  - Integration with interpreted TickerProvider instances

- **Animation Curves**: Comprehensive curve system with 18+ curve types
  - Basic curves: Linear, Cubic, ThreePointCubic, SawTooth
  - Interval and timing curves: Interval, Split, Threshold
  - Transform curves: FlippedCurve for reversing animations
  - Elastic curves: ElasticInCurve, ElasticOutCurve, ElasticInOutCurve
  - Spline curves: CatmullRomCurve, CatmullRomSpline with full 2D support
  - Complete Curves static class with 35+ predefined curves (easeIn, easeOut, bounce, etc.)

- **Animation Styles**: Advanced animation configuration system
  - Duration and reverse duration support
  - Custom curve and reverse curve configuration
  - Animation interpolation and style copying
  - Integration with Material Design animation standards

#### Physics System Foundation
- **Simulation Framework**: Complete physics simulation support
  - Base Simulation class with position, velocity, and completion detection
  - SpringSimulation with comprehensive spring physics
  - SpringDescription for customizable spring behavior
  - Tolerance system for animation precision control
  - Support for custom physics simulations in AnimationController

#### Enhanced Painting System
- **Gradient System**: Native Flutter gradient support with advanced features
  - LinearGradient, RadialGradient, SweepGradient with full API coverage
  - GradientTransform and GradientRotation for dynamic transformations
  - Complete color stop and tile mode support
  - Integration with shader creation and opacity modulation

- **Custom Painting**: Advanced CustomPainter bridge system


#### Material Design Extensions
- **Icon System**: Comprehensive icon support with 100+ Material icons
  - Navigation icons (arrows, chevrons, menu, home)
  - Action icons (edit, delete, save, search, settings)
  - Status icons (favorite, share, refresh, check, warning)
  - Organized icon categories for better discoverability

- **Theme System**: Enhanced theme and color support
  - MaterialColor and MaterialAccentColor with shade variants
  - Complete color palette with accent colors
  - Theme integration with animation and styling systems

### Technical Improvements

#### Bridge Architecture
- **Type Safety**: Enhanced type conversion system with `toDouble` utility
- **Method Signatures**: Updated all bridge methods to use consistent parameter patterns
- **Error Handling**: Improved error messages and runtime exception handling
- **Performance**: Optimized bridge registration and method lookup

#### Code Organization
- **Modular Structure**: Organized animation system into focused modules
- **Registration System**: Centralized bridge registration for animation components
- **Documentation**: Comprehensive documentation for all new animation features
- **Testing**: Enhanced test coverage for animation and physics systems

### Framework Integration

#### Animation Package Support
- Complete `package:flutter/animation.dart` export support
- Physics integration via `package:flutter/physics.dart`
- Seamless integration with existing widget animation system
- Support for custom animation curves and controllers in interpreted code

#### Rendering System
- Enhanced rendering bridge support for custom painting
- Improved layout and positioning calculations
- Better integration with Flutter's rendering pipeline
- Support for complex visual effects and animations

### Performance Enhancements
- **Optimized Animation**: Efficient animation controller management
- **Memory Management**: Proper disposal of animation resources
- **Bridge Efficiency**: Reduced overhead in method invocation
- **Cache Integration**: Animation-aware caching for better performance

### Developer Experience
- **Comprehensive Examples**: Animation examples in DartPad clone
- **Error Messages**: Clear error messages for animation configuration issues
- **Documentation**: Detailed API documentation for all animation features
- **IDE Support**: Better code completion and type inference

### Breaking Changes
- Animation bridge method signatures updated to use consistent parameter patterns
- CustomPainter bridge now requires explicit instance parameter
- Some deprecated color methods replaced with newer alternatives

### Bug Fixes
- Fixed protected member access issues in curve implementations
- Improved TickerProvider wrapper for interpreted instances
- Enhanced parameter validation in animation constructors
- Corrected type conversions in physics simulations

## [0.0.3] - 2025-08-25

- feat: Add StreamBuilder, FutureBuilder, and Timer examples to DartPad clone
- fix: Update d4rt dependency version to ^0.1.4, enhance icon support in Flutter, fix StreamBuilder and FutureBuilder bridge

## [0.0.2] - 2025-08-04

- Add counter example
- Refactor widget bridging definitions to use a centralized `toDouble` utility function for type conversion
- Updated all widget bridging functions to return BridgedClass.
- Enhanced type safety by specifying dynamic types in named arguments.

## [0.0.1] - 2025-07-10

### Added

#### Core Features
- **FlutterRunInterpreter**: Main interpreter class for dynamic Dart code execution
- **InterpretedWidget**: High-level widget for easy integration of dynamic code
- **Dynamic Widget Creation**: Convert Dart code strings to Flutter widgets at runtime
- **Comprehensive Widget Support**: Full support for Material Design and Flutter core widgets

#### Performance Features
- **Intelligent Caching**: Automatic widget caching with 5-minute expiration
- **Cache Management**: Methods to clear cache and get performance statistics
- **Memory Optimization**: Efficient memory usage with automatic cache cleanup
- **Performance Monitoring**: Built-in cache hit rate and memory usage tracking

#### Developer Experience
- **Error Handling**: Robust error handling with detailed logging
- **Custom Error Callbacks**: Configurable error and warning handlers
- **Hot Reload Support**: Automatic reloading when code changes
- **Loading States**: Customizable loading widgets during compilation
- **Debug Logging**: Comprehensive logging for development and debugging

#### Framework Integration
- **Foundation Support**: ChangeNotifier, ValueNotifier, and state management
- **Gesture System**: Complete gesture recognition and handling
- **Material Design**: Full Material Design component library
- **Painting System**: Colors, borders, text styles, and decorations
- **Layout Widgets**: Row, Column, Stack, Container, and positioning
- **UI Primitives**: Low-level UI components and geometry

#### Advanced Features
- **Custom Sources**: Support for additional source files and dependencies
- **Parameter Passing**: Pass arguments to executed functions and constructors
- **Resource Management**: Proper disposal and cleanup of interpreter resources
- **Thread Safety**: Safe initialization and execution in Flutter environment

### Framework Components

#### Supported Widget Categories
- **Material Components**: MaterialApp, Scaffold, AppBar, Buttons, Cards, etc.
- **Layout Widgets**: Container, Row, Column, Stack, Padding, Center, etc.
- **Input Widgets**: TextField, Checkbox, Radio, Switch, Slider, etc.
- **Display Widgets**: Text, Icon, Image, Card, Chip, etc.
- **Navigation**: BottomNavigationBar, Tabs, Drawer, PageView, etc.
- **Scrolling**: ListView, GridView, ScrollView, etc.
- **State Management**: StatelessWidget, StatefulWidget, ChangeNotifier, etc.

#### Supported Packages
- `package:flutter/material.dart` - Complete Material Design library
- `package:flutter/widgets.dart` - Core Flutter widgets
- `package:flutter/foundation.dart` - Foundation classes and utilities
- `package:flutter/gestures.dart` - Gesture recognition system
- `package:flutter/painting.dart` - Painting and styling
- `package:flutter/rendering.dart` - Low-level rendering
- `dart:ui` - UI primitives and geometry

### Documentation
- **Comprehensive README**: Complete user guide with examples
- **API Documentation**: Detailed dartdoc comments for all public APIs
- **Usage Examples**: Multiple examples from basic to advanced usage
- **Performance Guidelines**: Best practices for optimal performance
- **Error Handling Guide**: Comprehensive error handling strategies

### Testing
- **Unit Tests**: Core functionality testing
- **Widget Tests**: UI component testing
- **Integration Tests**: End-to-end testing scenarios
- **Performance Tests**: Cache and memory usage testing

### Example Application
- **Full Demo App**: Complete example showcasing all features
- **Theme Management**: Dynamic theme switching demonstration
- **State Management**: ChangeNotifier and state management examples
- **Complex UI**: Advanced Material Design implementation
- **Performance Demo**: Caching and performance optimization examples

### Known Limitations
- **Security**: Dynamic code execution requires careful input validation
- **Performance**: Initial compilation may be slower than static widgets
- **Debugging**: Limited debugging support for dynamic code
- **Platform**: Currently optimized for mobile platforms

### Dependencies
- `d4rt: ^0.0.9` - Core Dart interpreter
- `flutter: >=1.17.0` - Flutter framework
- `sdk: ^3.8.1` - Dart SDK requirement

