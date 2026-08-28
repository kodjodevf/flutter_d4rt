import 'package:d4rt/d4rt.dart';
import 'package:flutter_d4rt/src/painting/basic_types.dart';
import 'package:flutter_d4rt/src/painting/border_radius.dart';
import 'package:flutter_d4rt/src/painting/borders.dart';
import 'package:flutter_d4rt/src/painting/box_border.dart';
import 'package:flutter_d4rt/src/painting/box_decoration.dart';
import 'package:flutter_d4rt/src/painting/edge_insets.dart';
import 'package:flutter_d4rt/src/painting/gradient.dart';
import 'package:flutter_d4rt/src/painting/shadow.dart';
import 'package:flutter_d4rt/src/painting/text_style.dart';

void registerPaintingBridges(D4rt interpreter) {
  interpreter.registerBridgedEnum(
    getVerticalDirectionBridgingDefinition(),
    'package:flutter/painting_.dart',
  );
  interpreter.registerBridgedEnum(
    getBorderStyleBridgingDefinition(),
    'package:flutter/painting_.dart',
  );
  interpreter.registerBridgedEnum(
    getBlurStyleBridgingDefinition(),
    'package:flutter/painting_.dart',
  );
  interpreter.registerBridgedClass(
    getShadowBridgingDefinition(),
    'package:flutter/painting_.dart',
  );
  interpreter.registerBridgedClass(
    getBoxShadowBridgingDefinition(),
    'package:flutter/painting_.dart',
  );
  interpreter.registerBridgedClass(
    getBorderRadiusBridgingDefinition(),
    'package:flutter/painting_.dart',
  );
  interpreter.registerBridgedClass(
    getBorderRadiusGeometryBridgingDefinition(),
    'package:flutter/painting_.dart',
  );
  interpreter.registerBridgedClass(
    getBorderRadiusDirectionalBridgingDefinition(),
    'package:flutter/painting_.dart',
  );
  interpreter.registerBridgedClass(
    getBorderSideBridgingDefinition(),
    'package:flutter/painting_.dart',
  );
  interpreter.registerBridgedClass(
    getShapeBorderBridgingDefinition(),
    'package:flutter/painting_.dart',
  );
  interpreter.registerBridgedClass(
    getOutlinedBorderBridgingDefinition(),
    'package:flutter/painting_.dart',
  );
  interpreter.registerBridgedClass(
    getRoundedRectangleBorderBridgingDefinition(),
    'package:flutter/painting_.dart',
  );
  interpreter.registerBridgedClass(
    getStadiumBorderBridgingDefinition(),
    'package:flutter/painting_.dart',
  );
  interpreter.registerBridgedClass(
    getBeveledRectangleBorderBridgingDefinition(),
    'package:flutter/painting_.dart',
  );
  interpreter.registerBridgedClass(
    getContinuousRectangleBorderBridgingDefinition(),
    'package:flutter/painting_.dart',
  );
  interpreter.registerBridgedClass(
    getCircleBorderBridgingDefinition(),
    'package:flutter/painting_.dart',
  );
  interpreter.registerBridgedClass(
    getBoxBorderBridgingDefinition(),
    'package:flutter/painting_.dart',
  );
  interpreter.registerBridgedClass(
    getBorderBridgingDefinition(),
    'package:flutter/painting_.dart',
  );
  interpreter.registerBridgedClass(
    getBoxDecorationBridgingDefinition(),
    'package:flutter/painting_.dart',
  );
  interpreter.registerBridgedClass(
    getEdgeInsetsBridgingDefinition(),
    'package:flutter/painting_.dart',
  );
  interpreter.registerBridgedClass(
    getEdgeInsetsDirectionalBridgingDefinition(),
    'package:flutter/painting_.dart',
  );
  interpreter.registerBridgedClass(
    getEdgeInsetsGeometryBridgingDefinition(),
    'package:flutter/painting_.dart',
  );
  interpreter.registerBridgedClass(
    getTextStyleBridgingDefinition(),
    'package:flutter/painting_.dart',
  );
  interpreter.registerBridgedEnum(
    getAxisBridgingDefinition(),
    'package:flutter/painting_.dart',
  );
  interpreter.registerBridgedEnum(
    getBoxShapeBridgingDefinition(),
    'package:flutter/painting_.dart',
  );

  // Register gradient bridges
  final gradientBridges = getGradientBridgingDefinitions();
  gradientBridges.forEach((name, bridge) {
    interpreter.registerBridgedClass(bridge, 'package:flutter/painting_.dart');
  });
}
