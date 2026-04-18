// PascalCase --> UpperCamelCase
class Pessoa {
  // Atributos ou Propriedades
  String? nome;
  int? idade;

  // Construtor Default, mas pode ter outros
  Pessoa(); // pode ou não ter escopo {}

  // Métodos (Funções de classe) ->  Ações que pode ser feitas dentro da classe

  void exibirInformacoes() {
    print('Nome: $nome, idade: $idade');
  }

  bool ehMarioDeIdade() {
    if (idade != null) {
      return idade! >= 18;
    }
    return false;
  }
}