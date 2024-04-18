import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_quiz_app/app/user/user.dart';
import 'package:simple_quiz_app/utils/utils.dart';

extension BuildContextExtension on BuildContext {
  // Styles
  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  TextTheme get textTheme => Theme.of(this).textTheme;

  // End of Styles

  // States
  UserState get userState => read<UserBloc>().state;

  // End of States

  // Utils
  bool isLoading(LoadingStatus status) => status == LoadingStatus.loading;
}
