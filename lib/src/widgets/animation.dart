import 'package:d4rt/d4rt.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_d4rt/utils/double.dart';
import 'package:flutter_d4rt/utils/extensions/list.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for the Flutter AnimatedContainer widget.
BridgedClass getAnimatedContainerBridgingDefinition() {
  return BridgedClass(
    nativeType: AnimatedContainer,
    name: 'AnimatedContainer',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final alignment = namedArgs.get<AlignmentGeometry?>('alignment');
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding');
        final color = namedArgs.get<Color?>('color');
        final decoration = namedArgs.get<Decoration?>('decoration');
        final foregroundDecoration = namedArgs.get<Decoration?>(
          'foregroundDecoration',
        );
        final width = namedArgs.getToDouble('width');
        final height = namedArgs.getToDouble('height');
        final constraints = namedArgs.get<BoxConstraints?>('constraints');
        final margin = namedArgs.get<EdgeInsetsGeometry?>('margin');
        final transform = namedArgs.get<Matrix4?>('transform');
        final transformAlignment = namedArgs.get<AlignmentGeometry?>(
          'transformAlignment',
        );
        final clipBehavior = namedArgs.get<Clip?>('clipBehavior') ?? Clip.none;
        final duration =
            namedArgs.get<Duration>('duration') ??
            const Duration(milliseconds: 200);
        final curve = namedArgs.get<Curve?>('curve') ?? Curves.linear;
        final onEnd = namedArgs.handleVoidCallback('onEnd', visitor);
        final child = visitor.toWidgets(namedArgs['child']);

        return AnimatedContainer(
          key: key,
          alignment: alignment,
          padding: padding,
          color: color,
          decoration: decoration,
          foregroundDecoration: foregroundDecoration,
          width: width,
          height: height,
          constraints: constraints,
          margin: margin,
          transform: transform,
          transformAlignment: transformAlignment,
          clipBehavior: clipBehavior,
          duration: duration,
          curve: curve,
          onEnd: onEnd,
          child: child,
        );
      },
    },
    getters: {
      'child': (visitor, target) => (target as AnimatedContainer).child,
      'duration': (visitor, target) => (target as AnimatedContainer).duration,
      'curve': (visitor, target) => (target as AnimatedContainer).curve,
      'key': (visitor, target) => (target as AnimatedContainer).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter AnimatedOpacity widget.
BridgedClass getAnimatedOpacityBridgingDefinition() {
  return BridgedClass(
    nativeType: AnimatedOpacity,
    name: 'AnimatedOpacity',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final opacity = toDouble(namedArgs.get<dynamic>('opacity'))!;
        final duration =
            namedArgs.get<Duration>('duration') ??
            const Duration(milliseconds: 200);
        final curve = namedArgs.get<Curve?>('curve') ?? Curves.linear;
        final onEnd = namedArgs.handleVoidCallback('onEnd', visitor);
        final alwaysIncludeSemantics =
            namedArgs.get<bool?>('alwaysIncludeSemantics') ?? false;
        final child = visitor.toWidgets(namedArgs['child']);

        return AnimatedOpacity(
          key: key,
          opacity: opacity,
          duration: duration,
          curve: curve,
          onEnd: onEnd,
          alwaysIncludeSemantics: alwaysIncludeSemantics,
          child: child,
        );
      },
    },
    getters: {
      'opacity': (visitor, target) => (target as AnimatedOpacity).opacity,
      'duration': (visitor, target) => (target as AnimatedOpacity).duration,
      'curve': (visitor, target) => (target as AnimatedOpacity).curve,
      'child': (visitor, target) => (target as AnimatedOpacity).child,
      'alwaysIncludeSemantics': (visitor, target) =>
          (target as AnimatedOpacity).alwaysIncludeSemantics,
      'key': (visitor, target) => (target as AnimatedOpacity).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter AnimatedPadding widget.
BridgedClass getAnimatedPaddingBridgingDefinition() {
  return BridgedClass(
    nativeType: AnimatedPadding,
    name: 'AnimatedPadding',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final padding =
            namedArgs.get<EdgeInsetsGeometry>('padding') ?? EdgeInsets.zero;
        final duration =
            namedArgs.get<Duration>('duration') ??
            const Duration(milliseconds: 200);
        final curve = namedArgs.get<Curve?>('curve') ?? Curves.linear;
        final onEnd = namedArgs.handleVoidCallback('onEnd', visitor);
        final child = visitor.toWidgets(namedArgs['child']);

        return AnimatedPadding(
          key: key,
          padding: padding,
          duration: duration,
          curve: curve,
          onEnd: onEnd,
          child: child,
        );
      },
    },
    getters: {
      'padding': (visitor, target) => (target as AnimatedPadding).padding,
      'duration': (visitor, target) => (target as AnimatedPadding).duration,
      'curve': (visitor, target) => (target as AnimatedPadding).curve,
      'child': (visitor, target) => (target as AnimatedPadding).child,
      'key': (visitor, target) => (target as AnimatedPadding).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter AnimatedAlign widget.
BridgedClass getAnimatedAlignBridgingDefinition() {
  return BridgedClass(
    nativeType: AnimatedAlign,
    name: 'AnimatedAlign',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final alignment =
            namedArgs.get<AlignmentGeometry>('alignment') ?? Alignment.center;
        final duration =
            namedArgs.get<Duration>('duration') ??
            const Duration(milliseconds: 200);
        final curve = namedArgs.get<Curve?>('curve') ?? Curves.linear;
        final onEnd = namedArgs.handleVoidCallback('onEnd', visitor);
        final widthFactor = namedArgs.getToDouble('widthFactor');
        final heightFactor = namedArgs.getToDouble('heightFactor');
        final child = visitor.toWidgets(namedArgs['child']);

        return AnimatedAlign(
          key: key,
          alignment: alignment,
          duration: duration,
          curve: curve,
          onEnd: onEnd,
          widthFactor: widthFactor,
          heightFactor: heightFactor,
          child: child,
        );
      },
    },
    getters: {
      'alignment': (visitor, target) => (target as AnimatedAlign).alignment,
      'duration': (visitor, target) => (target as AnimatedAlign).duration,
      'curve': (visitor, target) => (target as AnimatedAlign).curve,
      'widthFactor': (visitor, target) => (target as AnimatedAlign).widthFactor,
      'heightFactor': (visitor, target) =>
          (target as AnimatedAlign).heightFactor,
      'child': (visitor, target) => (target as AnimatedAlign).child,
      'key': (visitor, target) => (target as AnimatedAlign).key,
    },
  );
}

/// Returns the BridgedClass for the Cubic curve class.
BridgedClass getCubicBridgingDefinition() {
  return BridgedClass(
    nativeType: Cubic,
    name: 'Cubic',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final a = toDouble(namedArgs.get<dynamic>('a'))!;
        final b = toDouble(namedArgs.get<dynamic>('b'))!;
        final c = toDouble(namedArgs.get<dynamic>('c'))!;
        final d = toDouble(namedArgs.get<dynamic>('d'))!;

        return Cubic(a, b, c, d);
      },
    },
    getters: {
      'a': (visitor, target) => (target as Cubic).a,
      'b': (visitor, target) => (target as Cubic).b,
      'c': (visitor, target) => (target as Cubic).c,
      'd': (visitor, target) => (target as Cubic).d,
    },
    methods: {
      'transform': (visitor, target, positionalArgs, namedArgs) {
        final t = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as Cubic).transform(t);
      },
    },
  );
}

