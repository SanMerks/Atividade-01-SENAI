import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class User {
  final String name;
  final String email;

  User({required this.name, required this.email});
}

final ThemeData customTheme = ThemeData(
  primarySwatch: Colors.amber, // Fundo amarelo
  textTheme: TextTheme(
    bodyText1: TextStyle(fontSize: 20.0),
    bodyText2: TextStyle(fontSize: 20.0),
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn English Vocabulary',
      theme: customTheme,
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome to JobsFlex')),
      backgroundColor: Colors.amber,
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Bem-vindo ao JobsFlex - English Vocabulary!'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterScreen()));
                },
                child: Text('Registrar'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro')),
      backgroundColor: Colors.amber,
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Preencha os campos abaixo!!'),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Nome'),
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'E-mail'),
              ),
              ElevatedButton(
                onPressed: () {
                  final name = nameController.text;
                  final email = emailController.text;
                  final user = User(name: name, email: email);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DifficultyScreen(user: user)),
                  );
                },
                child: Text('Registrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      backgroundColor: Colors.amber,
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Faça login para continuar'),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Nome'),
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'E-mail'),
              ),
              ElevatedButton(
                onPressed: () {
                  final name = nameController.text;
                  final email = emailController.text;
                  final user = User(name: name, email: email);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DifficultyScreen(user: user)),
                  );
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DifficultyScreen extends StatelessWidget {
  final User user;

  DifficultyScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Seleção de Nível de Dificuldade')),
      backgroundColor: Colors.amber,
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Olá, ${user.name}! Escolha o nível de dificuldade:'),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              WordsAndPhrasesScreen(user: user)));
                },
                child: Text('Continuar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WordsAndPhrasesScreen extends StatelessWidget {
  final User user;

  WordsAndPhrasesScreen({required this.user});

  // Lista de palavras e frases
  final List<Map<String, String>> vocabularyList = [
    {'word': 'Hello', 'translation': 'Olá'},
    {'word': 'Goodbye', 'translation': 'Adeus'},
    {'word': 'Friend', 'translation': 'Amigo'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Palavras e Frases')),
      backgroundColor: Colors.amber,
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Exibição de Palavras e Frases para ${user.name}'),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: vocabularyList.length,
                itemBuilder: (context, index) {
                  final word = vocabularyList[index]['word'];
                  final translation = vocabularyList[index]['translation'];

                  return ListTile(
                    title: Text(word!),
                    subtitle: Text(translation!),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ComprehensionTestScreen()));
              },
              child: Text('Ir para Testes de Compreensão'),
            ),
          ],
        ),
      ),
    );
  }
}

class ComprehensionTestScreen extends StatelessWidget {
  final List<Map<String, dynamic>> comprehensionQuestions = [
    {
      'question': 'Qual é a tradução de "Hello"?',
      'options': ['Oi', 'Adeus', 'Amigo', 'Bom dia'],
      'correctAnswerIndex': 0,
    },
    {
      'question': 'O que significa "Goodbye"?',
      'options': ['Adeus', 'Oi', 'Bom dia', 'Amigo'],
      'correctAnswerIndex': 0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Testes de Compreensão')),
      backgroundColor: Colors.amber,
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'Oferece pequenos testes para verificar a compreensão do vocabulário aprendido.'),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: comprehensionQuestions.length,
                itemBuilder: (context, index) {
                  final question = comprehensionQuestions[index]['question'];
                  final options = comprehensionQuestions[index]['options'];

                  return ComprehensionQuestionWidget(
                    question: question,
                    options: options,
                    onAnswerSelected: (selectedAnswerIndex) {
                      final correctAnswerIndex =
                          comprehensionQuestions[index]['correctAnswerIndex'];

                      if (selectedAnswerIndex == correctAnswerIndex) {
                        print('Resposta correta!');
                      } else {
                        print('Resposta incorreta. Tente novamente.');
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ComprehensionQuestionWidget extends StatefulWidget {
  final String question;
  final List<String> options;
  final Function(int) onAnswerSelected;

  ComprehensionQuestionWidget({
    required this.question,
    required this.options,
    required this.onAnswerSelected,
  });

  @override
  _ComprehensionQuestionWidgetState createState() =>
      _ComprehensionQuestionWidgetState();
}

class _ComprehensionQuestionWidgetState
    extends State<ComprehensionQuestionWidget> {
  int? selectedAnswerIndex;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.question),
            SizedBox(height: 10),
            Column(
              children: widget.options.asMap().entries.map((entry) {
                final index = entry.key;
                final option = entry.value;

                return RadioListTile<int>(
                  title: Text(option),
                  value: index,
                  groupValue: selectedAnswerIndex,
                  onChanged: (value) {
                    setState(() {
                      selectedAnswerIndex = value;
                    });
                    widget.onAnswerSelected(value!);
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressAndStatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Progresso e Estatísticas')),
      backgroundColor: Colors.amber,
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'Mostra o progresso do usuário e estatísticas sobre seu desempenho.'),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserProfileScreen()));
                },
                child: Text('Ir para Perfil do Usuário'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Perfil do Usuário')),
      backgroundColor: Colors.amber,
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'Permite ao usuário visualizar e editar seu perfil, incluindo suas preferências de aprendizado.'),
              ElevatedButton(
                onPressed: () {
                  // Implementar a lógica para voltar à tela inicial ou fechar o aplicativo
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: Text('Voltar para a Tela Inicial'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
