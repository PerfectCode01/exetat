import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:frontend/views/pages/base.dart';

class Present1 extends StatefulWidget {
  const Present1({super.key});

  @override
  State<StatefulWidget> createState() => _Present1State();
}

class _Present1State extends State<Present1> {
  List<Map> present = [
    {
      "image": "hello",
      "texte":
          'Bienvenue ! Votre inscription a été réalisée avec succès. Nous sommes ravis de vous accueillir parmi nous.'
    },
    {
      "image": "objectif",
      "texte":
          "Notre application vous aide à évaluer vos connaissances et à vous préparer efficacement pour vos examens d'État."
    }
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Afficher l'image
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                'images/${present[index]["image"]}.jpeg',
                fit: BoxFit.cover,
                height: 250,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 20),
            // Afficher le texte
            Text(
              present[index]["texte"],
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            // Espace pour pousser les boutons vers le bas
            const Spacer(),
            // Boutons de navigation
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(_createPageTransition(const Base()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: const Text('Ignorer',style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (index < present.length - 1) {
                        index++;
                      } else {
                        Navigator.of(context).push(_createPageTransition(const Base()));
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: const Text('Suivant', style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Fonction pour créer la transition personnalisée
  PageRouteBuilder _createPageTransition(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Déplacement horizontal
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end);
        var offsetAnimation = animation.drive(tween.chain(CurveTween(curve: curve)));

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }
}
