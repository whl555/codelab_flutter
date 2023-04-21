import 'package:flutter/material.dart';

class VocabularyWidget extends StatelessWidget {
  const VocabularyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 12),
          alignment: Alignment.center,
          height: 357,
          width: 664,
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              Image.asset(
                "assets/images/bg_vocabulary_book_2.png",
                fit: BoxFit.contain,
              ),
              Image.asset(
                "assets/images/bg_vocabulary_book_1.png",
                fit: BoxFit.contain,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                alignment: Alignment.topCenter,
                child: FractionallySizedBox(
                  widthFactor: 550 / 664,
                  heightFactor: 283 / 357,
                  child: Column(
                    children: [
                      VocabularyGradeBarWidget(),
                      Expanded(child: CharGridWidget())
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class VocabularyGradeBarWidget extends StatefulWidget {
  VocabularyGradeBarWidget({Key? key}) : super(key: key);

  @override
  State<VocabularyGradeBarWidget> createState() =>
      _VocabularyGradeBarWidgetState();
}

class _VocabularyGradeBarWidgetState extends State<VocabularyGradeBarWidget> {
  int currentId = 0;
  List<String> titles = ["一年级", "二年级", "三年级", "四年级", "五年级", "六年级"];
  List<VocabularyGradeBarTab> tabs = [];

  @override
  void initState() {
    int count = 0;
    for (var element in titles) {
      final item = VocabularyGradeBarTab(count, element);
      tabs.add(item);
      count++;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: tabs.map((grade) {
          return grade.id == currentId
              ? VocabularyGradeActiveWidget(
                  title: grade.title,
                  onTap: () {
                    setState(() {
                      currentId = grade.id;
                    });
                  },
                )
              : VocabularyGradeWidget(
                  title: grade.title,
                  onTap: () {
                    setState(() {
                      currentId = grade.id;
                    });
                  });
        }).toList());
  }
}

class VocabularyGradeActiveWidget extends StatelessWidget {
  final String title;
  final Function()? onTap;

  const VocabularyGradeActiveWidget({Key? key, required this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        padding: const EdgeInsets.all(10.0),
        child: Text(title, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}

class VocabularyGradeWidget extends StatelessWidget {
  final String title;
  final Function()? onTap;

  const VocabularyGradeWidget({Key? key, required this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            )),
        child: Text(title, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}

class VocabularyGradeBarTab {
  int id;
  String title;

  VocabularyGradeBarTab(this.id, this.title);
}

class CharGridWidget extends StatefulWidget {
  CharGridWidget({Key? key}) : super(key: key);

  @override
  State<CharGridWidget> createState() => _CharGridWidgetState();
}

class _CharGridWidgetState extends State<CharGridWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
