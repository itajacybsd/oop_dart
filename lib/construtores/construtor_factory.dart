class Usuario {
  final String nome;
  final String tipo;

  // Usuario._(this.nome, this.tipo);
  Usuario._adm(this.nome) : tipo = 'ADMINISTRADOR';
  Usuario._cli(this.nome) : tipo = 'CLIENTE';

  factory Usuario(String nome, String tipo) {
    if (tipo == 'A') {
      // return Usuario._(nome, 'ADMINISTRADOR');
      return Usuario._adm(nome);
    } else if (tipo == 'C') {
      // return Usuario._(nome, 'CLIENTE');
      return Usuario._cli(nome);
    } else {
      throw ArgumentError('Tipo de usuário inválido');
    }
  }

  void exibirInformacoes() {
    print('Usuário: $nome, é $tipo');
  }
}

void main(List<String> args) {
  final adm = Usuario('Rodrigo', 'A');
  adm.exibirInformacoes();
  final cli = Usuario('Ana', 'C');
  cli.exibirInformacoes();
}


/**
 * Imagine que você tem uma fábrica de bicicletas. No modelo tradicional, toda vez que 
 * alguém pede uma bicicleta, você obrigatoriamente constrói uma nova do zero, com peças saindo da caixa.

O construtor factory do Dart é como se essa fábrica ganhasse um gerente inteligente.
 Esse gerente pode olhar para o pedido e decidir: "Espere, eu não preciso fabricar uma nova.
  Tenho uma idêntica guardada no estoque que posso entregar agora", ou então: 
  "Este cliente quer uma bicicleta de corrida, vou chamar meu especialista em fibra de
   carbono para montar essa especificamente".

Aqui está a essência do factory: ele parece um construtor, mas se comporta como uma função que decide o que devolver.

1. O Poder da Decisão
Diferente de um construtor comum, que é obrigado a criar uma nova instância da classe atual, 
um factory tem três liberdades fundamentais:

Não precisa criar nada novo: Ele pode retornar uma instância que já existe (como um cache).

Pode retornar um "filho": Ele pode devolver uma subclasse em vez da classe principal.

Controle total: Ele pode realizar lógicas complexas antes de decidir qual objeto entregar.

2. Na Prática: O Exemplo da Peça de Museu
Imagine que você está catalogando itens. Se o item for muito antigo, você quer uma lógica especial.

3. Por que isso é importante?
Se você usar um construtor comum, você está preso. É como se a natureza te obrigasse a 
nascer toda vez que alguém chama seu nome. Com o factory, o Dart permite o Padrão Singleton 
(garantir que só exista uma única versão de algo, como uma conexão com banco de dados) 
ou o Pattern Matching para criar objetos sob medida.

O resumo "Feynman":
Um construtor comum é um criador. Ele faz a coisa agora.
Um construtor factory é um distribuidor. Ele decide qual é a melhor coisa para te entregar,
 seja uma nova, uma velha ou uma versão especializada.

Em arquiteturas como o Bloc ou ao lidar com JSON, usamos muito o factory para transformar
 dados brutos em objetos de forma inteligente. Você já teve que lidar com uma situação onde 
 precisava garantir que não existissem dois objetos iguais na memória para a mesma informação?
 */