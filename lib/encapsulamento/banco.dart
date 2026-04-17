
import 'package:oop_dart/encapsulamento/conta_corrente.dart';

void main(List<String> args) {
  final contaCorrente = ContaCorrente();
  contaCorrente.saldo = 300.00;


  print(contaCorrente.saldo);

  final valorSaque = contaCorrente.sacar(200);
  print(valorSaque);
  print(contaCorrente.saldo);
  contaCorrente.depositar(1000);

  print('Saldo atual: ${contaCorrente.saldo}');


}