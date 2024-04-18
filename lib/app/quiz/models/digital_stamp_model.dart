import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_quiz_app/app/quiz/quiz.dart';

part 'digital_stamp_model.freezed.dart';

part 'digital_stamp_model.g.dart';

@Freezed()
class DigitalStampModel extends Equatable with _$DigitalStampModel {
  const DigitalStampModel._();

  const factory DigitalStampModel({
    @Default('') String name,
    @Default(0) int questionIndex,
    @Default([]) List<DigitalStampItemModel> items,
  }) = _DigitalStampModel;

  @override
  List<Object?> get props => [
        name,
        questionIndex,
        items,
      ];

  factory DigitalStampModel.fromJson(Map<String, dynamic> json) =>
      _$DigitalStampModelFromJson(json);
}
