import 'package:codelab_vocabulary/screen/screen_display_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultPandaDisplayHelper extends ScreenDisplayHelper {
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

  }

  @override
  showSystemStatusBar(String widgetName) {
  }
  
}