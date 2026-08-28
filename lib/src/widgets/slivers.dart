// ignore_for_file: deprecated_member_use

import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for CustomScrollView.
BridgedClass getCustomScrollViewBridgingDefinition() {
  return BridgedClass(
    nativeType: CustomScrollView,
    name: 'CustomScrollView',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final scrollDirection =
            namedArgs.get<Axis?>('scrollDirection') ?? Axis.vertical;
        final reverse = namedArgs.get<bool?>('reverse') ?? false;
        final controller = namedArgs.get<ScrollController?>('controller');
        final primary = namedArgs.get<bool?>('primary');
        final physics = namedArgs.get<ScrollPhysics?>('physics');
        final shrinkWrap = namedArgs.get<bool?>('shrinkWrap') ?? false;
        final cacheExtent = namedArgs.getToDouble('cacheExtent');
        final anchor = namedArgs.getToDouble('anchor') ?? 0.0;

        final sliversRaw = visitor.toWidgets(namedArgs['slivers']);
        final List<Widget> slivers = sliversRaw is List<Widget>
            ? sliversRaw
            : (sliversRaw is List
                ? sliversRaw.cast<Widget>()
                : (sliversRaw is Widget ? [sliversRaw] : <Widget>[]));

        return CustomScrollView(
          key: key,
          scrollDirection: scrollDirection,
          reverse: reverse,
          controller: controller,
          primary: primary,
          physics: physics,
          shrinkWrap: shrinkWrap,
          cacheExtent: cacheExtent,
          anchor: anchor,
          slivers: slivers,
        );
      },
    },
    getters: {
      'scrollDirection': (visitor, target) =>
          (target as CustomScrollView).scrollDirection,
      'reverse': (visitor, target) => (target as CustomScrollView).reverse,
      'controller': (visitor, target) => (target as CustomScrollView).controller,
      'primary': (visitor, target) => (target as CustomScrollView).primary,
      'physics': (visitor, target) => (target as CustomScrollView).physics,
      'shrinkWrap': (visitor, target) => (target as CustomScrollView).shrinkWrap,
      'slivers': (visitor, target) => (target as CustomScrollView).slivers,
      'key': (visitor, target) => (target as CustomScrollView).key,
    },
  );
}

/// Returns the BridgedClass for SliverToBoxAdapter.
BridgedClass getSliverToBoxAdapterBridgingDefinition() {
  return BridgedClass(
    nativeType: SliverToBoxAdapter,
    name: 'SliverToBoxAdapter',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final child = visitor.toWidgets(namedArgs['child']);
        return SliverToBoxAdapter(key: key, child: child);
      },
    },
    getters: {
      'child': (visitor, target) => (target as SliverToBoxAdapter).child,
      'key': (visitor, target) => (target as SliverToBoxAdapter).key,
    },
  );
}

/// Returns the BridgedClass for SliverPadding.
BridgedClass getSliverPaddingBridgingDefinition() {
  return BridgedClass(
    nativeType: SliverPadding,
    name: 'SliverPadding',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final padding =
            namedArgs.get<EdgeInsetsGeometry?>('padding') ?? EdgeInsets.zero;
        final sliver = visitor.toWidgets(namedArgs['sliver']);
        return SliverPadding(key: key, padding: padding, sliver: sliver);
      },
    },
    getters: {
      'padding': (visitor, target) => (target as SliverPadding).padding,
      'child': (visitor, target) => (target as SliverPadding).child,
      'key': (visitor, target) => (target as SliverPadding).key,
    },
  );
}

/// Returns the BridgedClass for SliverFillRemaining.
BridgedClass getSliverFillRemainingBridgingDefinition() {
  return BridgedClass(
    nativeType: SliverFillRemaining,
    name: 'SliverFillRemaining',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final child = visitor.toWidgets(namedArgs['child']);
        final hasScrollBody = namedArgs.get<bool?>('hasScrollBody') ?? true;
        final fillOverscroll = namedArgs.get<bool?>('fillOverscroll') ?? false;
        return SliverFillRemaining(
          key: key,
          child: child,
          hasScrollBody: hasScrollBody,
          fillOverscroll: fillOverscroll,
        );
      },
    },
    getters: {
      'child': (visitor, target) => (target as SliverFillRemaining).child,
      'hasScrollBody': (visitor, target) =>
          (target as SliverFillRemaining).hasScrollBody,
      'fillOverscroll': (visitor, target) =>
          (target as SliverFillRemaining).fillOverscroll,
      'key': (visitor, target) => (target as SliverFillRemaining).key,
    },
  );
}

