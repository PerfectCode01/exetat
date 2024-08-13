import 'package:flutter/material.dart';

class Typequiz extends StatelessWidget {
  const Typequiz({super.key, required this.img});
  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue[600], borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.all(12),
      child: SizedBox(
          width: 35, height: 35, child: Image.asset('./images/$img.gif')),
    );
  }
}
