import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_quiz_app/app/common/common.dart';
import 'package:simple_quiz_app/app/user/user.dart';
import 'package:simple_quiz_app/configs/configs.dart';
import 'package:simple_quiz_app/utils/utils.dart';

class NavWidget extends StatefulWidget {
  const NavWidget({super.key});

  @override
  State<NavWidget> createState() => _NavWidgetState();
}

class _NavWidgetState extends State<NavWidget> {
  void _onLogout() {
    context.read<UserBloc>().add(const SignOut());
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: Colors.black.withOpacity(0.5),
              width: 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: const Image(
              image: AssetImage('assets/png/my-memoji.png'),
              width: 50,
              height: 50,
            ),
          ),
        ),
        const Spacer(),
        BlocConsumer<UserBloc, UserState>(
          listener: (context, state) {
            if (!state.isAuthenticated) {
              context.goNamed(RouteName.home);
            }
          },
          builder: (context, state) {
            return IconButton(
              onPressed: _onLogout,
              icon: context.isLoading(state.status)
                  ? const ButtonLoaderWidget()
                  : const Icon(Icons.logout),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
            );
          },
        ),
      ],
    );
  }
}
