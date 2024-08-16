import 'package:flutter/material.dart';
import 'package:frontend/models/question_model.dart';

class QuestionPage extends StatelessWidget {
  final List<QuestionModel> questions;

  const QuestionPage({super.key, required this.questions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Questions'),
      ),
      body: questions.isEmpty
          ? const Center(child: Text('Aucune question disponible.'))
          : ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                final question = questions[index];
                return ListTile(
                  title: Text(
                      question.lib!), // Assurez-vous que la clé est correcte
                );
              },
            ),
    );
  }
}
