import 'package:d4rt/d4rt.dart';
import 'package:flutter/cupertino.dart';

/// Returns the BridgedClass for Flutter CupertinoColors.
BridgedClass getCupertinoColorsBridgingDefinition() {
  return BridgedClass(
    nativeType: CupertinoColors,
    name: 'CupertinoColors',
    staticGetters: {
      'activeBlue': (visitor) => CupertinoColors.activeBlue,
      'activeGreen': (visitor) => CupertinoColors.activeGreen,
      'activeOrange': (visitor) => CupertinoColors.activeOrange,
      'white': (visitor) => CupertinoColors.white,
      'black': (visitor) => CupertinoColors.black,
      'lightBackgroundGray': (visitor) => CupertinoColors.lightBackgroundGray,
      'extraLightBackgroundGray': (visitor) => CupertinoColors.extraLightBackgroundGray,
      'darkBackgroundGray': (visitor) => CupertinoColors.darkBackgroundGray,
      'inactiveGray': (visitor) => CupertinoColors.inactiveGray,
      'destructiveRed': (visitor) => CupertinoColors.destructiveRed,
      'systemBlue': (visitor) => CupertinoColors.systemBlue,
      'systemGreen': (visitor) => CupertinoColors.systemGreen,
      'systemIndigo': (visitor) => CupertinoColors.systemIndigo,
      'systemOrange': (visitor) => CupertinoColors.systemOrange,
      'systemPink': (visitor) => CupertinoColors.systemPink,
      'systemPurple': (visitor) => CupertinoColors.systemPurple,
      'systemRed': (visitor) => CupertinoColors.systemRed,
      'systemTeal': (visitor) => CupertinoColors.systemTeal,
      'systemYellow': (visitor) => CupertinoColors.systemYellow,
      'systemGrey': (visitor) => CupertinoColors.systemGrey,
      'systemGrey2': (visitor) => CupertinoColors.systemGrey2,
      'systemGrey3': (visitor) => CupertinoColors.systemGrey3,
      'systemGrey4': (visitor) => CupertinoColors.systemGrey4,
      'systemGrey5': (visitor) => CupertinoColors.systemGrey5,
      'systemGrey6': (visitor) => CupertinoColors.systemGrey6,
      'systemBackground': (visitor) => CupertinoColors.systemBackground,
      'secondarySystemBackground': (visitor) => CupertinoColors.secondarySystemBackground,
      'tertiarySystemBackground': (visitor) => CupertinoColors.tertiarySystemBackground,
      'systemGroupedBackground': (visitor) => CupertinoColors.systemGroupedBackground,
      'label': (visitor) => CupertinoColors.label,
      'secondaryLabel': (visitor) => CupertinoColors.secondaryLabel,
      'tertiaryLabel': (visitor) => CupertinoColors.tertiaryLabel,
      'quaternaryLabel': (visitor) => CupertinoColors.quaternaryLabel,
      'placeholderText': (visitor) => CupertinoColors.placeholderText,
      'separator': (visitor) => CupertinoColors.separator,
      'opaqueSeparator': (visitor) => CupertinoColors.opaqueSeparator,
      'link': (visitor) => CupertinoColors.link,
    },
  );
}
