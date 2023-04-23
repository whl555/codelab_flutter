import 'package:codelab_vocabulary/bloc/vocabulary_event.dart';
import 'package:codelab_vocabulary/bloc/vocabulary_state.dart';
import 'package:codelab_vocabulary/model/vocabulary_mock_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VocabularyBloc extends Bloc<VocabularyEvent, VocabularyState> {
  VocabularyBloc() : super(VocabularyInitial()) {
    on<GradeClickEvent>((event, emit) async {
      if (state is VocabularyLoadSuccess) {
        // 把点击过的grade添加到选中记录中
        var successState = state as VocabularyLoadSuccess;
        successState = successState.addSelectedGrade(event.gradeId);

        // 把当前的年级也加入选中记录中，为了处理当前年级时默认年级，并且有红点，在离开时，需要把红点去掉
        if (successState.currentGradeId != null) {
          successState = successState.addSelectedGrade(successState.currentGradeId!);
        }

        // 如果是当前已经选中的年级，那么不需要重新加载数据
        if (successState.currentGradeId != event.gradeId) {
          successState = successState.copyWith(gradeId: event.gradeId);
        }

        emit(successState);
      }
    });

    // 加载字词本数据
    on<LoadVocabularyEvent>((event, emit) async {
      emit(VocabularyLoadSuccess(
          model: VocabularyMockData.mockVocabulary,
          currentCategory: 'CHARACTER',
          currentGradeId: 0));
    });
  }
}
