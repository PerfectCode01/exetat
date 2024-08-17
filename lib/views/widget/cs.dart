import 'dart:async'; // Importer le package dart:async pour utiliser Timer
import 'package:flutter/material.dart';
import 'package:frontend/controllers/question_controlller.dart';
import 'package:frontend/views/pages/question_page.dart';
import 'package:get/get.dart';

class MyCarousel extends StatefulWidget {
  const MyCarousel({
    super.key,
    required this.categories,
    required this.options,
    required this.idSection,
  });

  final List categories;
  final String options;
  final int idSection;

  @override
  _MyCarouselState createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  final PageController _pageController = PageController();
  late Timer _timer; // Déclaration de Timer pour la lecture automatique
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });

    // Initialisation du Timer pour faire défiler automatiquement les pages
    _timer = Timer.periodic(
      const Duration(seconds: 3), // Intervalle de défilement automatique
      (Timer timer) {
        if (_pageController.hasClients) {
          _currentPage = (_currentPage + 1) % widget.categories.length;
          _pageController.animateToPage(
            _currentPage,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel(); // Annuler le Timer lorsque le widget est supprimé
    _pageController.dispose(); // Nettoyer le PageController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Initialiser le QuestionController ici
    final questionController = Get.put(QuestionController());

    final List<String> imageNames =
        List.generate(widget.categories.length, (index) => '$index.jpeg');

    return Column(
      children: [
        SizedBox(
          // Réduire la hauteur du carrousel ici
          height: 200, // Hauteur ajustée
          child: PageView.builder(
            controller: _pageController,
            itemCount: imageNames.length,
            itemBuilder: (context, index) {
              final imageName = imageNames[index];
              final category = widget.categories[index];

              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8.0), // Espacement horizontal
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      20), // Arrondir les coins du carrousel
                  child: Container(
                    color: Colors
                        .transparent, // Fond transparent pour que l'image soit visible
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        // Image de fond
                        Image.asset(
                          'images/$imageName',
                          fit: BoxFit.cover,
                        ),
                        // Couche noire semi-transparente
                        Container(
                          color: Colors.black.withOpacity(0.5),
                        ),
                        // Contenu centré
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Texte
                            Center(
                              child: Text(
                                category.lib,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                                height:
                                    16), // Espacement entre le texte et le bouton
                            // Bouton "Commencer"
                            ElevatedButton(
                              onPressed: () async {
                                final sectionId = widget.idSection;
                                final categoryId = category.sectionId;

                                print(sectionId);
                                print(categoryId);

                                // Vider la liste des questions avant de faire la requête
                                questionController.questions.value = [];

                                // Naviguez vers la page des questions avec un FutureBuilder
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FutureBuilder(
                                      future: questionController.getQuestions(
                                          categoryId, sectionId),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return const Center(
                                              child:
                                                  CircularProgressIndicator());
                                        } else if (snapshot.hasError) {
                                          return const Center(
                                              child: Text(
                                                  'Erreur lors du chargement des questions'));
                                        } else {
                                          return QuestionPage(
                                              questions: questionController
                                                  .questions.value);
                                        }
                                      },
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.blue, // Couleur de fond du bouton
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 12),
                              ),
                              child: const Text(
                                'Commencer',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        // Indicateurs de pagination
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            imageNames.length,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index ? Colors.indigo[900] : Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
