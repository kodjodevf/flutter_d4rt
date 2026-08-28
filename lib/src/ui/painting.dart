// ignore_for_file: deprecated_member_use

import 'dart:ui';
import 'dart:typed_data';
import 'package:d4rt/d4rt.dart';
import 'package:flutter_d4rt/utils/double.dart';
import 'package:flutter_d4rt/utils/extensions/list.dart';

/// Returns all painting bridge definitions
Map<String, dynamic> getPaintingBridgingDefinitions() {
  return {
    'Color': getColorBridgingDefinition(),
    'Paint': getPaintBridgingDefinition(),
    'BlendMode': getBlendModeBridgingDefinition(),
    'PaintingStyle': getPaintingStyleBridgingDefinition(),
    'StrokeCap': getStrokeCapBridgingDefinition(),
    'StrokeJoin': getStrokeJoinBridgingDefinition(),
    'FilterQuality': getFilterQualityBridgingDefinition(),
    'TileMode': getTileModeBridgingDefinition(),
    'Shader': getShaderBridgingDefinition(),
    'Gradient': getGradientBridgingDefinition(),
    'ImageShader': getImageShaderBridgingDefinition(),
    'ColorFilter': getColorFilterBridgingDefinition(),
    'ImageFilter': getImageFilterBridgingDefinition(),
    'MaskFilter': getMaskFilterBridgingDefinition(),
    'BlurStyle': getBlurStyleBridgingDefinition(),
    'Shadow': getShadowBridgingDefinition(),
    'Canvas': getCanvasBridgingDefinition(),
    'Picture': getPictureBridgingDefinition(),
    'PictureRecorder': getPictureRecorderBridgingDefinition(),
    'Vertices': getVerticesBridgingDefinition(),
    'VertexMode': getVertexModeBridgingDefinition(),
    'PointMode': getPointModeBridgingDefinition(),
    'ClipOp': getClipOpBridgingDefinition(),
    'Path': getPathBridgingDefinition(),
    'PathFillType': getPathFillTypeBridgingDefinition(),
    'PathOperation': getPathOperationBridgingDefinition(),
    'PathMetrics': getPathMetricsBridgingDefinition(),
    'PathMetric': getPathMetricBridgingDefinition(),
    'Tangent': getTangentBridgingDefinition(),
    'FragmentProgram': getFragmentProgramBridgingDefinition(),
    'FragmentShader': getFragmentShaderBridgingDefinition(),
    'ImageByteFormat': getImageByteFormatBridgingDefinition(),
    'PixelFormat': getPixelFormatBridgingDefinition(),
    'Image': getImageBridgingDefinition(),
    'FrameInfo': getFrameInfoBridgingDefinition(),
    'Codec': getCodecBridgingDefinition(),
    'ImmutableBuffer': getImmutableBufferBridgingDefinition(),
    'ImageDescriptor': getImageDescriptorBridgingDefinition(),
  };
}

/// Returns the BridgedClass for the Flutter Color class.
BridgedClass getColorBridgingDefinition() {
  return BridgedClass(
    nativeType: Color,
    name: 'Color',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final value = positionalArgs.get<int?>(0);
        return Color(value!);
      },
      'fromARGB': (visitor, positionalArgs, namedArgs) {
        final alpha = positionalArgs.get<int?>(0);
        final red = positionalArgs.get<int?>(1);
        final green = positionalArgs.get<int?>(2);
        final blue = positionalArgs.get<int?>(3);
        return Color.fromARGB(alpha!, red!, green!, blue!);
      },
      'fromRGBO': (visitor, positionalArgs, namedArgs) {
        final red = positionalArgs.get<int?>(0);
        final green = positionalArgs.get<int?>(1);
        final blue = positionalArgs.get<int?>(2);
        final opacity = toDouble(positionalArgs.get<dynamic>(3));
        return Color.fromRGBO(red!, green!, blue!, opacity!);
      },
      'lerp': (visitor, positionalArgs, namedArgs) {
        final x = positionalArgs.get<Color?>(0);
        final y = positionalArgs.get<Color?>(1);
        final t = toDouble(positionalArgs.get<dynamic>(2));
        return Color.lerp(x, y, t!);
      },
      'alphaBlend': (visitor, positionalArgs, namedArgs) {
        final foreground = positionalArgs.get<Color>(0);
        final background = positionalArgs.get<Color>(1);
        return Color.alphaBlend(foreground!, background!);
      },
      'from': (visitor, positionalArgs, namedArgs) {
        final red = toDouble(namedArgs.get<dynamic>('red'))!;
        final green = toDouble(namedArgs.get<dynamic>('green'))!;
        final blue = toDouble(namedArgs.get<dynamic>('blue'))!;
        final alpha = toDouble(namedArgs.get<dynamic>('alpha'))!;
        final colorSpace =
            namedArgs.get<ColorSpace>('colorSpace') ?? ColorSpace.sRGB;
        return Color.from(
          alpha: alpha,
          green: green,
          blue: blue,
          red: red,
          colorSpace: colorSpace,
        );
      },
      'getAlphaFromOpacity': (visitor, positionalArgs, namedArgs) {
        final opacity = toDouble(positionalArgs.get<dynamic>(0))!;
        return Color.getAlphaFromOpacity(opacity);
      },
    },
    getters: {
      'alpha': (visitor, target) => (target as Color).alpha,
      'red': (visitor, target) => (target as Color).red,
      'green': (visitor, target) => (target as Color).green,
      'blue': (visitor, target) => (target as Color).blue,
      'opacity': (visitor, target) => (target as Color).opacity,
      'value': (visitor, target) => (target as Color).value,
      'a': (visitor, target) => (target as Color).a,
      'r': (visitor, target) => (target as Color).r,
      'g': (visitor, target) => (target as Color).g,
      'b': (visitor, target) => (target as Color).b,
      'colorSpace': (visitor, target) => (target as Color).colorSpace,
      'hashCode': (visitor, target) => (target as Color).hashCode,
      'runtimeType': (visitor, target) => (target as Color).runtimeType,
    },
    methods: {
      'computeLuminance': (visitor, target, positionalArgs, namedArgs) {
        return (target as Color).computeLuminance();
      },
      'toARGB32': (visitor, target, positionalArgs, namedArgs) {
        return (target as Color).toARGB32();
      },
      'withAlpha': (visitor, target, positionalArgs, namedArgs) {
        final alpha = positionalArgs.get<int?>(0);
        return (target as Color).withAlpha(alpha!);
      },
      'withRed': (visitor, target, positionalArgs, namedArgs) {
        final red = positionalArgs.get<int?>(0);
        return (target as Color).withRed(red!);
      },
      'withGreen': (visitor, target, positionalArgs, namedArgs) {
        final green = positionalArgs.get<int?>(0);
        return (target as Color).withGreen(green!);
      },
      'withBlue': (visitor, target, positionalArgs, namedArgs) {
        final blue = positionalArgs.get<int?>(0);
        return (target as Color).withBlue(blue!);
      },
      'withOpacity': (visitor, target, positionalArgs, namedArgs) {
        final opacity = toDouble(positionalArgs.get<dynamic>(0));
        return (target as Color).withOpacity(opacity!);
      },
      'withValues': (visitor, target, positionalArgs, namedArgs) {
        final red = positionalArgs.getToDouble(0);
        final green = positionalArgs.getToDouble(1);
        final blue = positionalArgs.getToDouble(2);
        final alpha = positionalArgs.getToDouble(3);
        final colorSpace = positionalArgs.get<ColorSpace?>(4);
        return (target as Color).withValues(
          alpha: alpha,
          green: green,
          blue: blue,
          red: red,
          colorSpace: colorSpace,
        );
      },
    },
  );
}

