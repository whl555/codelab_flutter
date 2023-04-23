import 'package:equatable/equatable.dart';


/// 字词本界面框架相关的事件
abstract class VocabularyEvent extends Equatable {
  const VocabularyEvent();

  @override
  List<Object?> get props => [];
}

class CategoryClickEvent extends VocabularyEvent {
  final String category;

  const CategoryClickEvent({required this.category});

  @override
  List<Object?> get props => [category];
}

class GradeClickEvent extends VocabularyEvent {
  final int gradeId;

  const GradeClickEvent({required this.gradeId});

  @override
  List<Object?> get props => [gradeId];
}

class LoadVocabularyEvent extends VocabularyEvent {}