/// Returns the BridgedClass for SliverChildListDelegate.
BridgedClass getSliverChildListDelegateBridgingDefinition() {
  return BridgedClass(
    nativeType: SliverChildListDelegate,
    name: 'SliverChildListDelegate',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final childrenRaw = positionalArgs.isNotEmpty
            ? visitor.toWidgets(positionalArgs[0])
            : visitor.toWidgets(namedArgs['children']);
        final List<Widget> children = childrenRaw is List<Widget>
            ? childrenRaw
            : (childrenRaw is List
                ? childrenRaw.cast<Widget>()
                : (childrenRaw is Widget ? [childrenRaw] : <Widget>[]));
        final addAutomaticKeepAlives =
            namedArgs.get<bool?>('addAutomaticKeepAlives') ?? true;
        final addRepaintBoundaries =
            namedArgs.get<bool?>('addRepaintBoundaries') ?? true;
        final addSemanticIndexes =
            namedArgs.get<bool?>('addSemanticIndexes') ?? true;

        return SliverChildListDelegate(
          children,
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
          addSemanticIndexes: addSemanticIndexes,
        );
      },
    },
    getters: {
      'children': (visitor, target) =>
          (target as SliverChildListDelegate).children,
    },
    isSubtypeOfFunc: (value) => value is SliverChildListDelegate,
  );
}

/// Returns the BridgedClass for SliverChildBuilderDelegate.
BridgedClass getSliverChildBuilderDelegateBridgingDefinition() {
  return BridgedClass(
    nativeType: SliverChildBuilderDelegate,
    name: 'SliverChildBuilderDelegate',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final builderValue = positionalArgs.isNotEmpty
            ? positionalArgs[0]
            : namedArgs['builder'];
        final childCount = namedArgs.get<int?>('childCount');
        final addAutomaticKeepAlives =
            namedArgs.get<bool?>('addAutomaticKeepAlives') ?? true;
        final addRepaintBoundaries =
            namedArgs.get<bool?>('addRepaintBoundaries') ?? true;
        final addSemanticIndexes =
            namedArgs.get<bool?>('addSemanticIndexes') ?? true;

        NullableIndexedWidgetBuilder builder = (context, index) => null;
        if (builderValue is InterpretedFunction) {
          builder = (context, index) {
            final result = builderValue.call(visitor, [context, index]);
            return visitor.toWidgets(result);
          };
        } else if (builderValue is Function) {
          builder = (context, index) {
            final result = (builderValue as dynamic)(context, index);
            return visitor.toWidgets(result);
          };
        }

        return SliverChildBuilderDelegate(
          builder,
          childCount: childCount,
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
          addSemanticIndexes: addSemanticIndexes,
        );
      },
    },
    getters: {
      'childCount': (visitor, target) =>
          (target as SliverChildBuilderDelegate).childCount,
    },
    isSubtypeOfFunc: (value) => value is SliverChildBuilderDelegate,
  );
}

/// Returns the BridgedClass for SliverList.
BridgedClass getSliverListBridgingDefinition() {
  return BridgedClass(
    nativeType: SliverList,
    name: 'SliverList',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final delegate =
            namedArgs.get<SliverChildDelegate>('delegate') ??
            SliverChildListDelegate(const <Widget>[]);
        return SliverList(key: key, delegate: delegate);
      },
      'list': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final childrenRaw = visitor.toWidgets(namedArgs['children']);
        final List<Widget> children = childrenRaw is List<Widget>
            ? childrenRaw
            : (childrenRaw is List
                ? childrenRaw.cast<Widget>()
                : (childrenRaw is Widget ? [childrenRaw] : <Widget>[]));
        return SliverList.list(key: key, children: children);
      },
      'builder': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final itemBuilder = namedArgs['itemBuilder'];
        final itemCount =
            namedArgs.get<int?>('itemCount') ??
            namedArgs.get<int?>('childCount');

        NullableIndexedWidgetBuilder builder = (context, index) => null;
        if (itemBuilder is InterpretedFunction) {
          builder = (context, index) {
            final result = itemBuilder.call(visitor, [context, index]);
            return visitor.toWidgets(result);
          };
        } else if (itemBuilder is Function) {
          builder = (context, index) {
            final result = (itemBuilder as dynamic)(context, index);
            return visitor.toWidgets(result);
          };
        }

        return SliverList.builder(
          key: key,
          itemBuilder: builder,
          itemCount: itemCount,
        );
      },
    },
    getters: {
      'delegate': (visitor, target) => (target as SliverList).delegate,
      'key': (visitor, target) => (target as SliverList).key,
    },
  );
}

