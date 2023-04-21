import 'package:codelab_vocabulary/screen/default_screen_display_helper.dart';
import 'package:codelab_vocabulary/screen/screen_display_helper.dart';
import 'package:flutter/material.dart';

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

class _VocabularyPageState extends State<VocabularyPage> {

  late ScreenDisplayHelper _playHelper;

  @override
  void initState() {
    _playHelper = DefaultPandaDisplayHelper();
    _playHelper.setScreenLandscape(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Image.asset(
              "assets/images/bg_vocabulary_book_2.png",
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Image.asset(
              "assets/images/bg_vocabulary_book_1.png",
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}