/// Returns the BridgedClass for the Interval curve class.
BridgedClass getIntervalBridgingDefinition() {
  return BridgedClass(
    nativeType: Interval,
    name: 'Interval',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final begin = toDouble(namedArgs.get<dynamic>('begin'))!;
        final end = toDouble(namedArgs.get<dynamic>('end'))!;
        final curve = namedArgs.get<Curve?>('curve') ?? Curves.linear;

        return Interval(begin, end, curve: curve);
      },
    },
    getters: {
      'begin': (visitor, target) => (target as Interval).begin,
      'end': (visitor, target) => (target as Interval).end,
      'curve': (visitor, target) => (target as Interval).curve,
    },
    methods: {
      'transform': (visitor, target, positionalArgs, namedArgs) {
        final t = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as Interval).transform(t);
      },
    },
  );
}

/// Returns the BridgedClass for the Threshold curve class.
BridgedClass getThresholdBridgingDefinition() {
  return BridgedClass(
    nativeType: Threshold,
    name: 'Threshold',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final threshold = toDouble(namedArgs.get<dynamic>('threshold'));

        return Threshold(threshold);
      },
    },
    getters: {
      'threshold': (visitor, target) => (target as Threshold).threshold,
    },
    methods: {
      'transform': (visitor, target, positionalArgs, namedArgs) {
        final t = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as Threshold).transform(t);
      },
    },
  );
}

