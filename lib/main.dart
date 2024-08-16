import 'package:flutter/material.dart';
import 'package:frontend/controllers/question_controlller.dart';
import 'package:frontend/views/pages/base.dart';
// import 'package:frontend/views/pages/start_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init(); // Initialiser GetStorage si nécessaire
  Get.put(QuestionController()); // Initialisation du QuestionController
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Base(),
    );
  }
}
