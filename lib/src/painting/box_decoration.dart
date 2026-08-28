import 'package:d4rt/d4rt.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for the Flutter BoxDecoration class.
BridgedClass getBoxDecorationBridgingDefinition() {
  return BridgedClass(
    nativeType: BoxDecoration,
    name: 'BoxDecoration',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final color = namedArgs.get<Color?>('color');
        final image = namedArgs.get<DecorationImage?>('image');
        final border = namedArgs.get<BoxBorder?>('border');
        final borderRadius = namedArgs.get<BorderRadiusGeometry?>(
          'borderRadius',
        );
        final boxShadowRaw = visitor.toElements(namedArgs['boxShadow']);
        final List<BoxShadow>? boxShadow = boxShadowRaw is List
            ? boxShadowRaw.whereType<BoxShadow>().toList()
            : (boxShadowRaw is BoxShadow ? [boxShadowRaw] : null);
        final gradient = namedArgs.get<Gradient?>('gradient');
        final backgroundBlendMode = namedArgs.get<BlendMode?>(
          'backgroundBlendMode',
        );
        final shape = namedArgs.get<BoxShape?>('shape') ?? BoxShape.rectangle;

        return BoxDecoration(
          color: color,
          image: image,
          border: border,
          borderRadius: borderRadius,
          boxShadow: boxShadow,
          gradient: gradient,
          backgroundBlendMode: backgroundBlendMode,
          shape: shape,
        );
      },
    },
    getters: {
      'color': (visitor, target) => (target as BoxDecoration).color,
      'image': (visitor, target) => (target as BoxDecoration).image,
      'border': (visitor, target) => (target as BoxDecoration).border,
      'borderRadius': (visitor, target) =>
          (target as BoxDecoration).borderRadius,
      'boxShadow': (visitor, target) => (target as BoxDecoration).boxShadow,
      'gradient': (visitor, target) => (target as BoxDecoration).gradient,
      'backgroundBlendMode': (visitor, target) =>
          (target as BoxDecoration).backgroundBlendMode,
      'shape': (visitor, target) => (target as BoxDecoration).shape,
    },
  );
}
