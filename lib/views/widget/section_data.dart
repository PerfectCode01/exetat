import 'package:flutter/material.dart';
import 'package:frontend/models/section_model.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionData extends StatefulWidget {
  const SectionData({super.key, required this.sections});
  final SectionModel sections;

  @override
  State<SectionData> createState() => _SectionDataState();
}

class _SectionDataState extends State<SectionData> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0), // Coins arrondis
      ),
      child: Container(
        height: 150, // Taille de la carte pour qu'elle soit carrée
        width: 150, // Taille de la carte pour qu'elle soit carrée
        alignment: Alignment.center,
        child: Text(
          widget.sections.lib!.toUpperCase(),
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: Colors.blue[900],
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center, // Centrer le texte
        ),
      ),
    );
  }
}
