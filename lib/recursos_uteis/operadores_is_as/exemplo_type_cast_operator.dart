class Animal {
  void fazerSom() {
    print('som Genérico');
  }
}

class Cachorro extends Animal {
  @override
  void fazerSom() {
    print('Latido');
  }

  void buscarBola() {
    print('Buscar a Bola');
  }
}

class Gato extends Animal {
  @override
  void fazerSom() {
    print('Miado');
  }
}

void main(List<String> args) {
  final animais = [Cachorro(), Gato(), Animal()];

  final Animal animalCachorro = Cachorro();
  final cachorro = animalCachorro as Cachorro;
  cachorro.buscarBola();

  for (var animal in animais) {
    animal.fazerSom();
    // animal.buscarBola();
  }
}
