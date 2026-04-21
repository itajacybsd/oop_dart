// ignore_for_file: public_member_api_docs, sort_constructors_first

// classe seladas não podem ter construtores especificos
// mas pode ter construtor do tipo factory
sealed class Forma {

  Forma();
  double calcularArea();

  factory Forma.circulo(double raio) => Circulo(raio: raio);
  factory Forma.retangulo(double largura, double altura) => Retangulo(largura: largura, altura: altura);

}

class Circulo extends Forma {
  final double raio;
  Circulo({required this.raio});

  @override
  double calcularArea() => 3.14 * raio * raio;
}

class Retangulo extends Forma {
  final double largura;
  final double altura;
  Retangulo({
    required this.largura,
    required this.altura,
  });
  @override
  double calcularArea() => altura * largura;

}


void main(List<String> args) {
  Forma forma = Circulo(raio: 5);
  Forma forma2 = Forma.retangulo(5,4);  // usando o construtor do tipo factory

// o compilador conhece todos os filhos para tratamento no switch
  // switch(forma){
  //   case Circulo():
  //     // TODO: Handle this case.
  //     throw UnimplementedError();
  //   case Retangulo():
  //     // TODO: Handle this case.
  //     throw UnimplementedError();
  // }
}