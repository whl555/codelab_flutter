import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vocabulary_json.g.dart';

/// 字词本界面数据的框架
@JsonSerializable()
class VocabularyStructure {
  final VocabularyHeader? header;
  final int goldWord;
  final int size;

  VocabularyStructure({
    this.header,
    this.goldWord = 0,
    this.size = 0,
  });

  factory VocabularyStructure.fromJson(Map<String, dynamic> json) =>
      _$VocabularyStructureFromJson(json);

  Map<String, dynamic> toJson() => _$VocabularyStructureToJson(this);
}

@JsonSerializable()
class VocabularyHeader {
  @JsonKey(name: 'WORD')
  List<VocabularyGrade>? word;

  @JsonKey(name: 'CHARACTER')
  List<VocabularyGrade>? character;

  VocabularyHeader({
    this.word,
    this.character,
  });

  factory VocabularyHeader.fromJson(Map<String, dynamic> json) =>
      _$VocabularyHeaderFromJson(json);

  Map<String, dynamic> toJson() => _$VocabularyHeaderToJson(this);
}

@JsonSerializable()
class VocabularyGrade {
  int grade;
  String gradeName;
  bool hasNew;

  VocabularyGrade({
    required this.grade,
    required this.gradeName,
    required this.hasNew,
  });

  factory VocabularyGrade.fromJson(Map<String, dynamic> json) =>
      _$VocabularyGradeFromJson(json);

  Map<String, dynamic> toJson() => _$VocabularyGradeToJson(this);
}

@JsonSerializable()
class VocabularyItem {
  int id;
  String text;

  /// 2代表已读
  int? status;

  /// 分数
  double? currentScore;

  /// "gold/normal/lock" 颜色分别对应金卡 普通卡 灰卡
  String? color;

  /// 动画状态，1已播放，0未播放动画
  int? animationStatus;

  VocabularyItem({
    required this.id,
    required this.text,
    this.status,
    this.currentScore,
    this.color,
    this.animationStatus,
  });

  factory VocabularyItem.fromJson(Map<String, dynamic> json) =>
      _$VocabularyItemFromJson(json);

  Map<String, dynamic> toJson() => _$VocabularyItemToJson(this);
}

@JsonSerializable()
class VocabularyUpdate extends Equatable {
  /// 普通升级数
  final int? commonUpdateCount;
  /// 满成长值升级数(金卡)
  final int? fullUpdateCount;

  VocabularyUpdate({
    this.commonUpdateCount,
    this.fullUpdateCount,
  });

  factory VocabularyUpdate.fromJson(Map<String, dynamic> json) =>
      _$VocabularyUpdateFromJson(json);

  Map<String, dynamic> toJson() => _$VocabularyUpdateToJson(this);

  @override
  List<Object?> get props => [commonUpdateCount, fullUpdateCount];

  int get normalCardUpdateCount => commonUpdateCount ?? 0;

  int get goldenCardUpdateCount => fullUpdateCount ?? 0;
}
