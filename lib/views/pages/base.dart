import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/views/pages/dashboard.dart';
import 'package:frontend/views/pages/home.dart';
import 'package:frontend/views/pages/quiz.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

class Base extends StatefulWidget {
  const Base({super.key});

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int _index = 0;
  Widget pageActuelle = const Home();

  void pageController(index) {
    setState(() {
      _index = index;
      print(_index);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_index == 0) {
      pageActuelle = const Home();
    } else if (_index == 1) {
      pageActuelle = const Quiz();
    } else {
      pageActuelle = const Dashboard();
    }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.grey,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.quiz,
                  color: Colors.grey,
                ),
                label: 'Quiz'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.dashboard_rounded,
                  color: Colors.grey,
                ),
                label: 'Tableau de bord'),
          ],
          currentIndex: _index,
          selectedItemColor: Colors.blue[800],
          onTap: pageController),
      body: pageActuelle,
    );
  }
}
