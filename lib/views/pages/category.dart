import 'package:flutter/material.dart';
import 'package:frontend/controllers/categorie_controller.dart';
import 'package:frontend/views/widget/card.dart';
import 'package:frontend/views/widget/cs.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Category extends StatefulWidget {
  const Category({super.key, required this.options, required this.idSection});
  final String options;
  final int idSection;

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final CategorieController categorieController =
      Get.put(CategorieController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    print('La valeur de id section est ${widget.idSection}');
                    categorieController.getCategories(widget.idSection);
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return FutureBuilder(
                          future: categorieController
                              .getCategories(widget.idSection),
                          builder: (BuildContext context,
                              AsyncSnapshot<void> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text('Erreur: ${snapshot.error}'));
                            } else {
                              return Container(
                                padding: const EdgeInsets.all(10.0),
                                height: 425,
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    Text(
                                      'Choisissez une catégorie',
                                      style: GoogleFonts.poppins(
                                          color: Colors.indigo[900],
                                          fontSize: 25),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      'Cette page est conçue pour vous offrir une vue claire et intuitive de toutes les catégories disponibles, vous permettant de choisir celle qui vous intéresse le plus.',
                                      textAlign: TextAlign.justify,
                                    ),
                                    const SizedBox(height: 35),
                                    Obx(() {
                                      // Observez la liste des catégories
                                      final categories =
                                          categorieController.categories.value;
                                      return MyCarousel(
                                        categories: categories,
                                        options: widget.options,
                                        idSection: widget.idSection,
                                      );
                                    }),
                                  ],
                                ),
                              );
                            }
                          },
                        );
                      },
                    );
                  },
                  child: const CustomCard(
                    couleur: Colors.blue,
                    icone: Icons.quiz,
                    titre: "Quiz Rapide",
                  ),
                ),
                const CustomCard(
                  couleur: Colors.green,
                  icone: Icons.fitness_center,
                  titre: "Entraînement",
                ),
                const CustomCard(
                  couleur: Colors.red,
                  icone: Icons.book,
                  titre: 'Cours',
                ),
                const CustomCard(
                  couleur: Colors.orange,
                  icone: Icons.pages,
                  titre: 'Dissertation',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
