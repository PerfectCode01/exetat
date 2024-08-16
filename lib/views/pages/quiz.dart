import 'package:flutter/material.dart';
import 'package:frontend/views/pages/after_option.dart';
import 'package:frontend/views/widget/section_data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart'; // Assurez-vous d'importer GetX
import 'package:frontend/controllers/section_controller.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final SectionController _sectionController = Get.put(SectionController());

  @override
  void initState() {
    super.initState();
    // Charger les sections lorsqu'il est initialisé
    _sectionController.getAllSections();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.indigo[900],
        body: Column(
          children: [
            // Salutation et nom
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 200,
                    child: Image.asset('images/quiz.gif'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
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
                    if (_sectionController.isLoading.value) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView(
                        children: [
                          Text(
                            'Quelle est votre section ?',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: Colors.indigo[900],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            'Choisissez votre option pour commencer',
                            style: TextStyle(color: Colors.grey[400]),
                          ),
                          const SizedBox(height: 15),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // Nombre de colonnes
                              crossAxisSpacing: 10, // Espacement horizontal
                              mainAxisSpacing: 10, // Espacement vertical
                              childAspectRatio:
                                  2, // Ratio largeur/hauteur des éléments
                            ),
                            itemCount: _sectionController.sections.value.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AfterOption(
                                            titre: _sectionController
                                                .sections.value[index].lib
                                                .toString(),
                                            id: _sectionController
                                                .sections.value[index].id!)),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue[50],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: SectionData(
                                    sections: _sectionController
                                        .sections.value[index],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    }
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
