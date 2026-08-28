import 'package:d4rt/d4rt.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';

/// Returns the BridgedClass for the Flutter Border class.
BridgedClass getBorderBridgingDefinition() {
  return BridgedClass(
    nativeType: Border,
    name: 'Border',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final top = namedArgs.get<BorderSide?>('top') ?? BorderSide.none;
        final right = namedArgs.get<BorderSide?>('right') ?? BorderSide.none;
        final bottom = namedArgs.get<BorderSide?>('bottom') ?? BorderSide.none;
        final left = namedArgs.get<BorderSide?>('left') ?? BorderSide.none;
        return Border(top: top, right: right, bottom: bottom, left: left);
      },
      'all': (visitor, positionalArgs, namedArgs) {
        final color = namedArgs.get<Color?>('color') ?? const Color(0xFF000000);
        final width = namedArgs.getToDouble('width') ?? 1.0;
        final style = namedArgs.get<BorderStyle?>('style') ?? BorderStyle.solid;
        final strokeAlign =
            namedArgs.getToDouble('strokeAlign') ??
            BorderSide.strokeAlignInside;
        return Border.all(
          color: color,
          width: width,
          style: style,
          strokeAlign: strokeAlign,
        );
      },
      'symmetric': (visitor, positionalArgs, namedArgs) {
        final vertical =
            namedArgs.get<BorderSide?>('vertical') ?? BorderSide.none;
        final horizontal =
            namedArgs.get<BorderSide?>('horizontal') ?? BorderSide.none;
        return Border.symmetric(vertical: vertical, horizontal: horizontal);
      },
    },
    getters: {
      'top': (visitor, target) => (target as Border).top,
      'right': (visitor, target) => (target as Border).right,
      'bottom': (visitor, target) => (target as Border).bottom,
      'left': (visitor, target) => (target as Border).left,
      'isUniform': (visitor, target) => (target as Border).isUniform,
    },
  );
}

BridgedEnumDefinition getBoxShapeBridgingDefinition() {
  return BridgedEnumDefinition<BoxShape>(
    name: 'BoxShape',
    values: BoxShape.values,
    getters: {
      'name': (visitor, target) => (target as BoxShape).name,
      'index': (visitor, target) => (target as BoxShape).index,
    },
  );
}

/// Returns the BridgedClass for the Flutter BoxBorder abstract class.
BridgedClass getBoxBorderBridgingDefinition() {
  return BridgedClass(
    nativeType: BoxBorder,
    name: 'BoxBorder',
    constructors: {},
    isSubtypeOfFunc: (value) => value is BoxBorder,
  );
}

