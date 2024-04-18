import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:simple_quiz_app/app/common/common.dart';
import 'package:simple_quiz_app/app/user/user.dart';
import 'package:simple_quiz_app/configs/configs.dart';
import 'package:simple_quiz_app/utils/utils.dart';

class HomeFormWidget extends StatefulWidget {
  const HomeFormWidget({super.key});

  @override
  State<HomeFormWidget> createState() => _HomeFormWidgetState();
}

class _HomeFormWidgetState extends State<HomeFormWidget> {
  final _form = FormGroup({
    'name': FormControl<String>(validators: [Validators.required]),
  });

  void _onSetName() {
    final event = SetUserName(
      name: _form.control('name').value,
    );

    context.read<UserBloc>().add(event);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state.isAuthenticated) {
          context.goNamed(RouteName.dashboard);
        }
      },
      builder: (context, state) {
        return ReactiveForm(
          formGroup: _form,
          child: Column(
            children: [
              ReactiveTextField(
                decoration: const InputDecoration(hintText: 'Enter your name'),
                formControlName: 'name',
                validationMessages: {
                  'required': (value) => 'Please enter your name.'
                },
              ),
              const SizedBox(height: 20),
              ReactiveFormConsumer(
                builder: (
                  BuildContext context,
                  FormGroup form,
                  Widget? child,
                ) {
                  final isValid = form.valid;
                  return SizedBox(
                    width: double.infinity,
                    child: CustomButtonWidget(
                      onPressed: isValid ? _onSetName : null,
                      child: context.isLoading(state.status)
                          ? const ButtonLoaderWidget()
                          : const Text('Start Quiz'),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
