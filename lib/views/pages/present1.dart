import 'package:flutter/material.dart';
import 'package:frontend/views/pages/base.dart';
// import 'package:frontend/views/pages/home.dart';
import 'package:google_fonts/google_fonts.dart';

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
          'Bienvenue ! Votre inscription a été réalisée avec succès. Nous sommes ravis de vous accueillir parmis nous'
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
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                child: Image.asset('images/${present[index]["image"]}.jpeg')),
            SizedBox(
                child: Text(
              present[index]["texte"],
              style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 51, 50, 50)),
              textAlign: TextAlign.center,
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: () {}, child: const Text('Ignorer')),
                SizedBox(
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (index < present.length - 1) {
                            index++;
                          } else {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Base()));
                          }
                        });
                      },
                      icon: const Icon(Icons.arrow_circle_right_sharp)),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