/// Returns the BridgedClass for the SawTooth curve class.
BridgedClass getSawToothBridgingDefinition() {
  return BridgedClass(
    nativeType: SawTooth,
    name: 'SawTooth',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final count = namedArgs.get<int?>('count') ?? 1;

        return SawTooth(count);
      },
    },
    getters: {'count': (visitor, target) => (target as SawTooth).count},
    methods: {
      'transform': (visitor, target, positionalArgs, namedArgs) {
        final t = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as SawTooth).transform(t);
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter AnimatedPositioned widget.
BridgedClass getAnimatedPositionedBridgingDefinition() {
  return BridgedClass(
    nativeType: AnimatedPositioned,
    name: 'AnimatedPositioned',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final left = namedArgs.getToDouble('left');
        final top = namedArgs.getToDouble('top');
        final right = namedArgs.getToDouble('right');
        final bottom = namedArgs.getToDouble('bottom');
        final width = namedArgs.getToDouble('width');
        final height = namedArgs.getToDouble('height');
        final duration =
            namedArgs.get<Duration>('duration') ??
            const Duration(milliseconds: 200);
        final curve = namedArgs.get<Curve?>('curve') ?? Curves.linear;
        final onEnd = namedArgs.handleVoidCallback('onEnd', visitor);
        final child = visitor.toWidgets(namedArgs['child']);

        return AnimatedPositioned(
          key: key,
          left: left,
          top: top,
          right: right,
          bottom: bottom,
          width: width,
          height: height,
          duration: duration,
          curve: curve,
          onEnd: onEnd,
          child: child!,
        );
      },
    },
    getters: {
      'left': (visitor, target) => (target as AnimatedPositioned).left,
      'top': (visitor, target) => (target as AnimatedPositioned).top,
      'right': (visitor, target) => (target as AnimatedPositioned).right,
      'bottom': (visitor, target) => (target as AnimatedPositioned).bottom,
      'width': (visitor, target) => (target as AnimatedPositioned).width,
      'height': (visitor, target) => (target as AnimatedPositioned).height,
      'duration': (visitor, target) => (target as AnimatedPositioned).duration,
      'curve': (visitor, target) => (target as AnimatedPositioned).curve,
      'child': (visitor, target) => (target as AnimatedPositioned).child,
      'key': (visitor, target) => (target as AnimatedPositioned).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter AnimatedSize widget.
BridgedClass getAnimatedSizeBridgingDefinition() {
  return BridgedClass(
    nativeType: AnimatedSize,
    name: 'AnimatedSize',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final duration =
            namedArgs.get<Duration>('duration') ??
            const Duration(milliseconds: 200);
        final curve = namedArgs.get<Curve?>('curve') ?? Curves.linear;
        final alignment =
            namedArgs.get<AlignmentGeometry?>('alignment') ?? Alignment.center;
        final clipBehavior =
            namedArgs.get<Clip?>('clipBehavior') ?? Clip.hardEdge;
        final child = visitor.toWidgets(namedArgs['child']);

        return AnimatedSize(
          key: key,
          duration: duration,
          curve: curve,
          alignment: alignment,
          clipBehavior: clipBehavior,
          child: child,
        );
      },
    },
    getters: {
      'duration': (visitor, target) => (target as AnimatedSize).duration,
      'curve': (visitor, target) => (target as AnimatedSize).curve,
      'alignment': (visitor, target) => (target as AnimatedSize).alignment,
      'clipBehavior': (visitor, target) =>
          (target as AnimatedSize).clipBehavior,
      'child': (visitor, target) => (target as AnimatedSize).child,
      'key': (visitor, target) => (target as AnimatedSize).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter AnimatedRotation widget.
BridgedClass getAnimatedRotationBridgingDefinition() {
  return BridgedClass(
    nativeType: AnimatedRotation,
    name: 'AnimatedRotation',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final turns = toDouble(namedArgs.get<dynamic>('turns'))!;
        final alignment =
            namedArgs.get<Alignment?>('alignment') ?? Alignment.center;
        final duration =
            namedArgs.get<Duration>('duration') ??
            const Duration(milliseconds: 200);
        final curve = namedArgs.get<Curve?>('curve') ?? Curves.linear;
        final onEnd = namedArgs.handleVoidCallback('onEnd', visitor);
        final filterQuality = namedArgs.get<FilterQuality?>('filterQuality');
        final child = visitor.toWidgets(namedArgs['child']);

        return AnimatedRotation(
          key: key,
          turns: turns,
          alignment: alignment,
          duration: duration,
          curve: curve,
          onEnd: onEnd,
          filterQuality: filterQuality,
          child: child,
        );
      },
    },
    getters: {
      'turns': (visitor, target) => (target as AnimatedRotation).turns,
      'alignment': (visitor, target) => (target as AnimatedRotation).alignment,
      'duration': (visitor, target) => (target as AnimatedRotation).duration,
      'curve': (visitor, target) => (target as AnimatedRotation).curve,
      'filterQuality': (visitor, target) =>
          (target as AnimatedRotation).filterQuality,
      'child': (visitor, target) => (target as AnimatedRotation).child,
      'key': (visitor, target) => (target as AnimatedRotation).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter AnimatedScale widget.
BridgedClass getAnimatedScaleBridgingDefinition() {
  return BridgedClass(
    nativeType: AnimatedScale,
    name: 'AnimatedScale',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final scale = toDouble(namedArgs.get<dynamic>('scale'))!;
        final alignment =
            namedArgs.get<Alignment?>('alignment') ?? Alignment.center;
        final duration =
            namedArgs.get<Duration>('duration') ??
            const Duration(milliseconds: 200);
        final curve = namedArgs.get<Curve?>('curve') ?? Curves.linear;
        final onEnd = namedArgs.handleVoidCallback('onEnd', visitor);
        final filterQuality = namedArgs.get<FilterQuality?>('filterQuality');
        final child = visitor.toWidgets(namedArgs['child']);

        return AnimatedScale(
          key: key,
          scale: scale,
          alignment: alignment,
          duration: duration,
          curve: curve,
          onEnd: onEnd,
          filterQuality: filterQuality,
          child: child,
        );
      },
    },
    getters: {
      'scale': (visitor, target) => (target as AnimatedScale).scale,
      'alignment': (visitor, target) => (target as AnimatedScale).alignment,
      'duration': (visitor, target) => (target as AnimatedScale).duration,
      'curve': (visitor, target) => (target as AnimatedScale).curve,
      'filterQuality': (visitor, target) =>
          (target as AnimatedScale).filterQuality,
      'child': (visitor, target) => (target as AnimatedScale).child,
      'key': (visitor, target) => (target as AnimatedScale).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter AnimatedSlide widget.
BridgedClass getAnimatedSlideBridgingDefinition() {
  return BridgedClass(
    nativeType: AnimatedSlide,
    name: 'AnimatedSlide',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final offset = namedArgs.get<Offset>('offset') ?? Offset.zero;
        final duration =
            namedArgs.get<Duration>('duration') ??
            const Duration(milliseconds: 200);
        final curve = namedArgs.get<Curve?>('curve') ?? Curves.linear;
        final onEnd = namedArgs.handleVoidCallback('onEnd', visitor);
        final child = visitor.toWidgets(namedArgs['child']);

        return AnimatedSlide(
          key: key,
          offset: offset,
          duration: duration,
          curve: curve,
          onEnd: onEnd,
          child: child,
        );
      },
    },
    getters: {
      'offset': (visitor, target) => (target as AnimatedSlide).offset,
      'duration': (visitor, target) => (target as AnimatedSlide).duration,
      'curve': (visitor, target) => (target as AnimatedSlide).curve,
      'child': (visitor, target) => (target as AnimatedSlide).child,
      'key': (visitor, target) => (target as AnimatedSlide).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter AnimatedDefaultTextStyle widget.
BridgedClass getAnimatedDefaultTextStyleBridgingDefinition() {
  return BridgedClass(
    nativeType: AnimatedDefaultTextStyle,
    name: 'AnimatedDefaultTextStyle',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final style = namedArgs.get<TextStyle>('style')!;
        final textAlign = namedArgs.get<TextAlign?>('textAlign');
        final softWrap = namedArgs.get<bool?>('softWrap') ?? true;
        final overflow =
            namedArgs.get<TextOverflow?>('overflow') ?? TextOverflow.clip;
        final maxLines = namedArgs.get<int?>('maxLines');
        final textWidthBasis =
            namedArgs.get<TextWidthBasis?>('textWidthBasis') ??
            TextWidthBasis.parent;
        final textHeightBehavior = namedArgs.get<TextHeightBehavior?>(
          'textHeightBehavior',
        );
        final duration =
            namedArgs.get<Duration>('duration') ??
            const Duration(milliseconds: 200);
        final curve = namedArgs.get<Curve?>('curve') ?? Curves.linear;
        final onEnd = namedArgs.handleVoidCallback('onEnd', visitor);
        final child = visitor.toWidgets(namedArgs['child']);

        return AnimatedDefaultTextStyle(
          key: key,
          style: style,
          textAlign: textAlign,
          softWrap: softWrap,
          overflow: overflow,
          maxLines: maxLines,
          textWidthBasis: textWidthBasis,
          textHeightBehavior: textHeightBehavior,
          duration: duration,
          curve: curve,
          onEnd: onEnd,
          child: child!,
        );
      },
    },
    getters: {
      'style': (visitor, target) => (target as AnimatedDefaultTextStyle).style,
      'textAlign': (visitor, target) =>
          (target as AnimatedDefaultTextStyle).textAlign,
      'softWrap': (visitor, target) =>
          (target as AnimatedDefaultTextStyle).softWrap,
      'overflow': (visitor, target) =>
          (target as AnimatedDefaultTextStyle).overflow,
      'maxLines': (visitor, target) =>
          (target as AnimatedDefaultTextStyle).maxLines,
      'textWidthBasis': (visitor, target) =>
          (target as AnimatedDefaultTextStyle).textWidthBasis,
      'textHeightBehavior': (visitor, target) =>
          (target as AnimatedDefaultTextStyle).textHeightBehavior,
      'duration': (visitor, target) =>
          (target as AnimatedDefaultTextStyle).duration,
      'curve': (visitor, target) => (target as AnimatedDefaultTextStyle).curve,
      'child': (visitor, target) => (target as AnimatedDefaultTextStyle).child,
      'key': (visitor, target) => (target as AnimatedDefaultTextStyle).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter Matrix4 class.
BridgedClass getMatrix4BridgingDefinition() {
  return BridgedClass(
    nativeType: Matrix4,
    name: 'Matrix4',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        // Constructeur avec 16 valeurs
        if (positionalArgs.length >= 16) {
          return Matrix4(
            toDouble(positionalArgs.get<dynamic>(0))!,
            toDouble(positionalArgs.get<dynamic>(1))!,
            toDouble(positionalArgs.get<dynamic>(2))!,
            toDouble(positionalArgs.get<dynamic>(3))!,
            toDouble(positionalArgs.get<dynamic>(4))!,
            toDouble(positionalArgs.get<dynamic>(5))!,
            toDouble(positionalArgs.get<dynamic>(6))!,
            toDouble(positionalArgs.get<dynamic>(7))!,
            toDouble(positionalArgs.get<dynamic>(8))!,
            toDouble(positionalArgs.get<dynamic>(9))!,
            toDouble(positionalArgs.get<dynamic>(10))!,
            toDouble(positionalArgs.get<dynamic>(11))!,
            toDouble(positionalArgs.get<dynamic>(12))!,
            toDouble(positionalArgs.get<dynamic>(13))!,
            toDouble(positionalArgs.get<dynamic>(14))!,
            toDouble(positionalArgs.get<dynamic>(15))!,
          );
        }
        return Matrix4.identity();
      },
      'identity': (visitor, positionalArgs, namedArgs) => Matrix4.identity(),
      'zero': (visitor, positionalArgs, namedArgs) => Matrix4.zero(),
      'fromList': (visitor, positionalArgs, namedArgs) {
        final values = positionalArgs.get<List>(0)!;
        return Matrix4.fromList(values.cast());
      },
      'copy': (visitor, positionalArgs, namedArgs) {
        final other = positionalArgs.get<Matrix4>(0);
        if (other != null) {
          return Matrix4.copy(other);
        }
        return Matrix4.identity();
      },
      'inverted': (visitor, positionalArgs, namedArgs) {
        final other = positionalArgs.get<Matrix4>(0);
        if (other != null) {
          return Matrix4.inverted(other);
        }
        return Matrix4.identity();
      },

      // Constructeurs de transformation
      'translationValues': (visitor, positionalArgs, namedArgs) {
        final x = toDouble(positionalArgs.get<dynamic>(0))!;
        final y = toDouble(positionalArgs.get<dynamic>(1))!;
        final z = toDouble(positionalArgs.get<dynamic>(2))!;
        return Matrix4.translationValues(x, y, z);
      },
      'diagonal3Values': (visitor, positionalArgs, namedArgs) {
        final x = toDouble(positionalArgs.get<dynamic>(0))!;
        final y = toDouble(positionalArgs.get<dynamic>(1))!;
        final z = toDouble(positionalArgs.get<dynamic>(2))!;
        return Matrix4.diagonal3Values(x, y, z);
      },
      'rotationX': (visitor, positionalArgs, namedArgs) {
        final radians = toDouble(positionalArgs.get<dynamic>(0))!;
        return Matrix4.rotationX(radians);
      },
      'rotationY': (visitor, positionalArgs, namedArgs) {
        final radians = toDouble(positionalArgs.get<dynamic>(0))!;
        return Matrix4.rotationY(radians);
      },
      'rotationZ': (visitor, positionalArgs, namedArgs) {
        final radians = toDouble(positionalArgs.get<dynamic>(0))!;
        return Matrix4.rotationZ(radians);
      },
      'skewX': (visitor, positionalArgs, namedArgs) {
        final alpha = toDouble(positionalArgs.get<dynamic>(0))!;
        return Matrix4.skewX(alpha);
      },
      'skewY': (visitor, positionalArgs, namedArgs) {
        final beta = toDouble(positionalArgs.get<dynamic>(0))!;
        return Matrix4.skewY(beta);
      },
      'skew': (visitor, positionalArgs, namedArgs) {
        final alpha = toDouble(positionalArgs.get<dynamic>(0))!;
        final beta = toDouble(positionalArgs.get<dynamic>(1))!;
        return Matrix4.skew(alpha, beta);
      },
    },
    staticMethods: {
      'determinant': (visitor, target, _) => (target as Matrix4).determinant(),
      'isIdentity': (visitor, target, _) => (target as Matrix4).isIdentity(),
      'isZero': (visitor, target, _) => (target as Matrix4).isZero(),
    },
    methods: {
      'setIdentity': (visitor, target, positionalArgs, namedArgs) {
        (target as Matrix4).setIdentity();
        return null;
      },
      'setZero': (visitor, target, positionalArgs, namedArgs) {
        (target as Matrix4).setZero();
        return null;
      },
      'clone': (visitor, target, positionalArgs, namedArgs) {
        return (target as Matrix4).clone();
      },
      'copyInto': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.get<Matrix4>(0);
        if (other != null) {
          (target as Matrix4).copyInto(other);
        }
        return null;
      },
      'copyFromArray': (visitor, target, positionalArgs, namedArgs) {
        final array = positionalArgs.get<List>(0)!;
        final offset = positionalArgs.get<int?>(1) ?? 0;
        (target as Matrix4).copyFromArray(array.cast(), offset);
        return null;
      },

      // Transformations
      'translate': (visitor, target, positionalArgs, namedArgs) {
        final x = toDouble(positionalArgs.get<dynamic>(0))!;
        final y = toDouble(positionalArgs.get<dynamic>(1))!;
        final z = toDouble(positionalArgs.get<dynamic>(2))!;
        (target as Matrix4).translate(x, y, z);
        return null;
      },
      'scale': (visitor, target, positionalArgs, namedArgs) {
        final x = toDouble(positionalArgs.get<dynamic>(0))!;
        final y = toDouble(positionalArgs.get<dynamic>(1));
        final z = toDouble(positionalArgs.get<dynamic>(2));
        (target as Matrix4).scale(x, y, z);
        return null;
      },
      'rotateX': (visitor, target, positionalArgs, namedArgs) {
        final angle = toDouble(positionalArgs.get<dynamic>(0))!;
        (target as Matrix4).rotateX(angle);
        return null;
      },
      'rotateY': (visitor, target, positionalArgs, namedArgs) {
        final angle = toDouble(positionalArgs.get<dynamic>(0))!;
        (target as Matrix4).rotateY(angle);
        return null;
      },
      'rotateZ': (visitor, target, positionalArgs, namedArgs) {
        final angle = toDouble(positionalArgs.get<dynamic>(0))!;
        (target as Matrix4).rotateZ(angle);
        return null;
      },

      // Opérations matricielles
      'multiply': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.get<Matrix4>(0);
        if (other != null) {
          (target as Matrix4).multiply(other);
        }
        return null;
      },
      'multiplied': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.get<Matrix4>(0);
        if (other != null) {
          return (target as Matrix4).multiplied(other);
        }
        return null;
      },
      'transpose': (visitor, target, positionalArgs, namedArgs) {
        (target as Matrix4).transpose();
        return null;
      },
      'transposed': (visitor, target, positionalArgs, namedArgs) {
        return (target as Matrix4).transposed();
      },
      'invert': (visitor, target, positionalArgs, namedArgs) {
        return (target as Matrix4).invert();
      },

      // Accès aux éléments
      'entry': (visitor, target, positionalArgs, namedArgs) {
        final row = positionalArgs.get<int?>(0) ?? 0;
        final col = positionalArgs.get<int?>(1) ?? 0;
        return (target as Matrix4).entry(row, col);
      },
      'setEntry': (visitor, target, positionalArgs, namedArgs) {
        final row = positionalArgs.get<int?>(0) ?? 0;
        final col = positionalArgs.get<int?>(1) ?? 0;
        final value = toDouble(positionalArgs.get<dynamic>(2))!;
        (target as Matrix4).setEntry(row, col, value);
        return null;
      },

      // Conversion
      'storage': (visitor, target, positionalArgs, namedArgs) {
        return (target as Matrix4).storage;
      },
    },
  );
}

/// Bridge for TickerProviderStateMixin
mixin TickerProviderStateMixinBridge on State {
  Set<Ticker>? _tickers;

  Ticker createTicker(TickerCallback onTick) {
    _tickers ??= <Ticker>{};
    final ticker = Ticker(onTick, debugLabel: 'created by $runtimeType');
    _tickers!.add(ticker);
    return ticker;
  }

  @override
  void dispose() {
    if (_tickers != null) {
      for (final Ticker ticker in _tickers!) {
        ticker.dispose();
      }
    }
    super.dispose();
  }
}

/// Bridge for SingleTickerProviderStateMixin
mixin SingleTickerProviderStateMixinBridge on State {
  Ticker? _ticker;

  Ticker createTicker(TickerCallback onTick) {
    assert(
      _ticker == null,
      'SingleTickerProviderStateMixin can only have one ticker',
    );
    _ticker = Ticker(onTick, debugLabel: 'created by $runtimeType');
    return _ticker!;
  }

  @override
  void dispose() {
    _ticker?.dispose();
    _ticker = null;
    super.dispose();
  }
}

/// Returns the BridgedClass for TickerProviderStateMixin
BridgedClass getTickerProviderStateMixinBridgingDefinition() {
  return BridgedClass(
    nativeType: TickerProviderStateMixin,
    name: 'TickerProviderStateMixin',
    canBeUsedAsMixin: true,
    methods: {
      'createTicker': (visitor, target, positionalArgs, namedArgs) {
        final onTick = positionalArgs[0] as TickerCallback;
        if (target is TickerProvider) {
          return target.createTicker(onTick);
        }
        throw RuntimeError('createTicker called on non-TickerProvider target');
      },
    },
  );
}

/// Returns the BridgedClass for SingleTickerProviderStateMixin
BridgedClass getSingleTickerProviderStateMixinBridgingDefinition() {
  return BridgedClass(
    nativeType: SingleTickerProviderStateMixin,
    name: 'SingleTickerProviderStateMixin',
    canBeUsedAsMixin: true,
    methods: {
      'createTicker': (visitor, target, positionalArgs, namedArgs) {
        final onTick = positionalArgs[0] as TickerCallback;
        if (target is TickerProvider) {
          return target.createTicker(onTick);
        }
        throw RuntimeError('createTicker called on non-TickerProvider target');
      },
    },
  );
}

/// Returns the BridgedClass for Ticker
BridgedClass getTickerBridgingDefinition() {
  return BridgedClass(
    nativeType: Ticker,
    name: 'Ticker',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final onTick = positionalArgs[0] as TickerCallback;
        final debugLabel = namedArgs.get<String?>('debugLabel');
        return Ticker(onTick, debugLabel: debugLabel);
      },
    },
    methods: {
      'start': (visitor, target, positionalArgs, namedArgs) {
        (target as Ticker).start();
        return null;
      },
      'stop': (visitor, target, positionalArgs, namedArgs) {
        final canceled = namedArgs.get<bool?>('canceled') ?? false;
        (target as Ticker).stop(canceled: canceled);
        return null;
      },
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        (target as Ticker).dispose();
        return null;
      },
    },
    getters: {
      'isActive': (visitor, target) => (target as Ticker).isActive,
      'isTicking': (visitor, target) => (target as Ticker).isTicking,
      'muted': (visitor, target) => (target as Ticker).muted,
    },
    setters: {
      'muted': (visitor, target, value) {
        (target as Ticker).muted = value as bool;
      },
    },
  );
}