/// Returns the BridgedClass for SliverGrid.
BridgedClass getSliverGridBridgingDefinition() {
  return BridgedClass(
    nativeType: SliverGrid,
    name: 'SliverGrid',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final delegate =
            namedArgs.get<SliverChildDelegate>('delegate') ??
            SliverChildListDelegate(const <Widget>[]);
        final gridDelegate =
            namedArgs.get<SliverGridDelegate>('gridDelegate') ??
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2);
        return SliverGrid(
          key: key,
          delegate: delegate,
          gridDelegate: gridDelegate,
        );
      },
      'count': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final crossAxisCount = namedArgs.get<int?>('crossAxisCount') ?? 2;
        final mainAxisSpacing = namedArgs.getToDouble('mainAxisSpacing') ?? 0.0;
        final crossAxisSpacing =
            namedArgs.getToDouble('crossAxisSpacing') ?? 0.0;
        final childAspectRatio =
            namedArgs.getToDouble('childAspectRatio') ?? 1.0;
        final childrenRaw = visitor.toWidgets(namedArgs['children']);
        final List<Widget> children = childrenRaw is List<Widget>
            ? childrenRaw
            : (childrenRaw is List
                ? childrenRaw.cast<Widget>()
                : (childrenRaw is Widget ? [childrenRaw] : <Widget>[]));

        return SliverGrid.count(
          key: key,
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
          childAspectRatio: childAspectRatio,
          children: children,
        );
      },
      'extent': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final maxCrossAxisExtent =
            namedArgs.getToDouble('maxCrossAxisExtent') ?? 200.0;
        final mainAxisSpacing = namedArgs.getToDouble('mainAxisSpacing') ?? 0.0;
        final crossAxisSpacing =
            namedArgs.getToDouble('crossAxisSpacing') ?? 0.0;
        final childAspectRatio =
            namedArgs.getToDouble('childAspectRatio') ?? 1.0;
        final childrenRaw = visitor.toWidgets(namedArgs['children']);
        final List<Widget> children = childrenRaw is List<Widget>
            ? childrenRaw
            : (childrenRaw is List
                ? childrenRaw.cast<Widget>()
                : (childrenRaw is Widget ? [childrenRaw] : <Widget>[]));

        return SliverGrid.extent(
          key: key,
          maxCrossAxisExtent: maxCrossAxisExtent,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
          childAspectRatio: childAspectRatio,
          children: children,
        );
      },
    },
    getters: {
      'delegate': (visitor, target) => (target as SliverGrid).delegate,
      'gridDelegate': (visitor, target) => (target as SliverGrid).gridDelegate,
      'key': (visitor, target) => (target as SliverGrid).key,
    },
  );
}

/// Returns the BridgedClass for SliverGridDelegate abstract class.
BridgedClass getSliverGridDelegateBridgingDefinition() {
  return BridgedClass(
    nativeType: SliverGridDelegate,
    name: 'SliverGridDelegate',
    constructors: {},
    isSubtypeOfFunc: (value) => value is SliverGridDelegate,
  );
}

