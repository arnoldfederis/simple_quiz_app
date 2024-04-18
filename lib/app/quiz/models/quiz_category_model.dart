import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_quiz_app/app/quiz/quiz.dart';

part 'quiz_category_model.freezed.dart';
part 'quiz_category_model.g.dart';

@Freezed()
class QuizCategoryModel extends Equatable with _$QuizCategoryModel {
  const QuizCategoryModel._();

  const factory QuizCategoryModel({
    @Default([]) List<QuizCategoryItemModel> categories,
  }) = _QuizCategoryModel;

  @override
  List<Object?> get props => [
        categories,
      ];

  factory QuizCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$QuizCategoryModelFromJson(json);
}