BridgedEnumDefinition getClipBridgingDefinition() {
  return BridgedEnumDefinition<Clip>(
    name: 'Clip',
    values: Clip.values,
    getters: {
      'name': (visitor, target) => (target as Clip).name,
      'index': (visitor, target) => (target as Clip).index,
    },
  );
}

BridgedEnumDefinition getColorSpaceBridgingDefinition() {
  return BridgedEnumDefinition<ColorSpace>(
    name: 'ColorSpace',
    values: ColorSpace.values,
    getters: {
      'name': (visitor, target) => (target as ColorSpace).name,
      'index': (visitor, target) => (target as ColorSpace).index,
    },
  );
}

/// Returns the BridgedClass for the Flutter Paint class.
BridgedClass getPaintBridgingDefinition() {
  return BridgedClass(
    nativeType: Paint,
    name: 'Paint',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return Paint();
      },
    },
    getters: {
      'blendMode': (visitor, target) => (target as Paint).blendMode,
      'color': (visitor, target) => (target as Paint).color,
      'colorFilter': (visitor, target) => (target as Paint).colorFilter,
      'filterQuality': (visitor, target) => (target as Paint).filterQuality,
      'imageFilter': (visitor, target) => (target as Paint).imageFilter,
      'invertColors': (visitor, target) => (target as Paint).invertColors,
      'isAntiAlias': (visitor, target) => (target as Paint).isAntiAlias,
      'maskFilter': (visitor, target) => (target as Paint).maskFilter,
      'shader': (visitor, target) => (target as Paint).shader,
      'strokeCap': (visitor, target) => (target as Paint).strokeCap,
      'strokeJoin': (visitor, target) => (target as Paint).strokeJoin,
      'strokeMiterLimit': (visitor, target) =>
          (target as Paint).strokeMiterLimit,
      'strokeWidth': (visitor, target) => (target as Paint).strokeWidth,
      'style': (visitor, target) => (target as Paint).style,
    },
    setters: {
      'blendMode': (visitor, target, value) =>
          (target as Paint).blendMode = value as BlendMode,
      'color': (visitor, target, value) =>
          (target as Paint).color = value as Color,
      'colorFilter': (visitor, target, value) =>
          (target as Paint).colorFilter = value as ColorFilter?,
      'filterQuality': (visitor, target, value) =>
          (target as Paint).filterQuality = value as FilterQuality,
      'imageFilter': (visitor, target, value) =>
          (target as Paint).imageFilter = value as ImageFilter?,
      'invertColors': (visitor, target, value) =>
          (target as Paint).invertColors = value as bool,
      'isAntiAlias': (visitor, target, value) =>
          (target as Paint).isAntiAlias = value as bool,
      'maskFilter': (visitor, target, value) =>
          (target as Paint).maskFilter = value as MaskFilter?,
      'shader': (visitor, target, value) =>
          (target as Paint).shader = value as Shader?,
      'strokeCap': (visitor, target, value) =>
          (target as Paint).strokeCap = value as StrokeCap,
      'strokeJoin': (visitor, target, value) =>
          (target as Paint).strokeJoin = value as StrokeJoin,
      'strokeMiterLimit': (visitor, target, value) =>
          (target as Paint).strokeMiterLimit = toDouble(value)!,
      'strokeWidth': (visitor, target, value) =>
          (target as Paint).strokeWidth = toDouble(value)!,
      'style': (visitor, target, value) => (target as Paint).style =
          (value as dynamic).nativeValue as PaintingStyle,
    },
  );
}

/// Returns the BridgedEnumDefinition for BlendMode.
BridgedEnumDefinition getBlendModeBridgingDefinition() {
  return BridgedEnumDefinition<BlendMode>(
    name: 'BlendMode',
    values: BlendMode.values,
    getters: {
      'name': (visitor, target) => (target as BlendMode).name,
      'index': (visitor, target) => (target as BlendMode).index,
    },
  );
}

/// Returns the BridgedEnumDefinition for PaintingStyle.
BridgedEnumDefinition getPaintingStyleBridgingDefinition() {
  return BridgedEnumDefinition<PaintingStyle>(
    name: 'PaintingStyle',
    values: PaintingStyle.values,
    getters: {
      'name': (visitor, target) => (target as PaintingStyle).name,
      'index': (visitor, target) => (target as PaintingStyle).index,
    },
  );
}

/// Returns the BridgedEnumDefinition for StrokeCap.
BridgedEnumDefinition getStrokeCapBridgingDefinition() {
  return BridgedEnumDefinition<StrokeCap>(
    name: 'StrokeCap',
    values: StrokeCap.values,
    getters: {
      'name': (visitor, target) => (target as StrokeCap).name,
      'index': (visitor, target) => (target as StrokeCap).index,
    },
  );
}

/// Returns the BridgedEnumDefinition for StrokeJoin.
BridgedEnumDefinition getStrokeJoinBridgingDefinition() {
  return BridgedEnumDefinition<StrokeJoin>(
    name: 'StrokeJoin',
    values: StrokeJoin.values,
    getters: {
      'name': (visitor, target) => (target as StrokeJoin).name,
      'index': (visitor, target) => (target as StrokeJoin).index,
    },
  );
}

/// Returns the BridgedEnumDefinition for FilterQuality.
BridgedEnumDefinition getFilterQualityBridgingDefinition() {
  return BridgedEnumDefinition<FilterQuality>(
    name: 'FilterQuality',
    values: FilterQuality.values,
    getters: {
      'name': (visitor, target) => (target as FilterQuality).name,
      'index': (visitor, target) => (target as FilterQuality).index,
    },
  );
}

/// Returns the BridgedEnumDefinition for TileMode.
BridgedEnumDefinition getTileModeBridgingDefinition() {
  return BridgedEnumDefinition<TileMode>(
    name: 'TileMode',
    values: TileMode.values,
    getters: {
      'name': (visitor, target) => (target as TileMode).name,
      'index': (visitor, target) => (target as TileMode).index,
    },
  );
}

/// Returns the BridgedClass for the Flutter Shader class.
BridgedClass getShaderBridgingDefinition() {
  return BridgedClass(
    nativeType: Shader,
    name: 'Shader',
    constructors: {},
    getters: {},
    methods: {},
  );
}

