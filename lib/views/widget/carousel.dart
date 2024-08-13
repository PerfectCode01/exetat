import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key, required this.categories});
  final List categories;

  @override
  State<StatefulWidget> createState() => _CarouselState();
}

// [
//           "bg",
//           "r2",
//           "r3",
//         ].
class _CarouselState extends State<Carousel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        items: widget.categories.map((i) {
          return ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'images/${i["img"]}.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  color: Colors.black.withOpacity(0.5),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${i["titre"]}',
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
        options: CarouselOptions(
          height: 150,
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 0.6,
        ),
      ),
    );
  }
}
