// Essa classe tem um único métodoe e um unico objetivo

class Saudacao {
  final String mensagem;

  Saudacao(this.mensagem);

// como essa classe possui um único método, ao invés de dar um nome para o método e chamá-lo,
// podemos usar a palavra 'call' e executar direto pela instancia
  void call(String nome) { 
    print('$mensagem, $nome!');
  }
  // void saudar(String nome) {
  //   print('$mensagem, $nome!');
  // }
}

void main(List<String> args) {
  final saudacao = Saudacao('Bem-vindo');

  // saudacao.saudar('Rodrigo');
  saudacao('Rodrigo');
  saudacao('Ana Paula');

}