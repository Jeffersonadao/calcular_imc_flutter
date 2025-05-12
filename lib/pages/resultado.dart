import 'package:calcular_imc/models/imc.dart';
import 'package:calcular_imc/widgets/logo.dart';
import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final String nome;
  final int idade;
  final int peso;
  final int altura;

  const Resultado({
    super.key,
    required this.nome,
    required this.idade,
    required this.peso,
    required this.altura,
  });

  @override
  Widget build(BuildContext context) {
    final imc = Imc(nome, idade, peso, altura);
    final resultado = imc.classificacao();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.green.shade300,
        title: Text("Resultado"),
      ),
      body: ListView(
        children: [
          LogoImage(imagePath: 'assets/images/resultado.jpg', width: 400),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  "Olá, $nome!",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "Seu IMC é: ${imc.imcFormatado}",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  "Classificação: ${resultado['classificacao']}",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  "${resultado['mensagem']}",
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Sair"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
