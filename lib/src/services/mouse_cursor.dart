import 'package:d4rt/d4rt.dart';
import 'package:flutter/services.dart';

/// Returns the BridgedClass for MouseCursor
BridgedClass getMouseCursorBridgingDefinition() {
  return BridgedClass(
    nativeType: MouseCursor,
    name: 'MouseCursor',
    getters: {
      'defer': (visitor, target) => MouseCursor.defer,
      'uncontrolled': (visitor, target) => MouseCursor.uncontrolled,
    },
    staticGetters: {
      'defer': (visitor) => MouseCursor.defer,
      'uncontrolled': (visitor) => MouseCursor.uncontrolled,
    },
  );
}

/// Returns the BridgedClass for SystemMouseCursors
BridgedClass getSystemMouseCursorsBridgingDefinition() {
  return BridgedClass(
    nativeType: SystemMouseCursors,
    name: 'SystemMouseCursors',
    staticGetters: {
      'none': (visitor) => SystemMouseCursors.none,
      'basic': (visitor) => SystemMouseCursors.basic,
      'click': (visitor) => SystemMouseCursors.click,
      'forbidden': (visitor) => SystemMouseCursors.forbidden,
      'wait': (visitor) => SystemMouseCursors.wait,
      'progress': (visitor) => SystemMouseCursors.progress,
      'contextMenu': (visitor) => SystemMouseCursors.contextMenu,
      'help': (visitor) => SystemMouseCursors.help,
      'text': (visitor) => SystemMouseCursors.text,
      'verticalText': (visitor) => SystemMouseCursors.verticalText,
      'cell': (visitor) => SystemMouseCursors.cell,
      'precise': (visitor) => SystemMouseCursors.precise,
      'move': (visitor) => SystemMouseCursors.move,
      'grab': (visitor) => SystemMouseCursors.grab,
      'grabbing': (visitor) => SystemMouseCursors.grabbing,
      'noDrop': (visitor) => SystemMouseCursors.noDrop,
      'alias': (visitor) => SystemMouseCursors.alias,
      'copy': (visitor) => SystemMouseCursors.copy,
      'disappearing': (visitor) => SystemMouseCursors.disappearing,
      'allScroll': (visitor) => SystemMouseCursors.allScroll,
      'resizeLeftRight': (visitor) => SystemMouseCursors.resizeLeftRight,
      'resizeUpDown': (visitor) => SystemMouseCursors.resizeUpDown,
      'resizeUpLeftDownRight': (visitor) =>
          SystemMouseCursors.resizeUpLeftDownRight,
      'resizeUpRightDownLeft': (visitor) =>
          SystemMouseCursors.resizeUpRightDownLeft,
      'resizeUp': (visitor) => SystemMouseCursors.resizeUp,
      'resizeDown': (visitor) => SystemMouseCursors.resizeDown,
      'resizeLeft': (visitor) => SystemMouseCursors.resizeLeft,
      'resizeRight': (visitor) => SystemMouseCursors.resizeRight,
      'resizeUpLeft': (visitor) => SystemMouseCursors.resizeUpLeft,
      'resizeUpRight': (visitor) => SystemMouseCursors.resizeUpRight,
      'resizeDownLeft': (visitor) => SystemMouseCursors.resizeDownLeft,
      'resizeDownRight': (visitor) => SystemMouseCursors.resizeDownRight,
      'resizeColumn': (visitor) => SystemMouseCursors.resizeColumn,
      'resizeRow': (visitor) => SystemMouseCursors.resizeRow,
      'zoomIn': (visitor) => SystemMouseCursors.zoomIn,
      'zoomOut': (visitor) => SystemMouseCursors.zoomOut,
    },
    getters: {
      'none': (visitor, target) => SystemMouseCursors.none,
      'basic': (visitor, target) => SystemMouseCursors.basic,
      'click': (visitor, target) => SystemMouseCursors.click,
      'forbidden': (visitor, target) => SystemMouseCursors.forbidden,
      'wait': (visitor, target) => SystemMouseCursors.wait,
      'progress': (visitor, target) => SystemMouseCursors.progress,
      'contextMenu': (visitor, target) => SystemMouseCursors.contextMenu,
      'help': (visitor, target) => SystemMouseCursors.help,
      'text': (visitor, target) => SystemMouseCursors.text,
      'verticalText': (visitor, target) => SystemMouseCursors.verticalText,
      'cell': (visitor, target) => SystemMouseCursors.cell,
      'precise': (visitor, target) => SystemMouseCursors.precise,
      'move': (visitor, target) => SystemMouseCursors.move,
      'grab': (visitor, target) => SystemMouseCursors.grab,
      'grabbing': (visitor, target) => SystemMouseCursors.grabbing,
      'noDrop': (visitor, target) => SystemMouseCursors.noDrop,
      'alias': (visitor, target) => SystemMouseCursors.alias,
      'copy': (visitor, target) => SystemMouseCursors.copy,
      'disappearing': (visitor, target) => SystemMouseCursors.disappearing,
      'allScroll': (visitor, target) => SystemMouseCursors.allScroll,
      'resizeLeftRight': (visitor, target) => SystemMouseCursors.resizeLeftRight,
      'resizeUpDown': (visitor, target) => SystemMouseCursors.resizeUpDown,
      'resizeUpLeftDownRight': (visitor, target) =>
          SystemMouseCursors.resizeUpLeftDownRight,
      'resizeUpRightDownLeft': (visitor, target) =>
          SystemMouseCursors.resizeUpRightDownLeft,
      'resizeUp': (visitor, target) => SystemMouseCursors.resizeUp,
      'resizeDown': (visitor, target) => SystemMouseCursors.resizeDown,
      'resizeLeft': (visitor, target) => SystemMouseCursors.resizeLeft,
      'resizeRight': (visitor, target) => SystemMouseCursors.resizeRight,
      'resizeUpLeft': (visitor, target) => SystemMouseCursors.resizeUpLeft,
      'resizeUpRight': (visitor, target) => SystemMouseCursors.resizeUpRight,
      'resizeDownLeft': (visitor, target) => SystemMouseCursors.resizeDownLeft,
      'resizeDownRight': (visitor, target) =>
          SystemMouseCursors.resizeDownRight,
      'resizeColumn': (visitor, target) => SystemMouseCursors.resizeColumn,
      'resizeRow': (visitor, target) => SystemMouseCursors.resizeRow,
      'zoomIn': (visitor, target) => SystemMouseCursors.zoomIn,
      'zoomOut': (visitor, target) => SystemMouseCursors.zoomOut,
    },
  );
}
