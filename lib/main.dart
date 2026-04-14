import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';

// Função principal do app 
void main() {
  runApp(MyApp()); // inicia o app
}

// Classe principal do aplicativo
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      // Remove a faixa de debug no canto da tela
      debugShowCheckedModeBanner: false,

      // Rota inicial (primeira tela ao abrir o app)
      initialRoute: '/',

      // Mapeamento de rotas do app
      routes: {

        // Tela de login
        '/': (context) => LoginScreen(),

        // Tela de cadastro
        '/register': (context) => RegisterScreen(),

        // Tela principal (home)
        '/home': (context) => HomeScreen(),
      },
    );
  }
}