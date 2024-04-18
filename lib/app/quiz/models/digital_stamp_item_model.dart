import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'digital_stamp_item_model.freezed.dart';
part 'digital_stamp_item_model.g.dart';

@Freezed()
class DigitalStampItemModel extends Equatable with _$DigitalStampItemModel {
  const DigitalStampItemModel._();

  const factory DigitalStampItemModel({
    @Default(0) int stampIndex,
    @Default('') String completedAt,
    @Default(false) bool isSigned,
  }) = _DigitalStampItemModel;

  @override
  List<Object?> get props => [
        stampIndex,
        completedAt,
        isSigned,
      ];

  factory DigitalStampItemModel.fromJson(Map<String, dynamic> json) =>
      _$DigitalStampItemModelFromJson(json);
}
