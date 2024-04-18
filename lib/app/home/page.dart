import 'package:flutter/material.dart';
import 'package:simple_quiz_app/app/home/home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: const Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                Expanded(child: HomeIconWidget()),
                HomeFormWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
