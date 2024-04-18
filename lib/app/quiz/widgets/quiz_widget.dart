import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_quiz_app/app/common/common.dart';
import 'package:simple_quiz_app/app/quiz/quiz.dart';
import 'package:simple_quiz_app/utils/utils.dart';

class QuizWidget extends StatefulWidget {
  const QuizWidget({
    super.key,
    required this.category,
    required this.quiz,
    required this.status,
  });

  final String category;
  final QuizCategoryItemModel quiz;
  final LoadingStatus status;

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  String selectedAnswer = '';

  void _onAnswer() {
    final event = AnswerQuestion(
      category: widget.category,
      answer: selectedAnswer,
    );

    context.read<QuizBloc>().add(event);
  }

  @override
  Widget build(BuildContext context) {
    final quiz = widget.quiz;
    final question = quiz.quizzes[quiz.digitalStamp.questionIndex];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  question.question,
                  textAlign: TextAlign.center,
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            '${quiz.digitalStamp.questionIndex + 1} / ${quiz.quizzes.length}',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Column(
          children: [
            ...question.answers.map(
              (answer) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: RadioListTile<String>(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    title: Text(
                      answer.selection,
                      style: TextStyle(
                        fontSize: 14,
                        color: selectedAnswer == answer.selection
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    selected: selectedAnswer == answer.selection,
                    selectedTileColor: Colors.black,
                    activeColor: Colors.white,
                    tileColor: Colors.white,
                    value: answer.selection,
                    groupValue: selectedAnswer,
                    onChanged: (String? value) {
                      setState(() => selectedAnswer = value!);
                    },
                  ),
                );
              },
            ),
          ],
        ),
        const Spacer(),
        SizedBox(
          width: double.infinity,
          child: CustomButtonWidget(
            onPressed: selectedAnswer.isNotEmpty ? _onAnswer : null,
            child: context.isLoading(widget.status)
                ? const ButtonLoaderWidget()
                : const Text('Confirm Answer'),
          ),
        )
      ],
    );
  }
}
