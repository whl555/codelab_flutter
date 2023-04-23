import 'dart:collection';
import 'package:codelab_vocabulary/model/vocabulary_mock_data.dart';
import 'package:codelab_vocabulary/model/vocabulary_model.dart';
import 'package:equatable/equatable.dart';
import 'package:collection/collection.dart';

abstract class VocabularyState extends Equatable {
  const VocabularyState();

  @override
  List<Object?> get props => [];
}

class VocabularyInitial extends VocabularyState {}

class VocabularyLoadSuccess extends VocabularyState {
  /// 当前字词类别
  final String? currentCategory;

  /// 当前年级
  final int? currentGradeId;

  /// 当前页面状态
  final VocabularyModel model;

  /// 当前已选中的grade tab, 分别对应"字"、“词”
  final Map<String?, Set<int>> selectedGrades;

  const VocabularyLoadSuccess({
    this.currentCategory,
    this.currentGradeId,
    required this.model,
    this.selectedGrades = const {}
  });

  @override
  List<Object?> get props => [currentCategory, currentGradeId, model, selectedGrades];

  VocabularyLoadSuccess copyWith({
    VocabularyModel? vocabulary,
    String? category,
    int? gradeId,
    Map<String?, Set<int>>? selectedGrades,
  }) {
    return VocabularyLoadSuccess(
      model: vocabulary ?? model,
      currentCategory: category ?? currentCategory,
      currentGradeId: gradeId ?? currentGradeId,
      selectedGrades: selectedGrades ?? this.selectedGrades,
    );
  }

  /// 获取当前字词本类型
  VocabularyCategoryModel? get currentCategoryModel {
    return model.categories
        ?.where((element) => element.type == currentCategory)
        .firstOrNull;
  }

  /// 获取当前类型的年级
  List<VocabularyGradeModel> get currentGrades {
    return currentCategoryModel?.grades ?? [];
  }

  /// 增加一个年级到选中列表中，只处理当前类型下的年级
  VocabularyLoadSuccess addSelectedGrade(int gradeId) {
    // 所有分类的年级选中情况
    final newSelectedGrades = HashMap<String?, Set<int>>()
      ..addAll(selectedGrades);

    // 每个分类对应的年级的选中情况列表
    final selectedGradesInCategory =
    HashSet<int>.from(newSelectedGrades[currentCategory] ?? {});

    selectedGradesInCategory.add(gradeId);
    newSelectedGrades[currentCategory] = selectedGradesInCategory;

    return copyWith(selectedGrades: newSelectedGrades);
  }

  VocabularyCategoryModel? getCategoryByType(String? type) {
    return model.categories
        ?.where((element) => element.type == type)
        .firstOrNull;
  }
}

class VocabularyLoadFailed extends VocabularyState {
  /// 错误信息
  final String message;

  const VocabularyLoadFailed({required this.message});

  @override
  List<Object?> get props => [message];
}
