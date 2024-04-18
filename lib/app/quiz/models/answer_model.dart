import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer_model.freezed.dart';
part 'answer_model.g.dart';

@Freezed()
class AnswerModel extends Equatable with _$AnswerModel {
  const AnswerModel._();

  const factory AnswerModel({
    @Default('') String selection,
    @Default(false) bool isCorrect,
  }) = _AnswerModel;

  @override
  List<Object?> get props => [
        selection,
        isCorrect,
      ];

  factory AnswerModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerModelFromJson(json);
}
