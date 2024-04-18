import 'package:flutter/material.dart';
import 'package:simple_quiz_app/app/quiz/quiz.dart';

class StampWidget extends StatelessWidget {
  const StampWidget({
    super.key,
    required this.stamps,
  });

  final List<DigitalStampItemModel> stamps;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Wrap(
        spacing: 20,
        alignment: WrapAlignment.center,
        children: List.generate(
          stamps.length,
          (index) => Icon(
            Icons.card_giftcard,
            size: 50,
            color:
                stamps[index].isSigned && stamps[index].completedAt.isNotEmpty
                    ? Colors.green
                    : Colors.grey,
          ),
        ),
      ),
    );
  }
}
