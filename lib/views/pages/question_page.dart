import 'package:flutter/material.dart';
import 'package:frontend/views/pages/result_page.dart';
import 'package:get/get.dart';
import 'package:frontend/controllers/assertion_controller.dart';
import 'package:frontend/models/question_model.dart';

class QuestionPage extends StatefulWidget {
  final List<QuestionModel> questions;

  const QuestionPage({Key? key, required this.questions}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final AssertionController _assertionController =
      Get.put(AssertionController());
  int currentIndex = 0;
  int score = 0;
  int? selectedAssertionId;

  @override
  void initState() {
    super.initState();
    _assertionController.getAssertions(widget.questions[currentIndex].id!);
  }

  void onNextQuestion() {
    if (selectedAssertionId != null) {
      final selectedAssertion =
          _assertionController.assertions.value.firstWhere(
        (assertion) => assertion.id == selectedAssertionId,
      );

      if (selectedAssertion.isCorrect == 1) {
        score += 2; // Ajouter 2 points pour chaque bonne réponse
      }
    }

    if (currentIndex < widget.questions.length - 1) {
      setState(() {
        currentIndex++;
        selectedAssertionId = null;
      });
      _assertionController.getAssertions(widget.questions[currentIndex].id!);
    } else {
      // Naviguer vers la page des résultats
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ResultPage(score: score, total: widget.questions.length * 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.indigo[900],
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Text(
                widget.questions[currentIndex].lib ?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(10),
                  child: Obx(() {
                    if (_assertionController.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(
                        itemCount: _assertionController.assertions.value.length,
                        itemBuilder: (context, index) {
                          final assertion =
                              _assertionController.assertions.value[index];
                          final isSelected =
                              assertion.id == selectedAssertionId;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedAssertionId = assertion.id;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Colors.blue[100]
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: isSelected ? Colors.blue : Colors.grey,
                                  width: 2,
                                ),
                              ),
                              child: Text(
                                assertion.lib ?? '',
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.blue[900]
                                      : Colors.black,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  }),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: onNextQuestion,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                    ),
                    child:
                        const Text('Suivant', style: TextStyle(fontSize: 18)),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      widget.questions.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              currentIndex == index ? Colors.blue : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
