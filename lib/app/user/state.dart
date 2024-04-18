import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_quiz_app/utils/utils.dart';

part 'state.freezed.dart';
part 'state.g.dart';

@Freezed()
class UserState extends Equatable with _$UserState {
  const UserState._();

  const factory UserState({
    @Default('') String name,
    @Default(false) bool isAuthenticated,
    @Default(LoadingStatus.initial) LoadingStatus status,
  }) = _UserState;

  @override
  List<Object?> get props => [
        name,
        isAuthenticated,
        status,
      ];

  factory UserState.fromJson(Map<String, dynamic> json) =>
      _$UserStateFromJson(json);
}
