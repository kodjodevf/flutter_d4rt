import 'package:d4rt/d4rt.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';

/// Returns the BridgedClass for the Flutter FadeInImage widget.
BridgedClass getFadeInImageBridgingDefinition() {
  return BridgedClass(
    nativeType: FadeInImage,
    name: 'FadeInImage',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final placeholder = namedArgs.get<ImageProvider>('placeholder');
        final image = namedArgs.get<ImageProvider>('image');
        final excludeFromSemantics =
            namedArgs.get<bool?>('excludeFromSemantics') ?? false;
        final imageSemanticLabel = namedArgs.get<String?>('imageSemanticLabel');
        final fadeOutDuration =
            namedArgs.get<Duration?>('fadeOutDuration') ??
            const Duration(milliseconds: 300);
        final fadeOutCurve =
            namedArgs.get<Curve?>('fadeOutCurve') ?? Curves.easeOut;
        final fadeInDuration =
            namedArgs.get<Duration?>('fadeInDuration') ??
            const Duration(milliseconds: 700);
        final fadeInCurve =
            namedArgs.get<Curve?>('fadeInCurve') ?? Curves.easeIn;
        final width = namedArgs.getToDouble('width');
        final height = namedArgs.getToDouble('height');
        final fit = namedArgs.get<BoxFit?>('fit');
        final alignment =
            namedArgs.get<Alignment?>('alignment') ?? Alignment.center;
        final repeat =
            namedArgs.get<ImageRepeat?>('repeat') ?? ImageRepeat.noRepeat;
        final matchTextDirection =
            namedArgs.get<bool?>('matchTextDirection') ?? false;

        if (placeholder == null || image == null) {
          throw ArgumentError(
            'Both placeholder and image are required for FadeInImage',
          );
        }

        return FadeInImage(
          key: key,
          placeholder: placeholder,
          image: image,
          excludeFromSemantics: excludeFromSemantics,
          imageSemanticLabel: imageSemanticLabel,
          fadeOutDuration: fadeOutDuration,
          fadeOutCurve: fadeOutCurve,
          fadeInDuration: fadeInDuration,
          fadeInCurve: fadeInCurve,
          width: width,
          height: height,
          fit: fit,
          alignment: alignment,
          repeat: repeat,
          matchTextDirection: matchTextDirection,
        );
      },
      'memoryNetwork': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final placeholder = namedArgs.get<dynamic>('placeholder');
        final image = namedArgs.get<String>('image');
        final placeholderScale =
            namedArgs.getToDouble('placeholderScale') ?? 1.0;
        final imageScale = namedArgs.getToDouble('imageScale') ?? 1.0;
        final excludeFromSemantics =
            namedArgs.get<bool?>('excludeFromSemantics') ?? false;
        final imageSemanticLabel = namedArgs.get<String?>('imageSemanticLabel');
        final fadeOutDuration =
            namedArgs.get<Duration?>('fadeOutDuration') ??
            const Duration(milliseconds: 300);
        final fadeOutCurve =
            namedArgs.get<Curve?>('fadeOutCurve') ?? Curves.easeOut;
        final fadeInDuration =
            namedArgs.get<Duration?>('fadeInDuration') ??
            const Duration(milliseconds: 700);
        final fadeInCurve =
            namedArgs.get<Curve?>('fadeInCurve') ?? Curves.easeIn;
        final width = namedArgs.getToDouble('width');
        final height = namedArgs.getToDouble('height');
        final fit = namedArgs.get<BoxFit?>('fit');
        final alignment =
            namedArgs.get<Alignment?>('alignment') ?? Alignment.center;
        final repeat =
            namedArgs.get<ImageRepeat?>('repeat') ?? ImageRepeat.noRepeat;
        final matchTextDirection =
            namedArgs.get<bool?>('matchTextDirection') ?? false;
        final placeholderCacheWidth = namedArgs.get<int?>(
          'placeholderCacheWidth',
        );
        final placeholderCacheHeight = namedArgs.get<int?>(
          'placeholderCacheHeight',
        );
        final imageCacheWidth = namedArgs.get<int?>('imageCacheWidth');
        final imageCacheHeight = namedArgs.get<int?>('imageCacheHeight');

        if (placeholder == null || image == null) {
          throw ArgumentError(
            'Both placeholder and image are required for FadeInImage.memoryNetwork',
          );
        }

        return FadeInImage.memoryNetwork(
          key: key,
          placeholder: placeholder,
          image: image,
          placeholderScale: placeholderScale,
          imageScale: imageScale,
          excludeFromSemantics: excludeFromSemantics,
          imageSemanticLabel: imageSemanticLabel,
          fadeOutDuration: fadeOutDuration,
          fadeOutCurve: fadeOutCurve,
          fadeInDuration: fadeInDuration,
          fadeInCurve: fadeInCurve,
          width: width,
          height: height,
          fit: fit,
          alignment: alignment,
          repeat: repeat,
          matchTextDirection: matchTextDirection,
          placeholderCacheWidth: placeholderCacheWidth,
          placeholderCacheHeight: placeholderCacheHeight,
          imageCacheWidth: imageCacheWidth,
          imageCacheHeight: imageCacheHeight,
        );
      },
      'assetNetwork': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final placeholder = namedArgs.get<String>('placeholder');
        final image = namedArgs.get<String>('image');
        final bundle = namedArgs.get<AssetBundle?>('bundle');
        final placeholderScale = namedArgs.getToDouble('placeholderScale');
        final imageScale = namedArgs.getToDouble('imageScale') ?? 1.0;
        final excludeFromSemantics =
            namedArgs.get<bool?>('excludeFromSemantics') ?? false;
        final imageSemanticLabel = namedArgs.get<String?>('imageSemanticLabel');
        final fadeOutDuration =
            namedArgs.get<Duration?>('fadeOutDuration') ??
            const Duration(milliseconds: 300);
        final fadeOutCurve =
            namedArgs.get<Curve?>('fadeOutCurve') ?? Curves.easeOut;
        final fadeInDuration =
            namedArgs.get<Duration?>('fadeInDuration') ??
            const Duration(milliseconds: 700);
        final fadeInCurve =
            namedArgs.get<Curve?>('fadeInCurve') ?? Curves.easeIn;
        final width = namedArgs.getToDouble('width');
        final height = namedArgs.getToDouble('height');
        final fit = namedArgs.get<BoxFit?>('fit');
        final alignment =
            namedArgs.get<Alignment?>('alignment') ?? Alignment.center;
        final repeat =
            namedArgs.get<ImageRepeat?>('repeat') ?? ImageRepeat.noRepeat;
        final matchTextDirection =
            namedArgs.get<bool?>('matchTextDirection') ?? false;
        final placeholderCacheWidth = namedArgs.get<int?>(
          'placeholderCacheWidth',
        );
        final placeholderCacheHeight = namedArgs.get<int?>(
          'placeholderCacheHeight',
        );
        final imageCacheWidth = namedArgs.get<int?>('imageCacheWidth');
        final imageCacheHeight = namedArgs.get<int?>('imageCacheHeight');

        if (placeholder == null || image == null) {
          throw ArgumentError(
            'Both placeholder and image are required for FadeInImage.assetNetwork',
          );
        }

        return FadeInImage.assetNetwork(
          key: key,
          placeholder: placeholder,
          image: image,
          bundle: bundle,
          placeholderScale: placeholderScale,
          imageScale: imageScale,
          excludeFromSemantics: excludeFromSemantics,
          imageSemanticLabel: imageSemanticLabel,
          fadeOutDuration: fadeOutDuration,
          fadeOutCurve: fadeOutCurve,
          fadeInDuration: fadeInDuration,
          fadeInCurve: fadeInCurve,
          width: width,
          height: height,
          fit: fit,
          alignment: alignment,
          repeat: repeat,
          matchTextDirection: matchTextDirection,
          placeholderCacheWidth: placeholderCacheWidth,
          placeholderCacheHeight: placeholderCacheHeight,
          imageCacheWidth: imageCacheWidth,
          imageCacheHeight: imageCacheHeight,
        );
      },
    },
    getters: {
      'placeholder': (visitor, target) => (target as FadeInImage).placeholder,
      'image': (visitor, target) => (target as FadeInImage).image,
      'fadeOutDuration': (visitor, target) =>
          (target as FadeInImage).fadeOutDuration,
      'fadeOutCurve': (visitor, target) => (target as FadeInImage).fadeOutCurve,
      'fadeInDuration': (visitor, target) =>
          (target as FadeInImage).fadeInDuration,
      'fadeInCurve': (visitor, target) => (target as FadeInImage).fadeInCurve,
      'width': (visitor, target) => (target as FadeInImage).width,
      'height': (visitor, target) => (target as FadeInImage).height,
      'fit': (visitor, target) => (target as FadeInImage).fit,
      'alignment': (visitor, target) => (target as FadeInImage).alignment,
      'repeat': (visitor, target) => (target as FadeInImage).repeat,
      'matchTextDirection': (visitor, target) =>
          (target as FadeInImage).matchTextDirection,
      'key': (visitor, target) => (target as FadeInImage).key,
    },
  );
}
