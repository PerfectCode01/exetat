import 'package:flutter/material.dart';
import 'package:frontend/views/widget/card.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
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

              children: const <Widget>[
                CustomCard(
                    couleur: Colors.blue,
                    icone: Icons.quiz,
                    titre: "Quiz Rapide"),
                CustomCard(
                    couleur: Colors.green,
                    icone: Icons.fitness_center,
                    titre: "Entrainement"),
                CustomCard(
                    couleur: Colors.red, icone: Icons.book, titre: 'Cours'),
                CustomCard(
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
