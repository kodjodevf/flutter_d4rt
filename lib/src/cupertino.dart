import 'package:d4rt/d4rt.dart';
import 'package:flutter_d4rt/src/cupertino/cupertino.dart';

/// Provides Cupertino Design source code and bridge registrations for the Flutter D4rt interpreter.
///
/// Parameters:
/// - [interpreter]: The D4rt interpreter instance to configure
///
/// Returns:
/// - A map containing the Cupertino Design source code exports and dependencies
Map<String, String> getCupertinoSource(D4rt interpreter) {
  registerCupertinoBridges(interpreter);
  return {
    'package:flutter/cupertino.dart': '''
     export 'package:flutter/cupertino_.dart';
     export 'package:flutter/widgets.dart';
     export 'package:flutter/foundation.dart';
     export 'dart:ui';
    ''',
  };
}
