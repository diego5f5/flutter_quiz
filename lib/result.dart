import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final VoidCallback handleResetQuestions;
  final num totalScore;

  const Result({
    required this.handleResetQuestions,
    required this.totalScore,
    super.key,
  });

  String get resultPhrase {
    String resultText = 'You did it!';

    if (totalScore <= 8) {
      resultText = 'You are awesome and innocent!';
    } else if (totalScore <= 12) {
      resultText = 'Pretty likeable!';
    } else if (totalScore <= 16) {
      resultText = 'You are ... strange?!';
    } else {
      resultText = 'You are so bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            resultPhrase,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: handleResetQuestions,
            child: const Text('Reset Questions'),
          )
        ],
      ),
    );
  }
}
