// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocabulary_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VocabularyStructure _$VocabularyStructureFromJson(Map<String, dynamic> json) =>
    VocabularyStructure(
      header: json['header'] == null
          ? null
          : VocabularyHeader.fromJson(json['header'] as Map<String, dynamic>),
      goldWord: json['goldWord'] as int? ?? 0,
      size: json['size'] as int? ?? 0,
    );

Map<String, dynamic> _$VocabularyStructureToJson(
        VocabularyStructure instance) =>
    <String, dynamic>{
      'header': instance.header,
      'goldWord': instance.goldWord,
      'size': instance.size,
    };

VocabularyHeader _$VocabularyHeaderFromJson(Map<String, dynamic> json) =>
    VocabularyHeader(
      word: (json['WORD'] as List<dynamic>?)
          ?.map((e) => VocabularyGrade.fromJson(e as Map<String, dynamic>))
          .toList(),
      character: (json['CHARACTER'] as List<dynamic>?)
          ?.map((e) => VocabularyGrade.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VocabularyHeaderToJson(VocabularyHeader instance) =>
    <String, dynamic>{
      'WORD': instance.word,
      'CHARACTER': instance.character,
    };

VocabularyGrade _$VocabularyGradeFromJson(Map<String, dynamic> json) =>
    VocabularyGrade(
      grade: json['grade'] as int,
      gradeName: json['gradeName'] as String,
      hasNew: json['hasNew'] as bool,
    );

Map<String, dynamic> _$VocabularyGradeToJson(VocabularyGrade instance) =>
    <String, dynamic>{
      'grade': instance.grade,
      'gradeName': instance.gradeName,
      'hasNew': instance.hasNew,
    };

VocabularyItem _$VocabularyItemFromJson(Map<String, dynamic> json) =>
    VocabularyItem(
      id: json['id'] as int,
      text: json['text'] as String,
      status: json['status'] as int?,
      currentScore: (json['currentScore'] as num?)?.toDouble(),
      color: json['color'] as String?,
      animationStatus: json['animationStatus'] as int?,
    );

Map<String, dynamic> _$VocabularyItemToJson(VocabularyItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'status': instance.status,
      'currentScore': instance.currentScore,
      'color': instance.color,
      'animationStatus': instance.animationStatus,
    };

VocabularyUpdate _$VocabularyUpdateFromJson(Map<String, dynamic> json) =>
    VocabularyUpdate(
      commonUpdateCount: json['commonUpdateCount'] as int?,
      fullUpdateCount: json['fullUpdateCount'] as int?,
    );

Map<String, dynamic> _$VocabularyUpdateToJson(VocabularyUpdate instance) =>
    <String, dynamic>{
      'commonUpdateCount': instance.commonUpdateCount,
      'fullUpdateCount': instance.fullUpdateCount,
    };
