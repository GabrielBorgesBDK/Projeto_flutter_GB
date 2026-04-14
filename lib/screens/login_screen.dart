import 'package:flutter/material.dart';

// Tela de login (Stateless porque não gerencia estado interno)
class LoginScreen extends StatelessWidget {

  // Controladores dos campos de texto (email e senha)
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Função chamada ao clicar em "Entrar"
  void login(BuildContext context) {
    // Aqui deveria ter validação/autenticação
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // Stack para sobrepor elementos (fundo + design + conteúdo)
      body: Stack(
        children: [

          //  FUNDO BRANCO
          Container(
            color: Colors.white,
          ),

          //  FAIXA DIAGONAL SUPERIOR
          Positioned(
            top: -120,
            left: -120,
            child: Transform.rotate(
              angle: -0.5, // rotação para efeito diagonal
              child: Container(
                width: 500,
                height: 250,
                color: Colors.blue.shade900,
              ),
            ),
          ),

          //  FAIXA DIAGONAL INFERIOR
          Positioned(
            bottom: -120,
            right: -120,
            child: Transform.rotate(
              angle: -0.5,
              child: Container(
                width: 500,
                height: 250,
                color: Colors.blue.shade900,
              ),
            ),
          ),

          // CONTEÚDO CENTRAL (CARD DE LOGIN)
          Center(
            child: Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),

              // Estilo do card
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                  )
                ],
              ),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  // Título
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 20),

                  // Campo de email
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),

                  SizedBox(height: 15),

                  // Campo de senha
                  TextField(
                    controller: passwordController,
                    obscureText: true, // esconde senha
                    decoration: InputDecoration(
                      hintText: "Senha",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  // Botão de login
                  ElevatedButton(
                    onPressed: () => login(context),

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade900,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),

                    child: Text(
                      "Entrar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  // Botão para ir para cadastro
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Text("Cadastrar"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}