class Pessoa{
  static String nome = 'Rodrigo';
  int? idade;
}

void main(List<String> args) {
  Pessoa.nome;  //  <--  Acessando variavel estática//  pois ela é um atributo da CLASSE e não da instancia
  // Pessoa.idade; // <--  não dá para acessar pq não é estatico

final pessoa = Pessoa();
pessoa.idade; //  atributo da instancia

}