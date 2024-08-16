import 'package:flutter/material.dart';
import 'package:frontend/views/widget/card.dart';
import 'package:frontend/views/widget/cs.dart';
import 'package:google_fonts/google_fonts.dart';

class Category extends StatefulWidget {
  const Category({super.key, required this.options, required this.idSection});
  final String options;
  final int idSection;

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<String> categories = [
    "Culture generale",
    "Sciences",
    "Options",
    "Langues"
  ];

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
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          padding: const EdgeInsets.all(10.0),
                          height: 425,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Text(
                                'Choisissez une categorie',
                                style: GoogleFonts.poppins(
                                    color: Colors.indigo[900], fontSize: 25),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Cette page est conçue pour vous offrir une vue claire et intuitive de toutes les categories disponibles, vous permettant de choisir celle qui vous intéresse le plus.',
                                textAlign: TextAlign.justify,
                              ),
                              const SizedBox(height: 35),
                              MyCarousel(
                                categories: categories,
                                options: widget.options,
                                idSection: widget.idSection,
                              ),
                            ],
                          ),
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
                  titre: "Entrainement",
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
