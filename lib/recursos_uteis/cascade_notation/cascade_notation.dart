class Pessoa {
  String? nome;
  int? idade;

  void apresentar() {
    print('Olá, meu nome é $nome, e eu tenho $idade anos');
  }
}

void main(List<String> args) {
  // final pessoa = Pessoa();
  // pessoa.nome = 'Rodrigo';
  // pessoa.idade = 42;
  // pessoa.apresentar();

  // Cascade notation, utilizando o '..', e nem precisa criar a variavel pessoa
  Pessoa()
    ..nome = 'Rodrigo'
    ..idade = 42
    ..apresentar();
}
