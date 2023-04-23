import 'package:codelab_vocabulary/screen/default_screen_display_helper.dart';
import 'package:codelab_vocabulary/screen/screen_display_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'bloc/vocabulary_bloc.dart';
import 'bloc/vocabulary_event.dart';
import 'component/vocabulary_widget.dart';

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
    with WidgetsBindingObserver, TickerProviderStateMixin {
  late VocabularyBloc _vocabularyBloc;

  late ScreenDisplayHelper _playHelper;
  late AnimationController _clickAnimationController;
  Offset _clickPosition = Offset.zero;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _playHelper = DefaultPandaDisplayHelper();
    _clickAnimationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 700),
    );
    _playHelper.setScreenLandscape(context);
    _playHelper.hideSystemStatusBar(widget.toString());

    _vocabularyBloc = VocabularyBloc();
    super.initState();
  }

  @override
  void dispose() {
    _clickAnimationController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(state == AppLifecycleState.resumed) {
      print("hide system status bar");
      _vocabularyBloc.add(LoadVocabularyEvent());
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<VocabularyBloc>(
          create: (context) => _vocabularyBloc..add(LoadVocabularyEvent()),
        ),
      ],
      child: Scaffold(
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
      ),
    );
  }
}
