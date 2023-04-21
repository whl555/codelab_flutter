import 'package:codelab_vocabulary/screen/screen_display_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultPandaDisplayHelper extends ScreenDisplayHelper {

  @override
  initDisplaySettings(BuildContext context) {
    initScreenRotation(context);
  }

  @override
  initScreenRotation(BuildContext context) {
    // 自由旋转
    // 1.判断是否开启自动旋转模式
    // ipad横屏、其他竖屏
    // 1.判断当前设备类型
  }

  @override
  setScreenLandscape(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft
    ]);
  }

  @override
  setScreenPortrait(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
  }

  @override
  setScreenFreeRotation(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  hideSystemStatusBar(String widgetName) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  showSystemStatusBar(String widgetName) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }
}