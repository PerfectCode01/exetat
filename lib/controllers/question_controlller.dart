import 'dart:convert'; // Pour json.decode
import 'package:frontend/constants/constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/models/question_model.dart';

class QuestionController extends GetxController {
  // Liste observable pour stocker les questions
  Rx<List<QuestionModel>> questions = Rx<List<QuestionModel>>([]);
  // État de chargement
  final isLoading = false.obs;
  // Instance de GetStorage pour la gestion du stockage local
  final box = GetStorage();
  // URL de base pour l'API

  @override
  void onInit() {
    super.onInit();
    // Vous pouvez appeler getQuestions() avec des valeurs par défaut ici si nécessaire
  }

  // Méthode pour récupérer toutes les questions
  Future<void> getQuestions(int cat, int sec) async {
    isLoading.value = true; // Démarrer le chargement

    try {
      // Construire l'URL complète en utilisant Uri.parse
      final uri = Uri.parse('$url/questions?category=$cat&section=$sec');

      var response = await http.get(
        uri,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}',
          'Cache-Control': 'no-cache', // Désactive la mise en cache
        },
      );

      if (response.statusCode == 200) {
        // Décoder la réponse JSON
        var data = json.decode(response.body)['data'];

        // Convertir chaque élément en QuestionModel
        questions.value = List<QuestionModel>.from(
            data.map((item) => QuestionModel.fromJson(item)));

        print('Questions récupérées: ${questions.value}');
      } else {
        // Afficher le message d'erreur en cas de statut différent de 200
        print('Erreur: ${response.statusCode}');
        print(json.decode(response.body));
      }
    } catch (e) {
      // Gérer les exceptions
      print('Exception: ${e.toString()}');
    } finally {
      isLoading.value = false; // Fin du chargement
    }
  }
}
