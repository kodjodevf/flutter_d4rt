import 'package:d4rt/d4rt.dart';
import 'package:flutter_d4rt/src/widgets/async.dart' as async;
import 'package:flutter_d4rt/src/widgets/basic.dart';
import 'package:flutter_d4rt/src/widgets/container.dart';
import 'package:flutter_d4rt/src/widgets/form.dart';
import 'package:flutter_d4rt/src/widgets/framework.dart';
import 'package:flutter_d4rt/src/widgets/text.dart';
import 'package:flutter_d4rt/src/widgets/layout.dart';
import 'package:flutter_d4rt/src/widgets/animation.dart';
import 'package:flutter_d4rt/src/widgets/scrolling.dart' as scrolling;
import 'package:flutter_d4rt/src/widgets/interactive.dart' as interactive;
import 'package:flutter_d4rt/src/widgets/effects.dart' as effects;
import 'package:flutter_d4rt/src/widgets/transition.dart';
import 'package:flutter_d4rt/src/widgets/utility.dart' as utility;
import 'package:flutter_d4rt/src/widgets/media.dart' as media;
import 'package:flutter_d4rt/src/widgets/navigator.dart' as navigation;
import 'package:flutter_d4rt/src/widgets/input.dart' as input;
import 'package:flutter_d4rt/src/widgets/gesture_detector.dart' as gesture;
import 'package:flutter_d4rt/src/widgets/picker.dart' as picker;
import 'package:flutter_d4rt/src/widgets/notification.dart' as notification;
import 'package:flutter_d4rt/src/widgets/feedback.dart' as feedback;
import 'package:flutter_d4rt/src/widgets/advanced.dart' as advanced;
import 'package:flutter_d4rt/src/widgets/media_query.dart' as media_query;
import 'package:flutter_d4rt/src/widgets/scaffold.dart' as scaffold;
import 'package:flutter_d4rt/src/widgets/hero.dart';
import 'package:flutter_d4rt/src/widgets/drag_and_drop.dart';
import 'package:flutter_d4rt/src/widgets/fade_in_image.dart';
import 'package:flutter_d4rt/src/widgets/safe_area.dart';
import 'package:flutter_d4rt/src/widgets/tooltip.dart';
import 'package:flutter_d4rt/src/widgets/ink_well.dart';
import 'package:flutter_d4rt/src/widgets/selectable_text.dart';

