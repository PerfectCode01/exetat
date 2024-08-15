import 'package:flutter/material.dart';

class MyCarousel extends StatelessWidget {
  final List<String> titles;

  const MyCarousel({super.key, required this.titles});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0, // Définit la hauteur du carrousel
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.8),
        itemCount: titles.length,
        itemBuilder: (BuildContext context, int index) {
          return AnimatedBuilder(
            animation: PageController(viewportFraction: 0.8),
            builder: (context, child) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    titles[index],
                    style: const TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
