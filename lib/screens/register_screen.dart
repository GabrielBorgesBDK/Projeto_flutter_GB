import 'package:flutter/material.dart';

// Tela de cadastro 
class RegisterScreen extends StatelessWidget {

  // Controladores dos campos de entrada
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Função chamada ao clicar em "Cadastrar"
  void register(BuildContext context) {
    // Volta para a tela anterior (login)
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      
      body: Container(
        width: double.infinity,
        height: double.infinity,

        // Fundo com gradiente azul 
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade900,
              Colors.blueAccent,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        // Centraliza o conteúdo na tela
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),

            // Estilo do card branco
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),

            // Conteúdo do formulário
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                // Título da tela
                Text(
                  "Cadastro",
                  style: TextStyle(
                    fontSize: 24,
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
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Senha",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // Botão de cadastro
                ElevatedButton(
                  onPressed: () => register(context),

                  // Estilo do botão
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade900,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),

                  // Texto do botão
                  child: Text(
                    "Cadastrar",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}