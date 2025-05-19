import 'package:calcular_imc/models/imc.dart';
import 'package:calcular_imc/models/imc_resultado.dart';
import 'package:calcular_imc/pages/resultado.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

class Formulario extends StatefulWidget {
  final void Function(ImcResultado) onCalculoFinalizado;
  Formulario({super.key, required this.onCalculoFinalizado});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final nomeController = TextEditingController();

  final idadeController = TextEditingController();

  final pesoController = TextEditingController();

  final alturaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 300),
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(labelText: "Nome"),
              inputFormatters: [],
            ),
            TextField(
              controller: idadeController,
              decoration: InputDecoration(labelText: "Idade"),
              keyboardType: TextInputType.numberWithOptions(),
              inputFormatters: [
                LengthLimitingTextInputFormatter(2),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            TextField(
              controller: pesoController,
              decoration: InputDecoration(labelText: "Peso"),
              keyboardType: TextInputType.numberWithOptions(),
              inputFormatters: [
                LengthLimitingTextInputFormatter(3),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            TextField(
              controller: alturaController,
              decoration: InputDecoration(labelText: "Altura(Cm)"),
              keyboardType: TextInputType.numberWithOptions(),
              inputFormatters: [
                LengthLimitingTextInputFormatter(3),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () async {
                final nome = nomeController.text.trim();
                final alturaTxt = alturaController.text.trim();
                final pesoTxt = pesoController.text.trim();
                final idadetxt = idadeController.text.trim();

                if (nome.isEmpty || nome.length < 3) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Informe um nome com pelo menos 3 caracteres.',
                      ),
                    ),
                  );
                  return;
                }

                final idade = int.tryParse(idadetxt);
                if (idade == null || idade <= 0 || idade > 99) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Idade Inválida. Informe uma idade válida.",
                      ),
                    ),
                  );
                  return;
                }

                final peso = int.tryParse(pesoTxt);
                if (peso == null || peso <= 0 || peso > 700) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Peso inválido. Informe até 700 kg.'),
                    ),
                  );
                  return;
                }

                final altura = int.tryParse(alturaTxt);
                if (altura == null || altura <= 0 || altura > 250) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Altura inválida. Informe até 250 cm.'),
                    ),
                  );
                  return;
                }

                final imc = Imc(nome, idade, peso, altura);
                final resultado = ImcResultado(
                  nome: nome,
                  idade: idade,
                  peso: peso,
                  altura: altura,
                  valor: imc.calcular,
                  classificacao: imc.classificacao()['classificacao']!,
                );

                final box = Hive.box<ImcResultado>('historico_imc');
                await box.add(resultado);

                widget.onCalculoFinalizado(resultado);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => Resultado(
                          nome: nome,
                          idade: idade,
                          peso: peso,
                          altura: altura,
                        ),
                  ),
                ).then((context) {
                  nomeController.clear();
                  idadeController.clear();
                  pesoController.clear();
                  alturaController.clear();
                });
              },
              child: Text('Continuar'),
            ),
          ],
        ),
      ),
    );
  }
}
