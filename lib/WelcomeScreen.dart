// WelcomeScreen.dart
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bem-vindo!')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Seja bem-vindo ao app de aprendizado de inglês!'),
            ElevatedButton(
              onPressed: () {
                // Navegar para a tela de login
              },
              child: Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navegar para a tela de registro
              },
              child: Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}
