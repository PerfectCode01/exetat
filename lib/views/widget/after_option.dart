import 'package:flutter/material.dart';

class AfterOption extends StatefulWidget {
  const AfterOption({super.key});

  @override
  State<AfterOption> createState() => _AfterOptionState();
}

class _AfterOptionState extends State<AfterOption> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Nombre de tabs
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Bio-chimie'),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Culture Generale'), // Texte uniquement
                Tab(text: 'Langues'), // Texte uniquement
                Tab(text: 'Options'), // Texte uniquement
                Tab(text: 'Science'), // Texte uniquement
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Center(child: Text('Culture Generale')),
              Center(child: Text('Langues')),
              Center(child: Text('Options')),
              Center(child: Text('Sciences')),
            ],
          ),
        ),
      ),
    );
  }
}