/// Returns the BridgedClass for the Flutter Gradient class.
BridgedClass getGradientBridgingDefinition() {
  return BridgedClass(
    nativeType: Gradient,
    name: 'Gradient',
    constructors: {
      'linear': (visitor, positionalArgs, namedArgs) {
        final from = positionalArgs.get<Offset>(0)!;
        final to = positionalArgs.get<Offset>(1)!;
        final colors = positionalArgs.get<List>(2)!;
        final colorStops = positionalArgs.get<List?>(3);
        final tileMode = namedArgs.get<TileMode>('tileMode') ?? TileMode.clamp;
        final matrix = namedArgs.get<Float64List?>("transform");
        return Gradient.linear(
          from,
          to,
          colors.cast(),
          colorStops?.cast(),
          tileMode,
          matrix,
        );
      },
      'radial': (visitor, positionalArgs, namedArgs) {
        final center = positionalArgs.get<Offset>(0)!;
        final radius = toDouble(positionalArgs.get<dynamic>(1))!;
        final colors = positionalArgs.get<List>(2)!;
        final colorStops = positionalArgs.get<List?>(3);
        final tileMode = namedArgs.get<TileMode>('tileMode') ?? TileMode.clamp;
        final matrix = namedArgs.get<Float64List?>("transform");
        final focal = namedArgs.get<Offset?>("focal");
        final focalRadius =
            toDouble(namedArgs.get<dynamic>("focalRadius")) ?? 0.0;
        return Gradient.radial(
          center,
          radius,
          colors.cast(),
          colorStops?.cast(),
          tileMode,
          matrix,
          focal,
          focalRadius,
        );
      },
      'sweep': (visitor, positionalArgs, namedArgs) {
        final center = positionalArgs.get<Offset>(0)!;
        final colors = positionalArgs.get<List>(1)!;
        final colorStops = positionalArgs.get<List?>(2);
        final tileMode = namedArgs.get<TileMode>('tileMode') ?? TileMode.clamp;
        final startAngle =
            toDouble(namedArgs.get<dynamic>("startAngle")) ?? 0.0;
        final endAngle =
            toDouble(namedArgs.get<dynamic>("endAngle")) ?? 6.283185307179586;
        final matrix = namedArgs.get<Float64List?>("transform");
        return Gradient.sweep(
          center,
          colors.cast(),
          colorStops?.cast(),
          tileMode,
          startAngle,
          endAngle,
          matrix,
        );
      },
    },
    getters: {},
    methods: {},
  );
}

/// Returns the BridgedClass for the Flutter ImageShader class.
BridgedClass getImageShaderBridgingDefinition() {
  return BridgedClass(
    nativeType: ImageShader,
    name: 'ImageShader',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final image = positionalArgs.get<Image>(0)!;
        final tmx = positionalArgs.get<TileMode>(1)!;
        final tmy = positionalArgs.get<TileMode>(2)!;
        final matrix4 = positionalArgs.get<Float64List>(3)!;
        final filterQuality = namedArgs.get<FilterQuality>('filterQuality');
        return ImageShader(
          image,
          tmx,
          tmy,
          matrix4,
          filterQuality: filterQuality,
        );
      },
    },
    getters: {},
    methods: {},
  );
}

/// Returns the BridgedClass for the Flutter ColorFilter class.
BridgedClass getColorFilterBridgingDefinition() {
  return BridgedClass(
    nativeType: ColorFilter,
    name: 'ColorFilter',
    constructors: {
      'mode': (visitor, positionalArgs, namedArgs) {
        final color = positionalArgs.get<Color>(0)!;
        final blendMode = positionalArgs.get<BlendMode>(1)!;
        return ColorFilter.mode(color, blendMode);
      },
      'matrix': (visitor, positionalArgs, namedArgs) {
        final matrix = positionalArgs.get<List>(0)!;
        return ColorFilter.matrix(matrix.cast());
      },
      'linearToSrgbGamma': (visitor, positionalArgs, namedArgs) {
        return const ColorFilter.linearToSrgbGamma();
      },
      'srgbToLinearGamma': (visitor, positionalArgs, namedArgs) {
        return const ColorFilter.srgbToLinearGamma();
      },
    },
    getters: {},
    methods: {},
  );
}

/// Returns the BridgedClass for the Flutter ImageFilter class.
BridgedClass getImageFilterBridgingDefinition() {
  return BridgedClass(
    nativeType: ImageFilter,
    name: 'ImageFilter',
    constructors: {
      'blur': (visitor, positionalArgs, namedArgs) {
        final sigmaX = toDouble(namedArgs.get<dynamic>('sigmaX')) ?? 0.0;
        final sigmaY = toDouble(namedArgs.get<dynamic>('sigmaY')) ?? 0.0;
        final tileMode = namedArgs.get<TileMode>('tileMode') ?? TileMode.clamp;
        return ImageFilter.blur(
          sigmaX: sigmaX,
          sigmaY: sigmaY,
          tileMode: tileMode,
        );
      },
      'dilate': (visitor, positionalArgs, namedArgs) {
        final radiusX = toDouble(namedArgs.get<dynamic>('radiusX')) ?? 0.0;
        final radiusY = toDouble(namedArgs.get<dynamic>('radiusY')) ?? 0.0;
        return ImageFilter.dilate(radiusX: radiusX, radiusY: radiusY);
      },
      'erode': (visitor, positionalArgs, namedArgs) {
        final radiusX = toDouble(namedArgs.get<dynamic>('radiusX')) ?? 0.0;
        final radiusY = toDouble(namedArgs.get<dynamic>('radiusY')) ?? 0.0;
        return ImageFilter.erode(radiusX: radiusX, radiusY: radiusY);
      },
      'matrix': (visitor, positionalArgs, namedArgs) {
        final matrix4 = positionalArgs.get<Float64List>(0)!;
        final filterQuality =
            namedArgs.get<FilterQuality>('filterQuality') ?? FilterQuality.low;
        return ImageFilter.matrix(matrix4, filterQuality: filterQuality);
      },
      'compose': (visitor, positionalArgs, namedArgs) {
        final outer = positionalArgs.get<ImageFilter>(0)!;
        final inner = positionalArgs.get<ImageFilter>(1)!;
        return ImageFilter.compose(outer: outer, inner: inner);
      },
    },
    getters: {},
    methods: {},
  );
}

/// Returns the BridgedClass for the Flutter MaskFilter class.
BridgedClass getMaskFilterBridgingDefinition() {
  return BridgedClass(
    nativeType: MaskFilter,
    name: 'MaskFilter',
    constructors: {
      'blur': (visitor, positionalArgs, namedArgs) {
        final style = positionalArgs.get<BlurStyle>(0)!;
        final sigma = toDouble(positionalArgs.get<dynamic>(1))!;
        return MaskFilter.blur(style, sigma);
      },
    },
    getters: {},
    methods: {},
  );
}

/// Returns the BridgedEnumDefinition for BlurStyle.
BridgedEnumDefinition getBlurStyleBridgingDefinition() {
  return BridgedEnumDefinition<BlurStyle>(
    name: 'BlurStyle',
    values: BlurStyle.values,
    getters: {
      'name': (visitor, target) => (target as BlurStyle).name,
      'index': (visitor, target) => (target as BlurStyle).index,
    },
  );
}

