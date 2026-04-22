// tear off -> destacar, extrair

class Pessoa {
  final String nome;

  Pessoa(this.nome); // o 'new' é o construtor default

  Pessoa.comNome(this.nome);
  Pessoa.com2Params(this.nome, String sobrenome);

  factory Pessoa.fabrica(final String nome) => Pessoa(nome);

  Pessoa.redirect(final String nome) : this(nome);

  const Pessoa.constante(this.nome);



  @override
  String toString() {
    return 'Pessoa: $nome';
  }
}

// void criarEExibirPessoa(final String nome, final Pessoa Function(String) criador) {
//   final pessoa = criador(nome);
//   print(pessoa);
// }

// // função construtora :  Função que cria uma Pessoa
// Pessoa criarPessoa(final String nome) => Pessoa(nome);


void main(){
  final padrao = Pessoa.new;
  final nomeado = Pessoa.comNome;
  final fabrica = Pessoa.fabrica;
  final redirecionado = Pessoa.redirect;
  //final  constante = const Pessoa.constante;  // somente este não funciona por causa do const
   
   imprimir(Pessoa.com2Params); // pq ela atende a assinatura, com 2 parametros

}

void imprimir(Pessoa Function(String, String) criador){
  criador('a','b');
}
