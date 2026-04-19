class Animal {
  void emitirSom(){}
}

class Cachorro extends Animal{

  @override
  void emitirSom() {
    print('Au');
  }
}

class Gato extends Animal{

  @override
  void emitirSom() {
    print('Miau');
  }
}

class Marley extends Cachorro{}

void fazerBarulho(Animal animal) { // só enxerga o que estiver dentro da classe Animal
 // o cachorro e o gato são promovidos a classe Animal, e são chamados os métodos
 // sobreescritos emitirSom() de cada animal.
  animal.emitirSom();
}


void main(List<String> args) {
  final cachorro = Cachorro();
  final gato = Gato();
  Animal marley = Marley();

  fazerBarulho(cachorro);
  fazerBarulho(gato);
  fazerBarulho(marley);

}