/// Returns the BridgedClass for Tween
BridgedClass getTweenBridgingDefinition() {
  return BridgedClass(
    nativeType: Tween,
    name: 'Tween',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final begin = namedArgs['begin'];
        final end = namedArgs['end'];

        // Create a Tween<double> if both begin and end are numbers
        if ((begin is num || begin == null) && (end is num || end == null)) {
          return Tween<double>(
            begin: begin != null ? (begin as num).toDouble() : null,
            end: end != null ? (end as num).toDouble() : null,
          );
        }

        // For other types, use dynamic
        return Tween<dynamic>(begin: begin, end: end);
      },
      'double': (visitor, positionalArgs, namedArgs) {
        final begin = namedArgs['begin'];
        final end = namedArgs['end'];
        return Tween<double>(
          begin: begin != null ? (begin as num).toDouble() : null,
          end: end != null ? (end as num).toDouble() : null,
        );
      },
      'fromTo': (visitor, positionalArgs, namedArgs) {
        final begin = positionalArgs[0];
        final end = positionalArgs[1];

        if ((begin is num || begin == null) && (end is num || end == null)) {
          return Tween<double>(
            begin: begin != null ? (begin as num).toDouble() : null,
            end: end != null ? (end as num).toDouble() : null,
          );
        }

        return Tween<dynamic>(begin: begin, end: end);
      },
    },
    methods: {
      'animate': (visitor, target, positionalArgs, namedArgs) {
        final parent = positionalArgs[0] as Animation<double>;
        return (target as Tween).animate(parent);
      },
      'transform': (visitor, target, positionalArgs, namedArgs) {
        final t = toDouble(positionalArgs[0]);
        return (target as Tween).transform(t);
      },
    },
    getters: {
      'begin': (visitor, target) => (target as Tween).begin,
      'end': (visitor, target) => (target as Tween).end,
    },
    setters: {
      'begin': (visitor, target, value) {
        (target as Tween).begin = value;
      },
      'end': (visitor, target, value) {
        (target as Tween).end = value;
      },
    },
  );
}

