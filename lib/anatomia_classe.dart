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

  bool _ehMarioDeIdade() {
    if (idade != null) {
      return idade! >= 18;
    }
    return false;
  }
}

void main(List<String> args) {
  final pessoa = Pessoa();
  pessoa.idade = 42;
  pessoa.nome = 'Rodrigo';

  pessoa.exibirInformacoes();

  if (pessoa._ehMarioDeIdade()) {
    // só acessa esse método pq está no mesmo arquivo
    print('${pessoa.nome} é maior de idade.');
  } else {
    print('${pessoa.nome} não é maior de idade.');
  }
}
