class Pessoa {
  late String nome;
  late final int idade;

  void inicializar(String nome, int idade) {
    this.nome = nome;
    this.idade = idade;
  }

  void mostrarInformacoes() {
    print('Nome: $nome, Idade: $idade');
  }
}

void main(List<String> args) {
  final r = Pessoa();
  r.inicializar('Rodrigo', 42); // preciso inicializar antes de mostrarInformacoes
  r.mostrarInformacoes();
}
