import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_quiz_app/app/quiz/quiz.dart';

part 'quiz_category_item_model.freezed.dart';

part 'quiz_category_item_model.g.dart';

@Freezed()
class QuizCategoryItemModel extends Equatable with _$QuizCategoryItemModel {
  const QuizCategoryItemModel._();

  const factory QuizCategoryItemModel({
    @Default('') String name,
    @Default('') String image,
    @Default(0) int quizCount,
    @Default(DigitalStampModel()) DigitalStampModel digitalStamp,
    @Default([]) List<QuizModel> quizzes,
  }) = _QuizCategoryItemModel;

  @override
  List<Object?> get props => [
        name,
        image,
        quizCount,
        digitalStamp,
        quizzes,
      ];

  factory QuizCategoryItemModel.fromJson(Map<String, dynamic> json) =>
      _$QuizCategoryItemModelFromJson(json);
}
