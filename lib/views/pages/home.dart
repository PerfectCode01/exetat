import 'package:flutter/material.dart';
// import 'package:frontend/views/widget/Carousel.dart';
import 'package:frontend/views/widget/type_quiz.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Salut Jared',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '23, Janvier 2024',
                            style: TextStyle(color: Colors.blue),
                          )
                        ],
                      ),
                      Icon(
                        Icons.notifications,
                        color: Colors.white,
                      )
                    ],
                  ),
                  const SizedBox(height: 25),
                  // searchbar
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue[600],
                        borderRadius: BorderRadius.circular(12)),
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
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Different type de test ?',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                      )
                    ],
                  ),
                  const SizedBox(height: 25),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Column(
                      //   children: [
                      //     Typequiz(
                      //       img: 'rocket',
                      //     ),
                      //     Text(
                      //       'Rapide',
                      //       style: TextStyle(color: Colors.white),
                      //     )
                      //   ],
                      // ),
                      Column(
                        children: [
                          Typequiz(
                            img: 'award',
                          ),
                          Text(
                            'Exetat',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Typequiz(
                            img: 'target',
                          ),
                          Text(
                            'personnalisé',
                            style: TextStyle(color: Colors.white),
                          )
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
                    Text('Decouvez les options disponibles',
                        style: GoogleFonts.lobster(
                          fontSize: 20,
                          color: Colors.blue[900],
                          fontWeight: FontWeight.bold,
                        )),
                    const SizedBox(height: 15),
                    Text(
                      'Evaluer vos connaissances, Entraînez-vous avec des tests personnalisés, suivez vos progrès et atteignez vos objectifs académiques avec confiance.',
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.poppins(
                          fontSize: 12, color: Colors.grey[500]),
                    ),
                    const SizedBox(height: 25),
                    // const Carousel(
                    //   categories: [
                    //     {
                    //       "img": "bg",
                    //       "titre": "Scientifique",
                    //       "desc":
                    //           "L'enseignement des sciences encourage le développement de compétences analytiques, "
                    //     },
                    //     {"img": "bg", "titre": "Pedagogie générale"},
                    //     {"img": "bg", "titre": "Commerciale"},
                    //     {"img": "bg", "titre": "Electricité"},
                    //   ],
                    // ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
