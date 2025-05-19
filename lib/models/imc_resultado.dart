import 'package:hive/hive.dart';

part 'imc_resultado.g.dart';

@HiveType(typeId: 0)
class ImcResultado extends HiveObject {
  @HiveField(0)
  String nome;

  @HiveField(1)
  int idade;

  @HiveField(2)
  int peso;

  @HiveField(3)
  int altura;

  @HiveField(4)
  double valor;

  @HiveField(5)
  String classificacao;

  ImcResultado({
    required this.nome,
    required this.idade,
    required this.peso,
    required this.altura,
    required this.valor,
    required this.classificacao,
  });

  
}

