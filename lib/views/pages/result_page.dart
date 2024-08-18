import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final int score;
  final int total;

  const ResultPage({Key? key, required this.score, required this.total})
      : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Déterminer le message et l'icône en fonction du score
    String message;
    IconData icon;
    if (widget.score < (widget.total * 0.5).toInt()) {
      message = 'Désolé, vous avez échoué.';
      icon = Icons.sentiment_dissatisfied; // Icône triste
    } else {
      message = 'Félicitations, vous avez réussi !';
      icon = Icons.sentiment_very_satisfied; // Icône joyeuse
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Résultats'),
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Afficher l'icône en fonction du résultat
                Icon(
                  icon,
                  size: 100,
                  color: widget.score < (widget.total * 0.5).toInt()
                      ? Colors.red
                      : Colors.green,
                ),
                const SizedBox(height: 20),
                Text(
                  message,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Text(
                  '${widget.score} / ${widget.total}',
                  style: TextStyle(
                      fontSize: 48,
                      color: Colors.indigo[900],
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(
                        context); // Retourner à la page précédente ou au menu principal
                  },
                  child: const Text('Retour'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
