import 'package:calcular_imc/models/imc_resultado.dart';

class ImcRepository {
  static final ImcRepository _instancia = ImcRepository._interno();
  factory ImcRepository() => _instancia;
  ImcRepository._interno();

  final List<ImcResultado> _historico = [];

  void adicionarResultado(ImcResultado resultado) {
    _historico.add(resultado);
  }

  List<ImcResultado> listarResultados() {
    return List.unmodifiable(_historico);
  }

  void limparHistorico() {
    _historico.clear();
  }
}