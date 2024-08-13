import 'package:flutter/material.dart';
import 'package:frontend/controllers/authentication.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authenticationController = Get.put(AuthenticationController());

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // actions: [TextButton(onPressed: () {}, child: const Text('<  Retour'))],
          backgroundColor: Colors.white,
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Flexible(
                child: SizedBox(
                  child: Stack(
                    children: [
                      Image.asset(
                        'images/login.jpeg',
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment
                                    .centerLeft, // Aligner le texte à gauche
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14),
                                  child: Text(
                                    'Connectez vous',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[900]),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const SizedBox(
                                height: 8,
                              ),
                              SizedBox(
                                height: 40,
                                width: 300,
                                child: TextField(
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                      label: const Text('Email'),
                                      border: InputBorder.none,
                                      filled: true,
                                      fillColor: Colors.grey[200]),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              SizedBox(
                                height: 40,
                                width: 300,
                                child: TextField(
                                  controller: _passwordController,
                                  decoration: InputDecoration(
                                      label: const Text('Mot de passe'),
                                      border: InputBorder.none,
                                      filled: true,
                                      fillColor: Colors.grey[200]),
                                  obscureText: true,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                            child: Column(children: [
                          SizedBox(
                            width: 300,
                            child: ElevatedButton(
                              onPressed: () async {
                                await _authenticationController.login(
                                    email: _emailController.text.trim(),
                                    password: _passwordController.text.trim(),
                                    context: context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.lightBlue,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.zero, // Coins non arrondis
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 3, vertical: 8),
                                child: Obx(() {
                                  return _authenticationController
                                          .isLoading.value
                                      ? const CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                      : const Text(
                                          'Se Connecter',
                                          style: TextStyle(color: Colors.white),
                                        );
                                }),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12), // Padding
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Mot de passe oublié',
                                    style: TextStyle(
                                        color: Colors.lightBlue,
                                        fontWeight: FontWeight.bold),
                                  ), // Texte du bouton
                                  SizedBox(
                                      width:
                                          8), // Espacement entre le texte et l'icône
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.lightBlue,
                                  ), // Icône du bouton
                                ],
                              ),
                            ),
                          ),
                        ]))
                      ])),
            ],
          ),
        ));
  }
}
