import 'package:flutter/material.dart';
import 'package:frontend/views/widget/card.dart';
import 'package:frontend/views/widget/carousel_slider.dart';

class Category extends StatefulWidget {
  const Category({super.key});

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
            width: double
                .infinity, // Permet au GridView de prendre toute la largeur disponible
            height: double
                .infinity, // Permet au GridView de prendre toute la hauteur disponible
            child: GridView.count(
              crossAxisCount: 2, // Nombre d'éléments par ligne
              crossAxisSpacing:
                  10.0, // Espacement horizontal entre les éléments
              mainAxisSpacing: 10.0, // Espacement vertical entre les éléments

              children: <Widget>[
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                              height: 425,
                              width: double.infinity,
                              child: MyCarousel(titles: categories));
                        });
                  },
                  child: const CustomCard(
                      couleur: Colors.blue,
                      icone: Icons.quiz,
                      titre: "Quiz Rapide"),
                ),
                const CustomCard(
                    couleur: Colors.green,
                    icone: Icons.fitness_center,
                    titre: "Entrainement"),
                const CustomCard(
                    couleur: Colors.red, icone: Icons.book, titre: 'Cours'),
                const CustomCard(
                    couleur: Colors.orange,
                    icone: Icons.pages,
                    titre: 'Dissertation')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