/// Returns the BridgedClass for SliverAppBar.
BridgedClass getSliverAppBarBridgingDefinition() {
  return BridgedClass(
    nativeType: SliverAppBar,
    name: 'SliverAppBar',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final leading = visitor.toWidgets(namedArgs['leading']);
        final automaticallyImplyLeading =
            namedArgs.get<bool?>('automaticallyImplyLeading') ?? true;
        final title = visitor.toWidgets(namedArgs['title']);
        final actionsRaw = visitor.toWidgets(namedArgs['actions']);
        final List<Widget>? actions = actionsRaw is List<Widget>
            ? actionsRaw
            : (actionsRaw is List
                ? actionsRaw.cast<Widget>()
                : (actionsRaw is Widget ? [actionsRaw] : null));
        final flexibleSpace = visitor.toWidgets(namedArgs['flexibleSpace']);
        final bottom = namedArgs.get<PreferredSizeWidget?>('bottom');
        final elevation = namedArgs.getToDouble('elevation');
        final shadowColor = namedArgs.get<Color?>('shadowColor');
        final surfaceTintColor = namedArgs.get<Color?>('surfaceTintColor');
        final forceElevated = namedArgs.get<bool?>('forceElevated') ?? false;
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final foregroundColor = namedArgs.get<Color?>('foregroundColor');
        final iconTheme = namedArgs.get<IconThemeData?>('iconTheme');
        final actionsIconTheme =
            namedArgs.get<IconThemeData?>('actionsIconTheme');
        final primary = namedArgs.get<bool?>('primary') ?? true;
        final centerTitle = namedArgs.get<bool?>('centerTitle');
        final titleSpacing = namedArgs.getToDouble('titleSpacing');
        final expandedHeight = namedArgs.getToDouble('expandedHeight');
        final floating = namedArgs.get<bool?>('floating') ?? false;
        final pinned = namedArgs.get<bool?>('pinned') ?? false;
        final snap = namedArgs.get<bool?>('snap') ?? false;
        final stretch = namedArgs.get<bool?>('stretch') ?? false;

        return SliverAppBar(
          key: key,
          leading: leading,
          automaticallyImplyLeading: automaticallyImplyLeading,
          title: title,
          actions: actions,
          flexibleSpace: flexibleSpace,
          bottom: bottom,
          elevation: elevation,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          forceElevated: forceElevated,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          iconTheme: iconTheme,
          actionsIconTheme: actionsIconTheme,
          primary: primary,
          centerTitle: centerTitle,
          titleSpacing: titleSpacing,
          expandedHeight: expandedHeight,
          floating: floating,
          pinned: pinned,
          snap: snap,
          stretch: stretch,
        );
      },
      'medium': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final leading = visitor.toWidgets(namedArgs['leading']);
        final title = visitor.toWidgets(namedArgs['title']);
        final flexibleSpace = visitor.toWidgets(namedArgs['flexibleSpace']);
        final pinned = namedArgs.get<bool?>('pinned') ?? true;
        final floating = namedArgs.get<bool?>('floating') ?? false;
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final actionsRaw = visitor.toWidgets(namedArgs['actions']);
        final List<Widget>? actions = actionsRaw is List<Widget>
            ? actionsRaw
            : (actionsRaw is List
                ? actionsRaw.cast<Widget>()
                : (actionsRaw is Widget ? [actionsRaw] : null));

        return SliverAppBar.medium(
          key: key,
          leading: leading,
          title: title,
          flexibleSpace: flexibleSpace,
          pinned: pinned,
          floating: floating,
          backgroundColor: backgroundColor,
          actions: actions,
        );
      },
      'large': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final leading = visitor.toWidgets(namedArgs['leading']);
        final title = visitor.toWidgets(namedArgs['title']);
        final flexibleSpace = visitor.toWidgets(namedArgs['flexibleSpace']);
        final pinned = namedArgs.get<bool?>('pinned') ?? true;
        final floating = namedArgs.get<bool?>('floating') ?? false;
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final actionsRaw = visitor.toWidgets(namedArgs['actions']);
        final List<Widget>? actions = actionsRaw is List<Widget>
            ? actionsRaw
            : (actionsRaw is List
                ? actionsRaw.cast<Widget>()
                : (actionsRaw is Widget ? [actionsRaw] : null));

        return SliverAppBar.large(
          key: key,
          leading: leading,
          title: title,
          flexibleSpace: flexibleSpace,
          pinned: pinned,
          floating: floating,
          backgroundColor: backgroundColor,
          actions: actions,
        );
      },
    },
    getters: {
      'leading': (visitor, target) => (target as SliverAppBar).leading,
      'title': (visitor, target) => (target as SliverAppBar).title,
      'pinned': (visitor, target) => (target as SliverAppBar).pinned,
      'floating': (visitor, target) => (target as SliverAppBar).floating,
      'expandedHeight': (visitor, target) =>
          (target as SliverAppBar).expandedHeight,
      'key': (visitor, target) => (target as SliverAppBar).key,
    },
  );
}
