// INTERFACE PURA COMO NÓS CONHECEMOS NO MUNDO POO
//! NUNCA DEVE TER METODOS IMPLEMENTADOS
// não há métodos implementados em uma interface
// estamos definindo um contrato, adicionando os métodos do contrato

abstract interface class InterfaceProcessadorPagamento {
  void processarPagamento(double valor);
}

abstract interface class InterfaceGerarRelatorio {
  String gerarRelatorioFechamento();
}

class SistemaPagamento implements InterfaceProcessadorPagamento, InterfaceGerarRelatorio {
  double _saldo = 0.0;

  @override
  void processarPagamento(double valor) {
    _saldo += valor;
    print(
      'Pagamento de R\$ ${valor.toStringAsFixed(2)} processado com sucesso',
    );
  }

  @override
  String gerarRelatorioFechamento() {
    return 'Relatorio: Saldo atual é R\$ é ${_saldo.toStringAsFixed(2)}';
  }
}

void funcaoProcessarPagamento(InterfaceProcessadorPagamento pagamento, double valor) {
  pagamento.processarPagamento(valor);
}

void funcaoGerarRelatorioDeFechamento(InterfaceGerarRelatorio gerarRelatorioDeFechamento) {
  print(gerarRelatorioDeFechamento.gerarRelatorioFechamento());
}

void main(List<String> args) {
  SistemaPagamento sistemaPagamento = SistemaPagamento();  // criada uma instancia de SistemaPagamento que implementa as duas Interfaces
  // InterfaceProcessadorPagamento sistemaPagamento = SistemaPagamento();  
  funcaoProcessarPagamento(sistemaPagamento, 200);
  funcaoProcessarPagamento(sistemaPagamento, 100.4);
  funcaoProcessarPagamento(sistemaPagamento, 10);
  print(sistemaPagamento.gerarRelatorioFechamento()); //executando como um metodo da instancia
  sistemaPagamento.processarPagamento(150);  // executando como um metodo da instancia

  funcaoGerarRelatorioDeFechamento(sistemaPagamento); // executando através da função
  // funcaoGerarRelatorioDeFechamento(sistemaPagamento as InterfaceGerarRelatorio);
}


