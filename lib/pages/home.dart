import 'package:calcular_imc/models/imc_resultado.dart';
import 'package:calcular_imc/pages/historico.dart';
import 'package:calcular_imc/widgets/bottom_navigation.dart';
import 'package:calcular_imc/widgets/formulario.dart';
import 'package:calcular_imc/widgets/logo.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController controller = PageController(initialPage: 0);

  List<ImcResultado> historicoResultados = [];

  void adicionarResultado(ImcResultado resultado) {
    setState(() {
      historicoResultados.add(resultado);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green.shade300,
        title: Text("Calcular IMC"),
      ),
      resizeToAvoidBottomInset: true,
      body: PageView(
        controller: controller,
        children: [
          ListView(
            children: [
              LogoImage(imagePath: "assets/images/logo.png", width: 180),
              Center(
                child: Column(
                  children: [
                    Formulario(onCalculoFinalizado: adicionarResultado),
                  ],
                ),
              ),
            ],
          ),

          Center(child: HistoricoPage(historico: historicoResultados)),
        ],
      ),
      bottomNavigationBar: BottomNavigation(controller: controller),
    );
  }
}
