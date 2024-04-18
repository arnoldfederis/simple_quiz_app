import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_quiz_app/app/quiz/quiz.dart';
import 'package:simple_quiz_app/utils/utils.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({
    super.key,
    required this.category,
  });

  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          category,
          style: context.textTheme.headlineSmall?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocConsumer<QuizBloc, QuizState>(
          listener: (context, state) {
            if (state.showStamp) {
              showDialog(
                context: context,
                builder: (_) => StampDialogWidget(
                  category: category,
                ),
              );
            }
          },
          builder: (context, state) {
            final quiz = state.categories.firstWhere(
              (quiz) => quiz.name == category,
              orElse: () => const QuizCategoryItemModel(),
            );

            return quiz.digitalStamp.questionIndex < quiz.quizzes.length
                ? QuizWidget(
                    category: category,
                    quiz: quiz,
                    status: state.status,
                  )
                : const ResultWidget();
          },
        ),
      ),
    );
  }
}
