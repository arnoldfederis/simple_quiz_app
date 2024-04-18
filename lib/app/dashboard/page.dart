import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_quiz_app/app/dashboard/dashboard.dart';
import 'package:simple_quiz_app/app/quiz/quiz.dart';
import 'package:simple_quiz_app/utils/utils.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    _fetchQuizCategories();
    super.initState();
  }

  Future<void> _fetchQuizCategories() async {
    context.read<QuizBloc>().add(const FetchQuizCategory());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        if (Navigator.canPop(context)) Navigator.pop(context),
      },
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const NavWidget(),
                const SizedBox(height: 20),
                const HeadlineWidget(),
                const SizedBox(height: 20),
                BlocBuilder<QuizBloc, QuizState>(builder: (context, state) {
                  return Expanded(
                    child: RefreshIndicator.adaptive(
                      onRefresh: _fetchQuizCategories,
                      child: ListView(
                        children: [
                          if (context.isLoading(state.status)) ...[
                            const DashboardLoaderWidget(),
                          ] else ...[
                            ...state.categories.map((category) {
                              return QuizCategoryWidget(
                                title: category.name,
                                image: category.image,
                                quizCount: category.quizCount,
                              );
                            }),
                          ],
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
