import 'package:flutter/material.dart';
import 'package:frontend/constants/constants.dart';
import 'package:frontend/views/pages/base.dart';
import 'package:frontend/views/pages/home.dart';
import 'package:frontend/views/pages/present1.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get_storage/get_storage.dart';

class AuthenticationController extends GetxController {
  final isLoading = false.obs;
  final token = ''.obs;
  final box = GetStorage();

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      isLoading.value = true;
      var data =
          jsonEncode({'name': name, 'email': email, 'password': password});
      var response = await http.post(
        Uri.parse('$url/register'), // Remplacez par l'URL correcte
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: data,
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        debugPrint('Enregistrement réussi: ${response.body}');
        token.value = json.decode(response.body)['token'];
        box.write('token', token.value);
        Get.offAll(() => const Present1());
      } else {
        // Vérifiez si la réponse contient un utilisateur et un jeton
        var responseBody = json.decode(response.body);
        if (responseBody['user'] != null && responseBody['token'] != null) {
          debugPrint('Enregistrement réussi: ${response.body}');
          token.value = json.decode(response.body)['token'];
          box.write('token', token.value);
          Get.offAll(() => const Present1());
        } else {
          debugPrint('Erreur lors de l\'enregistrement: ${response.body}');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(json.decode(response.body)['message']),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red,
          ));
        }
      }
    } catch (e) {
      debugPrint('Erreur: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      isLoading.value = true;
      var data = jsonEncode({'email': email, 'password': password});
      var response = await http.post(
        Uri.parse('$url/login'), // Remplacez par l'URL correcte
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: data,
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        token.value = json.decode(response.body)['token'];
        box.write('token', token.value);
        Get.offAll(() => const Home());
      } else {
        // Vérifiez si la réponse contient un utilisateur et un jeton
        var responseBody = json.decode(response.body);
        if (responseBody['user'] != null && responseBody['token'] != null) {
          debugPrint('Enregistrement réussi: ${response.body}');
          token.value = json.decode(response.body)['token'];
          box.write('token', token.value);
          Get.offAll(() => const Base());
        } else {
          debugPrint('Erreur lors de l\'enregistrement: ${response.body}');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(json.decode(response.body)['message']),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red,
          ));
        }
      }
    } catch (e) {
      debugPrint('Erreur: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
