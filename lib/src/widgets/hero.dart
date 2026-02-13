import 'package:d4rt/d4rt.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for the Flutter Hero widget.
BridgedClass getHeroBridgingDefinition() {
  return BridgedClass(
    nativeType: Hero,
    name: 'Hero',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final tag = namedArgs.get('tag') ?? '';
        final child =
            visitor.toWidgets(namedArgs['child']) ?? const SizedBox.shrink();

        // Handle createRectTween callback
        final createRectTween = namedArgs['createRectTween'];
        CreateRectTween? createRectTweenCallback;
        if (createRectTween != null) {
          if (createRectTween is InterpretedFunction) {
            createRectTweenCallback = (Rect? begin, Rect? end) {
              final result = createRectTween.call(visitor, [begin, end]);
              return result as Tween<Rect?>;
            };
          } else {
            createRectTweenCallback = createRectTween as CreateRectTween?;
          }
        }

        // Handle flightShuttleBuilder callback
        final flightShuttleBuilder = namedArgs['flightShuttleBuilder'];
        HeroFlightShuttleBuilder? flightShuttleBuilderCallback;
        if (flightShuttleBuilder != null) {
          if (flightShuttleBuilder is InterpretedFunction) {
            flightShuttleBuilderCallback =
                (
                  BuildContext flightContext,
                  Animation<double> animation,
                  HeroFlightDirection flightDirection,
                  BuildContext fromHeroContext,
                  BuildContext toHeroContext,
                ) {
                  final result = flightShuttleBuilder.call(visitor, [
                    flightContext,
                    animation,
                    flightDirection,
                    fromHeroContext,
                    toHeroContext,
                  ]);
                  return visitor.toWidgets(result) ?? const SizedBox.shrink();
                };
          } else {
            flightShuttleBuilderCallback =
                flightShuttleBuilder as HeroFlightShuttleBuilder?;
          }
        }

        // Handle placeholderBuilder callback
        final placeholderBuilder = namedArgs['placeholderBuilder'];
        HeroPlaceholderBuilder? placeholderBuilderCallback;
        if (placeholderBuilder != null) {
          if (placeholderBuilder is InterpretedFunction) {
            placeholderBuilderCallback =
                (BuildContext context, Size heroSize, Widget child) {
                  final result = placeholderBuilder.call(visitor, [
                    context,
                    heroSize,
                    child,
                  ]);
                  return visitor.toWidgets(result) ?? const SizedBox.shrink();
                };
          } else {
            placeholderBuilderCallback =
                placeholderBuilder as HeroPlaceholderBuilder?;
          }
        }

        final transitionOnUserGestures =
            namedArgs.get<bool?>('transitionOnUserGestures') ?? false;

        return Hero(
          key: key,
          tag: tag,
          createRectTween: createRectTweenCallback,
          flightShuttleBuilder: flightShuttleBuilderCallback,
          placeholderBuilder: placeholderBuilderCallback,
          transitionOnUserGestures: transitionOnUserGestures,
          child: child,
        );
      },
    },
    getters: {
      'tag': (visitor, target) => (target as Hero).tag,
      'child': (visitor, target) => (target as Hero).child,
      'transitionOnUserGestures': (visitor, target) =>
          (target as Hero).transitionOnUserGestures,
      'key': (visitor, target) => (target as Hero).key,
    },
  );
}
