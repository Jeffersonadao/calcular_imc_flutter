import 'package:flutter/material.dart';
import '../models/imc_resultado.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/imc_resultado.dart';

class HistoricoPage extends StatelessWidget {
  const HistoricoPage({Key? key, required List<ImcResultado> historico}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<ImcResultado>('historico_imc');


    return ValueListenableBuilder(
      valueListenable: box.listenable(),
      builder: (context, Box<ImcResultado> box, _) {
        final historico = box.values.toList();

        if (historico.isEmpty) {
          return Center(child: Text('Nenhum histórico encontrado.'));
        }

        return ListView.builder(
          itemCount: historico.length,
          itemBuilder: (context, index) {
            final item = historico[index];

            return Dismissible(
              key: Key('${item.nome}-${item.idade}-$index'),
              direction: DismissDirection.horizontal,
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Icon(Icons.delete, color: Colors.white),
              ),
              onDismissed: (_) {
                item.delete(); // Aqui remove do Hive

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${item.nome} removido do histórico')),
                );
              },
              child: Card(
                margin: EdgeInsets.all(10),
                elevation: 3,
                child: ListTile(
                  title: Text('${item.nome}, ${item.idade} anos'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Peso: ${item.peso} kg'),
                      Text('Altura: ${item.altura} cm'),
                      Text('IMC: ${item.valor.toStringAsFixed(2)}'),
                      Text('Classificação: ${item.classificacao}'),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
