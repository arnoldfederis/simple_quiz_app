import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class SetUserName extends UserEvent {
  const SetUserName({
    required this.name,
  });

  final String name;

  @override
  List<Object?> get props => [name];
}

class SignOut extends UserEvent {
  const SignOut();

  @override
  List<Object?> get props => [];
}
