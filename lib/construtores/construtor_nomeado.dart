class Pedido {
  int id;
  String descricao;
  DateTime data;
  double valor;

  Pedido(this.id, this.descricao, this.data, this.valor);

  // construtor nomeado, já com data igual a data de hoje

  Pedido.criarPedido(this.id, this.descricao, this.valor)
    : data = DateTime.now();

 //  construtor nomeado com data iniciando com a data atual, e com calculo de valor de desconto 
 //  já sendo executado no próprio construtor
  Pedido.comDesconto(
    this.id,
    this.descricao,
    double valorOriginal,
    double desconto,
  ) : data = DateTime.now(),
      valor = valorOriginal - (valorOriginal * desconto);

  // construtor nomeado com atributo id opcional com valor default
  Pedido.comIdOpcional(this.descricao, this.data, this.valor, [this.id = 0]);
}

void main(List<String> args) {
  final p1 = Pedido(1, 'primeiro', DateTime.now(), 200.00);
  final p2 = Pedido.criarPedido(1, 'primeiro', 300.00);
  final p3 = Pedido.comDesconto(1, 'primeiro', 300.00, 0.1);

  final pID = Pedido.comIdOpcional('teste', DateTime.now(), 300.00);
  final pID1 = Pedido.comIdOpcional('teste', DateTime.now(), 300.00,3);

  print(p3.valor);
  print(pID);
  print(pID1);
}
