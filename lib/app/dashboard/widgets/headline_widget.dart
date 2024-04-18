import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_quiz_app/app/user/user.dart';
import 'package:simple_quiz_app/utils/utils.dart';

class HeadlineWidget extends StatelessWidget {
  const HeadlineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocSelector<UserBloc, UserState, String>(
          selector: (state) => state.name,
          builder: (context, name) {
            return Text(
              'Hello ${name.capitalize()}!',
              style: context.textTheme.headlineLarge,
            );
          },
        ),
        Text(
          'Let\'s start the quiz!',
          style: context.textTheme.headlineSmall,
        ),
      ],
    );
  }
}
