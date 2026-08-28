// ignore_for_file: deprecated_member_use

import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
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
        final onOpen = namedArgs.handleVoidCallback('onOpen', visitor);

        // Handle onClose callback
        final onClose = namedArgs.handleVoidCallback('onClose', visitor);

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
          onOpen: onOpen,
          onClose: onClose,
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
        final onPressed = namedArgs.handleVoidCallback('onPressed', visitor);

        // Handle onHover callback
        final onHover = namedArgs.handleValueCallback<bool?>(
          'onHover',
          visitor,
        );

        final requestFocusOnHover =
            namedArgs.get<bool?>('requestFocusOnHover') ?? true;
        final onFocusChange = namedArgs.handleValueCallback<bool?>(
          'onFocusChange',
          visitor,
        );

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
          onPressed: onPressed,
          onHover: onHover,
          requestFocusOnHover: requestFocusOnHover,
          onFocusChange: onFocusChange,
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

/// Returns the BridgedClass for Flutter MenuController.
BridgedClass getMenuControllerBridgingDefinition() {
  return BridgedClass(
    nativeType: MenuController,
    name: 'MenuController',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return MenuController();
      },
    },
    getters: {
      'isOpen': (visitor, target) => (target as MenuController).isOpen,
    },
    methods: {
      'open': (visitor, target, positionalArgs, namedArgs) {
        final position = namedArgs.get<Offset?>('position') ??
            (positionalArgs.isNotEmpty ? positionalArgs[0] as Offset? : null);
        (target as MenuController).open(position: position);
        return null;
      },
      'close': (visitor, target, positionalArgs, namedArgs) {
        (target as MenuController).close();
        return null;
      },
    },
    isSubtypeOfFunc: (value) => value is MenuController,
  );
}

/// Returns the BridgedClass for Flutter SubmenuButton.
BridgedClass getSubmenuButtonBridgingDefinition() {
  return BridgedClass(
    nativeType: SubmenuButton,
    name: 'SubmenuButton',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final rawMenuChildren = namedArgs['menuChildren'];
        final List<Widget> menuChildren = [];
        if (rawMenuChildren is List) {
          menuChildren.addAll(
            rawMenuChildren
                .map((e) => visitor.toWidget(e))
                .whereType<Widget>(),
          );
        }
        final onOpen = namedArgs.handleVoidCallback('onOpen', visitor);
        final onClose = namedArgs.handleVoidCallback('onClose', visitor);
        final leadingIcon = visitor.toWidget(namedArgs['leadingIcon']);
        final trailingIcon = visitor.toWidget(namedArgs['trailingIcon']);
        final child = visitor.toWidget(namedArgs['child']) ?? const SizedBox.shrink();
        final style = namedArgs.get<ButtonStyle?>('style');

        return SubmenuButton(
          key: key,
          menuChildren: menuChildren,
          onOpen: onOpen,
          onClose: onClose,
          leadingIcon: leadingIcon,
          trailingIcon: trailingIcon,
          style: style,
          child: child,
        );
      },
    },
    getters: {
      'menuChildren': (visitor, target) =>
          (target as SubmenuButton).menuChildren,
      'leadingIcon': (visitor, target) => (target as SubmenuButton).leadingIcon,
      'trailingIcon': (visitor, target) =>
          (target as SubmenuButton).trailingIcon,
      'child': (visitor, target) => (target as SubmenuButton).child,
      'key': (visitor, target) => (target as SubmenuButton).key,
    },
    isSubtypeOfFunc: (value) => value is SubmenuButton,
  );
}

/// Returns the BridgedClass for Flutter CheckboxMenuButton.
BridgedClass getCheckboxMenuButtonBridgingDefinition() {
  return BridgedClass(
    nativeType: CheckboxMenuButton,
    name: 'CheckboxMenuButton',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final value = namedArgs.get<bool?>('value') ?? false;
        final onChanged =
            namedArgs.handleValueCallback<bool?>('onChanged', visitor);
        final child = visitor.toWidget(namedArgs['child']) ?? const SizedBox.shrink();
        final trailingIcon = visitor.toWidget(namedArgs['trailingIcon']);
        final style = namedArgs.get<ButtonStyle?>('style');

        return CheckboxMenuButton(
          key: key,
          value: value,
          onChanged: onChanged,
          trailingIcon: trailingIcon,
          style: style,
          child: child,
        );
      },
    },
    getters: {
      'value': (visitor, target) => (target as CheckboxMenuButton).value,
      'child': (visitor, target) => (target as CheckboxMenuButton).child,
      'key': (visitor, target) => (target as CheckboxMenuButton).key,
    },
    isSubtypeOfFunc: (value) => value is CheckboxMenuButton,
  );
}

/// Returns the BridgedClass for Flutter RadioMenuButton.
BridgedClass getRadioMenuButtonBridgingDefinition() {
  return BridgedClass(
    nativeType: RadioMenuButton,
    name: 'RadioMenuButton',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final value = namedArgs['value'];
        final groupValue = namedArgs['groupValue'];
        final rawOnChanged = namedArgs['onChanged'];
        ValueChanged<dynamic>? onChanged;
        if (rawOnChanged is InterpretedFunction) {
          onChanged = (dynamic val) {
            rawOnChanged.call(visitor, [val], {});
          };
        }
        final child = visitor.toWidget(namedArgs['child']) ?? const SizedBox.shrink();
        final trailingIcon = visitor.toWidget(namedArgs['trailingIcon']);
        final style = namedArgs.get<ButtonStyle?>('style');

        return RadioMenuButton<dynamic>(
          key: key,
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          trailingIcon: trailingIcon,
          style: style,
          child: child,
        );
      },
    },
    getters: {
      'value': (visitor, target) => (target as RadioMenuButton).value,
      'groupValue': (visitor, target) => (target as RadioMenuButton).groupValue,
      'child': (visitor, target) => (target as RadioMenuButton).child,
      'key': (visitor, target) => (target as RadioMenuButton).key,
    },
    isSubtypeOfFunc: (value) => value is RadioMenuButton,
  );
}

/// Returns the BridgedClass for Flutter MenuBar.
BridgedClass getMenuBarBridgingDefinition() {
  return BridgedClass(
    nativeType: MenuBar,
    name: 'MenuBar',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final rawChildren = namedArgs['children'];
        final List<Widget> children = [];
        if (rawChildren is List) {
          children.addAll(
            rawChildren
                .map((e) => visitor.toWidget(e))
                .whereType<Widget>(),
          );
        }
        final style = namedArgs.get<MenuStyle?>('style');
        final clipBehavior =
            namedArgs.get<Clip?>('clipBehavior') ?? Clip.none;

        return MenuBar(
          key: key,
          style: style,
          clipBehavior: clipBehavior,
          children: children,
        );
      },
    },
    getters: {
      'children': (visitor, target) => (target as MenuBar).children,
      'style': (visitor, target) => (target as MenuBar).style,
      'clipBehavior': (visitor, target) => (target as MenuBar).clipBehavior,
      'key': (visitor, target) => (target as MenuBar).key,
    },
    isSubtypeOfFunc: (value) => value is MenuBar,
  );
}
