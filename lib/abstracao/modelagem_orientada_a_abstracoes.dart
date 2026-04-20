// EXEMPLO DE MODELAGEM DE NEGOCIO EM CIMA DE ABSTRAÇÕES (CARTAO DE CREDITO, PIX, BOLETO)
// SE HOUVER UM NOVO MEIO DE PAGAMENTO PARA IMPLEMENTAR FICA SUPER SIMPLES



abstract interface class MetodoPagamento {
  void pagar(double valor);
}

class CartaoCredito implements MetodoPagamento {
  @override
  void pagar(double valor) {
    print('Pagando com Cartão de crédito no valor: R\$ $valor');
  }
}

class Pix implements MetodoPagamento {
  @override
  void pagar(double valor) {
    print('Pagando com Pix  no valor: R\$ $valor');
  }
}

class Boleto implements MetodoPagamento {
  @override
  void pagar(double valor) {
    print('Pagando com Boleto  no valor: R\$ $valor');
  }
}



class ServicoReserva {
  final MetodoPagamento metodoPagamento;

  ServicoReserva(this.metodoPagamento);

  void reservar(int quantidadePessoas, String tipoQuarto) {
    double valorDiaria = 0;
    if (tipoQuarto == 'Luxo') {
      valorDiaria = 1000;
    }
    final valorTotalReserva = quantidadePessoas * valorDiaria;

    metodoPagamento.pagar(valorTotalReserva);
  }
}

void main(List<String> args) {
  var servicoReserva = ServicoReserva(CartaoCredito());
  servicoReserva.reservar(4, 'Luxo');

  var servicoReserva2 = ServicoReserva(Pix());
  servicoReserva2.reservar(5, 'Luxo');

  var servicoReserva3 = ServicoReserva(Boleto());
  servicoReserva3.reservar(7, 'Luxo');
}
