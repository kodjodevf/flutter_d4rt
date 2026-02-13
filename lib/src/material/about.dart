import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for AboutDialog
BridgedClass getAboutDialogBridgingDefinition() {
  return BridgedClass(
    nativeType: AboutDialog,
    name: 'AboutDialog',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final applicationName = namedArgs.get<String?>('applicationName');
        final applicationVersion = namedArgs.get<String?>('applicationVersion');
        final applicationIcon = namedArgs.get<Widget?>('applicationIcon');
        final applicationLegalese = namedArgs.get<String?>(
          'applicationLegalese',
        );
        final children = visitor.toWidgets(namedArgs['children']);

        return AboutDialog(
          key: key,
          applicationName: applicationName,
          applicationVersion: applicationVersion,
          applicationIcon: applicationIcon,
          applicationLegalese: applicationLegalese,
          children: children is List<Widget> ? children : null,
        );
      },
    },
  );
}

/// Returns the BridgedClass for AboutListTile
BridgedClass getAboutListTileBridgingDefinition() {
  return BridgedClass(
    nativeType: AboutListTile,
    name: 'AboutListTile',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final icon = namedArgs.get<Widget?>('icon');
        final child = visitor.toWidgets(namedArgs['child']);
        final applicationName = namedArgs.get<String?>('applicationName');
        final applicationVersion = namedArgs.get<String?>('applicationVersion');
        final applicationIcon = namedArgs.get<Widget?>('applicationIcon');
        final applicationLegalese = namedArgs.get<String?>(
          'applicationLegalese',
        );
        final aboutBoxChildren = visitor.toWidgets(
          namedArgs['aboutBoxChildren'],
        );
        final dense = namedArgs.get<bool?>('dense');

        return AboutListTile(
          key: key,
          icon: icon,
          child: child,
          applicationName: applicationName,
          applicationVersion: applicationVersion,
          applicationIcon: applicationIcon,
          applicationLegalese: applicationLegalese,
          aboutBoxChildren: aboutBoxChildren is List<Widget>
              ? aboutBoxChildren
              : null,
          dense: dense,
        );
      },
    },
  );
}

/// Returns the BridgedClass for LicensePage
BridgedClass getLicensePageBridgingDefinition() {
  return BridgedClass(
    nativeType: LicensePage,
    name: 'LicensePage',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final applicationName = namedArgs.get<String?>('applicationName');
        final applicationVersion = namedArgs.get<String?>('applicationVersion');
        final applicationIcon = namedArgs.get<Widget?>('applicationIcon');
        final applicationLegalese = namedArgs.get<String?>(
          'applicationLegalese',
        );

        return LicensePage(
          key: key,
          applicationName: applicationName,
          applicationVersion: applicationVersion,
          applicationIcon: applicationIcon,
          applicationLegalese: applicationLegalese,
        );
      },
    },
  );
}
