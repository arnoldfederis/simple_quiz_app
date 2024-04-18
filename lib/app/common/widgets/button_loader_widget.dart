import 'package:flutter/material.dart';

class ButtonLoaderWidget extends StatelessWidget {
  const ButtonLoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 19,
      width: 19,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation(Colors.black),
        backgroundColor: Colors.white,
      ),
    );
  }
}
