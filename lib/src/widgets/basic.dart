// ignore_for_file: deprecated_member_use

import 'package:d4rt/d4rt.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_d4rt/src/rendering/custom_paint.dart';
import 'package:flutter_d4rt/utils/double.dart';
import 'package:flutter_d4rt/utils/extensions/list.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

BridgedClass getColumnBridgingDefinition() {
  return BridgedClass(
    nativeType: Column,
    name: 'Column',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final List<Widget> children = [];
        final interpretedChildren = visitor.toWidgets(namedArgs['children']);
        if (interpretedChildren is List) {
          children.addAll(interpretedChildren.cast());
        }
        final key = namedArgs.get<Key?>('key');
        final mainAxisAlignment =
            namedArgs.get<MainAxisAlignment?>('mainAxisAlignment') ??
            MainAxisAlignment.start;
        final crossAxisAlignment =
            namedArgs.get<CrossAxisAlignment?>('crossAxisAlignment') ??
            CrossAxisAlignment.center;
        final textDirection =
            namedArgs.get<TextDirection?>('textDirection') ?? TextDirection.ltr;
        final verticalDirection =
            namedArgs.get<VerticalDirection?>('verticalDirection') ??
            VerticalDirection.down;
        final mainAxisSize =
            namedArgs.get<MainAxisSize?>('mainAxisSize') ?? MainAxisSize.max;
        final textBaseline =
            namedArgs.get<TextBaseline?>('textBaseline') ??
            TextBaseline.alphabetic;
        final spacing = namedArgs.getToDouble('spacing') ?? 0.0;

        return Column(
          key: key,
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          textDirection: textDirection,
          verticalDirection: verticalDirection,
          mainAxisSize: mainAxisSize,
          textBaseline: textBaseline,
          spacing: spacing,
          children: children,
        );
      },
    },
    getters: {
      'mainAxisAlignment': (visitor, target) =>
          (target as Column).mainAxisAlignment,
      'crossAxisAlignment': (visitor, target) =>
          (target as Column).crossAxisAlignment,
      'textDirection': (visitor, target) => (target as Column).textDirection,
      'verticalDirection': (visitor, target) =>
          (target as Column).verticalDirection,
      'mainAxisSize': (visitor, target) => (target as Column).mainAxisSize,
      'textBaseline': (visitor, target) => (target as Column).textBaseline,
      'spacing': (visitor, target) => (target as Column).spacing,
      'children': (visitor, target) => (target as Column).children,
      'key': (visitor, target) => (target as Column).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter Row widget.
BridgedClass getRowBridgingDefinition() {
  return BridgedClass(
    nativeType: Row,
    name: 'Row',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final List<Widget> children = [];
        final interpretedChildren = visitor.toWidgets(namedArgs['children']);
        if (interpretedChildren is List) {
          children.addAll(interpretedChildren.cast());
        }
        final key = namedArgs.get<Key?>('key');
        final mainAxisAlignment =
            namedArgs.get<MainAxisAlignment?>('mainAxisAlignment') ??
            MainAxisAlignment.start;
        final crossAxisAlignment =
            namedArgs.get<CrossAxisAlignment?>('crossAxisAlignment') ??
            CrossAxisAlignment.center;
        final textDirection =
            namedArgs.get<TextDirection?>('textDirection') ?? TextDirection.ltr;
        final verticalDirection =
            namedArgs.get<VerticalDirection?>('verticalDirection') ??
            VerticalDirection.down;
        final mainAxisSize =
            namedArgs.get<MainAxisSize?>('mainAxisSize') ?? MainAxisSize.max;
        final textBaseline =
            namedArgs.get<TextBaseline?>('textBaseline') ??
            TextBaseline.alphabetic;
        final spacing = namedArgs.getToDouble('spacing') ?? 0.0;

        return Row(
          key: key,
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          textDirection: textDirection,
          verticalDirection: verticalDirection,
          mainAxisSize: mainAxisSize,
          textBaseline: textBaseline,
          spacing: spacing,
          children: children,
        );
      },
    },
    getters: {
      'mainAxisAlignment': (visitor, target) =>
          (target as Row).mainAxisAlignment,
      'crossAxisAlignment': (visitor, target) =>
          (target as Row).crossAxisAlignment,
      'textDirection': (visitor, target) => (target as Row).textDirection,
      'verticalDirection': (visitor, target) =>
          (target as Row).verticalDirection,
      'mainAxisSize': (visitor, target) => (target as Row).mainAxisSize,
      'textBaseline': (visitor, target) => (target as Row).textBaseline,
      'spacing': (visitor, target) => (target as Row).spacing,
      'children': (visitor, target) => (target as Row).children,
      'key': (visitor, target) => (target as Row).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter Padding widget.
BridgedClass getPaddingBridgingDefinition() {
  return BridgedClass(
    nativeType: Padding,
    name: 'Padding',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding');
        final child = visitor.toWidgets(namedArgs['child']);

        return Padding(key: key, padding: padding!, child: child);
      },
    },

    getters: {
      'padding': (visitor, target) => (target as Padding).padding,
      'child': (visitor, target) => (target as Padding).child,
      'key': (visitor, target) => (target as Padding).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter Stack widget.
BridgedClass getStackBridgingDefinition() {
  return BridgedClass(
    nativeType: Stack,
    name: 'Stack',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final alignment =
            namedArgs.get<AlignmentGeometry?>('alignment') ??
            AlignmentDirectional.topStart;
        final textDirection = namedArgs.get<TextDirection?>('textDirection');
        final fit = namedArgs.get<StackFit?>('fit') ?? StackFit.loose;
        final clipBehavior =
            namedArgs.get<Clip?>('clipBehavior') ?? Clip.hardEdge;

        final children = visitor.toWidgets(namedArgs['children']);

        return Stack(
          key: key,
          alignment: alignment,
          textDirection: textDirection,
          fit: fit,
          clipBehavior: clipBehavior,
          children: children,
        );
      },
    },
    getters: {
      'alignment': (visitor, target) => (target as Stack).alignment,
      'textDirection': (visitor, target) => (target as Stack).textDirection,
      'fit': (visitor, target) => (target as Stack).fit,
      'clipBehavior': (visitor, target) => (target as Stack).clipBehavior,
      'children': (visitor, target) => (target as Stack).children,
      'key': (visitor, target) => (target as Stack).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter Positioned widget.
BridgedClass getPositionedBridgingDefinition() {
  return BridgedClass(
    nativeType: Positioned,
    name: 'Positioned',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final left = namedArgs.getToDouble('left');
        final top = namedArgs.getToDouble('top');
        final right = namedArgs.getToDouble('right');
        final bottom = namedArgs.getToDouble('bottom');
        final width = namedArgs.getToDouble('width');
        final height = namedArgs.getToDouble('height');
        final child = visitor.toWidgets(namedArgs['child']);
        return Positioned(
          key: key,
          left: left,
          top: top,
          right: right,
          bottom: bottom,
          width: width,
          height: height,
          child: child,
        );
      },
      'fill': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final left = namedArgs.getToDouble('left') ?? 0.0;
        final top = namedArgs.getToDouble('top') ?? 0.0;
        final right = namedArgs.getToDouble('right') ?? 0.0;
        final bottom = namedArgs.getToDouble('bottom') ?? 0.0;
        final child = visitor.toWidgets(namedArgs['child']);

        return Positioned.fill(
          key: key,
          left: left,
          top: top,
          right: right,
          bottom: bottom,
          child: child,
        );
      },
      'fromRect': (visitor, positionalArgs, namedArgs) {
        final rect = positionalArgs.get<Rect?>(0);
        final child = visitor.toWidgets(namedArgs['child']);
        return Positioned.fromRect(rect: rect!, child: child);
      },
    },
    getters: {
      'left': (visitor, target) => (target as Positioned).left,
      'top': (visitor, target) => (target as Positioned).top,
      'right': (visitor, target) => (target as Positioned).right,
      'bottom': (visitor, target) => (target as Positioned).bottom,
      'width': (visitor, target) => (target as Positioned).width,
      'height': (visitor, target) => (target as Positioned).height,
      'child': (visitor, target) => (target as Positioned).child,
      'key': (visitor, target) => (target as Positioned).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter Flexible widget.
BridgedClass getFlexibleBridgingDefinition() {
  return BridgedClass(
    nativeType: Flexible,
    name: 'Flexible',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final flex = namedArgs.get<int?>('flex') ?? 1;
        final fit = namedArgs.get<FlexFit?>('fit') ?? FlexFit.loose;
        final child = visitor.toWidgets(namedArgs['child']);
        return Flexible(key: key, flex: flex, fit: fit, child: child);
      },
    },
    getters: {
      'flex': (visitor, target) => (target as Flexible).flex,
      'fit': (visitor, target) => (target as Flexible).fit,
      'child': (visitor, target) => (target as Flexible).child,
      'key': (visitor, target) => (target as Flexible).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter Expanded widget.
BridgedClass getExpandedBridgingDefinition() {
  return BridgedClass(
    nativeType: Expanded,
    name: 'Expanded',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final flex = namedArgs.get<int?>('flex') ?? 1;
        final child = visitor.toWidgets(namedArgs['child']);
        return Expanded(key: key, flex: flex, child: child);
      },
    },
    getters: {
      'flex': (visitor, target) => (target as Expanded).flex,
      'child': (visitor, target) => (target as Expanded).child,
      'key': (visitor, target) => (target as Expanded).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter Align widget.
BridgedClass getAlignBridgingDefinition() {
  return BridgedClass(
    nativeType: Align,
    name: 'Align',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final alignment =
            namedArgs.get<AlignmentGeometry?>('alignment') ?? Alignment.center;
        final widthFactor = namedArgs.getToDouble('widthFactor');
        final heightFactor = namedArgs.getToDouble('heightFactor');
        final child = visitor.toWidgets(namedArgs['child']);

        return Align(
          key: key,
          alignment: alignment,
          widthFactor: widthFactor,
          heightFactor: heightFactor,
          child: child,
        );
      },
    },
    getters: {
      'alignment': (visitor, target) => (target as Align).alignment,
      'widthFactor': (visitor, target) => (target as Align).widthFactor,
      'heightFactor': (visitor, target) => (target as Align).heightFactor,
      'child': (visitor, target) => (target as Align).child,
      'key': (visitor, target) => (target as Align).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter Center widget.
BridgedClass getCenterBridgingDefinition() {
  return BridgedClass(
    nativeType: Center,
    name: 'Center',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final widthFactor = namedArgs.getToDouble('widthFactor');
        final heightFactor = namedArgs.getToDouble('heightFactor');
        final child = visitor.toWidgets(namedArgs['child']);

        return Center(
          key: key,
          widthFactor: widthFactor,
          heightFactor: heightFactor,
          child: child,
        );
      },
    },
    getters: {
      'widthFactor': (visitor, target) => (target as Center).widthFactor,
      'heightFactor': (visitor, target) => (target as Center).heightFactor,
      'child': (visitor, target) => (target as Center).child,
      'key': (visitor, target) => (target as Center).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter SizedBox widget.
BridgedClass getSizedBoxBridgingDefinition() {
  return BridgedClass(
    nativeType: SizedBox,
    name: 'SizedBox',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final width = namedArgs.getToDouble('width');
        final height = namedArgs.getToDouble('height');
        final child = visitor.toWidgets(namedArgs['child']);

        return SizedBox(key: key, width: width, height: height, child: child);
      },
      'expand': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final child = visitor.toWidgets(namedArgs['child']);

        return SizedBox.expand(key: key, child: child);
      },
      'shrink': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final child = visitor.toWidgets(namedArgs['child']);

        return SizedBox.shrink(key: key, child: child);
      },
      'square': (visitor, positionalArgs, namedArgs) {
        final dimension = positionalArgs.getToDouble(0);
        final key = namedArgs.get<Key?>('key');
        final child = visitor.toWidgets(namedArgs['child']);

        return SizedBox.square(key: key, dimension: dimension, child: child);
      },
    },
    getters: {
      'width': (visitor, target) => (target as SizedBox).width,
      'height': (visitor, target) => (target as SizedBox).height,
      'child': (visitor, target) => (target as SizedBox).child,
      'key': (visitor, target) => (target as SizedBox).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter Alignment class.
BridgedClass getAlignmentBridgingDefinition() {
  return BridgedClass(
    nativeType: Alignment,
    name: 'Alignment',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final x = toDouble(namedArgs.get<dynamic>('x'))!;
        final y = toDouble(namedArgs.get<dynamic>('y'))!;
        return Alignment(x, y);
      },
    },
    getters: {
      'x': (visitor, target) => (target as Alignment).x,
      'y': (visitor, target) => (target as Alignment).y,
    },
    staticGetters: {
      'topLeft': (visitor) => Alignment.topLeft,
      'topCenter': (visitor) => Alignment.topCenter,
      'topRight': (visitor) => Alignment.topRight,
      'centerLeft': (visitor) => Alignment.centerLeft,
      'center': (visitor) => Alignment.center,
      'centerRight': (visitor) => Alignment.centerRight,
      'bottomLeft': (visitor) => Alignment.bottomLeft,
      'bottomCenter': (visitor) => Alignment.bottomCenter,
      'bottomRight': (visitor) => Alignment.bottomRight,
    },
    methods: {
      'resolve': (visitor, target, positionalArgs, namedArgs) {
        final textDirection = positionalArgs.get<TextDirection?>(0);
        return (target as Alignment).resolve(textDirection);
      },
      'add': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.get<AlignmentGeometry>(0);
        if (other != null) {
          return (target as Alignment).add(other);
        }
        return target;
      },
      'alongOffset': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.get<Offset>(0);
        if (other != null) {
          return (target as Alignment).alongOffset(other);
        }
        return Offset.zero;
      },
      'alongSize': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.get<Size>(0);
        if (other != null) {
          return (target as Alignment).alongSize(other);
        }
        return Offset.zero;
      },
      'withinRect': (visitor, target, positionalArgs, namedArgs) {
        final rect = positionalArgs.get<Rect>(0);
        if (rect != null) {
          return (target as Alignment).withinRect(rect);
        }
        return Offset.zero;
      },
      'inscribe': (visitor, target, positionalArgs, namedArgs) {
        final size = positionalArgs.get<Size>(0);
        final rect = positionalArgs.get<Rect>(1);
        if (size != null && rect != null) {
          return (target as Alignment).inscribe(size, rect);
        }
        return Rect.zero;
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter AlignmentDirectional class.
BridgedClass getAlignmentDirectionalBridgingDefinition() {
  return BridgedClass(
    nativeType: AlignmentDirectional,
    name: 'AlignmentDirectional',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final start = toDouble(namedArgs.get<dynamic>('start'))!;
        final y = toDouble(namedArgs.get<dynamic>('y'))!;
        return AlignmentDirectional(start, y);
      },
    },
    getters: {
      'start': (visitor, target) => (target as AlignmentDirectional).start,
      'y': (visitor, target) => (target as AlignmentDirectional).y,
    },
    staticGetters: {
      'topStart': (visitor) => AlignmentDirectional.topStart,
      'topCenter': (visitor) => AlignmentDirectional.topCenter,
      'topEnd': (visitor) => AlignmentDirectional.topEnd,
      'centerStart': (visitor) => AlignmentDirectional.centerStart,
      'center': (visitor) => AlignmentDirectional.center,
      'centerEnd': (visitor) => AlignmentDirectional.centerEnd,
      'bottomStart': (visitor) => AlignmentDirectional.bottomStart,
      'bottomCenter': (visitor) => AlignmentDirectional.bottomCenter,
      'bottomEnd': (visitor) => AlignmentDirectional.bottomEnd,
    },
    methods: {
      'resolve': (visitor, target, positionalArgs, namedArgs) {
        final textDirection = positionalArgs.get<TextDirection?>(0);
        return (target as AlignmentDirectional).resolve(textDirection);
      },
      'add': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.get<AlignmentGeometry>(0);
        if (other != null) {
          return (target as AlignmentDirectional).add(other);
        }
        return target;
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter FractionalOffset class.
BridgedClass getFractionalOffsetBridgingDefinition() {
  return BridgedClass(
    nativeType: FractionalOffset,
    name: 'FractionalOffset',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final dx = toDouble(namedArgs.get<dynamic>('dx'))!;
        final dy = toDouble(namedArgs.get<dynamic>('dy'))!;
        return FractionalOffset(dx, dy);
      },
      'fromOffsetAndSize': (visitor, positionalArgs, namedArgs) {
        final offset = positionalArgs.get<Offset>(0) ?? Offset.zero;
        final size = positionalArgs.get<Size>(1) ?? Size.zero;
        return FractionalOffset.fromOffsetAndSize(offset, size);
      },
      'fromOffsetAndRect': (visitor, positionalArgs, namedArgs) {
        final offset = positionalArgs.get<Offset>(0) ?? Offset.zero;
        final rect = positionalArgs.get<Rect>(1) ?? Rect.zero;
        return FractionalOffset.fromOffsetAndRect(offset, rect);
      },
      // FractionalOffsets prédéfinis
      'topLeft': (visitor, positionalArgs, namedArgs) =>
          FractionalOffset.topLeft,
      'topCenter': (visitor, positionalArgs, namedArgs) =>
          FractionalOffset.topCenter,
      'topRight': (visitor, positionalArgs, namedArgs) =>
          FractionalOffset.topRight,
      'centerLeft': (visitor, positionalArgs, namedArgs) =>
          FractionalOffset.centerLeft,
      'center': (visitor, positionalArgs, namedArgs) => FractionalOffset.center,
      'centerRight': (visitor, positionalArgs, namedArgs) =>
          FractionalOffset.centerRight,
      'bottomLeft': (visitor, positionalArgs, namedArgs) =>
          FractionalOffset.bottomLeft,
      'bottomCenter': (visitor, positionalArgs, namedArgs) =>
          FractionalOffset.bottomCenter,
      'bottomRight': (visitor, positionalArgs, namedArgs) =>
          FractionalOffset.bottomRight,
    },
    getters: {
      'dx': (visitor, target) => (target as FractionalOffset).dx,
      'dy': (visitor, target) => (target as FractionalOffset).dy,
    },
    methods: {
      'resolve': (visitor, target, positionalArgs, namedArgs) {
        final textDirection = positionalArgs.get<TextDirection?>(0);
        return (target as FractionalOffset).resolve(textDirection);
      },
      'add': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.get<AlignmentGeometry>(0);
        if (other != null) {
          return (target as FractionalOffset).add(other);
        }
        return target;
      },
      'alongOffset': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.get<Offset>(0);
        if (other != null) {
          return (target as FractionalOffset).alongOffset(other);
        }
        return Offset.zero;
      },
      'alongSize': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.get<Size>(0);
        if (other != null) {
          return (target as FractionalOffset).alongSize(other);
        }
        return Offset.zero;
      },
      'withinRect': (visitor, target, positionalArgs, namedArgs) {
        final rect = positionalArgs.get<Rect>(0);
        if (rect != null) {
          return (target as FractionalOffset).withinRect(rect);
        }
        return Offset.zero;
      },
      'inscribe': (visitor, target, positionalArgs, namedArgs) {
        final size = positionalArgs.get<Size>(0);
        final rect = positionalArgs.get<Rect>(1);
        if (size != null && rect != null) {
          return (target as FractionalOffset).inscribe(size, rect);
        }
        return Rect.zero;
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter Directionality widget.
BridgedClass getDirectionalityBridgingDefinition() {
  return BridgedClass(
    nativeType: Directionality,
    name: 'Directionality',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final textDirection = namedArgs.get<TextDirection>('textDirection')!;
        final child = visitor.toWidgets(namedArgs['child']);

        return Directionality(
          key: key,
          textDirection: textDirection,
          child: child,
        );
      },
    },
    getters: {
      'textDirection': (visitor, target) =>
          (target as Directionality).textDirection,
      'child': (visitor, target) => (target as Directionality).child,
      'key': (visitor, target) => (target as Directionality).key,
    },
    staticMethods: {
      'of': (visitor, positionalArgs, namedArgs) {
        final context = positionalArgs.get<BuildContext>(0);
        if (context != null) {
          return Directionality.of(context);
        }
        return TextDirection.ltr;
      },
      'maybeOf': (visitor, positionalArgs, namedArgs) {
        final context = positionalArgs.get<BuildContext>(0);
        if (context != null) {
          return Directionality.maybeOf(context);
        }
        return null;
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter Opacity widget.
BridgedClass getOpacityBridgingDefinition() {
  return BridgedClass(
    nativeType: Opacity,
    name: 'Opacity',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final opacity = namedArgs.getToDouble('opacity')!;
        final alwaysIncludeSemantics =
            namedArgs.get<bool?>('alwaysIncludeSemantics') ?? false;
        final child = visitor.toWidgets(namedArgs['child']);

        return Opacity(
          key: key,
          opacity: opacity,
          alwaysIncludeSemantics: alwaysIncludeSemantics,
          child: child,
        );
      },
    },
    getters: {
      'opacity': (visitor, target) => (target as Opacity).opacity,
      'alwaysIncludeSemantics': (visitor, target) =>
          (target as Opacity).alwaysIncludeSemantics,
      'child': (visitor, target) => (target as Opacity).child,
      'key': (visitor, target) => (target as Opacity).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter Transform widget.
BridgedClass getTransformBridgingDefinition() {
  return BridgedClass(
    nativeType: Transform,
    name: 'Transform',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final transform = namedArgs.get<Matrix4>('transform')!;
        final origin = namedArgs.get<Offset?>('origin');
        final alignment = namedArgs.get<AlignmentGeometry?>('alignment');
        final transformHitTests =
            namedArgs.get<bool?>('transformHitTests') ?? true;
        final filterQuality = namedArgs.get<FilterQuality?>('filterQuality');
        final child = visitor.toWidgets(namedArgs['child']);

        return Transform(
          key: key,
          transform: transform,
          origin: origin,
          alignment: alignment,
          transformHitTests: transformHitTests,
          filterQuality: filterQuality,
          child: child,
        );
      },
      'rotate': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final angle = namedArgs.getToDouble('angle')!;
        final origin = namedArgs.get<Offset?>('origin');
        final alignment =
            namedArgs.get<AlignmentGeometry?>('alignment') ?? Alignment.center;
        final transformHitTests =
            namedArgs.get<bool?>('transformHitTests') ?? true;
        final filterQuality = namedArgs.get<FilterQuality?>('filterQuality');
        final child = visitor.toWidgets(namedArgs['child']);

        return Transform.rotate(
          key: key,
          angle: angle,
          origin: origin,
          alignment: alignment,
          transformHitTests: transformHitTests,
          filterQuality: filterQuality,
          child: child,
        );
      },
      'translate': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final offset = namedArgs.get<Offset>('offset')!;
        final transformHitTests =
            namedArgs.get<bool?>('transformHitTests') ?? true;
        final filterQuality = namedArgs.get<FilterQuality?>('filterQuality');
        final child = visitor.toWidgets(namedArgs['child']);

        return Transform.translate(
          key: key,
          offset: offset,
          transformHitTests: transformHitTests,
          filterQuality: filterQuality,
          child: child,
        );
      },
      'scale': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final scale = namedArgs.getToDouble('scale');
        final scaleX = namedArgs.getToDouble('scaleX');
        final scaleY = namedArgs.getToDouble('scaleY');
        final origin = namedArgs.get<Offset?>('origin');
        final alignment =
            namedArgs.get<AlignmentGeometry?>('alignment') ?? Alignment.center;
        final transformHitTests =
            namedArgs.get<bool?>('transformHitTests') ?? true;
        final filterQuality = namedArgs.get<FilterQuality?>('filterQuality');
        final child = visitor.toWidgets(namedArgs['child']);

        return Transform.scale(
          key: key,
          scale: scale,
          scaleX: scaleX,
          scaleY: scaleY,
          origin: origin,
          alignment: alignment,
          transformHitTests: transformHitTests,
          filterQuality: filterQuality,
          child: child,
        );
      },
      'flip': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final flipX = namedArgs.get<bool?>('flipX') ?? false;
        final flipY = namedArgs.get<bool?>('flipY') ?? false;
        final origin = namedArgs.get<Offset?>('origin');
        final transformHitTests =
            namedArgs.get<bool?>('transformHitTests') ?? true;
        final filterQuality = namedArgs.get<FilterQuality?>('filterQuality');
        final child = visitor.toWidgets(namedArgs['child']);

        return Transform.flip(
          key: key,
          flipX: flipX,
          flipY: flipY,
          origin: origin,
          transformHitTests: transformHitTests,
          filterQuality: filterQuality,
          child: child,
        );
      },
    },
    getters: {
      'transform': (visitor, target) => (target as Transform).transform,
      'origin': (visitor, target) => (target as Transform).origin,
      'alignment': (visitor, target) => (target as Transform).alignment,
      'transformHitTests': (visitor, target) =>
          (target as Transform).transformHitTests,
      'filterQuality': (visitor, target) => (target as Transform).filterQuality,
      'child': (visitor, target) => (target as Transform).child,
      'key': (visitor, target) => (target as Transform).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter FittedBox widget.
BridgedClass getFittedBoxBridgingDefinition() {
  return BridgedClass(
    nativeType: FittedBox,
    name: 'FittedBox',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final fit = namedArgs.get<BoxFit?>('fit') ?? BoxFit.contain;
        final alignment =
            namedArgs.get<AlignmentGeometry?>('alignment') ?? Alignment.center;
        final clipBehavior = namedArgs.get<Clip?>('clipBehavior') ?? Clip.none;
        final child = visitor.toWidgets(namedArgs['child']);

        return FittedBox(
          key: key,
          fit: fit,
          alignment: alignment,
          clipBehavior: clipBehavior,
          child: child,
        );
      },
    },
    getters: {
      'fit': (visitor, target) => (target as FittedBox).fit,
      'alignment': (visitor, target) => (target as FittedBox).alignment,
      'clipBehavior': (visitor, target) => (target as FittedBox).clipBehavior,
      'child': (visitor, target) => (target as FittedBox).child,
      'key': (visitor, target) => (target as FittedBox).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter ConstrainedBox widget.
BridgedClass getConstrainedBoxBridgingDefinition() {
  return BridgedClass(
    nativeType: ConstrainedBox,
    name: 'ConstrainedBox',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final constraints = namedArgs.get<BoxConstraints>('constraints')!;
        final child = visitor.toWidgets(namedArgs['child']);

        return ConstrainedBox(key: key, constraints: constraints, child: child);
      },
    },
    getters: {
      'constraints': (visitor, target) =>
          (target as ConstrainedBox).constraints,
      'child': (visitor, target) => (target as ConstrainedBox).child,
      'key': (visitor, target) => (target as ConstrainedBox).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter UnconstrainedBox widget.
BridgedClass getUnconstrainedBoxBridgingDefinition() {
  return BridgedClass(
    nativeType: UnconstrainedBox,
    name: 'UnconstrainedBox',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final textDirection = namedArgs.get<TextDirection?>('textDirection');
        final alignment =
            namedArgs.get<AlignmentGeometry?>('alignment') ?? Alignment.center;
        final constrainedAxis = namedArgs.get<Axis?>('constrainedAxis');
        final clipBehavior = namedArgs.get<Clip?>('clipBehavior') ?? Clip.none;
        final child = visitor.toWidgets(namedArgs['child']);

        return UnconstrainedBox(
          key: key,
          textDirection: textDirection,
          alignment: alignment,
          constrainedAxis: constrainedAxis,
          clipBehavior: clipBehavior,
          child: child,
        );
      },
    },
    getters: {
      'textDirection': (visitor, target) =>
          (target as UnconstrainedBox).textDirection,
      'alignment': (visitor, target) => (target as UnconstrainedBox).alignment,
      'constrainedAxis': (visitor, target) =>
          (target as UnconstrainedBox).constrainedAxis,
      'clipBehavior': (visitor, target) =>
          (target as UnconstrainedBox).clipBehavior,
      'child': (visitor, target) => (target as UnconstrainedBox).child,
      'key': (visitor, target) => (target as UnconstrainedBox).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter FractionallySizedBox widget.
BridgedClass getFractionallySizedBoxBridgingDefinition() {
  return BridgedClass(
    nativeType: FractionallySizedBox,
    name: 'FractionallySizedBox',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final alignment =
            namedArgs.get<AlignmentGeometry?>('alignment') ?? Alignment.center;
        final widthFactor = namedArgs.getToDouble('widthFactor');
        final heightFactor = namedArgs.getToDouble('heightFactor');
        final child = visitor.toWidgets(namedArgs['child']);

        return FractionallySizedBox(
          key: key,
          alignment: alignment,
          widthFactor: widthFactor,
          heightFactor: heightFactor,
          child: child,
        );
      },
    },
    getters: {
      'alignment': (visitor, target) =>
          (target as FractionallySizedBox).alignment,
      'widthFactor': (visitor, target) =>
          (target as FractionallySizedBox).widthFactor,
      'heightFactor': (visitor, target) =>
          (target as FractionallySizedBox).heightFactor,
      'child': (visitor, target) => (target as FractionallySizedBox).child,
      'key': (visitor, target) => (target as FractionallySizedBox).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter LimitedBox widget.
BridgedClass getLimitedBoxBridgingDefinition() {
  return BridgedClass(
    nativeType: LimitedBox,
    name: 'LimitedBox',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final maxWidth = namedArgs.getToDouble('maxWidth') ?? double.infinity;
        final maxHeight = namedArgs.getToDouble('maxHeight') ?? double.infinity;
        final child = visitor.toWidgets(namedArgs['child']);

        return LimitedBox(
          key: key,
          maxWidth: maxWidth,
          maxHeight: maxHeight,
          child: child,
        );
      },
    },
    getters: {
      'maxWidth': (visitor, target) => (target as LimitedBox).maxWidth,
      'maxHeight': (visitor, target) => (target as LimitedBox).maxHeight,
      'child': (visitor, target) => (target as LimitedBox).child,
      'key': (visitor, target) => (target as LimitedBox).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter OverflowBox widget.
BridgedClass getOverflowBoxBridgingDefinition() {
  return BridgedClass(
    nativeType: OverflowBox,
    name: 'OverflowBox',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final alignment =
            namedArgs.get<AlignmentGeometry?>('alignment') ?? Alignment.center;
        final minWidth = namedArgs.getToDouble('minWidth');
        final maxWidth = namedArgs.getToDouble('maxWidth');
        final minHeight = namedArgs.getToDouble('minHeight');
        final maxHeight = namedArgs.getToDouble('maxHeight');
        final fit = namedArgs.get<dynamic>('fit');
        final child = visitor.toWidgets(namedArgs['child']);

        return OverflowBox(
          key: key,
          alignment: alignment,
          minWidth: minWidth,
          maxWidth: maxWidth,
          minHeight: minHeight,
          maxHeight: maxHeight,
          fit: fit,
          child: child,
        );
      },
    },
    getters: {
      'alignment': (visitor, target) => (target as OverflowBox).alignment,
      'minWidth': (visitor, target) => (target as OverflowBox).minWidth,
      'maxWidth': (visitor, target) => (target as OverflowBox).maxWidth,
      'minHeight': (visitor, target) => (target as OverflowBox).minHeight,
      'maxHeight': (visitor, target) => (target as OverflowBox).maxHeight,
      'fit': (visitor, target) => (target as OverflowBox).fit,
      'child': (visitor, target) => (target as OverflowBox).child,
      'key': (visitor, target) => (target as OverflowBox).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter SizedOverflowBox widget.
BridgedClass getSizedOverflowBoxBridgingDefinition() {
  return BridgedClass(
    nativeType: SizedOverflowBox,
    name: 'SizedOverflowBox',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final size = namedArgs.get<Size>('size')!;
        final alignment =
            namedArgs.get<AlignmentGeometry?>('alignment') ?? Alignment.center;
        final child = visitor.toWidgets(namedArgs['child']);

        return SizedOverflowBox(
          key: key,
          size: size,
          alignment: alignment,
          child: child,
        );
      },
    },
    getters: {
      'size': (visitor, target) => (target as SizedOverflowBox).size,
      'alignment': (visitor, target) => (target as SizedOverflowBox).alignment,
      'child': (visitor, target) => (target as SizedOverflowBox).child,
      'key': (visitor, target) => (target as SizedOverflowBox).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter Offstage widget.
BridgedClass getOffstageBridgingDefinition() {
  return BridgedClass(
    nativeType: Offstage,
    name: 'Offstage',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final offstage = namedArgs.get<bool?>('offstage') ?? true;
        final child = visitor.toWidgets(namedArgs['child']);

        return Offstage(key: key, offstage: offstage, child: child);
      },
    },
    getters: {
      'offstage': (visitor, target) => (target as Offstage).offstage,
      'child': (visitor, target) => (target as Offstage).child,
      'key': (visitor, target) => (target as Offstage).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter AspectRatio widget.
BridgedClass getAspectRatioBridgingDefinition() {
  return BridgedClass(
    nativeType: AspectRatio,
    name: 'AspectRatio',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final aspectRatio = namedArgs.getToDouble('aspectRatio')!;
        final child = visitor.toWidgets(namedArgs['child']);

        return AspectRatio(key: key, aspectRatio: aspectRatio, child: child);
      },
    },
    getters: {
      'aspectRatio': (visitor, target) => (target as AspectRatio).aspectRatio,
      'child': (visitor, target) => (target as AspectRatio).child,
      'key': (visitor, target) => (target as AspectRatio).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter IntrinsicWidth widget.
BridgedClass getIntrinsicWidthBridgingDefinition() {
  return BridgedClass(
    nativeType: IntrinsicWidth,
    name: 'IntrinsicWidth',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final stepWidth = namedArgs.getToDouble('stepWidth');
        final stepHeight = namedArgs.getToDouble('stepHeight');
        final child = visitor.toWidgets(namedArgs['child']);

        return IntrinsicWidth(
          key: key,
          stepWidth: stepWidth,
          stepHeight: stepHeight,
          child: child,
        );
      },
    },
    getters: {
      'stepWidth': (visitor, target) => (target as IntrinsicWidth).stepWidth,
      'stepHeight': (visitor, target) => (target as IntrinsicWidth).stepHeight,
      'child': (visitor, target) => (target as IntrinsicWidth).child,
      'key': (visitor, target) => (target as IntrinsicWidth).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter IntrinsicHeight widget.
BridgedClass getIntrinsicHeightBridgingDefinition() {
  return BridgedClass(
    nativeType: IntrinsicHeight,
    name: 'IntrinsicHeight',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final child = visitor.toWidgets(namedArgs['child']);

        return IntrinsicHeight(key: key, child: child);
      },
    },
    getters: {
      'child': (visitor, target) => (target as IntrinsicHeight).child,
      'key': (visitor, target) => (target as IntrinsicHeight).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter Baseline widget.
BridgedClass getBaselineBridgingDefinition() {
  return BridgedClass(
    nativeType: Baseline,
    name: 'Baseline',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final baseline = namedArgs.getToDouble('baseline')!;
        final baselineType = namedArgs.get<TextBaseline>('baselineType')!;
        final child = visitor.toWidgets(namedArgs['child']);

        return Baseline(
          key: key,
          baseline: baseline,
          baselineType: baselineType,
          child: child,
        );
      },
    },
    getters: {
      'baseline': (visitor, target) => (target as Baseline).baseline,
      'baselineType': (visitor, target) => (target as Baseline).baselineType,
      'child': (visitor, target) => (target as Baseline).child,
      'key': (visitor, target) => (target as Baseline).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter Flex widget.
BridgedClass getFlexBridgingDefinition() {
  return BridgedClass(
    nativeType: Flex,
    name: 'Flex',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final direction = namedArgs.get<Axis>('direction')!;
        final mainAxisAlignment =
            namedArgs.get<MainAxisAlignment?>('mainAxisAlignment') ??
            MainAxisAlignment.start;
        final mainAxisSize =
            namedArgs.get<MainAxisSize?>('mainAxisSize') ?? MainAxisSize.max;
        final crossAxisAlignment =
            namedArgs.get<CrossAxisAlignment?>('crossAxisAlignment') ??
            CrossAxisAlignment.center;
        final textDirection = namedArgs.get<TextDirection?>('textDirection');
        final verticalDirection =
            namedArgs.get<VerticalDirection?>('verticalDirection') ??
            VerticalDirection.down;
        final textBaseline = namedArgs.get<TextBaseline?>('textBaseline');
        final clipBehavior = namedArgs.get<Clip?>('clipBehavior') ?? Clip.none;
        final spacing = namedArgs.getToDouble('spacing') ?? 0.0;
        final children = visitor.toWidgets(namedArgs['children']);

        return Flex(
          key: key,
          direction: direction,
          mainAxisAlignment: mainAxisAlignment,
          mainAxisSize: mainAxisSize,
          crossAxisAlignment: crossAxisAlignment,
          textDirection: textDirection,
          verticalDirection: verticalDirection,
          textBaseline: textBaseline,
          clipBehavior: clipBehavior,
          spacing: spacing,
          children: children,
        );
      },
    },
    getters: {
      'direction': (visitor, target) => (target as Flex).direction,
      'mainAxisAlignment': (visitor, target) =>
          (target as Flex).mainAxisAlignment,
      'mainAxisSize': (visitor, target) => (target as Flex).mainAxisSize,
      'crossAxisAlignment': (visitor, target) =>
          (target as Flex).crossAxisAlignment,
      'textDirection': (visitor, target) => (target as Flex).textDirection,
      'verticalDirection': (visitor, target) =>
          (target as Flex).verticalDirection,
      'textBaseline': (visitor, target) => (target as Flex).textBaseline,
      'clipBehavior': (visitor, target) => (target as Flex).clipBehavior,
      'spacing': (visitor, target) => (target as Flex).spacing,
      'children': (visitor, target) => (target as Flex).children,
      'key': (visitor, target) => (target as Flex).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter Wrap widget.
BridgedClass getWrapBridgingDefinition() {
  return BridgedClass(
    nativeType: Wrap,
    name: 'Wrap',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final direction = namedArgs.get<Axis?>('direction') ?? Axis.horizontal;
        final alignment =
            namedArgs.get<WrapAlignment?>('alignment') ?? WrapAlignment.start;
        final spacing = namedArgs.getToDouble('spacing') ?? 0.0;
        final runAlignment =
            namedArgs.get<WrapAlignment?>('runAlignment') ??
            WrapAlignment.start;
        final runSpacing = namedArgs.getToDouble('runSpacing') ?? 0.0;
        final crossAxisAlignment =
            namedArgs.get<WrapCrossAlignment?>('crossAxisAlignment') ??
            WrapCrossAlignment.start;
        final textDirection = namedArgs.get<TextDirection?>('textDirection');
        final verticalDirection =
            namedArgs.get<VerticalDirection?>('verticalDirection') ??
            VerticalDirection.down;
        final clipBehavior = namedArgs.get<Clip?>('clipBehavior') ?? Clip.none;
        final children = visitor.toWidgets(namedArgs['children']);

        return Wrap(
          key: key,
          direction: direction,
          alignment: alignment,
          spacing: spacing,
          runAlignment: runAlignment,
          runSpacing: runSpacing,
          crossAxisAlignment: crossAxisAlignment,
          textDirection: textDirection,
          verticalDirection: verticalDirection,
          clipBehavior: clipBehavior,
          children: children,
        );
      },
    },
    getters: {
      'direction': (visitor, target) => (target as Wrap).direction,
      'alignment': (visitor, target) => (target as Wrap).alignment,
      'spacing': (visitor, target) => (target as Wrap).spacing,
      'runAlignment': (visitor, target) => (target as Wrap).runAlignment,
      'runSpacing': (visitor, target) => (target as Wrap).runSpacing,
      'crossAxisAlignment': (visitor, target) =>
          (target as Wrap).crossAxisAlignment,
      'textDirection': (visitor, target) => (target as Wrap).textDirection,
      'verticalDirection': (visitor, target) =>
          (target as Wrap).verticalDirection,
      'clipBehavior': (visitor, target) => (target as Wrap).clipBehavior,
      'children': (visitor, target) => (target as Wrap).children,
      'key': (visitor, target) => (target as Wrap).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter IndexedStack widget.
BridgedClass getIndexedStackBridgingDefinition() {
  return BridgedClass(
    nativeType: IndexedStack,
    name: 'IndexedStack',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final alignment =
            namedArgs.get<AlignmentGeometry?>('alignment') ??
            AlignmentDirectional.topStart;
        final textDirection = namedArgs.get<TextDirection?>('textDirection');
        final clipBehavior =
            namedArgs.get<Clip?>('clipBehavior') ?? Clip.hardEdge;
        final sizing = namedArgs.get<StackFit?>('sizing') ?? StackFit.loose;
        final index = namedArgs.get<int?>('index') ?? 0;
        final children = visitor.toWidgets(namedArgs['children']);

        return IndexedStack(
          key: key,
          alignment: alignment,
          textDirection: textDirection,
          clipBehavior: clipBehavior,
          sizing: sizing,
          index: index,
          children: children,
        );
      },
    },
    getters: {
      'alignment': (visitor, target) => (target as IndexedStack).alignment,
      'textDirection': (visitor, target) =>
          (target as IndexedStack).textDirection,
      'clipBehavior': (visitor, target) =>
          (target as IndexedStack).clipBehavior,
      'sizing': (visitor, target) => (target as IndexedStack).sizing,
      'index': (visitor, target) => (target as IndexedStack).index,
      'children': (visitor, target) => (target as IndexedStack).children,
      'key': (visitor, target) => (target as IndexedStack).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter ColoredBox widget.
BridgedClass getColoredBoxBridgingDefinition() {
  return BridgedClass(
    nativeType: ColoredBox,
    name: 'ColoredBox',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final color = namedArgs.get<Color>('color')!;
        final child = visitor.toWidgets(namedArgs['child']);

        return ColoredBox(key: key, color: color, child: child);
      },
    },
    getters: {
      'color': (visitor, target) => (target as ColoredBox).color,
      'child': (visitor, target) => (target as ColoredBox).child,
      'key': (visitor, target) => (target as ColoredBox).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter ClipRect widget.
BridgedClass getClipRectBridgingDefinition() {
  return BridgedClass(
    nativeType: ClipRect,
    name: 'ClipRect',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final clipper = namedArgs.get<CustomClipper<Rect>?>('clipper');
        final clipBehavior =
            namedArgs.get<Clip?>('clipBehavior') ?? Clip.hardEdge;
        final child = visitor.toWidgets(namedArgs['child']);

        return ClipRect(
          key: key,
          clipper: clipper,
          clipBehavior: clipBehavior,
          child: child,
        );
      },
    },
    getters: {
      'clipper': (visitor, target) => (target as ClipRect).clipper,
      'clipBehavior': (visitor, target) => (target as ClipRect).clipBehavior,
      'child': (visitor, target) => (target as ClipRect).child,
      'key': (visitor, target) => (target as ClipRect).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter ClipRRect widget.
BridgedClass getClipRRectBridgingDefinition() {
  return BridgedClass(
    nativeType: ClipRRect,
    name: 'ClipRRect',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final borderRadius =
            namedArgs.get<BorderRadiusGeometry?>('borderRadius') ??
            BorderRadius.zero;
        final clipper = namedArgs.get<CustomClipper<RRect>?>('clipper');
        final clipBehavior =
            namedArgs.get<Clip?>('clipBehavior') ?? Clip.antiAlias;
        final child = visitor.toWidgets(namedArgs['child']);

        return ClipRRect(
          key: key,
          borderRadius: borderRadius,
          clipper: clipper,
          clipBehavior: clipBehavior,
          child: child,
        );
      },
    },
    getters: {
      'borderRadius': (visitor, target) => (target as ClipRRect).borderRadius,
      'clipper': (visitor, target) => (target as ClipRRect).clipper,
      'clipBehavior': (visitor, target) => (target as ClipRRect).clipBehavior,
      'child': (visitor, target) => (target as ClipRRect).child,
      'key': (visitor, target) => (target as ClipRRect).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter ClipOval widget.
BridgedClass getClipOvalBridgingDefinition() {
  return BridgedClass(
    nativeType: ClipOval,
    name: 'ClipOval',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final clipper = namedArgs.get<CustomClipper<Rect>?>('clipper');
        final clipBehavior =
            namedArgs.get<Clip?>('clipBehavior') ?? Clip.antiAlias;
        final child = visitor.toWidgets(namedArgs['child']);

        return ClipOval(
          key: key,
          clipper: clipper,
          clipBehavior: clipBehavior,
          child: child,
        );
      },
    },
    getters: {
      'clipper': (visitor, target) => (target as ClipOval).clipper,
      'clipBehavior': (visitor, target) => (target as ClipOval).clipBehavior,
      'child': (visitor, target) => (target as ClipOval).child,
      'key': (visitor, target) => (target as ClipOval).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter ClipPath widget.
BridgedClass getClipPathBridgingDefinition() {
  return BridgedClass(
    nativeType: ClipPath,
    name: 'ClipPath',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final clipper = namedArgs.get<CustomClipper<Path>?>('clipper');
        final clipBehavior =
            namedArgs.get<Clip?>('clipBehavior') ?? Clip.antiAlias;
        final child = visitor.toWidgets(namedArgs['child']);

        return ClipPath(
          key: key,
          clipper: clipper,
          clipBehavior: clipBehavior,
          child: child,
        );
      },
    },
    getters: {
      'clipper': (visitor, target) => (target as ClipPath).clipper,
      'clipBehavior': (visitor, target) => (target as ClipPath).clipBehavior,
      'child': (visitor, target) => (target as ClipPath).child,
      'key': (visitor, target) => (target as ClipPath).key,
    },
    staticMethods: {
      'shape': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final shape = namedArgs.get<ShapeBorder>('shape')!;
        final clipBehavior =
            namedArgs.get<Clip?>('clipBehavior') ?? Clip.antiAlias;
        final child = visitor.toWidgets(namedArgs['child']);

        return ClipPath.shape(
          key: key,
          shape: shape,
          clipBehavior: clipBehavior,
          child: child,
        );
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter RepaintBoundary widget.
BridgedClass getRepaintBoundaryBridgingDefinition() {
  return BridgedClass(
    nativeType: RepaintBoundary,
    name: 'RepaintBoundary',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final child = visitor.toWidgets(namedArgs['child']);

        return RepaintBoundary(key: key, child: child);
      },
    },
    getters: {
      'child': (visitor, target) => (target as RepaintBoundary).child,
      'key': (visitor, target) => (target as RepaintBoundary).key,
    },
    staticMethods: {
      'wrap': (visitor, positionalArgs, namedArgs) {
        final child = visitor.toWidgets(positionalArgs[0]);
        final childIndex = positionalArgs.get<int>(1) ?? 0;
        return RepaintBoundary.wrap(child, childIndex);
      },
      'wrapAll': (visitor, positionalArgs, namedArgs) {
        final widgets = positionalArgs.get<List>(0)!;
        return RepaintBoundary.wrapAll(widgets.cast());
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter IgnorePointer widget.
BridgedClass getIgnorePointerBridgingDefinition() {
  return BridgedClass(
    nativeType: IgnorePointer,
    name: 'IgnorePointer',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final ignoring = namedArgs.get<bool?>('ignoring') ?? true;
        final ignoringSemantics = namedArgs.get<bool?>('ignoringSemantics');
        final child = visitor.toWidgets(namedArgs['child']);

        return IgnorePointer(
          key: key,
          ignoring: ignoring,
          ignoringSemantics: ignoringSemantics,
          child: child,
        );
      },
    },
    getters: {
      'ignoring': (visitor, target) => (target as IgnorePointer).ignoring,
      'ignoringSemantics': (visitor, target) =>
          (target as IgnorePointer).ignoringSemantics,
      'child': (visitor, target) => (target as IgnorePointer).child,
      'key': (visitor, target) => (target as IgnorePointer).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter AbsorbPointer widget.
BridgedClass getAbsorbPointerBridgingDefinition() {
  return BridgedClass(
    nativeType: AbsorbPointer,
    name: 'AbsorbPointer',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final absorbing = namedArgs.get<bool?>('absorbing') ?? true;
        final ignoringSemantics = namedArgs.get<bool?>('ignoringSemantics');
        final child = visitor.toWidgets(namedArgs['child']);

        return AbsorbPointer(
          key: key,
          absorbing: absorbing,
          ignoringSemantics: ignoringSemantics,
          child: child,
        );
      },
    },
    getters: {
      'absorbing': (visitor, target) => (target as AbsorbPointer).absorbing,
      'ignoringSemantics': (visitor, target) =>
          (target as AbsorbPointer).ignoringSemantics,
      'child': (visitor, target) => (target as AbsorbPointer).child,
      'key': (visitor, target) => (target as AbsorbPointer).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter Listener widget.
BridgedClass getListenerBridgingDefinition() {
  return BridgedClass(
    nativeType: Listener,
    name: 'Listener',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final behavior =
            namedArgs.get<HitTestBehavior?>('behavior') ??
            HitTestBehavior.deferToChild;
        final child = visitor.toWidgets(namedArgs['child']);

        return Listener(key: key, behavior: behavior, child: child);
      },
    },
    getters: {
      'behavior': (visitor, target) => (target as Listener).behavior,
      'child': (visitor, target) => (target as Listener).child,
      'key': (visitor, target) => (target as Listener).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter MouseRegion widget.
BridgedClass getMouseRegionBridgingDefinition() {
  return BridgedClass(
    nativeType: MouseRegion,
    name: 'MouseRegion',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final cursor =
            namedArgs.get<MouseCursor?>('cursor') ?? MouseCursor.defer;
        final opaque = namedArgs.get<bool?>('opaque') ?? true;
        final hitTestBehavior = namedArgs.get<HitTestBehavior?>(
          'hitTestBehavior',
        );
        final child = visitor.toWidgets(namedArgs['child']);

        return MouseRegion(
          key: key,
          cursor: cursor,
          opaque: opaque,
          hitTestBehavior: hitTestBehavior,
          child: child,
        );
      },
    },
    getters: {
      'cursor': (visitor, target) => (target as MouseRegion).cursor,
      'opaque': (visitor, target) => (target as MouseRegion).opaque,
      'hitTestBehavior': (visitor, target) =>
          (target as MouseRegion).hitTestBehavior,
      'child': (visitor, target) => (target as MouseRegion).child,
      'key': (visitor, target) => (target as MouseRegion).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter Builder widget.
BridgedClass getBuilderBridgingDefinition() {
  return BridgedClass(
    nativeType: Builder,
    name: 'Builder',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final builder = namedArgs.get<WidgetBuilder>('builder')!;

        return Builder(key: key, builder: builder);
      },
    },
    getters: {
      'builder': (visitor, target) => (target as Builder).builder,
      'key': (visitor, target) => (target as Builder).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter FractionalTranslation widget.
BridgedClass getFractionalTranslationBridgingDefinition() {
  return BridgedClass(
    nativeType: FractionalTranslation,
    name: 'FractionalTranslation',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final translation = namedArgs.get<Offset>('translation')!;
        final transformHitTests =
            namedArgs.get<bool?>('transformHitTests') ?? true;
        final child = visitor.toWidgets(namedArgs['child']);

        return FractionalTranslation(
          key: key,
          translation: translation,
          transformHitTests: transformHitTests,
          child: child,
        );
      },
    },
    getters: {
      'translation': (visitor, target) =>
          (target as FractionalTranslation).translation,
      'transformHitTests': (visitor, target) =>
          (target as FractionalTranslation).transformHitTests,
      'child': (visitor, target) => (target as FractionalTranslation).child,
      'key': (visitor, target) => (target as FractionalTranslation).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter RotatedBox widget.
BridgedClass getRotatedBoxBridgingDefinition() {
  return BridgedClass(
    nativeType: RotatedBox,
    name: 'RotatedBox',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final quarterTurns = namedArgs.get<int>('quarterTurns')!;
        final child = visitor.toWidgets(namedArgs['child']);

        return RotatedBox(key: key, quarterTurns: quarterTurns, child: child);
      },
    },
    getters: {
      'quarterTurns': (visitor, target) => (target as RotatedBox).quarterTurns,
      'child': (visitor, target) => (target as RotatedBox).child,
      'key': (visitor, target) => (target as RotatedBox).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter Visibility widget.
BridgedClass getVisibilityBridgingDefinition() {
  return BridgedClass(
    nativeType: Visibility,
    name: 'Visibility',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final visible = namedArgs.get<bool?>('visible') ?? true;
        final replacement =
            visitor.toWidgets(namedArgs['replacement']) ??
            const SizedBox.shrink();
        final maintainState = namedArgs.get<bool?>('maintainState') ?? false;
        final maintainAnimation =
            namedArgs.get<bool?>('maintainAnimation') ?? false;
        final maintainSize = namedArgs.get<bool?>('maintainSize') ?? false;
        final maintainSemantics =
            namedArgs.get<bool?>('maintainSemantics') ?? false;
        final maintainInteractivity =
            namedArgs.get<bool?>('maintainInteractivity') ?? false;
        final child = visitor.toWidgets(namedArgs['child'])!;

        return Visibility(
          key: key,
          visible: visible,
          replacement: replacement,
          maintainState: maintainState,
          maintainAnimation: maintainAnimation,
          maintainSize: maintainSize,
          maintainSemantics: maintainSemantics,
          maintainInteractivity: maintainInteractivity,
          child: child,
        );
      },
    },
    getters: {
      'visible': (visitor, target) => (target as Visibility).visible,
      'replacement': (visitor, target) => (target as Visibility).replacement,
      'maintainState': (visitor, target) =>
          (target as Visibility).maintainState,
      'maintainAnimation': (visitor, target) =>
          (target as Visibility).maintainAnimation,
      'maintainSize': (visitor, target) => (target as Visibility).maintainSize,
      'maintainSemantics': (visitor, target) =>
          (target as Visibility).maintainSemantics,
      'maintainInteractivity': (visitor, target) =>
          (target as Visibility).maintainInteractivity,
      'child': (visitor, target) => (target as Visibility).child,
      'key': (visitor, target) => (target as Visibility).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter CustomPaint widget.
BridgedClass getCustomPaintBridgingDefinition() {
  return BridgedClass(
    nativeType: CustomPaint,
    name: 'CustomPaint',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final painter = namedArgs.get<InterpretedInstance?>('painter');
        final foregroundPainter = namedArgs.get<InterpretedInstance?>(
          'foregroundPainter',
        );
        final size = namedArgs.get<Size?>('size') ?? Size.zero;
        final isComplex = namedArgs.get<bool?>('isComplex') ?? false;
        final willChange = namedArgs.get<bool?>('willChange') ?? false;
        final child = visitor.toWidgets(namedArgs['child']);

        return CustomPaint(
          key: key,
          painter: painter == null
              ? null
              : CustomPainterBridge(visitor: visitor, instance: painter),
          foregroundPainter: foregroundPainter == null
              ? null
              : CustomPainterBridge(
                  visitor: visitor,
                  instance: foregroundPainter,
                ),
          size: size,
          isComplex: isComplex,
          willChange: willChange,
          child: child,
        );
      },
    },
    getters: {
      'painter': (visitor, target) => (target as CustomPaint).painter,
      'foregroundPainter': (visitor, target) =>
          (target as CustomPaint).foregroundPainter,
      'size': (visitor, target) => (target as CustomPaint).size,
      'isComplex': (visitor, target) => (target as CustomPaint).isComplex,
      'willChange': (visitor, target) => (target as CustomPaint).willChange,
      'child': (visitor, target) => (target as CustomPaint).child,
      'key': (visitor, target) => (target as CustomPaint).key,
    },
  );
}

/// Returns basic widget bridges for d4rt.
Map<String, BridgedClass> getBasicBridgingDefinitions() {
  return {
    'Directionality': getDirectionalityBridgingDefinition(),
    'Opacity': getOpacityBridgingDefinition(),
    'Transform': getTransformBridgingDefinition(),
    'FittedBox': getFittedBoxBridgingDefinition(),
    'ConstrainedBox': getConstrainedBoxBridgingDefinition(),
    'UnconstrainedBox': getUnconstrainedBoxBridgingDefinition(),
    'FractionallySizedBox': getFractionallySizedBoxBridgingDefinition(),
    'LimitedBox': getLimitedBoxBridgingDefinition(),
    'OverflowBox': getOverflowBoxBridgingDefinition(),
    'SizedOverflowBox': getSizedOverflowBoxBridgingDefinition(),
    'Offstage': getOffstageBridgingDefinition(),
    'AspectRatio': getAspectRatioBridgingDefinition(),
    'IntrinsicWidth': getIntrinsicWidthBridgingDefinition(),
    'IntrinsicHeight': getIntrinsicHeightBridgingDefinition(),
    'Baseline': getBaselineBridgingDefinition(),
    'Flex': getFlexBridgingDefinition(),
    'Wrap': getWrapBridgingDefinition(),
    'IndexedStack': getIndexedStackBridgingDefinition(),
    'ColoredBox': getColoredBoxBridgingDefinition(),
    'ClipRect': getClipRectBridgingDefinition(),
    'ClipRRect': getClipRRectBridgingDefinition(),
    'ClipOval': getClipOvalBridgingDefinition(),
    'ClipPath': getClipPathBridgingDefinition(),
    'RepaintBoundary': getRepaintBoundaryBridgingDefinition(),
    'IgnorePointer': getIgnorePointerBridgingDefinition(),
    'AbsorbPointer': getAbsorbPointerBridgingDefinition(),
    'Listener': getListenerBridgingDefinition(),
    'MouseRegion': getMouseRegionBridgingDefinition(),
    'Builder': getBuilderBridgingDefinition(),
    'FractionalTranslation': getFractionalTranslationBridgingDefinition(),
    'RotatedBox': getRotatedBoxBridgingDefinition(),
    'Visibility': getVisibilityBridgingDefinition(),
    'CustomPaint': getCustomPaintBridgingDefinition(),
    'PreferredSize': getPreferredSizeBridgingDefinition(),
  };
}

/// Returns the BridgedClass for the Flutter PreferredSize widget.
BridgedClass getPreferredSizeBridgingDefinition() {
  return BridgedClass(
    nativeType: PreferredSize,
    name: 'PreferredSize',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final preferredSize = namedArgs.get<Size>('preferredSize') ??
            (positionalArgs.isNotEmpty ? positionalArgs[0] as Size : Size.zero);
        final child = visitor.toWidgets(namedArgs['child']) ??
            (positionalArgs.length > 1
                ? visitor.toWidgets(positionalArgs[1])
                : const SizedBox.shrink());

        return PreferredSize(
          key: key,
          preferredSize: preferredSize,
          child: child!,
        );
      },
    },
    getters: {
      'preferredSize': (visitor, target) =>
          (target as PreferredSize).preferredSize,
      'child': (visitor, target) => (target as PreferredSize).child,
      'key': (visitor, target) => (target as PreferredSize).key,
    },
    isSubtypeOfFunc: (value) =>
        value is PreferredSize || value is PreferredSizeWidget,
  );
}
