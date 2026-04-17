
class ContaCorrente {
  double _saldo = 0.0;

  double get saldo => _saldo;

  set saldo(double valor){ 
    if (valor >0 ) {
      _saldo = valor;
    } else {
      print('saldo não pode ser negativo');
    }
  }

  double sacar(double valor) {
      if (valor <= saldo) {
        _saldo = _saldo - valor;
        return valor;
      } else {
        print('Você não tem saldo suficiente $saldo');
        return 0;
      }
  }
  
    void depositar(double valor){ 
    if (valor >0 ) {
      _saldo += valor;
    } 
  }
}