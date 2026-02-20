import 'package:d4rt/d4rt.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Input and focus management widgets bridging definitions

KeyEventResult Function(FocusNode, KeyEvent)? _handleKeyEventCallback(
  InterpreterVisitor visitor,
  dynamic callback,
) {
  if (callback == null) return null;
  if (callback is InterpretedFunction) {
    return (FocusNode node, KeyEvent event) {
      final result = callback.call(visitor, [node, event]);
      return result as KeyEventResult;
    };
  }
  return callback as KeyEventResult Function(FocusNode, KeyEvent)?;
}

// Focus bridging
BridgedClass getFocusBridgingDefinition() {
  return BridgedClass(
    nativeType: Focus,
    name: 'Focus',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return Focus(
          key: namedArgs.get<Key?>('key'),
          focusNode: namedArgs['focusNode'] as FocusNode?,
          autofocus: namedArgs['autofocus'] as bool? ?? false,
          onFocusChange: namedArgs.handleValueCallback<bool>(
            'onFocusChange',
            visitor,
          ),
          onKeyEvent: _handleKeyEventCallback(visitor, namedArgs['onKeyEvent']),
          canRequestFocus: namedArgs['canRequestFocus'] as bool? ?? true,
          skipTraversal: namedArgs['skipTraversal'] as bool? ?? false,
          includeSemantics: namedArgs['includeSemantics'] as bool? ?? true,
          debugLabel: namedArgs['debugLabel'] as String?,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
    staticMethods: {
      'of': (visitor, positionalArgs, namedArgs) {
        final context = positionalArgs[0] as BuildContext;
        return Focus.of(context);
      },
      'maybeOf': (visitor, positionalArgs, namedArgs) {
        final context = positionalArgs[0] as BuildContext;
        return Focus.maybeOf(context);
      },
    },
  );
}

// FocusScope bridging
BridgedClass getFocusScopeBridgingDefinition() {
  return BridgedClass(
    nativeType: FocusScope,
    name: 'FocusScope',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return FocusScope(
          key: namedArgs.get<Key?>('key'),
          node: namedArgs['node'] as FocusScopeNode?,
          autofocus: namedArgs['autofocus'] as bool? ?? false,
          onFocusChange: namedArgs.handleValueCallback<bool>(
            'onFocusChange',
            visitor,
          ),
          canRequestFocus: namedArgs['canRequestFocus'] as bool? ?? true,
          skipTraversal: namedArgs['skipTraversal'] as bool? ?? false,
          includeSemantics: namedArgs['includeSemantics'] as bool? ?? true,
          debugLabel: namedArgs['debugLabel'] as String?,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
    staticMethods: {
      'of': (visitor, positionalArgs, namedArgs) {
        final context = positionalArgs[0] as BuildContext;
        return FocusScope.of(context);
      },
    },
  );
}

// Listener bridging
BridgedClass getListenerBridgingDefinition() {
  return BridgedClass(
    nativeType: Listener,
    name: 'Listener',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return Listener(
          key: namedArgs.get<Key?>('key'),
          onPointerDown: namedArgs.handleValueCallback<PointerDownEvent>(
            'onPointerDown',
            visitor,
          ),
          onPointerMove: namedArgs.handleValueCallback<PointerMoveEvent>(
            'onPointerMove',
            visitor,
          ),
          onPointerUp: namedArgs.handleValueCallback<PointerUpEvent>(
            'onPointerUp',
            visitor,
          ),
          onPointerHover: namedArgs.handleValueCallback<PointerHoverEvent>(
            'onPointerHover',
            visitor,
          ),
          onPointerCancel: namedArgs.handleValueCallback<PointerCancelEvent>(
            'onPointerCancel',
            visitor,
          ),
          onPointerPanZoomStart: namedArgs
              .handleValueCallback<PointerPanZoomStartEvent>(
                'onPointerPanZoomStart',
                visitor,
              ),
          onPointerPanZoomUpdate: namedArgs
              .handleValueCallback<PointerPanZoomUpdateEvent>(
                'onPointerPanZoomUpdate',
                visitor,
              ),
          onPointerPanZoomEnd: namedArgs
              .handleValueCallback<PointerPanZoomEndEvent>(
                'onPointerPanZoomEnd',
                visitor,
              ),
          onPointerSignal: namedArgs.handleValueCallback<PointerSignalEvent>(
            'onPointerSignal',
            visitor,
          ),
          behavior:
              namedArgs['behavior'] as HitTestBehavior? ??
              HitTestBehavior.deferToChild,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}

// MouseRegion bridging
BridgedClass getMouseRegionBridgingDefinition() {
  return BridgedClass(
    nativeType: MouseRegion,
    name: 'MouseRegion',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return MouseRegion(
          key: namedArgs.get<Key?>('key'),
          onEnter: namedArgs.handleValueCallback<PointerEnterEvent>(
            'onEnter',
            visitor,
          ),
          onExit: namedArgs.handleValueCallback<PointerExitEvent>(
            'onExit',
            visitor,
          ),
          onHover: namedArgs.handleValueCallback<PointerHoverEvent>(
            'onHover',
            visitor,
          ),
          cursor: namedArgs['cursor'] as MouseCursor? ?? MouseCursor.defer,
          opaque: namedArgs['opaque'] as bool? ?? true,
          hitTestBehavior: namedArgs['hitTestBehavior'] as HitTestBehavior?,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}

// AbsorbPointer bridging
BridgedClass getAbsorbPointerBridgingDefinition() {
  return BridgedClass(
    nativeType: AbsorbPointer,
    name: 'AbsorbPointer',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return AbsorbPointer(
          key: namedArgs.get<Key?>('key'),
          absorbing: namedArgs['absorbing'] as bool? ?? true,
          ignoringSemantics: namedArgs['ignoringSemantics'] as bool?,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}

// IgnorePointer bridging
BridgedClass getIgnorePointerBridgingDefinition() {
  return BridgedClass(
    nativeType: IgnorePointer,
    name: 'IgnorePointer',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return IgnorePointer(
          key: namedArgs.get<Key?>('key'),
          ignoring: namedArgs['ignoring'] as bool? ?? true,
          ignoringSemantics: namedArgs['ignoringSemantics'] as bool?,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}
