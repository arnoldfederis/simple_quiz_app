import 'package:equatable/equatable.dart';

abstract class QuizEvent extends Equatable {
  const QuizEvent();
}

class FetchQuizCategory extends QuizEvent {
  const FetchQuizCategory();

  @override
  List<Object?> get props => [];
}

class AnswerQuestion extends QuizEvent {
  const AnswerQuestion({
    required this.category,
    required this.answer,
  });

  final String category;
  final String answer;

  @override
  List<Object?> get props => [
        category,
        answer,
      ];
}

class CloseStamp extends QuizEvent {
  const CloseStamp({
    required this.category,
});

  final String category;

  @override
  List<Object?> get props => [category];
}