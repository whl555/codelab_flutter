

import 'package:flutter/cupertino.dart';

abstract class ScreenDisplayHelper {
  // static void setScreenLandscape(BuildContext context) {
  //   // TODO: implement setScreenLandscape
  // }

  /// 设置屏幕为竖屏
  setScreenPortrait(BuildContext context);

  /// 设置屏幕为横屏
  setScreenLandscape(BuildContext context);

  /// 任意方向自由旋转
  setScreenFreeRotation(BuildContext context);

  /// 隐藏系统状态栏
  hideSystemStatusBar(String widgetName);

  /// 显示系统状态栏
  showSystemStatusBar(String widgetName);
}