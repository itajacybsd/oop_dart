class Pagamento{
  void realizarPagamento(){}
}

class CartaoCredito extends Pagamento{
  @override
  void realizarPagamento() {
    print('Regra do Cartao');
  }
}
class Pix extends Pagamento{
  @override
  void realizarPagamento() {
    print('Regra do Banco Central');

  }
}
class FinanciamentoEstudantilPrincipia extends Pagamento{
  @override
  void realizarPagamento() {
    print('Acessar Principia');
  }
}

class PagamentoBatata extends Pagamento{}  // falta a sobrescrita do metodo realizarPagamento()

void checkout(Pagamento pagamento){
  pagamento.realizarPagamento();
}