/// Returns the BridgedClass for the Flutter Shadow class.
BridgedClass getShadowBridgingDefinition() {
  return BridgedClass(
    nativeType: Shadow,
    name: 'Shadow',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final color = namedArgs.get<Color>('color') ?? const Color(0xFF000000);
        final offset = namedArgs.get<Offset>('offset') ?? Offset.zero;
        final blurRadius =
            toDouble(namedArgs.get<dynamic>('blurRadius')) ?? 0.0;
        return Shadow(color: color, offset: offset, blurRadius: blurRadius);
      },
      'lerpList': (visitor, positionalArgs, namedArgs) {
        final a = positionalArgs.get<List?>(0);
        final b = positionalArgs.get<List?>(1);
        final t = toDouble(positionalArgs.get<dynamic>(2))!;
        return Shadow.lerpList(a?.cast(), b?.cast(), t);
      },
      'lerp': (visitor, positionalArgs, namedArgs) {
        final a = positionalArgs.get<Shadow?>(0);
        final b = positionalArgs.get<Shadow?>(1);
        final t = toDouble(positionalArgs.get<dynamic>(2))!;
        return Shadow.lerp(a, b, t);
      },
    },
    getters: {
      'color': (visitor, target) => (target as Shadow).color,
      'offset': (visitor, target) => (target as Shadow).offset,
      'blurRadius': (visitor, target) => (target as Shadow).blurRadius,
      'blurSigma': (visitor, target) => (target as Shadow).blurSigma,
    },
    methods: {
      'scale': (visitor, target, positionalArgs, namedArgs) {
        final factor = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as Shadow).scale(factor);
      },
      'toPaint': (visitor, target, positionalArgs, namedArgs) {
        return (target as Shadow).toPaint();
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter Canvas class.
BridgedClass getCanvasBridgingDefinition() {
  return BridgedClass(
    nativeType: Canvas,
    name: 'Canvas',
    nativeNames: ['CanvasKitCanvas'],
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final recorder = positionalArgs.get<PictureRecorder>(0)!;
        final cullRect = positionalArgs.get<Rect?>(1);
        return Canvas(recorder, cullRect);
      },
    },
    getters: {},
    methods: {
      'save': (visitor, target, positionalArgs, namedArgs) {
        return (target as Canvas).save();
      },
      'saveLayer': (visitor, target, positionalArgs, namedArgs) {
        final bounds = positionalArgs.get<Rect?>(0);
        final paint = positionalArgs.get<Paint>(1)!;
        return (target as Canvas).saveLayer(bounds, paint);
      },
      'restore': (visitor, target, positionalArgs, namedArgs) {
        return (target as Canvas).restore();
      },
      'getSaveCount': (visitor, target, positionalArgs, namedArgs) {
        return (target as Canvas).getSaveCount();
      },
      'translate': (visitor, target, positionalArgs, namedArgs) {
        final dx = toDouble(positionalArgs.get<dynamic>(0))!;
        final dy = toDouble(positionalArgs.get<dynamic>(1))!;
        return (target as Canvas).translate(dx, dy);
      },
      'scale': (visitor, target, positionalArgs, namedArgs) {
        final sx = toDouble(positionalArgs.get<dynamic>(0))!;
        final sy = positionalArgs.length > 1
            ? toDouble(positionalArgs.get<dynamic>(1))
            : null;
        return (target as Canvas).scale(sx, sy);
      },
      'rotate': (visitor, target, positionalArgs, namedArgs) {
        final radians = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as Canvas).rotate(radians);
      },
      'skew': (visitor, target, positionalArgs, namedArgs) {
        final sx = toDouble(positionalArgs.get<dynamic>(0))!;
        final sy = toDouble(positionalArgs.get<dynamic>(1))!;
        return (target as Canvas).skew(sx, sy);
      },
      'transform': (visitor, target, positionalArgs, namedArgs) {
        final matrix4 = positionalArgs.get<Float64List>(0)!;
        return (target as Canvas).transform(matrix4);
      },
      'clipRect': (visitor, target, positionalArgs, namedArgs) {
        final rect = positionalArgs.get<Rect>(0)!;
        final clipOp = namedArgs.get<ClipOp>('clipOp') ?? ClipOp.intersect;
        final doAntiAlias = namedArgs.get<bool>('doAntiAlias') ?? true;
        return (target as Canvas).clipRect(
          rect,
          clipOp: clipOp,
          doAntiAlias: doAntiAlias,
        );
      },
      'clipRRect': (visitor, target, positionalArgs, namedArgs) {
        final rrect = positionalArgs.get<RRect>(0)!;
        final doAntiAlias = namedArgs.get<bool>('doAntiAlias') ?? true;
        return (target as Canvas).clipRRect(rrect, doAntiAlias: doAntiAlias);
      },
      'clipPath': (visitor, target, positionalArgs, namedArgs) {
        final path = positionalArgs.get<Path>(0)!;
        final doAntiAlias = namedArgs.get<bool>('doAntiAlias') ?? true;
        return (target as Canvas).clipPath(path, doAntiAlias: doAntiAlias);
      },
      'drawColor': (visitor, target, positionalArgs, namedArgs) {
        final color = positionalArgs.get<Color>(0)!;
        final blendMode = positionalArgs.get<BlendMode>(1)!;
        return (target as Canvas).drawColor(color, blendMode);
      },
      'drawLine': (visitor, target, positionalArgs, namedArgs) {
        final p1 = positionalArgs.get<Offset>(0)!;
        final p2 = positionalArgs.get<Offset>(1)!;
        final paint = positionalArgs.get<Paint>(2)!;
        return (target as Canvas).drawLine(p1, p2, paint);
      },
      'drawPaint': (visitor, target, positionalArgs, namedArgs) {
        final paint = positionalArgs.get<Paint>(0)!;
        return (target as Canvas).drawPaint(paint);
      },
      'drawRect': (visitor, target, positionalArgs, namedArgs) {
        final rect = positionalArgs.get<Rect>(0)!;
        final paint = positionalArgs.get<Paint>(1)!;
        return (target as Canvas).drawRect(rect, paint);
      },
      'drawRRect': (visitor, target, positionalArgs, namedArgs) {
        final rrect = positionalArgs.get<RRect>(0)!;
        final paint = positionalArgs.get<Paint>(1)!;
        return (target as Canvas).drawRRect(rrect, paint);
      },
      'drawDRRect': (visitor, target, positionalArgs, namedArgs) {
        final outer = positionalArgs.get<RRect>(0)!;
        final inner = positionalArgs.get<RRect>(1)!;
        final paint = positionalArgs.get<Paint>(2)!;
        return (target as Canvas).drawDRRect(outer, inner, paint);
      },
      'drawOval': (visitor, target, positionalArgs, namedArgs) {
        final rect = positionalArgs.get<Rect>(0)!;
        final paint = positionalArgs.get<Paint>(1)!;
        return (target as Canvas).drawOval(rect, paint);
      },
      'drawCircle': (visitor, target, positionalArgs, namedArgs) {
        final center = positionalArgs.get<Offset>(0)!;
        final radius = toDouble(positionalArgs.get<dynamic>(1))!;
        final paint = positionalArgs.get<Paint>(2)!;
        return (target as Canvas).drawCircle(center, radius, paint);
      },
      'drawArc': (visitor, target, positionalArgs, namedArgs) {
        final rect = positionalArgs.get<Rect>(0)!;
        final startAngle = toDouble(positionalArgs.get<dynamic>(1))!;
        final sweepAngle = toDouble(positionalArgs.get<dynamic>(2))!;
        final useCenter = positionalArgs.get<bool>(3)!;
        final paint = positionalArgs.get<Paint>(4)!;
        return (target as Canvas).drawArc(
          rect,
          startAngle,
          sweepAngle,
          useCenter,
          paint,
        );
      },
      'drawPath': (visitor, target, positionalArgs, namedArgs) {
        final path = positionalArgs.get<Path>(0)!;
        final paint = positionalArgs.get<Paint>(1)!;
        return (target as Canvas).drawPath(path, paint);
      },
      'drawImage': (visitor, target, positionalArgs, namedArgs) {
        final image = positionalArgs.get<Image>(0)!;
        final offset = positionalArgs.get<Offset>(1)!;
        final paint = positionalArgs.get<Paint>(2)!;
        return (target as Canvas).drawImage(image, offset, paint);
      },
      'drawImageRect': (visitor, target, positionalArgs, namedArgs) {
        final image = positionalArgs.get<Image>(0)!;
        final src = positionalArgs.get<Rect?>(1);
        final dst = positionalArgs.get<Rect>(2)!;
        final paint = positionalArgs.get<Paint>(3)!;
        if (src != null) {
          return (target as Canvas).drawImageRect(image, src, dst, paint);
        } else {
          return (target as Canvas).drawImageRect(
            image,
            Rect.fromLTWH(
              0,
              0,
              image.width.toDouble(),
              image.height.toDouble(),
            ),
            dst,
            paint,
          );
        }
      },
      'drawImageNine': (visitor, target, positionalArgs, namedArgs) {
        final image = positionalArgs.get<Image>(0)!;
        final center = positionalArgs.get<Rect>(1)!;
        final dst = positionalArgs.get<Rect>(2)!;
        final paint = positionalArgs.get<Paint>(3)!;
        return (target as Canvas).drawImageNine(image, center, dst, paint);
      },
      'drawPicture': (visitor, target, positionalArgs, namedArgs) {
        final picture = positionalArgs.get<Picture>(0)!;
        return (target as Canvas).drawPicture(picture);
      },
      'drawParagraph': (visitor, target, positionalArgs, namedArgs) {
        final paragraph = positionalArgs.get<dynamic>(0)!; // Paragraph type
        final offset = positionalArgs.get<Offset>(1)!;
        return (target as Canvas).drawParagraph(paragraph, offset);
      },
      'drawPoints': (visitor, target, positionalArgs, namedArgs) {
        final pointMode = positionalArgs.get<PointMode>(0)!;
        final points = positionalArgs.get<List>(1)!;
        final paint = positionalArgs.get<Paint>(2)!;
        return (target as Canvas).drawPoints(pointMode, points.cast(), paint);
      },
      'drawRawPoints': (visitor, target, positionalArgs, namedArgs) {
        final pointMode = positionalArgs.get<PointMode>(0)!;
        final points = positionalArgs.get<Float32List>(1)!;
        final paint = positionalArgs.get<Paint>(2)!;
        return (target as Canvas).drawRawPoints(pointMode, points, paint);
      },
      'drawVertices': (visitor, target, positionalArgs, namedArgs) {
        final vertices = positionalArgs.get<Vertices>(0)!;
        final blendMode = positionalArgs.get<BlendMode>(1)!;
        final paint = positionalArgs.get<Paint>(2)!;
        return (target as Canvas).drawVertices(vertices, blendMode, paint);
      },
      'drawAtlas': (visitor, target, positionalArgs, namedArgs) {
        final atlas = positionalArgs.get<Image>(0)!;
        final transforms = positionalArgs.get<List>(1)!;
        final rects = positionalArgs.get<List>(2)!;
        final colors = positionalArgs.get<List?>(3);
        final blendMode = positionalArgs.get<BlendMode?>(4);
        final cullRect = positionalArgs.get<Rect?>(5);
        final paint = positionalArgs.get<Paint>(6)!;
        return (target as Canvas).drawAtlas(
          atlas,
          transforms.cast(),
          rects.cast(),
          colors?.cast(),
          blendMode,
          cullRect,
          paint,
        );
      },
      'drawRawAtlas': (visitor, target, positionalArgs, namedArgs) {
        final atlas = positionalArgs.get<Image>(0)!;
        final rstTransforms = positionalArgs.get<Float32List>(1)!;
        final rects = positionalArgs.get<Float32List>(2)!;
        final colors = positionalArgs.get<Int32List?>(3);
        final blendMode = positionalArgs.get<BlendMode?>(4);
        final cullRect = positionalArgs.get<Rect?>(5);
        final paint = positionalArgs.get<Paint>(6)!;
        return (target as Canvas).drawRawAtlas(
          atlas,
          rstTransforms,
          rects,
          colors,
          blendMode,
          cullRect,
          paint,
        );
      },
      'drawShadow': (visitor, target, positionalArgs, namedArgs) {
        final path = positionalArgs.get<Path>(0)!;
        final color = positionalArgs.get<Color>(1)!;
        final elevation = toDouble(positionalArgs.get<dynamic>(2))!;
        final transparentOccluder = positionalArgs.get<bool>(3)!;
        return (target as Canvas).drawShadow(
          path,
          color,
          elevation,
          transparentOccluder,
        );
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter Picture class.
BridgedClass getPictureBridgingDefinition() {
  return BridgedClass(
    nativeType: Picture,
    name: 'Picture',
    constructors: {},
    getters: {
      'approximateBytesUsed': (visitor, target) =>
          (target as Picture).approximateBytesUsed,
    },
    methods: {
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        return (target as Picture).dispose();
      },
      'toImage': (visitor, target, positionalArgs, namedArgs) {
        final width = positionalArgs.get<int>(0)!;
        final height = positionalArgs.get<int>(1)!;
        return (target as Picture).toImage(width, height);
      },
      'toImageSync': (visitor, target, positionalArgs, namedArgs) {
        final width = positionalArgs.get<int>(0)!;
        final height = positionalArgs.get<int>(1)!;
        return (target as Picture).toImageSync(width, height);
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter PictureRecorder class.
BridgedClass getPictureRecorderBridgingDefinition() {
  return BridgedClass(
    nativeType: PictureRecorder,
    name: 'PictureRecorder',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return PictureRecorder();
      },
    },
    getters: {
      'isRecording': (visitor, target) =>
          (target as PictureRecorder).isRecording,
    },
    methods: {
      'endRecording': (visitor, target, positionalArgs, namedArgs) {
        return (target as PictureRecorder).endRecording();
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter Vertices class.
BridgedClass getVerticesBridgingDefinition() {
  return BridgedClass(
    nativeType: Vertices,
    name: 'Vertices',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final mode = positionalArgs.get<VertexMode>(0)!;
        final positions = positionalArgs.get<List>(1)!;
        final textureCoordinates = namedArgs.get<List?>("textureCoordinates");
        final colors = namedArgs.get<List?>("colors");
        final indices = namedArgs.get<List?>("indices");
        return Vertices(
          mode,
          positions.cast(),
          textureCoordinates: textureCoordinates?.cast(),
          colors: colors?.cast(),
          indices: indices?.cast(),
        );
      },
      'raw': (visitor, positionalArgs, namedArgs) {
        final mode = positionalArgs.get<VertexMode>(0)!;
        final positions = positionalArgs.get<Float32List>(1)!;
        final textureCoordinates = namedArgs.get<Float32List?>(
          "textureCoordinates",
        );
        final colors = namedArgs.get<Int32List?>("colors");
        final indices = namedArgs.get<Uint16List?>("indices");
        return Vertices.raw(
          mode,
          positions,
          textureCoordinates: textureCoordinates,
          colors: colors,
          indices: indices,
        );
      },
    },
    getters: {},
    methods: {
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        return (target as Vertices).dispose();
      },
    },
  );
}

/// Returns the BridgedEnumDefinition for VertexMode.
BridgedEnumDefinition getVertexModeBridgingDefinition() {
  return BridgedEnumDefinition<VertexMode>(
    name: 'VertexMode',
    values: VertexMode.values,
    getters: {
      'name': (visitor, target) => (target as VertexMode).name,
      'index': (visitor, target) => (target as VertexMode).index,
    },
  );
}

/// Returns the BridgedEnumDefinition for PointMode.
BridgedEnumDefinition getPointModeBridgingDefinition() {
  return BridgedEnumDefinition<PointMode>(
    name: 'PointMode',
    values: PointMode.values,
    getters: {
      'name': (visitor, target) => (target as PointMode).name,
      'index': (visitor, target) => (target as PointMode).index,
    },
  );
}

/// Returns the BridgedEnumDefinition for ClipOp.
BridgedEnumDefinition getClipOpBridgingDefinition() {
  return BridgedEnumDefinition<ClipOp>(
    name: 'ClipOp',
    values: ClipOp.values,
    getters: {
      'name': (visitor, target) => (target as ClipOp).name,
      'index': (visitor, target) => (target as ClipOp).index,
    },
  );
}

/// Returns the BridgedClass for the Flutter Path class.
BridgedClass getPathBridgingDefinition() {
  return BridgedClass(
    nativeType: Path,
    name: 'Path',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return Path();
      },
      'from': (visitor, positionalArgs, namedArgs) {
        final source = positionalArgs.get<Path>(0)!;
        return Path.from(source);
      },
      'combine': (visitor, positionalArgs, namedArgs) {
        final operation = positionalArgs.get<PathOperation>(0)!;
        final path1 = positionalArgs.get<Path>(1)!;
        final path2 = positionalArgs.get<Path>(2)!;
        return Path.combine(operation, path1, path2);
      },
    },
    getters: {'fillType': (visitor, target) => (target as Path).fillType},
    setters: {
      'fillType': (visitor, target, value) =>
          (target as Path).fillType = value as PathFillType,
    },
    methods: {
      'moveTo': (visitor, target, positionalArgs, namedArgs) {
        final x = toDouble(positionalArgs.get<dynamic>(0))!;
        final y = toDouble(positionalArgs.get<dynamic>(1))!;
        return (target as Path).moveTo(x, y);
      },
      'relativeMoveTo': (visitor, target, positionalArgs, namedArgs) {
        final dx = toDouble(positionalArgs.get<dynamic>(0))!;
        final dy = toDouble(positionalArgs.get<dynamic>(1))!;
        return (target as Path).relativeMoveTo(dx, dy);
      },
      'lineTo': (visitor, target, positionalArgs, namedArgs) {
        final x = toDouble(positionalArgs.get<dynamic>(0))!;
        final y = toDouble(positionalArgs.get<dynamic>(1))!;
        return (target as Path).lineTo(x, y);
      },
      'relativeLineTo': (visitor, target, positionalArgs, namedArgs) {
        final dx = toDouble(positionalArgs.get<dynamic>(0))!;
        final dy = toDouble(positionalArgs.get<dynamic>(1))!;
        return (target as Path).relativeLineTo(dx, dy);
      },
      'quadraticBezierTo': (visitor, target, positionalArgs, namedArgs) {
        final x1 = toDouble(positionalArgs.get<dynamic>(0))!;
        final y1 = toDouble(positionalArgs.get<dynamic>(1))!;
        final x2 = toDouble(positionalArgs.get<dynamic>(2))!;
        final y2 = toDouble(positionalArgs.get<dynamic>(3))!;
        return (target as Path).quadraticBezierTo(x1, y1, x2, y2);
      },
      'relativeQuadraticBezierTo':
          (visitor, target, positionalArgs, namedArgs) {
            final x1 = toDouble(positionalArgs.get<dynamic>(0))!;
            final y1 = toDouble(positionalArgs.get<dynamic>(1))!;
            final x2 = toDouble(positionalArgs.get<dynamic>(2))!;
            final y2 = toDouble(positionalArgs.get<dynamic>(3))!;
            return (target as Path).relativeQuadraticBezierTo(x1, y1, x2, y2);
          },
      'cubicTo': (visitor, target, positionalArgs, namedArgs) {
        final x1 = toDouble(positionalArgs.get<dynamic>(0))!;
        final y1 = toDouble(positionalArgs.get<dynamic>(1))!;
        final x2 = toDouble(positionalArgs.get<dynamic>(2))!;
        final y2 = toDouble(positionalArgs.get<dynamic>(3))!;
        final x3 = toDouble(positionalArgs.get<dynamic>(4))!;
        final y3 = toDouble(positionalArgs.get<dynamic>(5))!;
        return (target as Path).cubicTo(x1, y1, x2, y2, x3, y3);
      },
      'relativeCubicTo': (visitor, target, positionalArgs, namedArgs) {
        final x1 = toDouble(positionalArgs.get<dynamic>(0))!;
        final y1 = toDouble(positionalArgs.get<dynamic>(1))!;
        final x2 = toDouble(positionalArgs.get<dynamic>(2))!;
        final y2 = toDouble(positionalArgs.get<dynamic>(3))!;
        final x3 = toDouble(positionalArgs.get<dynamic>(4))!;
        final y3 = toDouble(positionalArgs.get<dynamic>(5))!;
        return (target as Path).relativeCubicTo(x1, y1, x2, y2, x3, y3);
      },
      'conicTo': (visitor, target, positionalArgs, namedArgs) {
        final x1 = toDouble(positionalArgs.get<dynamic>(0))!;
        final y1 = toDouble(positionalArgs.get<dynamic>(1))!;
        final x2 = toDouble(positionalArgs.get<dynamic>(2))!;
        final y2 = toDouble(positionalArgs.get<dynamic>(3))!;
        final w = toDouble(positionalArgs.get<dynamic>(4))!;
        return (target as Path).conicTo(x1, y1, x2, y2, w);
      },
      'relativeConicTo': (visitor, target, positionalArgs, namedArgs) {
        final x1 = toDouble(positionalArgs.get<dynamic>(0))!;
        final y1 = toDouble(positionalArgs.get<dynamic>(1))!;
        final x2 = toDouble(positionalArgs.get<dynamic>(2))!;
        final y2 = toDouble(positionalArgs.get<dynamic>(3))!;
        final w = toDouble(positionalArgs.get<dynamic>(4))!;
        return (target as Path).relativeConicTo(x1, y1, x2, y2, w);
      },
      'arcTo': (visitor, target, positionalArgs, namedArgs) {
        final rect = positionalArgs.get<Rect>(0)!;
        final startAngle = toDouble(positionalArgs.get<dynamic>(1))!;
        final sweepAngle = toDouble(positionalArgs.get<dynamic>(2))!;
        final forceMoveTo = positionalArgs.get<bool>(3)!;
        return (target as Path).arcTo(
          rect,
          startAngle,
          sweepAngle,
          forceMoveTo,
        );
      },
      'arcToPoint': (visitor, target, positionalArgs, namedArgs) {
        final arcEnd = positionalArgs.get<Offset>(0)!;
        final radius = namedArgs.get<Radius>('radius') ?? Radius.zero;
        final rotation = toDouble(namedArgs.get<dynamic>('rotation')) ?? 0.0;
        final largeArc = namedArgs.get<bool>('largeArc') ?? false;
        final clockwise = namedArgs.get<bool>('clockwise') ?? true;
        return (target as Path).arcToPoint(
          arcEnd,
          radius: radius,
          rotation: rotation,
          largeArc: largeArc,
          clockwise: clockwise,
        );
      },
      'relativeArcToPoint': (visitor, target, positionalArgs, namedArgs) {
        final arcEndDelta = positionalArgs.get<Offset>(0)!;
        final radius = namedArgs.get<Radius>('radius') ?? Radius.zero;
        final rotation = toDouble(namedArgs.get<dynamic>('rotation')) ?? 0.0;
        final largeArc = namedArgs.get<bool>('largeArc') ?? false;
        final clockwise = namedArgs.get<bool>('clockwise') ?? true;
        return (target as Path).relativeArcToPoint(
          arcEndDelta,
          radius: radius,
          rotation: rotation,
          largeArc: largeArc,
          clockwise: clockwise,
        );
      },
      'addRect': (visitor, target, positionalArgs, namedArgs) {
        final rect = positionalArgs.get<Rect>(0)!;
        return (target as Path).addRect(rect);
      },
      'addOval': (visitor, target, positionalArgs, namedArgs) {
        final oval = positionalArgs.get<Rect>(0)!;
        return (target as Path).addOval(oval);
      },
      'addArc': (visitor, target, positionalArgs, namedArgs) {
        final oval = positionalArgs.get<Rect>(0)!;
        final startAngle = toDouble(positionalArgs.get<dynamic>(1))!;
        final sweepAngle = toDouble(positionalArgs.get<dynamic>(2))!;
        return (target as Path).addArc(oval, startAngle, sweepAngle);
      },
      'addPolygon': (visitor, target, positionalArgs, namedArgs) {
        final points = positionalArgs.get<List>(0)!;
        final close = positionalArgs.get<bool>(1)!;
        return (target as Path).addPolygon(points.cast(), close);
      },
      'addRRect': (visitor, target, positionalArgs, namedArgs) {
        final rrect = positionalArgs.get<RRect>(0)!;
        return (target as Path).addRRect(rrect);
      },
      'addPath': (visitor, target, positionalArgs, namedArgs) {
        final path = positionalArgs.get<Path>(0)!;
        final offset = positionalArgs.get<Offset>(1)!;
        final matrix4 = namedArgs.get<Float64List>('matrix4');
        return (target as Path).addPath(path, offset, matrix4: matrix4);
      },
      'extendWithPath': (visitor, target, positionalArgs, namedArgs) {
        final path = positionalArgs.get<Path>(0)!;
        final offset = positionalArgs.get<Offset>(1)!;
        final matrix4 = namedArgs.get<Float64List>('matrix4');
        return (target as Path).extendWithPath(path, offset, matrix4: matrix4);
      },
      'close': (visitor, target, positionalArgs, namedArgs) {
        return (target as Path).close();
      },
      'reset': (visitor, target, positionalArgs, namedArgs) {
        return (target as Path).reset();
      },
      'contains': (visitor, target, positionalArgs, namedArgs) {
        final point = positionalArgs.get<Offset>(0)!;
        return (target as Path).contains(point);
      },
      'shift': (visitor, target, positionalArgs, namedArgs) {
        final offset = positionalArgs.get<Offset>(0)!;
        return (target as Path).shift(offset);
      },
      'transform': (visitor, target, positionalArgs, namedArgs) {
        final matrix4 = positionalArgs.get<Float64List>(0)!;
        return (target as Path).transform(matrix4);
      },
      'getBounds': (visitor, target, positionalArgs, namedArgs) {
        return (target as Path).getBounds();
      },
      'computeMetrics': (visitor, target, positionalArgs, namedArgs) {
        final forceClosed = namedArgs.get<bool>('forceClosed') ?? false;
        return (target as Path).computeMetrics(forceClosed: forceClosed);
      },
    },
  );
}

/// Returns the BridgedEnumDefinition for PathFillType.
BridgedEnumDefinition getPathFillTypeBridgingDefinition() {
  return BridgedEnumDefinition<PathFillType>(
    name: 'PathFillType',
    values: PathFillType.values,
    getters: {
      'name': (visitor, target) => (target as PathFillType).name,
      'index': (visitor, target) => (target as PathFillType).index,
    },
  );
}

/// Returns the BridgedEnumDefinition for PathOperation.
BridgedEnumDefinition getPathOperationBridgingDefinition() {
  return BridgedEnumDefinition<PathOperation>(
    name: 'PathOperation',
    values: PathOperation.values,
    getters: {
      'name': (visitor, target) => (target as PathOperation).name,
      'index': (visitor, target) => (target as PathOperation).index,
    },
  );
}

/// Returns the BridgedClass for the Flutter PathMetrics class.
BridgedClass getPathMetricsBridgingDefinition() {
  return BridgedClass(
    nativeType: PathMetrics,
    name: 'PathMetrics',
    constructors: {},
    getters: {},
    methods: {},
  );
}

/// Returns the BridgedClass for the Flutter PathMetric class.
BridgedClass getPathMetricBridgingDefinition() {
  return BridgedClass(
    nativeType: PathMetric,
    name: 'PathMetric',
    constructors: {},
    getters: {
      'length': (visitor, target) => (target as PathMetric).length,
      'isClosed': (visitor, target) => (target as PathMetric).isClosed,
      'contourIndex': (visitor, target) => (target as PathMetric).contourIndex,
    },
    methods: {
      'getTangentForOffset': (visitor, target, positionalArgs, namedArgs) {
        final distance = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as PathMetric).getTangentForOffset(distance);
      },
      'extractPath': (visitor, target, positionalArgs, namedArgs) {
        final start = toDouble(positionalArgs.get<dynamic>(0))!;
        final end = toDouble(positionalArgs.get<dynamic>(1))!;
        final startWithMoveTo = namedArgs.get<bool>('startWithMoveTo') ?? true;
        return (target as PathMetric).extractPath(
          start,
          end,
          startWithMoveTo: startWithMoveTo,
        );
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter Tangent class.
BridgedClass getTangentBridgingDefinition() {
  return BridgedClass(
    nativeType: Tangent,
    name: 'Tangent',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final position = positionalArgs.get<Offset>(0)!;
        final vector = positionalArgs.get<Offset>(1)!;
        return Tangent(position, vector);
      },
    },
    getters: {
      'position': (visitor, target) => (target as Tangent).position,
      'vector': (visitor, target) => (target as Tangent).vector,
      'angle': (visitor, target) => (target as Tangent).angle,
    },
    methods: {},
  );
}

/// Returns the BridgedClass for the Flutter FragmentProgram class.
BridgedClass getFragmentProgramBridgingDefinition() {
  return BridgedClass(
    nativeType: FragmentProgram,
    name: 'FragmentProgram',
    constructors: {
      'fromAsset': (visitor, positionalArgs, namedArgs) {
        final assetKey = positionalArgs.get<String>(0)!;
        return FragmentProgram.fromAsset(assetKey);
      },
    },
    getters: {},
    methods: {
      'fragmentShader': (visitor, target, positionalArgs, namedArgs) {
        return (target as FragmentProgram).fragmentShader();
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter FragmentShader class.
BridgedClass getFragmentShaderBridgingDefinition() {
  return BridgedClass(
    nativeType: FragmentShader,
    name: 'FragmentShader',
    constructors: {},
    getters: {},
    methods: {
      'setFloat': (visitor, target, positionalArgs, namedArgs) {
        final index = positionalArgs.get<int>(0)!;
        final value = toDouble(positionalArgs.get<dynamic>(1))!;
        return (target as FragmentShader).setFloat(index, value);
      },
      'setImageSampler': (visitor, target, positionalArgs, namedArgs) {
        final index = positionalArgs.get<int>(0)!;
        final image = positionalArgs.get<Image>(1)!;
        return (target as FragmentShader).setImageSampler(index, image);
      },
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        return (target as FragmentShader).dispose();
      },
    },
  );
}

/// Returns the BridgedEnumDefinition for ImageByteFormat.
BridgedEnumDefinition getImageByteFormatBridgingDefinition() {
  return BridgedEnumDefinition<ImageByteFormat>(
    name: 'ImageByteFormat',
    values: ImageByteFormat.values,
    getters: {
      'name': (visitor, target) => (target as ImageByteFormat).name,
      'index': (visitor, target) => (target as ImageByteFormat).index,
    },
  );
}

/// Returns the BridgedEnumDefinition for PixelFormat.
BridgedEnumDefinition getPixelFormatBridgingDefinition() {
  return BridgedEnumDefinition<PixelFormat>(
    name: 'PixelFormat',
    values: PixelFormat.values,
    getters: {
      'name': (visitor, target) => (target as PixelFormat).name,
      'index': (visitor, target) => (target as PixelFormat).index,
    },
  );
}

/// Returns the BridgedClass for the Flutter Image class.
BridgedClass getImageBridgingDefinition() {
  return BridgedClass(
    nativeType: Image,
    name: 'Image',
    constructors: {},
    getters: {
      'width': (visitor, target) => (target as Image).width,
      'height': (visitor, target) => (target as Image).height,
      'debugDisposed': (visitor, target) => (target as Image).debugDisposed,
    },
    methods: {
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        return (target as Image).dispose();
      },
      'clone': (visitor, target, positionalArgs, namedArgs) {
        return (target as Image).clone();
      },
      'isCloneOf': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.get<Image>(0)!;
        return (target as Image).isCloneOf(other);
      },
      'toByteData': (visitor, target, positionalArgs, namedArgs) {
        final format =
            namedArgs.get<ImageByteFormat>('format') ?? ImageByteFormat.rawRgba;
        return (target as Image).toByteData(format: format);
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter FrameInfo class.
BridgedClass getFrameInfoBridgingDefinition() {
  return BridgedClass(
    nativeType: FrameInfo,
    name: 'FrameInfo',
    constructors: {},
    getters: {
      'duration': (visitor, target) => (target as FrameInfo).duration,
      'image': (visitor, target) => (target as FrameInfo).image,
    },
    methods: {},
  );
}

/// Returns the BridgedClass for the Flutter Codec class.
BridgedClass getCodecBridgingDefinition() {
  return BridgedClass(
    nativeType: Codec,
    name: 'Codec',
    constructors: {},
    getters: {
      'frameCount': (visitor, target) => (target as Codec).frameCount,
      'repetitionCount': (visitor, target) => (target as Codec).repetitionCount,
    },
    methods: {
      'getNextFrame': (visitor, target, positionalArgs, namedArgs) {
        return (target as Codec).getNextFrame();
      },
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        return (target as Codec).dispose();
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter ImmutableBuffer class.
BridgedClass getImmutableBufferBridgingDefinition() {
  return BridgedClass(
    nativeType: ImmutableBuffer,
    name: 'ImmutableBuffer',
    constructors: {
      'fromUint8List': (visitor, positionalArgs, namedArgs) {
        final list = positionalArgs.get<Uint8List>(0)!;
        return ImmutableBuffer.fromUint8List(list);
      },
      'fromAsset': (visitor, positionalArgs, namedArgs) {
        final assetKey = positionalArgs.get<String>(0)!;
        return ImmutableBuffer.fromAsset(assetKey);
      },
      'fromFilePath': (visitor, positionalArgs, namedArgs) {
        final filePath = positionalArgs.get<String>(0)!;
        return ImmutableBuffer.fromFilePath(filePath);
      },
    },
    getters: {
      'length': (visitor, target) => (target as ImmutableBuffer).length,
    },
    methods: {
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        return (target as ImmutableBuffer).dispose();
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter ImageDescriptor class.
BridgedClass getImageDescriptorBridgingDefinition() {
  return BridgedClass(
    nativeType: ImageDescriptor,
    name: 'ImageDescriptor',
    constructors: {
      'encoded': (visitor, positionalArgs, namedArgs) {
        final buffer = positionalArgs.get<ImmutableBuffer>(0)!;
        return ImageDescriptor.encoded(buffer);
      },
      'raw': (visitor, positionalArgs, namedArgs) {
        final buffer = positionalArgs.get<ImmutableBuffer>(0)!;
        final width = namedArgs.get<int>('width')!;
        final height = namedArgs.get<int>('height')!;
        final pixelFormat = namedArgs.get<PixelFormat>('pixelFormat')!;
        final rowBytes = namedArgs.get<int>('rowBytes');
        return ImageDescriptor.raw(
          buffer,
          width: width,
          height: height,
          pixelFormat: pixelFormat,
          rowBytes: rowBytes,
        );
      },
    },
    getters: {
      'width': (visitor, target) => (target as ImageDescriptor).width,
      'height': (visitor, target) => (target as ImageDescriptor).height,
      'bytesPerPixel': (visitor, target) =>
          (target as ImageDescriptor).bytesPerPixel,
    },
    methods: {
      'instantiateCodec': (visitor, target, positionalArgs, namedArgs) {
        final targetWidth = namedArgs.get<int>('targetWidth');
        final targetHeight = namedArgs.get<int>('targetHeight');
        return (target as ImageDescriptor).instantiateCodec(
          targetWidth: targetWidth,
          targetHeight: targetHeight,
        );
      },
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        return (target as ImageDescriptor).dispose();
      },
    },
  );
}
