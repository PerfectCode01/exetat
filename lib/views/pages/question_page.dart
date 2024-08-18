import 'package:flutter/material.dart';
import 'package:frontend/controllers/assertion_controller.dart';
import 'package:frontend/models/question_model.dart';
import 'package:get/get.dart';

class QuestionPage extends StatefulWidget {
  final List<QuestionModel> questions;

  const QuestionPage({Key? key, required this.questions}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int _currentIndex = 0;
  final AssertionController _assertionController =
      Get.put(AssertionController());

  @override
  void initState() {
    super.initState();
    // Charger les assertions pour la première question lors de l'initialisation
    _assertionController.getAssertions(widget.questions[_currentIndex].id!);
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.questions[_currentIndex];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.indigo[900],
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Text(
                currentQuestion.lib ?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 25),
              Expanded(
                child: Obx(() {
                  if (_assertionController.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (_assertionController.assertions.value.isEmpty) {
                    return const Center(
                      child: Text(
                        'Aucune assertion disponible.',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: _assertionController.assertions.value.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: ListTile(
                          tileColor: Colors.blue[50],
                          title: Text(
                            _assertionController.assertions.value[index].lib ??
                                '',
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  if (_currentIndex < widget.questions.length - 1) {
                    setState(() {
                      _currentIndex++;
                    });
                    // Charger les assertions pour la prochaine question
                    _assertionController
                        .getAssertions(widget.questions[_currentIndex].id!);
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50), // Button size
                ),
                child: const Text(
                  'Suivant',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.questions.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    height: 8,
                    width: _currentIndex == index ? 20 : 8,
                    decoration: BoxDecoration(
                      color: _currentIndex == index
                          ? Colors.blue
                          : Colors.grey[400],
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20), // Space below the stepper
            ],
          ),
        ),
      ),
    );
  }
}
