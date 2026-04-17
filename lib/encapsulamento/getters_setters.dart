import 'package:oop_dart/encapsulamento/produto.dart';

void main(List<String> args) {
  final produto = Produto();
  // produto.getPreco();
  // produto.setPreco(300);

  final preco = produto.preco; // aqui estou executando o metodo getter
  print('O preco do produto é $preco');
  produto.preco = 300.00; // e aqui estou chamando o metodo setter
  print('O preco do produto agora é ${produto.preco}'); //getter
}
