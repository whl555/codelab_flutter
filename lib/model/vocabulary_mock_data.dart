import 'package:codelab_vocabulary/model/vocabulary_model.dart';

class VocabularyMockData {
  static List<VocabularyItemModel> mockCharItems({int count = 12}) {
    return [
      VocabularyItemModel(
        id: 1,
        text: "你",
        progress: 10,
        style: VocabularyItemStyle.Normal,
      ),
      VocabularyItemModel(
        id: 2,
        text: "金",
        progress: 100,
        style: VocabularyItemStyle.Golden,
      ),
      VocabularyItemModel(
        id: 3,
        text: "好",
        progress: 20,
        style: VocabularyItemStyle.Normal,
      ),
      VocabularyItemModel(
        id: 4,
        text: "雨",
        progress: 30,
        shiningAnimation: true,
        style: VocabularyItemStyle.Normal,
      ),
      VocabularyItemModel(
          id: 5, text: "阳", progress: 40, style: VocabularyItemStyle.Normal),
      VocabularyItemModel(
          id: 6, text: "花", progress: 0, style: VocabularyItemStyle.Grey),
      VocabularyItemModel(
          id: 7, text: "你", progress: 60, style: VocabularyItemStyle.Normal),
      VocabularyItemModel(
          id: 8, text: "书", progress: 70, style: VocabularyItemStyle.Normal),
      VocabularyItemModel(
          id: 9, text: "哈", progress: 80, style: VocabularyItemStyle.Normal),
      VocabularyItemModel(
          id: 10, text: "太", progress: 90, style: VocabularyItemStyle.Normal),
      VocabularyItemModel(
          id: 11, text: "你", progress: 10, style: VocabularyItemStyle.Normal),
      VocabularyItemModel(
        id: 12,
        text: "金",
        progress: 100,
        shiningAnimation: true,
        style: VocabularyItemStyle.Golden,
      ),
      VocabularyItemModel(id: 1, text: "好", progress: 20),
      VocabularyItemModel(
        id: 13,
        text: "雨",
        progress: 30,
        shiningAnimation: true,
      ),
      VocabularyItemModel(id: 14, text: "阳", progress: 40),
      VocabularyItemModel(id: 15, text: "花", progress: 50),
      VocabularyItemModel(id: 16, text: "你", progress: 60),
      VocabularyItemModel(id: 17, text: "书", progress: 70),
      VocabularyItemModel(id: 18, text: "哈", progress: 80),
      VocabularyItemModel(id: 19, text: "太", progress: 90),
    ].take(count).toList();
  }

  static List<VocabularyItemModel> mockWordItems({int count = 12}) {
    return [
      VocabularyItemModel(
        id: -1,
        text: "书籍",
        progress: 10,
        isWord: true,
        shiningAnimation: true,
        style: VocabularyItemStyle.Normal,
      ),
      VocabularyItemModel(
        id: -2,
        text: "笔记本",
        progress: 100,
        isWord: true,
        shiningAnimation: true,
        style: VocabularyItemStyle.Normal,
      ),
      VocabularyItemModel(id: -3, text: "窃窃私语", progress: 20, isWord: true),
      VocabularyItemModel(id: -4, text: "故事", progress: 30, isWord: true),
      VocabularyItemModel(id: -5, text: "圆珠笔", progress: 40, isWord: true),
      VocabularyItemModel(id: -6, text: "笔记", progress: 0, isWord: true),
      VocabularyItemModel(id: -7, text: "怡然自得", progress: 60, isWord: true),
      VocabularyItemModel(id: -8, text: "书籍", progress: 10, isWord: true),
      VocabularyItemModel(
        id: -9,
        text: "笔记本",
        progress: 100,
        isWord: true,
        style: VocabularyItemStyle.Golden,
      ),
      VocabularyItemModel(id: -10, text: "窃窃私语", progress: 20, isWord: true),
      VocabularyItemModel(id: -11, text: "故事", progress: 30, isWord: true),
      VocabularyItemModel(id: -12, text: "圆珠笔", progress: 40, isWord: true),
      VocabularyItemModel(id: -13, text: "笔记", progress: 0, isWord: true),
      VocabularyItemModel(id: -14, text: "怡然自得", progress: 60, isWord: true),
    ].take(count).toList();
  }

  static List<VocabularyGradeModel> mockGrades() {
    return [
      VocabularyGradeModel(
        id: 1,
        name: "一年级",
        showBadge: true,
      ),
      VocabularyGradeModel(
        id: 2,
        name: "二年级",
        showBadge: true,
      ),
      VocabularyGradeModel(
        id: 3,
        name: "三年级",
        showBadge: true,
      ),
      VocabularyGradeModel(
        id: 4,
        name: "四年级",
        showBadge: true,
      ),
      VocabularyGradeModel(
        id: 5,
        name: "五年级",
        showBadge: true,
      ),
      VocabularyGradeModel(
        id: 6,
        name: "七年级",
        showBadge: true,
      ),
    ];
  }

  static VocabularyModel get mockVocabulary {
    return VocabularyModel(
      categories: [
        VocabularyCategoryModel(
          grades: mockGrades(),
          type: "CHARACTER",
        ),
        VocabularyCategoryModel(
          grades: mockGrades(),
          type: "WORD",
        ),
      ],
      goldCardCount: 20,
      cardTotalCount: 100,
    );
  }
}
