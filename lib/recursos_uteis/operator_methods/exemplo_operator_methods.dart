class MeuInteiro {
  int numero;
  MeuInteiro(this.numero);

  MeuInteiro soma(MeuInteiro outroValor) {
    return MeuInteiro(numero + outroValor.numero);
  }

  MeuInteiro operator +(final MeuInteiro outroValor) {
     return MeuInteiro(numero + outroValor.numero);
  }

}

void main(List<String> args) {
  final valor1 = MeuInteiro(10);
  final valor2 = MeuInteiro(20);
  final soma = valor1 + valor2;
  // print(valor1.soma(valor2).numero);
  print(soma.numero);

  
}
