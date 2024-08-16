import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:frontend/views/pages/category.dart';
import 'package:google_fonts/google_fonts.dart';

class AfterOption extends StatefulWidget {
  const AfterOption({super.key, required this.titre, required this.id});
  final String titre;
  final int id;

  @override
  State<AfterOption> createState() => _AfterOptionState();
}

class _AfterOptionState extends State<AfterOption> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            // backgroundColor: Colors.indigo[900],
            ),
        backgroundColor: Colors.indigo[900],
        body: Column(
          children: [
            // Salutation et nom
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                height: 200, // Spécifiez une hauteur fixe
                alignment: Alignment
                    .center, // Centrer verticalement et horizontalement
                child: AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      widget.titre.toUpperCase(),
                      textStyle: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                      speed: const Duration(
                          milliseconds: 80), // Vitesse d'animation
                      curve: Curves
                          .easeInOut, // Courbe d'animation pour plus de fluidité
                    ),
                    // Vous pouvez ajouter d'autres animations comme Fade ou Scale
                    FadeAnimatedText(
                      widget.titre.toUpperCase(),
                      textStyle: GoogleFonts.poppins(
                        color: Colors.white70,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                      duration: const Duration(
                          seconds: 2), // Durée de l'animation de fondu
                    ),
                    ScaleAnimatedText(
                      widget.titre.toUpperCase(),
                      textStyle: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                      duration: const Duration(
                          seconds: 1), // Durée de l'animation d'échelle
                      scalingFactor: 0.5, // Facteur de mise à l'échelle
                    ),
                  ],
                  isRepeatingAnimation: true, // Pour répéter l'animation
                  repeatForever:
                      true, // Pour que l'animation se répète à l'infini
                  pause: const Duration(
                      milliseconds: 500), // Pause entre les répétitions
                ),
              ),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                child: SizedBox(
                  child: Center(
                      child: Category(
                    options: widget.titre,
                    idSection: widget.id,
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
