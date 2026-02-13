import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for the Flutter MenuAnchor widget.
BridgedClass getMenuAnchorBridgingDefinition() {
  return BridgedClass(
    nativeType: MenuAnchor,
    name: 'MenuAnchor',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final controller = namedArgs.get<MenuController?>('controller');
        final childFocusNode = namedArgs.get<FocusNode?>('childFocusNode');
        final style = namedArgs.get<MenuStyle?>('style');
        final alignmentOffset = namedArgs.get<Offset?>('alignmentOffset');
        final clipBehavior = namedArgs.get<Clip?>('clipBehavior') ?? Clip.none;
        final anchorTapClosesMenu =
            namedArgs.get<bool?>('anchorTapClosesMenu') ?? false;

        // Handle onOpen callback
        final onOpen = namedArgs['onOpen'];
        VoidCallback? onOpenCallback;
        if (onOpen != null) {
          if (onOpen is InterpretedFunction) {
            onOpenCallback = () => onOpen.call(visitor, []);
          } else if (onOpen is Function) {
            onOpenCallback = onOpen as VoidCallback?;
          }
        }

        // Handle onClose callback
        final onClose = namedArgs['onClose'];
        VoidCallback? onCloseCallback;
        if (onClose != null) {
          if (onClose is InterpretedFunction) {
            onCloseCallback = () => onClose.call(visitor, []);
          } else if (onClose is Function) {
            onCloseCallback = onClose as VoidCallback?;
          }
        }

        final crossAxisUnconstrained =
            namedArgs.get<bool?>('crossAxisUnconstrained') ?? true;

        // Handle builder callback
        final builder = namedArgs['builder'];
        Widget Function(BuildContext, MenuController, Widget?)? builderCallback;
        if (builder != null) {
          if (builder is InterpretedFunction) {
            builderCallback =
                (
                  BuildContext context,
                  MenuController controller,
                  Widget? child,
                ) {
                  final result = builder.call(visitor, [
                    context,
                    controller,
                    child,
                  ]);
                  return visitor.toWidgets(result) ?? const SizedBox.shrink();
                };
          }
        }

        final menuChildren = namedArgs.get<List<Widget>>('menuChildren') ?? [];
        final child = visitor.toWidgets(namedArgs['child']);

        return MenuAnchor(
          key: key,
          controller: controller,
          childFocusNode: childFocusNode,
          style: style,
          alignmentOffset: alignmentOffset,
          clipBehavior: clipBehavior,
          anchorTapClosesMenu: anchorTapClosesMenu,
          onOpen: onOpenCallback,
          onClose: onCloseCallback,
          crossAxisUnconstrained: crossAxisUnconstrained,
          builder: builderCallback,
          menuChildren: menuChildren,
          child: child,
        );
      },
    },
    getters: {
      'controller': (visitor, target) => (target as MenuAnchor).controller,
      'childFocusNode': (visitor, target) =>
          (target as MenuAnchor).childFocusNode,
      'style': (visitor, target) => (target as MenuAnchor).style,
      'alignmentOffset': (visitor, target) =>
          (target as MenuAnchor).alignmentOffset,
      'clipBehavior': (visitor, target) => (target as MenuAnchor).clipBehavior,
      'anchorTapClosesMenu': (visitor, target) =>
          (target as MenuAnchor).anchorTapClosesMenu,
      'crossAxisUnconstrained': (visitor, target) =>
          (target as MenuAnchor).crossAxisUnconstrained,
      'menuChildren': (visitor, target) => (target as MenuAnchor).menuChildren,
      'child': (visitor, target) => (target as MenuAnchor).child,
      'key': (visitor, target) => (target as MenuAnchor).key,
    },
  );
}

/// Returns the BridgedClass for the Flutter MenuItemButton widget.
BridgedClass getMenuItemButtonBridgingDefinition() {
  return BridgedClass(
    nativeType: MenuItemButton,
    name: 'MenuItemButton',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');

        // Handle onPressed callback
        final onPressed = namedArgs['onPressed'];
        VoidCallback? onPressedCallback;
        if (onPressed != null) {
          if (onPressed is InterpretedFunction) {
            onPressedCallback = () => onPressed.call(visitor, []);
          } else {
            onPressedCallback = onPressed as VoidCallback?;
          }
        }

        // Handle onHover callback
        final onHover = namedArgs['onHover'];
        void Function(bool)? onHoverCallback;
        if (onHover != null) {
          if (onHover is InterpretedFunction) {
            onHoverCallback = (bool value) => onHover.call(visitor, [value]);
          } else {
            onHoverCallback = onHover as void Function(bool)?;
          }
        }

        final requestFocusOnHover =
            namedArgs.get<bool?>('requestFocusOnHover') ?? true;
        final onFocusChange = namedArgs['onFocusChange'];
        void Function(bool)? onFocusChangeCallback;
        if (onFocusChange != null) {
          if (onFocusChange is InterpretedFunction) {
            onFocusChangeCallback = (bool value) =>
                onFocusChange.call(visitor, [value]);
          } else {
            onFocusChangeCallback = onFocusChange as void Function(bool)?;
          }
        }

        final focusNode = namedArgs.get<FocusNode?>('focusNode');
        final shortcut = namedArgs.get<MenuSerializableShortcut?>('shortcut');
        final semanticsLabel = namedArgs.get<String?>('semanticsLabel');
        final style = namedArgs.get<ButtonStyle?>('style');
        final closeOnActivate = namedArgs.get<bool?>('closeOnActivate') ?? true;
        final leadingIcon = visitor.toWidgets(namedArgs['leadingIcon']);
        final trailingIcon = visitor.toWidgets(namedArgs['trailingIcon']);
        final child = visitor.toWidgets(namedArgs['child']);

        return MenuItemButton(
          key: key,
          onPressed: onPressedCallback,
          onHover: onHoverCallback,
          requestFocusOnHover: requestFocusOnHover,
          onFocusChange: onFocusChangeCallback,
          focusNode: focusNode,
          shortcut: shortcut,
          semanticsLabel: semanticsLabel,
          style: style,
          closeOnActivate: closeOnActivate,
          leadingIcon: leadingIcon,
          trailingIcon: trailingIcon,
          child: child,
        );
      },
    },
    getters: {
      'focusNode': (visitor, target) => (target as MenuItemButton).focusNode,
      'shortcut': (visitor, target) => (target as MenuItemButton).shortcut,
      'semanticsLabel': (visitor, target) =>
          (target as MenuItemButton).semanticsLabel,
      'style': (visitor, target) => (target as MenuItemButton).style,
      'closeOnActivate': (visitor, target) =>
          (target as MenuItemButton).closeOnActivate,
      'leadingIcon': (visitor, target) =>
          (target as MenuItemButton).leadingIcon,
      'trailingIcon': (visitor, target) =>
          (target as MenuItemButton).trailingIcon,
      'child': (visitor, target) => (target as MenuItemButton).child,
      'key': (visitor, target) => (target as MenuItemButton).key,
    },
  );
}
