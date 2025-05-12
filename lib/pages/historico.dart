import 'package:flutter/material.dart';
import '../models/imc_resultado.dart';

class HistoricoPage extends StatelessWidget {
  final List<ImcResultado> historico;

  const HistoricoPage({Key? key, required this.historico}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${item.nome} removido do histórico')),
            );
          },
          child: InkWell(
            onTap: () {},
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
          ),
        );
      },
    );
  }
}