/// Returns the BridgedClass for CurvedAnimation
BridgedClass getCurvedAnimationBridgingDefinition() {
  return BridgedClass(
    nativeType: CurvedAnimation,
    name: 'CurvedAnimation',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final parent = namedArgs.get<Animation<double>>('parent');
        final curve = namedArgs.get<Curve>('curve') ?? Curves.linear;

        if (parent == null) {
          throw RuntimeError('CurvedAnimation requires a parent parameter');
        }

        return CurvedAnimation(parent: parent, curve: curve);
      },
    },
    getters: {
      'value': (visitor, target) => (target as CurvedAnimation).value,
      'status': (visitor, target) => (target as CurvedAnimation).status,
    },
  );
}

/// Returns the BridgedClass for Animation
BridgedClass getAnimationBridgingDefinition() {
  return BridgedClass(
    nativeType: Animation,
    name: 'Animation',
    nativeNames: ['_AnimatedEvaluation'],
    methods: {
      'addListener': (visitor, target, positionalArgs, namedArgs) {
        final listener = positionalArgs.handleVoidCallback(0, visitor)!;
        (target as Animation).addListener(listener);
        return null;
      },
      'removeListener': (visitor, target, positionalArgs, namedArgs) {
        final listener = positionalArgs.handleVoidCallback(0, visitor)!;
        (target as Animation).removeListener(listener);
        return null;
      },
      'addStatusListener': (visitor, target, positionalArgs, namedArgs) {
        final listener = positionalArgs[0] as AnimationStatusListener;
        (target as Animation).addStatusListener(listener);
        return null;
      },
      'removeStatusListener': (visitor, target, positionalArgs, namedArgs) {
        final listener = positionalArgs[0] as AnimationStatusListener;
        (target as Animation).removeStatusListener(listener);
        return null;
      },
    },
    getters: {
      'value': (visitor, target) => (target as Animation).value,
      'status': (visitor, target) => (target as Animation).status,
      'isCompleted': (visitor, target) => (target as Animation).isCompleted,
      'isDismissed': (visitor, target) => (target as Animation).isDismissed,
    },
  );
}

