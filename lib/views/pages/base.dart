import 'package:flutter/material.dart';
import 'package:frontend/views/pages/dashboard.dart';
import 'package:frontend/views/pages/home.dart';
import 'package:frontend/views/pages/quiz.dart';

class Base extends StatefulWidget {
  const Base({super.key});

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int _index = 0;

  final List<Widget> _pages = const [
    Home(),
    Quiz(),
    Dashboard(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: 'Quiz',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_rounded),
            label: 'Tableau de bord',
          ),
        ],
        currentIndex: _index,
        selectedItemColor: Colors.blue[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
      body: _pages[_index],
    );
  }
}
