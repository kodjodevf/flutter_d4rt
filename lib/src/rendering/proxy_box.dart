import 'package:d4rt/d4rt.dart';
import 'package:flutter/rendering.dart';

BridgedEnumDefinition getDecorationPositionBridgingDefinition() {
  return BridgedEnumDefinition<DecorationPosition>(
    name: 'DecorationPosition',
    values: DecorationPosition.values,
    getters: {
      'name': (visitor, target) => (target as DecorationPosition).name,
      'index': (visitor, target) => (target as DecorationPosition).index,
    },
  );
}

/// Returns the BridgedClass for BoxConstraints
BridgedClass getBoxConstraintsBridgingDefinition() {
  return BridgedClass(
    nativeType: BoxConstraints,
    name: 'BoxConstraints',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final minWidth = (namedArgs['minWidth'] as num?)?.toDouble() ?? 0.0;
        final maxWidth =
            (namedArgs['maxWidth'] as num?)?.toDouble() ?? double.infinity;
        final minHeight = (namedArgs['minHeight'] as num?)?.toDouble() ?? 0.0;
        final maxHeight =
            (namedArgs['maxHeight'] as num?)?.toDouble() ?? double.infinity;
        return BoxConstraints(
          minWidth: minWidth,
          maxWidth: maxWidth,
          minHeight: minHeight,
          maxHeight: maxHeight,
        );
      },
      'tight': (visitor, positionalArgs, namedArgs) {
        final size = positionalArgs[0] as Size;
        return BoxConstraints.tight(size);
      },
      'tightFor': (visitor, positionalArgs, namedArgs) {
        final width = (namedArgs['width'] as num?)?.toDouble();
        final height = (namedArgs['height'] as num?)?.toDouble();
        return BoxConstraints.tightFor(width: width, height: height);
      },
      'tightForFinite': (visitor, positionalArgs, namedArgs) {
        final width =
            (namedArgs['width'] as num?)?.toDouble() ?? double.infinity;
        final height =
            (namedArgs['height'] as num?)?.toDouble() ?? double.infinity;
        return BoxConstraints.tightForFinite(width: width, height: height);
      },
      'loose': (visitor, positionalArgs, namedArgs) {
        final size = positionalArgs[0] as Size;
        return BoxConstraints.loose(size);
      },
      'expand': (visitor, positionalArgs, namedArgs) {
        final width = (namedArgs['width'] as num?)?.toDouble();
        final height = (namedArgs['height'] as num?)?.toDouble();
        return BoxConstraints.expand(width: width, height: height);
      },
    },
    getters: {
      'minWidth': (visitor, target) => (target as BoxConstraints).minWidth,
      'maxWidth': (visitor, target) => (target as BoxConstraints).maxWidth,
      'minHeight': (visitor, target) => (target as BoxConstraints).minHeight,
      'maxHeight': (visitor, target) => (target as BoxConstraints).maxHeight,
      'biggest': (visitor, target) => (target as BoxConstraints).biggest,
      'smallest': (visitor, target) => (target as BoxConstraints).smallest,
      'hasBoundedWidth': (visitor, target) =>
          (target as BoxConstraints).hasBoundedWidth,
      'hasBoundedHeight': (visitor, target) =>
          (target as BoxConstraints).hasBoundedHeight,
      'hasInfiniteWidth': (visitor, target) =>
          (target as BoxConstraints).hasInfiniteWidth,
      'hasInfiniteHeight': (visitor, target) =>
          (target as BoxConstraints).hasInfiniteHeight,
      'isTight': (visitor, target) => (target as BoxConstraints).isTight,
      'isNormalized': (visitor, target) =>
          (target as BoxConstraints).isNormalized,
    },
    methods: {
      'constrain': (visitor, target, positionalArgs, namedArgs) {
        final size = positionalArgs[0] as Size;
        return (target as BoxConstraints).constrain(size);
      },
      'constrainWidth': (visitor, target, positionalArgs, namedArgs) {
        final width =
            (positionalArgs[0] as num?)?.toDouble() ?? double.infinity;
        return (target as BoxConstraints).constrainWidth(width);
      },
      'constrainHeight': (visitor, target, positionalArgs, namedArgs) {
        final height =
            (positionalArgs[0] as num?)?.toDouble() ?? double.infinity;
        return (target as BoxConstraints).constrainHeight(height);
      },
    },
    isSubtypeOfFunc: (value) => value is BoxConstraints,
  );
}

