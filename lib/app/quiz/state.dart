import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_quiz_app/app/quiz/quiz.dart';
import 'package:simple_quiz_app/utils/utils.dart';

part 'state.freezed.dart';

part 'state.g.dart';

@Freezed()
class QuizState extends Equatable with _$QuizState {
  const QuizState._();

  const factory QuizState({
    @Default([]) List<QuizCategoryItemModel> categories,
    @Default(false) bool showStamp,
    @Default(false) bool isCorrect,
    @Default(LoadingStatus.initial) LoadingStatus status,
  }) = _QuizState;

  @override
  List<Object?> get props => [
        categories,
        showStamp,
        isCorrect,
        status,
      ];

  factory QuizState.fromJson(Map<String, dynamic> json) =>
      _$QuizStateFromJson(json);
}
