// RegisterScreen.dart
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Adicione campos para o registro do usuário
            Text('Preencha os detalhes de registro'),
            // Exemplo de campo de entrada
            TextFormField(
              decoration: InputDecoration(labelText: 'Nome de usuário'),
            ),
            // Exemplo de campo de senha
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Senha'),
            ),
            ElevatedButton(
              onPressed: () {
                // Adicione a lógica para processar o registro
              },
              child: Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}
