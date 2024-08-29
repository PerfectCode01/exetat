import 'package:frontend/views/widget/type_quiz.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Assure-toi que le widget Typequiz est correctement défini ailleurs
// import 'package:frontend/views/widget/type_quiz.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[800],
        body: Column(
          children: [
            // Salutation et nom
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Salut Jared',
                            style: GoogleFonts.lobster(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '23, Janvier 2024',
                            style: TextStyle(color: Colors.blue[200]),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  // Barre de recherche
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[600],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Search',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  // Titre des types de tests
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Différents types de test ?',
                        style: GoogleFonts.lobster(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  // Types de quiz
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Typequiz(
                            img: 'award',
                            // Assure-toi que le widget Typequiz est correctement défini
                          ),
                          Text(
                            'Exetat',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Typequiz(
                            img: 'target',
                            // Assure-toi que le widget Typequiz est correctement défini
                          ),
                          Text(
                            'Personnalisé',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
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
                  child: ListView(
                    children: [
                      Text(
                        'Découvrez les options disponibles',
                        style: GoogleFonts.lobster(
                          fontSize: 20,
                          color: Colors.blue[900],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Évaluez vos connaissances, entraînez-vous avec des tests personnalisés, suivez vos progrès et atteignez vos objectifs académiques avec confiance.',
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.grey[500],
                        ),
                      ),
                      const SizedBox(height: 25),
                      // Ajoute le widget Carousel ici si nécessaire
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



