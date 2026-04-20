abstract class Legumes {

  void teste(){}
  void calcular();
}


// Legumes é uma classe concreta, mas no Dart temos a permissão de utilizar
// uma classe como  se fosse uma interface.
// Nesse caso você é obrigado a implementar todos os métodos que essa classe tem
// idependentemente se o método foi implementado ou não
class Batata implements Legumes {
  @override
  void calcular() {
    // TODO: implement calcular
  }

  @override
  void teste() {
    // TODO: implement teste
  }



 

}