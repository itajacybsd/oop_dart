class Usuario {
  String nome;
  int? idade;

  // o construtor padrão tem o mesmo nome da classe
  // Usuario(String nome){  // ocorre erro pq ele cria a instancia e depois exige o nome
  //   this.nome = nome;
  // }

  //  idade é opcional pois está entre  []
  // Usuario(String nome, [int? idade]) : this.nome = nome, this.idade = idade;

  // sintaxe simplicada do construtor default
  Usuario(this.nome, [this.idade]);
}

class Pessoa {
  String nome;
  int idade;

  // construtor nomeado
  Pessoa({required this.nome, required this.idade});
}

void main(List<String> args) {
  final usuario = Usuario('Rodrigo', 42);
}
