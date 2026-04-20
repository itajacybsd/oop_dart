

// hack da classe final, utilizando a classe base Carro que pode ser extendida

import 'package:oop_dart/modificadores_de_classe/final/final_exemplo.dart';

// classes final não podem ser extendidas como é o caso da classe Carro abaixo
base class CarroEletrico extends Carro {
  CarroEletrico({required super.marca, required super.modelo});

  @override
  void exibirDados() {
    print('alterei!  sem vergonha!');
    super.exibirDados();
  }
}

void main(List<String> args) {
  var eletrico = CarroEletrico(marca: 'BYD', modelo: 'King');

  eletrico.qualquer();
}


