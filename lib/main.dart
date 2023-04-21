import 'package:codelab_vocabulary/screen/default_screen_display_helper.dart';
import 'package:codelab_vocabulary/screen/screen_display_helper.dart';
import 'package:codelab_vocabulary/widget/vocabulary_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: VocabularyPage(),
    );
  }
}

class VocabularyPage extends StatefulWidget {
  const VocabularyPage({Key? key}) : super(key: key);

  @override
  State<VocabularyPage> createState() => _VocabularyPageState();
}

class _VocabularyPageState extends State<VocabularyPage>
    with WidgetsBindingObserver, TickerProviderStateMixin{
  late ScreenDisplayHelper _playHelper;
  late AnimationController _clickAnimationController;
  Offset _clickPosition = Offset.zero;

  @override
  void initState() {
    _playHelper = DefaultPandaDisplayHelper();
    _clickAnimationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 700),
    );
    _playHelper.setScreenLandscape(context);
    _playHelper.hideSystemStatusBar(widget.toString());
    super.initState();
  }

  @override
  void dispose() {
    _clickAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Listener(
        onPointerDown: (details) {
          setState(() {
            _clickPosition = details.localPosition;
          });
          _clickAnimationController.reset();
          _clickAnimationController.forward().whenComplete(() {
            _clickAnimationController.reset();
          });

        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Image.asset(
                "assets/images/bg_vocabulary.png",
                fit: BoxFit.fill,
              ),
            ),
            const Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: VocabularyWidget()
            ),
            Positioned(
                top: _clickPosition.dy - 20,
                left: _clickPosition.dx - 20,
                child: IgnorePointer(
                  child: Lottie.asset("assets/lottie/click.json",
                      width: 60, height: 60, repeat: false, controller: _clickAnimationController
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
