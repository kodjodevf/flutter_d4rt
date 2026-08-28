import 'package:d4rt/d4rt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedEnumDefinition for RefreshIndicatorMode.
BridgedEnumDefinition<RefreshIndicatorMode>
    getRefreshIndicatorModeBridgingDefinition() {
  return BridgedEnumDefinition<RefreshIndicatorMode>(
    name: 'RefreshIndicatorMode',
    values: RefreshIndicatorMode.values,
  );
}

/// Returns the BridgedClass for Flutter CupertinoSliverRefreshControl.
BridgedClass getCupertinoSliverRefreshControlBridgingDefinition() {
  return BridgedClass(
    nativeType: CupertinoSliverRefreshControl,
    name: 'CupertinoSliverRefreshControl',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final refreshTriggerPullDistance =
            (namedArgs['refreshTriggerPullDistance'] as num?)?.toDouble() ??
                100.0;
        final refreshIndicatorExtent =
            (namedArgs['refreshIndicatorExtent'] as num?)?.toDouble() ?? 60.0;
        final rawOnRefresh = namedArgs['onRefresh'];
        RefreshCallback? onRefresh;
        if (rawOnRefresh is InterpretedFunction) {
          onRefresh = () async {
            rawOnRefresh.call(visitor, [], {});
          };
        }
        final rawBuilder = namedArgs['builder'];
        RefreshControlIndicatorBuilder? builder;
        if (rawBuilder is InterpretedFunction) {
          builder = (context, refreshState, pulledExtent, refreshTriggerPullDistance, refreshIndicatorExtent) {
            final result = rawBuilder.call(visitor, [
              context,
              refreshState,
              pulledExtent,
              refreshTriggerPullDistance,
              refreshIndicatorExtent,
            ], {});
            return visitor.toWidget(result) ?? const SizedBox();
          };
        }

        return CupertinoSliverRefreshControl(
          key: key,
          refreshTriggerPullDistance: refreshTriggerPullDistance,
          refreshIndicatorExtent: refreshIndicatorExtent,
          onRefresh: onRefresh,
          builder: builder,
        );
      },
    },
    getters: {
      'refreshTriggerPullDistance': (visitor, target) =>
          (target as CupertinoSliverRefreshControl).refreshTriggerPullDistance,
      'refreshIndicatorExtent': (visitor, target) =>
          (target as CupertinoSliverRefreshControl).refreshIndicatorExtent,
    },
  );
}

/// Returns the BridgedClass for Flutter CupertinoSliverNavigationBar.
BridgedClass getCupertinoSliverNavigationBarBridgingDefinition() {
  return BridgedClass(
    nativeType: CupertinoSliverNavigationBar,
    name: 'CupertinoSliverNavigationBar',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final largeTitle = visitor.toWidget(namedArgs['largeTitle']);
        final leading = visitor.toWidget(namedArgs['leading']);
        final automaticallyImplyLeading =
            namedArgs.get<bool?>('automaticallyImplyLeading') ?? true;
        final previousPageTitle =
            namedArgs.get<String?>('previousPageTitle');
        final middle = visitor.toWidget(namedArgs['middle']);
        final trailing = visitor.toWidget(namedArgs['trailing']);
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final brightness = namedArgs.get<Brightness?>('brightness');
        final padding =
            namedArgs.get<EdgeInsetsDirectional?>('padding');
        final border = namedArgs.get<Border?>('border');
        final stretch = namedArgs.get<bool?>('stretch') ?? false;

        return CupertinoSliverNavigationBar(
          key: key,
          largeTitle: largeTitle,
          leading: leading,
          automaticallyImplyLeading: automaticallyImplyLeading,
          previousPageTitle: previousPageTitle,
          middle: middle,
          trailing: trailing,
          backgroundColor: backgroundColor,
          brightness: brightness,
          padding: padding,
          border: border,
          stretch: stretch,
        );
      },
    },
    getters: {
      'largeTitle': (visitor, target) =>
          (target as CupertinoSliverNavigationBar).largeTitle,
      'leading': (visitor, target) =>
          (target as CupertinoSliverNavigationBar).leading,
      'automaticallyImplyLeading': (visitor, target) =>
          (target as CupertinoSliverNavigationBar).automaticallyImplyLeading,
      'previousPageTitle': (visitor, target) =>
          (target as CupertinoSliverNavigationBar).previousPageTitle,
      'middle': (visitor, target) =>
          (target as CupertinoSliverNavigationBar).middle,
      'trailing': (visitor, target) =>
          (target as CupertinoSliverNavigationBar).trailing,
      'backgroundColor': (visitor, target) =>
          (target as CupertinoSliverNavigationBar).backgroundColor,
      'brightness': (visitor, target) =>
          (target as CupertinoSliverNavigationBar).brightness,
      'padding': (visitor, target) =>
          (target as CupertinoSliverNavigationBar).padding,
      'border': (visitor, target) =>
          (target as CupertinoSliverNavigationBar).border,
      'stretch': (visitor, target) =>
          (target as CupertinoSliverNavigationBar).stretch,
    },
  );
}

/// Returns the BridgedClass for Flutter CupertinoScrollbar.
BridgedClass getCupertinoScrollbarBridgingDefinition() {
  return BridgedClass(
    nativeType: CupertinoScrollbar,
    name: 'CupertinoScrollbar',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final child = visitor.toWidget(namedArgs['child']) ?? const SizedBox();
        final controller =
            namedArgs.get<ScrollController?>('controller');
        final thumbVisibility =
            namedArgs.get<bool?>('thumbVisibility');
        final thickness =
            (namedArgs['thickness'] as num?)?.toDouble() ??
                CupertinoScrollbar.defaultThickness;
        final thicknessWhileDragging =
            (namedArgs['thicknessWhileDragging'] as num?)?.toDouble() ??
                CupertinoScrollbar.defaultThicknessWhileDragging;
        final radius = namedArgs.get<Radius?>('radius') ??
            CupertinoScrollbar.defaultRadius;
        final radiusWhileDragging =
            namedArgs.get<Radius?>('radiusWhileDragging') ??
                CupertinoScrollbar.defaultRadiusWhileDragging;

        return CupertinoScrollbar(
          key: key,
          controller: controller,
          thumbVisibility: thumbVisibility,
          thickness: thickness,
          thicknessWhileDragging: thicknessWhileDragging,
          radius: radius,
          radiusWhileDragging: radiusWhileDragging,
          child: child,
        );
      },
    },
    getters: {
      'child': (visitor, target) => (target as CupertinoScrollbar).child,
      'controller': (visitor, target) =>
          (target as CupertinoScrollbar).controller,
      'thumbVisibility': (visitor, target) =>
          (target as CupertinoScrollbar).thumbVisibility,
      'thickness': (visitor, target) =>
          (target as CupertinoScrollbar).thickness,
      'radius': (visitor, target) => (target as CupertinoScrollbar).radius,
    },
  );
}
