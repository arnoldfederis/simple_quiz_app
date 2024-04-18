import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:simple_quiz_app/utils/utils.dart';

import 'event.dart';
import 'state.dart';

class UserBloc extends HydratedBloc<UserEvent, UserState> {
  UserBloc() : super(const UserState()) {
    on<SetUserName>(_setUserName);
    on<SignOut>(_signOut);
  }

  @override
  UserState? fromJson(Map<String, dynamic> json) {
    return UserState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(UserState state) {
    return state.toJson();
  }

  Future<void> _setUserName(
    SetUserName event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(status: LoadingStatus.loading));

    await Future.delayed(const Duration(seconds: 1), () {
      emit(state.copyWith(
        name: event.name,
        isAuthenticated: true,
      ));
    });

    await Future.delayed(
      const Duration(seconds: 1),
      () => emit(state.copyWith(status: LoadingStatus.success)),
    );
  }

  Future<void> _signOut(
    SignOut event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(status: LoadingStatus.loading));

    await Future.delayed(
      const Duration(seconds: 1),
      () => emit(state.copyWith(isAuthenticated: false)),
    );

    await Future.delayed(
      const Duration(seconds: 1),
      () => emit(state.copyWith(status: LoadingStatus.success)),
    );
  }
}
