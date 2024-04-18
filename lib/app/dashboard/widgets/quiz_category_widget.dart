import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_quiz_app/app/common/common.dart';
import 'package:simple_quiz_app/app/quiz/quiz.dart';
import 'package:simple_quiz_app/configs/configs.dart';
import 'package:simple_quiz_app/utils/utils.dart';

class QuizCategoryWidget extends StatefulWidget {
  const QuizCategoryWidget({
    super.key,
    required this.title,
    required this.image,
    required this.quizCount,
  });

  final String title;
  final String image;
  final int quizCount;

  @override
  State<QuizCategoryWidget> createState() => _QuizCategoryWidgetState();
}

class _QuizCategoryWidgetState extends State<QuizCategoryWidget> {
  late QuizCategoryItemModel quiz;
  late DigitalStampModel digitalStamp;

  @override
  void initState() {
    quiz = context.read<QuizBloc>().state.categories.firstWhere(
          (category) => category.name == widget.title,
          orElse: () => const QuizCategoryItemModel(),
        );

    digitalStamp = quiz.digitalStamp;

    super.initState();
  }

  void _onTapCategory() {
    if (Navigator.canPop(context)) Navigator.pop(context);
    context.goNamed(RouteName.quiz, pathParameters: {'category': widget.title});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: _onTapCategory,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                image: AssetImage(widget.image),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            Positioned(
              left: 15,
              top: 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: context.textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        Icons.quiz,
                        color: Colors.white,
                        size: 15,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '${widget.quizCount} quizzes',
                        style: context.textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 15,
              right: 10,
              child: IconButton(
                icon: const Icon(Icons.card_giftcard),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    final stampCount = digitalStamp.items
                        .where((stamp) => stamp.isSigned)
                        .length;

                    return Dialog(
                      insetPadding: const EdgeInsets.all(16),
                      backgroundColor: Colors.white,
                      surfaceTintColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              widget.title,
                              style: context.textTheme.headlineMedium,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              '$stampCount / ${quiz.quizzes.length} stamps',
                              style: context.textTheme.headlineSmall,
                            ),
                            const SizedBox(height: 20),
                            StampWidget(stamps: digitalStamp.items),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              child: CustomButtonWidget(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text('Close'),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
