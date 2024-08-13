import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Import pour la décodage JSON
import 'package:frontend/constants/constants.dart';
import 'package:frontend/models/section_model.dart';

class SectionController extends GetxController {
  // Liste observable pour stocker les sections
  Rx<List<SectionModel>> sections = Rx<List<SectionModel>>([]);
  // État de chargement
  final isLoading = false.obs;
  // Instance de GetStorage pour la gestion du stockage local
  final box = GetStorage();
  @override
  void onInit() {
    getAllSections();
    super.onInit();
  }

  // Méthode pour récupérer toutes les sections
  Future<void> getAllSections() async {
    isLoading.value = true; // Démarrer le chargement

    try {
      isLoading.value = true;
      // Appel HTTP pour récupérer les sections
      var response = await http.get(
        Uri.parse('$url/sections'),
        headers: {
          'Accept': 'application/json',
          'Authorization':
              'Bearer ${box.read('token')}' // Utiliser 'Authorization' au lieu de 'Bearer token'
        },
      );

      if (response.statusCode == 200) {
        isLoading.value = false;
        // Décoder la réponse JSON
        var data = json.decode(response.body)['data'];
        // Convertir chaque élément en SectionModel
        sections.value = List<SectionModel>.from(
            data.map((item) => SectionModel.fromJson(item)));
      } else {
        // Afficher le message d'erreur en cas de statut différent de 200
        print('Erreur: ${response.statusCode}');
        print(json.decode(response.body));
      }
    } catch (e) {
      isLoading.value = false;
      // Gérer les exceptions
      print('Exception: ${e.toString()}');
    } finally {
      isLoading.value = false; // Fin du chargement
    }
  }
}
