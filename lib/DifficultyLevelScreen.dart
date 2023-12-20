// DifficultyLevelScreen.dart
import 'package:flutter/material.dart';

class DifficultyLevelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Escolha o Nível')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Escolha o seu nível de dificuldade:'),
            ElevatedButton(
              onPressed: () {
                // Navegar para a tela de exibição de palavras e frases
              },
              child: Text('Iniciante'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navegar para a tela de exibição de palavras e frases
              },
              child: Text('Intermediário'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navegar para a tela de exibição de palavras e frases
              },
              child: Text('Avançado'),
            ),
          ],
        ),
      ),
    );
  }
}