void registerWidgetsBridges(D4rt interpreter) {
  interpreter.registerBridgedClass(
    media_query.getMediaQueryBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    media_query.getMediaQueryDataBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedEnum(
    media_query.getNavigationModeBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedEnum(
    media_query.getOrientationBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getColumnBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getRowBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getContainerBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getDecoratedBoxBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getPaddingBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getCenterBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );

  // Register alignment classes
  interpreter.registerBridgedClass(
    getAlignmentBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getAlignmentDirectionalBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getFractionalOffsetBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );

  // Register all basic widget bridges
  final basicBridges = getBasicBridgingDefinitions();
  for (final bridge in basicBridges.values) {
    interpreter.registerBridgedClass(bridge, 'package:flutter/widgets_.dart');
  }

  interpreter.registerBridgedClass(
    getStatelessWidgetBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );

  interpreter.registerBridgedClass(
    getStatefulWidgetBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );

  interpreter.registerBridgedClass(
    getStateBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );

  interpreter.registerBridgedClass(
    getWidgetBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );

  // Register async widgets
  interpreter.registerBridgedClass(
    async.getFutureBuilderBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    async.getStreamBuilderBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    async.getAsyncSnapshotBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedEnum(
    async.getConnectionStateBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );

  // Register layout widgets
  interpreter.registerBridgedClass(
    getStackBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getGlobalKeyBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getFormStateBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getPositionedBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getFlexibleBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getExpandedBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getTextBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );

  // Register layout widgets
  interpreter.registerBridgedClass(
    getGridViewBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getListViewBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );

  // Register animation widgets
  interpreter.registerBridgedClass(
    getAnimatedContainerBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getAnimatedOpacityBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getAnimatedPaddingBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getAnimatedAlignBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getAnimatedPositionedBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getAnimatedSizeBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getAnimatedRotationBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getAnimatedScaleBridgingDefinition(),
    'packageflutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getAnimatedSlideBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getAnimatedDefaultTextStyleBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getAlwaysStoppedAnimationBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );

  // Register ticker provider and animation controller bridges
  interpreter.registerBridgedClass(
    getTickerProviderStateMixinBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getSingleTickerProviderStateMixinBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getTickerBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getTweenBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getCurvedAnimationBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getAnimationBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getAnimationStatusBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );

  // Register transition widgets
  interpreter.registerBridgedClass(
    getAnimatedBuilderBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getFadeTransitionBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getScaleTransitionBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getRotationTransitionBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );

  interpreter.registerBridgedClass(
    getCubicBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getIntervalBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getThresholdBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getSawToothBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );

  // Register matrix transformation class
  interpreter.registerBridgedClass(
    getMatrix4BridgingDefinition(),
    'package:flutter/widgets_.dart',
  );

  // Register scrolling widgets
  interpreter.registerBridgedClass(
    scrolling.getSingleChildScrollViewBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    scrolling.getListViewBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    scrolling.getGridViewBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    scrolling.getPageViewBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );

  // Register interactive widgets
  interpreter.registerBridgedClass(
    interactive.getGestureDetectorBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    interactive.getInkWellBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    interactive.getDismissibleBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );

  // Register effects widgets
  interpreter.registerBridgedClass(
    effects.getTransformBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    effects.getOpacityBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    effects.getClipRRectBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    effects.getClipRectBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    effects.getClipOvalBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    effects.getClipPathBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );

  // Register utility widgets
  interpreter.registerBridgedClass(
    utility.getSafeAreaBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    utility.getAspectRatioBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    utility.getFittedBoxBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    utility.getSizedBoxBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    utility.getConstrainedBoxBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    utility.getLimitedBoxBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    utility.getOverflowBoxBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    utility.getIntrinsicHeightBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    utility.getIntrinsicWidthBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    utility.getBaselineBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );

  // Register media widgets
  interpreter.registerBridgedClass(
    media.getImageBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    media.getIconBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    media.getPlaceholderBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );

  // Register navigation widgets
  interpreter.registerBridgedClass(
    navigation.getNavigatorBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    navigation.getRouteSettingsBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    navigation.getHeroBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    navigation.getWillPopScopeBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    navigation.getPopScopeBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    navigation.getMaterialPageRouteBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    navigation.getNavigatorStateBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    navigation.getPageBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );

  // Register input and focus widgets
  interpreter.registerBridgedClass(
    input.getFocusBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    input.getFocusScopeBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    input.getListenerBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    input.getMouseRegionBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    input.getAbsorbPointerBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    input.getIgnorePointerBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );

  // Register gesture widgets
  interpreter.registerBridgedClass(
    gesture.getGestureDetectorBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    gesture.getInkWellBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    gesture.getInkResponseBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    gesture.getDraggableBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    gesture.getDragTargetBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    gesture.getLongPressDraggableBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );

  // Register picker widgets
  interpreter.registerBridgedClass(
    picker.getDatePickerBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    picker.getTimePickerBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );

  interpreter.registerBridgedClass(
    picker.getCupertinoDatePickerBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    picker.getCupertinoPickerBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );

  // Register notification widgets
  interpreter.registerBridgedClass(
    notification.getShowDialogBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    notification.getShowModalBottomSheetBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    notification.getShowBottomSheetBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    notification.getAlertDialogBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    notification.getSimpleDialogBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    notification.getBottomSheetBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    notification.getTooltipBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );

  // Register feedback widgets
  interpreter.registerBridgedClass(
    feedback.getRefreshIndicatorBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    feedback.getLinearProgressIndicatorBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    feedback.getBannerBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    feedback.getActionChipBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    feedback.getFilterChipBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    feedback.getChoiceChipBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );

  // Register advanced widgets
  interpreter.registerBridgedClass(
    advanced.getStepperBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    advanced.getStepBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    advanced.getDataTableBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    advanced.getDataColumnBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    advanced.getDataRowBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    advanced.getDataCellBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    advanced.getReorderableListViewBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );

  // Register ScaffoldMessenger related classes
  interpreter.registerBridgedClass(
    scaffold.getScaffoldMessengerBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    scaffold.getScaffoldMessengerStateBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    scaffold.getScaffoldFeatureControllerBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedEnum(
    scaffold.getSnackBarClosedReasonBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedEnum(
    scaffold.getMaterialBannerClosedReasonBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    scaffold.getMaterialBannerBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedEnum(
    scaffold.getOverflowBarAlignmentBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );

  interpreter.registerBridgedClass(
    getFadeTransitionBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getAnimatedBuilderBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getScaleTransitionBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getRotationTransitionBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );

  // Register new widget bridges
  interpreter.registerBridgedClass(
    getHeroBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getDraggableBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getDragTargetBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getFadeInImageBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getSafeAreaBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getSliverSafeAreaBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getTooltipWidgetBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getInkWellBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
  interpreter.registerBridgedClass(
    getSelectableTextBridgingDefinition(),
    'package:flutter/widgets_.dart',
  );
}
