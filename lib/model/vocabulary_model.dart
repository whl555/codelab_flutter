import 'package:codelab_vocabulary/json/vocabulary_json.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

/// 字词本里的内容
class VocabularyItemModel extends Equatable {
  final int id;

  final String text;

  /// 收集的进度
  final int progress;

  /// 是否是词
  final bool isWord;

  /// 是否需要展示闪光动画
  final bool shiningAnimation;

  /// 卡片样式
  final VocabularyItemStyle style;

  VocabularyItemModel({
    required this.id,
    required this.text,
    this.progress = 0,
    this.style = VocabularyItemStyle.Grey,
    this.isWord = false,
    this.shiningAnimation = false,
  });

  @override
  List<Object?> get props =>
      [id, text, progress, style, isWord, shiningAnimation];

  VocabularyItemModel copyWith({
    int? id,
    String? text,
    int? progress,
    bool? isWord,
    bool? shiningAnimation,
    VocabularyItemStyle? style,
  }) {
    return VocabularyItemModel(
      id: id ?? this.id,
      text: text ?? this.text,
      progress: progress ?? this.progress,
      isWord: isWord ?? this.isWord,
      shiningAnimation: shiningAnimation ?? this.shiningAnimation,
      style: style ?? this.style,
    );
  }

  factory VocabularyItemModel.fromEntity(VocabularyItem entity) {
    return VocabularyItemModel(
      id: entity.id,
      text: entity.text,
      progress: entity.currentScore?.toInt() ?? 0,
      style: _parseStyle(entity.color),
      shiningAnimation: entity.animationStatus == 0,
    );
  }

  /// 获取卡片的样式
  static VocabularyItemStyle _parseStyle(String? color) {
    switch (color) {
      case 'gold':
        return VocabularyItemStyle.Golden;
      case 'lock':
        return VocabularyItemStyle.Grey;
      default:
        return VocabularyItemStyle.Normal;
    }
  }
}

enum VocabularyItemStyle {
  /// 金卡
  Golden,

  /// 普通卡
  Normal,

  /// 未获得的卡片
  Grey
}

/// 字词本模型
class VocabularyModel extends Equatable {
  final List<VocabularyCategoryModel>? categories;
  final int goldCardCount;
  final int cardTotalCount;

  VocabularyModel({
    this.categories = null,
    this.goldCardCount = 0,
    this.cardTotalCount = 0,
  });

  @override
  List<Object?> get props => [categories, goldCardCount, cardTotalCount];

  VocabularyModel copyWith({
    List<VocabularyCategoryModel>? categories,
    int? goldCardCount,
    int? cardTotalCount,
  }) {
    return VocabularyModel(
      categories: categories ?? this.categories,
      goldCardCount: goldCardCount ?? this.goldCardCount,
      cardTotalCount: cardTotalCount ?? this.cardTotalCount,
    );
  }

  /// 获取第一个字词本类型
  VocabularyCategoryModel? get firstCategory => categories?.firstOrNull;

  /// 获取对应的分类
  VocabularyCategoryModel? getCategory(String? type) {
    return categories?.where((element) => element.type == type).firstOrNull;
  }

  factory VocabularyModel.fromEntity(VocabularyStructure entity) {
    final List<VocabularyCategoryModel> categories = [];
    // 添加字和词的分类，由于服务器数据返回的问题，这里的处理过程比较麻烦
    if (entity.header?.character != null) {
      categories.add(VocabularyCategoryModel(
        type: 'CHARACTER',
        grades: entity.header?.character
            ?.map((e) => VocabularyGradeModel.fromEntity(e))
            .toList() ??
            [],
      ));
    }

    if (entity.header?.word != null) {
      categories.add(VocabularyCategoryModel(
        type: 'WORD',
        grades: entity.header?.word
            ?.map((e) => VocabularyGradeModel.fromEntity(e))
            .toList() ??
            [],
      ));
    }

    return VocabularyModel(
      categories: categories,
      goldCardCount: entity.goldWord,
      cardTotalCount: entity.size,
    );
  }
}

/// 字词本中的类型，目前有字和词
class VocabularyCategoryModel extends Equatable {
  final String type;
  final List<VocabularyGradeModel> grades;

  VocabularyCategoryModel({
    required this.type,
    required this.grades,
  });

  VocabularyCategoryModel copyWith({
    String? type,
    List<VocabularyGradeModel>? grades,
    bool? showBadge,
  }) {
    return VocabularyCategoryModel(
      type: type ?? this.type,
      grades: grades ?? this.grades,
    );
  }

  @override
  List<Object> get props => [type, grades];

  /// 是否是字类型
  bool get isCharacter => type == 'CHARACTER';

  /// 是否是词类型
  bool get isWord => type == 'WORD';

  /// 获取第一个年级
  VocabularyGradeModel? get firstGrade => grades.firstOrNull;

  /// 是否显示红点
  bool get showBadge => grades.any((element) => element.showBadge);

  /// 获取对应的年级
  VocabularyGradeModel? getGrade(int? gradeId) {
    return grades.where((element) => element.id == gradeId).firstOrNull;
  }
}

/// 年级
class VocabularyGradeModel extends Equatable {
  final int id;
  final String name;

  /// 是否展示红点
  final bool showBadge;

  VocabularyGradeModel({
    required this.id,
    required this.name,
    this.showBadge = false,
  });

  @override
  List<Object?> get props => [id, name, showBadge];

  VocabularyGradeModel copyWith({
    int? id,
    String? name,
    bool? showBadge,
  }) {
    return VocabularyGradeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      showBadge: showBadge ?? this.showBadge,
    );
  }

  factory VocabularyGradeModel.fromEntity(VocabularyGrade entity) {
    return VocabularyGradeModel(
      id: entity.grade,
      name: entity.gradeName,
      showBadge: entity.hasNew,
    );
  }
}
