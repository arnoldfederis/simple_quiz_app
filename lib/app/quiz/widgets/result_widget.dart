import 'package:flutter/material.dart';
import 'package:simple_quiz_app/app/common/common.dart';
import 'package:simple_quiz_app/utils/utils.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.check_circle,
            size: 100,
            color: Colors.green,
          ),
          const SizedBox(height: 20),
          Text(
            'Congratulations!',
            style: context.textTheme.headlineMedium,
          ),
          const SizedBox(height: 20),
          Text(
            'You have completed the quiz!',
            style: context.textTheme.headlineSmall?.copyWith(
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: CustomButtonWidget(
              onPressed: () => Navigator.pop(context),
              child: const Text('Back to Home'),
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
