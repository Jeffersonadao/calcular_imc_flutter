class Imc {
  String _nome;
  int _idade;
  int _peso;
  int _altura;

  Imc(this._nome, this._idade, this._peso, this._altura);

  double get calcular => _peso / ((_altura / 100) * (_altura / 100));

  String get imcFormatado => calcular.toStringAsFixed(2);

  String get nome => _nome;
  set nome(String nome) => _nome = nome;

  int get idade => _idade;
  set idade(int idade) => _idade = idade;

  int get peso => _peso;
  set peso(int peso) => _peso = peso;

  int get altura => _altura;
  set altura(int altura) => _altura = altura;

  Map<String, String> classificacao() {
    double imc = calcular;

    if (imc < 18.5) {
      return {
        'classificacao': 'Magreza',
        'mensagem': 'Você está abaixo do peso. Busque acompanhamento médico.',
      };
    } else if (imc < 24.9) {
      return {
        'classificacao': 'Normal',
        'mensagem': 'Parabéns! Você está com o peso ideal.',
      };
    } else if (imc < 29.9) {
      return {
        'classificacao': 'Sobrepeso',
        'mensagem': 'Cuidado! Você está com sobrepeso.',
      };
    } else if (imc < 34.9) {
      return {
        'classificacao': 'Obesidade Nível 1',
        'mensagem': 'Atenção! Obesidade leve detectada.',
      };
    } else if (imc < 39.9) {
      return {
        'classificacao': 'Obesidade Nível 2',
        'mensagem': 'Obesidade moderada. Busque orientação médica.',
      };
    } else {
      return {
        'classificacao': 'Obesidade Grave',
        'mensagem': 'Obesidade grave. É urgente procurar um médico.',
      };
    }
  }
}
