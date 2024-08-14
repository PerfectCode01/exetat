import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      required this.couleur,
      required this.icone,
      required this.titre});
  final Color couleur;
  final IconData icone;
  final String titre;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[100],
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icone, size: 50, color: couleur),
              const SizedBox(height: 10),
              Text(
                titre,
                style: TextStyle(color: couleur, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
