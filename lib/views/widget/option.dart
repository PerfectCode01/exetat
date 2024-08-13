import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  const Option(
      {super.key,
      required this.texte,
      required this.icons,
      required this.color});
  final texte;
  final icons;
  final color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Action à exécuter lors du clic sur le bouton
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icons,
            size: 24,
            color: color,
          ),
          const SizedBox(height: 8),
          Text(
            texte,
            style: const TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
