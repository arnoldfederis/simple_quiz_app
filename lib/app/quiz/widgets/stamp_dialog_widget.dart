import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_quiz_app/app/common/common.dart';
import 'package:simple_quiz_app/app/quiz/quiz.dart';

class StampDialogWidget extends StatefulWidget {
  const StampDialogWidget({
    super.key,
    required this.category,
  });

  final String category;

  @override
  State<StampDialogWidget> createState() => _StampDialogWidgetState();
}

class _StampDialogWidgetState extends State<StampDialogWidget> {
  late QuizCategoryItemModel quiz;
  late DigitalStampModel digitalStamp;

  @override
  void initState() {
    quiz = context.read<QuizBloc>().state.categories.firstWhere(
          (category) => category.name == widget.category,
          orElse: () => const QuizCategoryItemModel(),
        );

    digitalStamp = quiz.digitalStamp;

    super.initState();
  }

  void _onClose() {
    Navigator.of(context).pop();
    context.read<QuizBloc>().add(CloseStamp(category: widget.category));
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      insetPadding: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<QuizBloc, QuizState>(
          builder: (context, state) {
            const correctMessage = 'You got a new stamp!';
            const incorrectMessage = 'Please proceed to the next question.';
            const completedMessage = 'You have completed the quiz!';
            final isLastQuestion =
                digitalStamp.questionIndex >= quiz.quizzes.length - 1;

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  digitalStamp.items[digitalStamp.questionIndex].isSigned
                      ? 'Correct! \n ${isLastQuestion ? '$correctMessage and $completedMessage' : correctMessage}'
                      : 'Incorrect! ${isLastQuestion ? completedMessage : incorrectMessage}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                StampWidget(stamps: digitalStamp.items),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: CustomButtonWidget(
                    onPressed: _onClose,
                    child: Text(
                      isLastQuestion ? 'Close' : 'Next Question',
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
