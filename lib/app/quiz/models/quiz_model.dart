import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_quiz_app/app/quiz/quiz.dart';

part 'quiz_model.freezed.dart';
part 'quiz_model.g.dart';

@Freezed()
class QuizModel extends Equatable with _$QuizModel {
  const QuizModel._();

  const factory QuizModel({
    @Default('') String question,
    @Default([]) List<AnswerModel> answers,
  }) = _QuizModel;

  @override
  List<Object?> get props => [
        question,
        answers,
      ];

  factory QuizModel.fromJson(Map<String, dynamic> json) =>
      _$QuizModelFromJson(json);
}