/// Returns the BridgedClass for AnimationStatus
BridgedClass getAnimationStatusBridgingDefinition() {
  return BridgedClass(
    nativeType: AnimationStatus,
    name: 'AnimationStatus',
    getters: {
      'dismissed': (visitor, target) => AnimationStatus.dismissed,
      'forward': (visitor, target) => AnimationStatus.forward,
      'reverse': (visitor, target) => AnimationStatus.reverse,
      'completed': (visitor, target) => AnimationStatus.completed,
    },
  );
}

/// Returns the BridgedClass for the Flutter AlwaysStoppedAnimation class.
BridgedClass getAlwaysStoppedAnimationBridgingDefinition() {
  return BridgedClass(
    nativeType: AlwaysStoppedAnimation,
    name: 'AlwaysStoppedAnimation',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final value = positionalArgs.get<dynamic>(0);
        return AlwaysStoppedAnimation(value);
      },
    },
    getters: {
      'value': (visitor, target) => (target as AlwaysStoppedAnimation).value,
      'status': (visitor, target) => (target as AlwaysStoppedAnimation).status,
      'isCompleted': (visitor, target) =>
          (target as AlwaysStoppedAnimation).isCompleted,
      'isDismissed': (visitor, target) =>
          (target as AlwaysStoppedAnimation).isDismissed,
    },
    methods: {
      'addListener': (visitor, target, positionalArgs, namedArgs) {
        final listener = positionalArgs.get<InterpretedFunction>(0);
        if (listener != null) {
          (target as AlwaysStoppedAnimation).addListener(
            () => listener.call(visitor, [], {}),
          );
        }
        return null;
      },
      'removeListener': (visitor, target, positionalArgs, namedArgs) {
        final listener = positionalArgs.get<InterpretedFunction>(0);
        if (listener != null) {
          (target as AlwaysStoppedAnimation).removeListener(
            () => listener.call(visitor, [], {}),
          );
        }
        return null;
      },
      'addStatusListener': (visitor, target, positionalArgs, namedArgs) {
        final listener = positionalArgs.get<AnimationStatusListener>(0);
        if (listener != null) {
          (target as AlwaysStoppedAnimation).addStatusListener(listener);
        }
        return null;
      },
      'removeStatusListener': (visitor, target, positionalArgs, namedArgs) {
        final listener = positionalArgs.get<AnimationStatusListener>(0);
        if (listener != null) {
          (target as AlwaysStoppedAnimation).removeStatusListener(listener);
        }
        return null;
      },
      'toString': (visitor, target, positionalArgs, namedArgs) {
        return (target as AlwaysStoppedAnimation).toString();
      },
    },
  );
}
