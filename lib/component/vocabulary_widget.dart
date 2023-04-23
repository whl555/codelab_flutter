import 'package:codelab_vocabulary/bloc/vocabulary_bloc.dart';
import 'package:codelab_vocabulary/bloc/vocabulary_event.dart';
import 'package:codelab_vocabulary/bloc/vocabulary_state.dart';
import 'package:codelab_vocabulary/model/vocabulary_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                alignment: Alignment.topCenter,
                child: FractionallySizedBox(
                  widthFactor: 550 / 664,
                  heightFactor: 283 / 357,
                  child: BlocBuilder<VocabularyBloc, VocabularyState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          VocabularyGradeBarWidget(),
                          Expanded(child: CharGridWidget())
                        ],
                      );
                    },
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
    return BlocBuilder<VocabularyBloc, VocabularyState>(
        builder: (context, state) {
      if (state is VocabularyLoadSuccess) {
        return Row(
            children: state.currentGrades.map((grade) {
          return grade.id == state.currentGradeId
              ? VocabularyGradeActiveWidget(
                  grade: grade,
                  selectedGrades: state.selectedGrades[state.currentCategory!],
                  onTap: () {
                    BlocProvider.of<VocabularyBloc>(context).add(
                      GradeClickEvent(gradeId: grade.id),
                    );
                  },
                )
              : VocabularyGradeWidget(
                  grade: grade,
                  selectedGrades: state.selectedGrades[state.currentCategory!],
                  onTap: () {
                    BlocProvider.of<VocabularyBloc>(context).add(
                      GradeClickEvent(gradeId: grade.id),
                    );
                  });
        }).toList());
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}

class VocabularyGradeActiveWidget extends StatelessWidget {
  final VocabularyGradeModel grade;
  final Set<int>? selectedGrades;
  final Function()? onTap;

  const VocabularyGradeActiveWidget(
      {Key? key, required this.grade, this.selectedGrades, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final showBadge =
        grade.showBadge && !(selectedGrades ?? {}).contains(grade.id);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32,
        decoration: BoxDecoration(
          color: const Color(0xFFFFD28F),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 2,
              right: 2,
              top: 2,
              bottom: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFD17148),
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
            Positioned(
              left: 2,
              right: 2,
              top: 2,
              bottom: 2,
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFD5774A),
                      Color(0xFFEB9D69),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 9)
                  .add(const EdgeInsets.only(bottom: 2)),
              child: Text(
                grade.name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            showBadge
                ? Positioned(right: 2, top: 3, child: VocabularyBadgeWidget())
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}

class VocabularyGradeWidget extends StatelessWidget {
  final VocabularyGradeModel grade;
  final Set<int>? selectedGrades;
  final Function()? onTap;

  const VocabularyGradeWidget(
      {Key? key, required this.grade, this.selectedGrades, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final showBadge =
        grade.showBadge && !(selectedGrades ?? {}).contains(grade.id);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32,
        decoration: BoxDecoration(
          color: const Color(0xFFFFD28F),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 2,
              right: 2,
              top: 2,
              bottom: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF7763DB),
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
            Positioned(
              left: 2,
              right: 2,
              top: 2,
              bottom: 2,
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF94A6FF),
                      Color(0xFF8080FF),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 9, right: 9, bottom: 2),
              child: Text(
                grade.name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            showBadge
                ? Positioned(right: 2, top: 3, child: VocabularyBadgeWidget())
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}

/// 红点控件
class VocabularyBadgeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/ic_badge.png",
      width: 8,
      height: 8,
      fit: BoxFit.contain,
    );
  }
}

class VocabularyGradeBarTab {
  int id;
  String title;

  VocabularyGradeBarTab(this.id, this.title);
}

class VocabularyGradeBarTab2 extends Equatable {
  final int id;
  final String title;
  final bool showBadge;

  VocabularyGradeBarTab2({
    required this.id,
    required this.title,
    this.showBadge = false,
  });

  VocabularyGradeBarTab2 copyWith({
    int? id,
    String? name,
    bool? showBadge,
  }) {
    return VocabularyGradeBarTab2(
      id: id ?? this.id,
      title: name ?? this.title,
      showBadge: showBadge ?? this.showBadge,
    );
  }

  factory VocabularyGradeBarTab2.fromEntity(VocabularyGradeBarTab2 entity) {
    return VocabularyGradeBarTab2(
      id: entity.id,
      title: entity.title,
      showBadge: entity.showBadge,
    );
  }

  @override
  List<Object?> get props => [id, title, showBadge];
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
