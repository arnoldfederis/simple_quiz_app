import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_quiz_app/configs/configs.dart';

class HomeIconWidget extends StatelessWidget {
  const HomeIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          SvgIcon.exam,
          height: 100,
        ),
        const SizedBox(height: 10),
        SvgPicture.asset(
          SvgIcon.chat,
          height: 100,
        ),
        const SizedBox(height: 20),
        const Text(
          'Simple Quiz App',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
