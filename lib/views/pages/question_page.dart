import 'package:flutter/material.dart';
import 'package:frontend/models/question_model.dart';

class QuestionPage extends StatelessWidget {
  final List<QuestionModel> questions;

  const QuestionPage({Key? key, required this.questions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Questions'),
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(questions[index].lib ?? ''),
          );
        },
      ),
    );
  }
}
