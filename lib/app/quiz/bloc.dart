import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:simple_quiz_app/app/quiz/models/models.dart';
import 'package:simple_quiz_app/utils/utils.dart';

import 'event.dart';
import 'state.dart';

class QuizBloc extends HydratedBloc<QuizEvent, QuizState> {
  QuizBloc() : super(const QuizState()) {
    on<FetchQuizCategory>(_fetchQuizCategories);
    on<AnswerQuestion>(_answerQuestion);
    on<CloseStamp>(_closeStamp);
  }

  @override
  QuizState? fromJson(Map<String, dynamic> json) {
    return QuizState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(QuizState state) {
    return state.toJson();
  }

  Future<void> _fetchQuizCategories(
    FetchQuizCategory event,
    Emitter<QuizState> emit,
  ) async {
    emit(state.copyWith(status: LoadingStatus.loading));

    await Future.delayed(const Duration(seconds: 1), () async {
      final response = await rootBundle.loadString(
        'assets/quiz-categories.json',
      );

      final data = jsonDecode(response);

      emit(state.copyWith(
        status: LoadingStatus.success,
        categories: (data as List)
            .map((category) => QuizCategoryItemModel.fromJson(category))
            .toList(),
      ));
    });
  }

  Future<void> _answerQuestion(
    AnswerQuestion event,
    Emitter<QuizState> emit,
  ) async {
    emit(state.copyWith(status: LoadingStatus.loading));

    await Future.delayed(const Duration(milliseconds: 500));

    emit(state.copyWith(
      status: LoadingStatus.success,
      showStamp: true,
      categories: state.categories.map((category) {
        if (category.name == event.category) {
          final quiz = category.quizzes[category.digitalStamp.questionIndex];

          final isCorrect = quiz.answers
              .where((answer) => answer.selection == event.answer)
              .first
              .isCorrect;

          return category.copyWith(
            digitalStamp: category.digitalStamp.copyWith(
              items: category.digitalStamp.items.map((item) {
                if (item.stampIndex == category.digitalStamp.questionIndex) {
                  return item.copyWith(
                    isSigned: isCorrect,
                    completedAt: DateTime.now().toString(),
                  );
                }

                return item;
              }).toList(),
            ),
          );
        }

        return category;
      }).toList(),
    ));
  }

  Future<void> _closeStamp(
    CloseStamp event,
    Emitter<QuizState> emit,
  ) async {
    emit(state.copyWith(
      showStamp: false,
      categories: state.categories.map((category) {
        if (category.name == event.category) {
          return category.copyWith(
            digitalStamp: category.digitalStamp.copyWith(
              questionIndex: category.digitalStamp.questionIndex + 1,
            ),
          );
        }

        return category;
      }).toList(),
    ));
  }
}
