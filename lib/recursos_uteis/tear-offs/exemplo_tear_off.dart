// tear off -> destacar, extrair

class Pessoa {
  final String nome;

  Pessoa(this.nome); // o 'new' é o construtor default

  @override
  String toString() {
    return 'Pessoa: $nome';
  }
}

void criarEExibirPessoa(final String nome, final Pessoa Function(String) criador) {
  final pessoa = criador(nome);
  print(pessoa);
}

// função construtora :  Função que cria uma Pessoa
Pessoa criarPessoa(final String nome) => Pessoa(nome);


void main(){
   criarEExibirPessoa('Rodrigo Rahman', criarPessoa);
   criarEExibirPessoa('Rodrigo Anonimo', (final String nome) => Pessoa(nome));
   criarEExibirPessoa('Rodrigo Tear-off', Pessoa.new); // o new chama o construtor default

   final pessoaTearOff = Pessoa.new;  //final Pessoa Function(String) pessoaTearOff = Pessoa.new; <-- se apertar ctrl + alt é isso q aparece
   

}


